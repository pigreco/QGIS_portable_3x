#!/bin/bash

# Script per scaricare e preparare QGIS portable con GRASS e matplotlib
# Versione: QGIS 3.40 LTR con supporto GRASS e matplotlib
# Basato su script_340ltr_grass_improved.sh

set -e  # Esce in caso di errore
set -x  # Debug mode

# Configurazione
nomefile="QGIS-OSGeo4W-3.40.15-1"
base_url="http://download.osgeo.org/qgis/win64"
github_bat_url="https://github.com/pigreco/QGIS_portable_3x/raw/master/file/win64/qgis-ltr-grass.bat"

# Funzione per gestire gli errori
handle_error() {
    echo "ERRORE: $1" >&2
    exit 1
}

# Funzione per logging
log_info() {
    echo "INFO: $1"
}

# Funzione per ottimizzare le performance
optimize_performance() {
    export PROCESSORS=$(nproc 2>/dev/null || echo "4")
    log_info "Usando $PROCESSORS core per l'elaborazione"
}

# Funzione per testare la connettività
test_connectivity() {
    local url="$1"
    log_info "Testando connettività verso $url..."
    if ! curl -s --connect-timeout 10 --head "$url" > /dev/null; then
        handle_error "Impossibile raggiungere $url. Controlla la connessione internet."
    fi
    log_info "Connettività OK"
}

# Funzione per rilevare la versione Python nella portable
find_python_version() {
    local python_dir
    python_dir=$(find qgis/apps -maxdepth 1 -type d -name "Python3*" | head -1)
    if [ -z "$python_dir" ]; then
        handle_error "Cartella Python non trovata in qgis/apps/"
    fi
    echo "$python_dir"
}

# Funzione per installare matplotlib tramite wheels
install_matplotlib() {
    local python_dir="$1"
    local site_packages="${python_dir}/Lib/site-packages"

    log_info "Directory Python rilevata: $python_dir"
    log_info "Site-packages: $site_packages"

    # Controlla se matplotlib è già presente
    if [ -d "${site_packages}/matplotlib" ]; then
        log_info "matplotlib è già presente nella portable, salto installazione"
        return 0
    fi

    log_info "matplotlib non trovato, avvio installazione..."

    # Verifica che pip3 sia disponibile sull'host
    if ! command -v pip3 &> /dev/null; then
        handle_error "pip3 non trovato sull'host. Installa python3-pip: sudo apt install python3-pip"
    fi

    # Estrai la versione Python numerica (es. Python312 -> 312)
    python_ver=$(basename "$python_dir" | sed 's/Python//')
    log_info "Versione Python target: $python_ver"

    # Crea cartella temporanea per i wheels
    mkdir -p ./wheels_tmp

    # Scarica matplotlib e dipendenze come wheels per Windows x64
    log_info "Scaricando wheels di matplotlib per Windows amd64 / Python $python_ver..."
    pip3 download matplotlib \
        --platform win_amd64 \
        --python-version "${python_ver}" \
        --only-binary=:all: \
        -d ./wheels_tmp/ \
        || handle_error "Impossibile scaricare i wheels di matplotlib"

    # Estrai ogni wheel nella site-packages della portable
    log_info "Installando wheels in $site_packages..."
    for wheel in ./wheels_tmp/*.whl; do
        log_info "  Estrazione: $(basename "$wheel")"
        unzip -o "$wheel" -d "${site_packages}/" > /dev/null \
            || handle_error "Impossibile estrarre $wheel"
    done

    # Pulizia
    rm -rf ./wheels_tmp
    log_info "matplotlib installato correttamente"
}

# Ottimizza le performance
optimize_performance

# Estrae numero versione: 3.xx.x
nr=$(echo "$nomefile" | sed 's/QGIS-OSGeo4W-//' | sed -E 's/-[0-9]+$//')
log_info "Versione QGIS da scaricare: $nr"

# Crea cartella principale OSGeo4W64 se non esiste
if [ ! -d "OSGeo4W64" ]; then
    mkdir OSGeo4W64
    log_info "Creata cartella OSGeo4W64"
else
    log_info "Cartella OSGeo4W64 già esistente"
fi

# Entra nella cartella di lavoro
cd OSGeo4W64

# Controlla se il file MSI esiste già
if [ -f "$nomefile.msi" ]; then
    log_info "File MSI già presente, salto download"
else
    test_connectivity "$base_url"

    log_info "Scaricando $nomefile.msi da $base_url..."

    file_size=$(curl -sI "$base_url/$nomefile.msi" | grep -i content-length | awk '{print $2}' | tr -d '\r')
    if [ -n "$file_size" ]; then
        file_size_mb=$((file_size / 1024 / 1024))
        log_info "Dimensione file: ${file_size_mb}MB"
    fi

    if ! curl -f -L --progress-bar --retry 5 --retry-delay 2 --connect-timeout 30 --max-time 1800 \
         "$base_url/$nomefile.msi" -o "$nomefile.msi"; then
        handle_error "Impossibile scaricare il file MSI da $base_url/$nomefile.msi"
    fi

    if [ ! -f "$nomefile.msi" ] || [ ! -s "$nomefile.msi" ]; then
        handle_error "Il file MSI scaricato è vuoto o corrotto"
    fi

    log_info "Download completato ($(du -h "$nomefile.msi" | cut -f1))"
fi

# Controlla se msiextract è disponibile
if ! command -v msiextract &> /dev/null; then
    handle_error "msiextract non è installato. Installa msitools: sudo apt install msitools"
fi

# Estrae il file MSI
log_info "Estraendo il file MSI..."
if ! msiextract -C ./ "$nomefile.msi"; then
    log_info "Errore durante l'estrazione, proviamo con opzioni alternative..."
    if command -v msiexec &> /dev/null; then
        log_info "Tentativo con msiexec..."
        msiexec /a "$nomefile.msi" /qn TARGETDIR="$(pwd)/extracted/" || handle_error "Impossibile estrarre il file MSI"
    else
        handle_error "Impossibile estrarre il file MSI con msiextract"
    fi
fi

# Debug: mostra il contenuto della cartella corrente
log_info "Contenuto cartella dopo estrazione:"
ls -la | head -10

# Individua la cartella estratta e la rinomina in 'qgis'
extracted_folder=$(find . -maxdepth 2 -type d -name "*QGIS*" -o -name "*qgis*" -o -name "*OSGeo*" | head -1)
if [ -n "$extracted_folder" ]; then
    log_info "Cartella trovata: $extracted_folder"
    if [ -d "qgis" ]; then
        rm -rf qgis
        log_info "Rimossa cartella qgis esistente"
    fi
    mv "$extracted_folder" qgis
    log_info "Cartella rinominata: '$extracted_folder' -> 'qgis'"
else
    log_info "Nessuna cartella QGIS/OSGeo trovata. Cartelle disponibili:"
    find . -maxdepth 2 -type d -not -path "." | head -10

    qgis_exe=$(find . -name "*qgis*.exe" -o -name "*QGIS*.exe" | head -1)
    if [ -n "$qgis_exe" ]; then
        extracted_folder=$(dirname "$qgis_exe")
        log_info "Trovato eseguibile QGIS in: $extracted_folder"
        mv "$extracted_folder" qgis
        log_info "Cartella rinominata: '$extracted_folder' -> 'qgis'"
    else
        handle_error "Nessuna cartella QGIS o eseguibile trovato dopo l'estrazione"
    fi
fi

# Installa matplotlib nella portable
install_matplotlib "$(find_python_version)"

# Scarica file qgis-ltr-grass.bat
log_info "Scaricando qgis-ltr-grass.bat..."
curl -fL --connect-timeout 5 --retry 2 "$github_bat_url" -o qgis-ltr-grass.bat || handle_error "Impossibile scaricare qgis-ltr-grass.bat"

# Elimina file non necessari
log_info "Pulizia file temporanei..."
rm -f *.msi
find . -name "*.sh" -not -path "./qgis/*" -delete
log_info "File temporanei rimossi"

# Torna alla cartella padre
cd ..

# Controlla se 7z è disponibile
if ! command -v 7z &> /dev/null; then
    handle_error "7z non è installato. Installa p7zip: sudo apt install p7zip-full"
fi

# Crea archivio compresso
archive_name="OSGeo4W64_${nr}-ltr_grass_matplotlib.7z"
log_info "Creando archivio $archive_name..."

if [ -f "$archive_name" ]; then
    rm "$archive_name"
    log_info "Rimosso archivio esistente"
fi

7z a -t7z -m0=lzma2 -mx=3 -mfb=64 -md=32m -ms=on -mmt=on "$archive_name" OSGeo4W64 > /dev/null || handle_error "Impossibile creare l'archivio"

# Statistiche finali
archive_size=$(du -h "$archive_name" | cut -f1)
log_info "Script completato con successo!"
log_info "Archivio creato: $archive_name (dimensione: $archive_size)"
log_info "Contenuto: QGIS $nr LTR con supporto GRASS e matplotlib"

log_info "Struttura cartella OSGeo4W64:"
ls -la OSGeo4W64/ | head -10
