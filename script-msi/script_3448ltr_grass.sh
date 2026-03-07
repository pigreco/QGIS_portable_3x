#!/bin/bash

# Script migliorato per scaricare e preparare QGIS portable con GRASS
# Versione: QGIS 3.44.8 LTR con supporto GRASS
# Autore: Miglioramento del script originale

set -e  # Esce in caso di errore
set -x  # Debug mode

# Configurazione
nomefile="QGIS-OSGeo4W-3.44.8-1"
base_url="http://download.osgeo.org/qgis/win64"
github_bat_url="https://github.com/pigreco/QGIS_portable_3x/raw/master/file/win64/qgis-ltr-grass.bat"

# Funzione per gestire gli errori
handle_error() {
    echo "❌ Errore: $1" >&2
    exit 1
}

# Funzione per logging
log_info() {
    echo "ℹ️  $1"
}

# Funzione per ottimizzare le performance
optimize_performance() {
    # Usa tutti i core disponibili per 7z
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
    # Testa la connettività prima del download
    test_connectivity "$base_url"
    
    # Scarica il file eseguibile MSI con ottimizzazioni
    log_info "Scaricando $nomefile.msi da $base_url..."
    
    # Ottieni dimensione del file per stimare il tempo di download
    file_size=$(curl -sI "$base_url/$nomefile.msi" | grep -i content-length | awk '{print $2}' | tr -d '\r')
    if [ -n "$file_size" ]; then
        file_size_mb=$((file_size / 1024 / 1024))
        log_info "Dimensione file: ${file_size_mb}MB"
    fi
    
    # Timeout più lungo e più retry per connessioni lente
    if ! curl -f -L --progress-bar --retry 5 --retry-delay 2 --connect-timeout 30 --max-time 1800 \
         "$base_url/$nomefile.msi" -o "$nomefile.msi"; then
        handle_error "impossibile scaricare il file MSI da $base_url/$nomefile.msi"
    fi
    
    # Verifica che il file sia stato scaricato correttamente
    if [ ! -f "$nomefile.msi" ] || [ ! -s "$nomefile.msi" ]; then
        handle_error "Il file MSI scaricato è vuoto o corrotto"
    fi
    
    log_info "Download completato ($(du -h "$nomefile.msi" | cut -f1))"
fi

# Controlla se msiextract è disponibile
if ! command -v msiextract &> /dev/null; then
    handle_error "msiextract non è installato. Installa msitools: sudo apt install msitools"
fi

# Unzippa il file eseguibile msi
log_info "Estraendo il file MSI..."
if ! msiextract -C ./ "$nomefile.msi"; then
    log_info "Errore durante l'estrazione, proviamo con opzioni alternative..."
    # Prova con msiexec (se disponibile su Wine)
    if command -v msiexec &> /dev/null; then
        log_info "Tentativo con msiexec..."
        msiexec /a "$nomefile.msi" /qn TARGETDIR="$(pwd)/extracted/" || handle_error "impossibile estrarre il file MSI"
    else
        handle_error "impossibile estrarre il file MSI con msiextract"
    fi
fi

# Debug: mostra il contenuto della cartella corrente
log_info "Contenuto cartella dopo estrazione:"
ls -la | head -10

# Controlla quale cartella è stata creata dall'estrazione
extracted_folder=$(find . -maxdepth 2 -type d -name "*QGIS*" -o -name "*qgis*" -o -name "*OSGeo*" | head -1)
if [ -n "$extracted_folder" ]; then
    log_info "Cartella trovata: $extracted_folder"
    # Rinomina la cartella estratta in 'qgis'
    if [ -d "qgis" ]; then
        rm -rf qgis
        log_info "Rimossa cartella qgis esistente"
    fi
    mv "$extracted_folder" qgis
    log_info "Cartella rinominata: '$extracted_folder' -> 'qgis'"
else
    # Se non troviamo cartelle con nomi specifici, cerchiamo tutte le cartelle create
    log_info "Nessuna cartella QGIS/OSGeo trovata. Cartelle disponibili:"
    find . -maxdepth 2 -type d -not -path "." | head -10
    
    # Proviamo a cercare file .exe di QGIS per identificare la cartella corretta
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

# Scarica file qgis-ltr-grass.bat in parallelo
log_info "Scaricando qgis-ltr-grass.bat..."
curl -fL --connect-timeout 5 --retry 2 "$github_bat_url" -o qgis-ltr-grass.bat || handle_error "impossibile scaricare qgis-ltr-grass.bat"

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

# Crea unica cartella zippata con compressione ottimizzata
archive_name="OSGeo4W64_${nr}-ltr_grass.7z"
log_info "Creando archivio $archive_name..."

# Rimuovi archivio esistente se presente
if [ -f "$archive_name" ]; then
    rm "$archive_name"
    log_info "Rimosso archivio esistente"
fi

# Compressione veloce con multi-threading
7z a -t7z -m0=lzma2 -mx=3 -mfb=64 -md=32m -ms=on -mmt=on "$archive_name" OSGeo4W64 > /dev/null || handle_error "impossibile creare l'archivio"

# Statistiche finali
archive_size=$(du -h "$archive_name" | cut -f1)
log_info "✅ Script completato con successo!"
log_info "📦 Archivio creato: $archive_name (dimensione: $archive_size)"
log_info "📁 Contenuto: QGIS $nr LTR con supporto GRASS"

# Mostra struttura della cartella creata
log_info "📋 Struttura cartella OSGeo4W64:"
ls -la OSGeo4W64/ | head -10