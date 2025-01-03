NOTA: A partire da QGIS 3.24 Tisler, gli eseguibili sono solo in formato `*.msi` e pesano circa 3 volte le vecchie `*.exe` perché contengono molti dati in più.
NOTA2: Il Plugin core **Geometry Checker** ha due [bug segnalati](https://lists.osgeo.org/pipermail/qgis-it-user/2023-April/010258.html) e risolti a partire da QGIS 3.28.6 e  QGIS 3.30.2

<!-- TOC -->

- [QGIS portable 3.x](#qgis-portable-3x)
  - [Perché questo repository](#perché-questo-repository)
  - [Che cosa è una versione Portable](#che-cosa-è-una-versione-portable)
  - [Step by step metodo manuale](#step-by-step-metodo-manuale)
  - [Step by step usando script Bash](#step-by-step-usando-script-bash)
  - [Connessione al Web e i Plugin](#connessione-al-web-e-i-plugin)
- [Portable (7z)](#portable-7z)
  - [OSGeo4W64 v2 - Nuovo Repository](#osgeo4w64-v2---nuovo-repository)
    - [QGIS](#qgis)
    - [QGIS LTR](#qgis-ltr)
  - [VECCHIO REPOSITORY OSGeo4W64 v1](#vecchio-repository-osgeo4w64-v1)
    - [Con GRASS GIS 7.8](#con-grass-gis-78)
    - [GRASS GIS non abilitato](#grass-gis-non-abilitato)

<!-- /TOC -->
# QGIS portable 3.x

Creare una versione **Portable di QGIS 3.x** usando il file `*.exe` scaricato dal sito http://download.osgeo.org/qgis/

## Perché questo repository

Per tenere traccia di come realizzare una **versione Portable di QGIS 3.x** senza necessariamente aver installato il software.

## Che cosa è una versione Portable

Per applicazione portabile (o applicazione portatile; in inglese portable application) si intende un software applicativo che non necessita di installazione all’interno del sistema operativo su cui viene eseguito. Programmi di questo genere possono essere memorizzati su supporto rimovibile come cd-rom o memorie flash. 
Un’applicazione portabile può indistintamente essere eseguita su qualsiasi computer in cui si dispone di un sistema operativo compatibile con l’applicazione stessa. Il vantaggio per l’utente è quindi quello di poter utilizzare la medesima applicazione su macchine diverse mantenendo le impostazioni personalizzate nell’uso dell’applicazione. Un secondo vantaggio delle applicazioni portabili deriva dal fatto che non richiedendo installazione possono spesso essere eseguite anche in ambienti in cui non si dispone dei diritti di amministrazione sul sistema operativo. [Wikipedia](https://it.wikipedia.org/wiki/Applicazione_portabile).

## Step by step metodo manuale

1. Inserire una **pen drive** nel PC, nel mio caso unità `F:`;
2. Creare la cartella **OSGeo4W**;
3. Scaricare la versione di **QGIS** (32 o 64 bit) desiderata;

<p align="center"> <a href="http://download.osgeo.org/qgis/" target="_blank"><img src="./imgs/img_01.png" width="400" title="dowload"></a>
</p>

 io ho scaricoto questa: **QGIS-OSGeo4W-3.4.8-1-Setup-x86_64.exe**

<p align="center"> <a href="http://download.osgeo.org/qgis/" target="_blank"><img src="./imgs/img_02.png" width="600" title="dowload"></a>
</p>

4. Unzippare il file ***.exe** e spostare tutta la cartella **QGIS-OSGeo4W-3.4.8-1-Setup-x86_64** all'interno della cartella **OSGeo4W** presente nella pen drive (`F:\OSGeo4W\OSGeo4W-3.4.1-1-Setup-x86_64`);
5. Spostare tutto il contenuto della cartella `F:\OSGeo4W\OSGeo4W-3.4.1-1-Setup-x86_64\$_25_\` nella cartella `F:\OSGeo4W\`;
6. Cercare il file `F:\OSGeo4W\bin\qgis-ltr.bat.tmpl` (nel caso di versione non LTR, il file sarebbe `qgis.bat.tmpl`) creare una copia e rinominarlo in `qgis-ltr.bat` in modo da ottenere `F:\OSGeo4W\bin\qgis-ltr.bat`;
7. Cercare e copiare i file `msvcp100.dll` `msvcr100.dll` nella cartella `c:\windows\syswow64` (nel caso `c:\windows\system32`) e incollarli nella cartella `F:\OSGeo4W\apps\qgis\bin\`
8. Lanciare `F:\OSGeo4W\bin\qgis-ltr.bat` e magicamente si avvierà **QGIS!!!** (in questo caso QGIS 3.4.8 LTR)

<p align="center"> <a href="" target="_blank"><img src="./imgs/splash_3_14_0.png" width="500" title="splash"></a>
</p>

Nella pen drive: (quelli evidenziato non servono più)

<p align="center"> <a href="" target="_blank"><img src="./imgs/img_03.png" width="500" title="pen drive"></a>
</p>

Buon lavoro!!!

<p align="center"> <a href="" target="_blank"><img src="./imgs/animazione.gif" width="700" title="avvio QGIS"></a>
</p>

## Step by step usando script Bash

1. creare una cartella sul desktop `zanzibar`(oppure dove preferite);
2. scaricare il file [script.sh](./script.sh) all'interno della cartella `zanzibar` creata al punto 1;
3. avviare `Bash` e digitare `chmod +x ./script.sh` per i permessi e poi `./script.sh`;
4. dopo circa **30 minuti** otterrete una cartella zippata `OSGeo4W_349` con la versione portable di QGIS.
5. unzippate la cartella `OSGeo4W_349.7z` dove desiderate e avvire il file `qgis-ltr.bat` che trovate in `/OSGeo4W/bin`.

**PS:** nello script scarico la `QGIS-OSGeo4W-3.4.9-1-Setup-x86_64.exe` e i file `msvcp100.dll` `msvcr100.dll` versione a 64 bit!!!

---
## Connessione al Web e i Plugin

Ho fatto dei test, la **portable** si connette alla rete senza problemi.

Per quanto riguarda i **plugin**: è possibile installarli, ma verrà creata una cartella **QGIS** nel percorso relativo al profilo utente `C:\Users\nomeUtente\AppData\Roaming\QGIS\QGIS3\profiles\default`

---

**Riferimenti:**

- Idea presa da [qui](https://www.youtube.com/watch?v=iWbB0WPn6rM)
- Blog post su [Pigrecoinfinito](https://pigrecoinfinito.wordpress.com/2019/02/26/creare-una-versione-portable-di-qgis-2-18-ltr/)


# Portable (7z)

## OSGeo4W64 v2 - Nuovo Repository
Con GRASS GIS 7.8, SAGA GIS 7.8.2, SpatiaLite 5, PDAL 2.2 - solo per win 10 64 bit

<p align="center"> <a href="" target="_blank"><img src="./imgs/qgis3280.png" width="700" title="info QGIS 3.22 LTR Białowieża"></a>

### QGIS 

**CON GRASS 7.8.7** 

(non c'è più SAGA GIS nel core di >= QGIS 3.30, vedi Plugin [Processing Saga NextGen Provider](https://plugins.qgis.org/plugins/processing_saga_nextgen/))

- ⭐⭐[QGIS 3.30.2-1 s-Hertogenbosch Portable](https://drive.google.com/file/d/10ZyKBlIYqnHjSAxOxEbuoQdEP-8fU9Fc/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.0-2`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.30.1-1 s-Hertogenbosch Portable](https://drive.google.com/file/d/10YPBlnUX1gMES7BD7H3PIjhTVLj7T1KZ/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.0-2`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.30.0-2 s-Hertogenbosch Portable](https://drive.google.com/file/d/10O7QwyQDNTRSUqYoFsi0IzHTsowACVP1/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.0-2`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)

**CON GRASS 7.8.7 E SAGA 7.8.2**

- ⭐⭐[QGIS 3.28.3-1 Firenze Portable](https://drive.google.com/file/d/1034lGd09ZUnw1yHKsYmQyMMSC0G7G3nv/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.0-2`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.28.3-1 Firenze Portable](https://drive.google.com/file/d/1034lGd09ZUnw1yHKsYmQyMMSC0G7G3nv/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.0-2`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.28.2-1 Firenze Portable](https://drive.google.com/file/d/10-RPw5Q6IKVM8kner5jhV5x-XOXgLI9q/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.0-2`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.28.1-1 Firenze Portable](https://drive.google.com/file/d/1-vWfIvJfiOYtzKcbJGaG1-6UiVBVKzj8/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.0-2`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- [QGIS 3.28.0-2 RC Firenze Portable](https://drive.google.com/file/d/1-t9mXTkRhDuM40lp5rInsU04JC42EfvT/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.0-2`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- [QGIS 3.26.3-1 EOL Buones Aires Portable](https://drive.google.com/file/d/1-rNpl5dpU7KS3oP_qBo9Iqne1e_RZwdk/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.26.3-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)

### QGIS LTR

CON GRASS 8.3.x

- 🙊[QGIS 3.34.14-1 Prizren Portable](https://drive.google.com/file/d/1KHkv0QtKzcn2QveFskm0ROaJPu5VkdTQ/view?usp=drive_link) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.34.10-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- 🙊[QGIS 3.34.10-1 Prizren Portable](https://drive.google.com/file/d/16w_vMj1AlXA0ssiWUBgh19r8qBm_Q4LL/view?usp=drive_link) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.34.10-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- 🙊[QGIS 3.34.9-1 Prizren Portable](https://drive.google.com/file/d/1t40zDCy75ItXqU84ZBtCIK809em4pu53/view?usp=drive_link) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.34.9-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- 🙊[QGIS 3.34.8-1 Prizren Portable](https://drive.google.com/file/d/12c_ptE5bzzu3D1HQjX8n8DR0TTOzWV12/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.34.8-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- 🙊[QGIS 3.34.7-2 Prizren Portable](https://drive.google.com/file/d/12WiTcwS4gP8_jrBgSFpi3RpfL_swy7TH/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.34.7-2`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- 🙊[QGIS 3.34.4-1 Prizren Portable](https://drive.google.com/file/d/11OsbJSGTju9w76NpuXTJ5yhBwB3T3zEn/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.34.4-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)

CON GRASS 7.8.7 E SAGA 7.8.2

- ⭐⭐[QGIS 3.28.15-1 Firenze Portable - ULTIMA](https://drive.google.com/file/d/10jJlPF-LBruvVXCACBkg9ni0khVq9scr/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.15-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.28.14-1 Firenze Portable - in lavorazione]() (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.14-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.28.13-1 Firenze Portable - in lavorazione]() (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.13-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.28.12-1 Firenze Portable - in lavorazione]() (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.12-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.28.11-1 Firenze Portable](https://drive.google.com/file/d/10ikds5VRD1IMywpSbs30ynzlPWAPeSUo/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.11-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.28.10-1 Firenze Portable](https://drive.google.com/file/d/10ieK_lZZqrrVkN6C6MyLWEIKVunr2Ddg/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.10-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.28.9-1 Firenze Portable](https://drive.google.com/file/d/10hQl4A-fay5q1KoUIgWajI0p0R_Pql8I/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.9-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.28.8-1 Firenze Portable](https://drive.google.com/file/d/10cyNXm7ofD-hCElJUvyXQ6IJ3X3MI0hF/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.8-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.28.7-1 Firenze Portable](https://drive.google.com/file/d/10_GOW7lmocB8VYuEwHfr3rKzr-LTlizy/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.7-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.28.6-1 Firenze Portable](https://drive.google.com/file/d/10ZHR18Knf4fiHKN3L3qWSRO54f7FQi38/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.6-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.28.5-1 Firenze Portable](https://drive.google.com/file/d/10Vu-JFyuiiJcpwIjXaBkHIyG_Th28k1s/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.5-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.28.4-3 Firenze Portable](https://drive.google.com/file/d/108H_q4-pM40DMQB6cgUNxO2EfUkzn-Ws/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.28.4-3`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐⭐[QGIS 3.22.16-1 Białowieża Portable EOL](https://drive.google.com/file/d/103EBACERFZXL4IoNg3d0Q0FBaCu5sAcN/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.22.11-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐⭐[QGIS 3.22.15-1 Białowieża Portable EOL](https://drive.google.com/file/d/102IhVQRwTNu5T6d3Jv5Et_fZVBqyl6p1/view?usp=sharing) (**[HA UN grave BUG CONOSCIUTO](https://github.com/qgis/QGIS/pull/51703)**!!!) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.22.11-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.22.14-1 Białowieża Portable](https://drive.google.com/file/d/1-zzvZ5PjkBV4cTi1xXVYAMvfrfP8GeNC/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.22.11-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐⭐[QGIS 3.22.13-1 Białowieża Portable](https://drive.google.com/file/d/1-tdYRNtnFgWFsc2RNju5O1rnM6vOsXP7/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.22.11-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- [QGIS 3.22.12-1 Białowieża Portable](https://drive.google.com/file/d/1-pRs-0Mw-NiBNwGpeFYOjcJjP0vplT5C/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.22.11-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- [QGIS 3.22.11-1 Białowieża Portable](https://drive.google.com/file/d/1-i4mYs2F0HxhzRdHVKRW6ro-YhjadlYj/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.22.11-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- ⭐[QGIS 3.22.10-1 Białowieża Portable anche su Win7 64bit](https://drive.google.com/file/d/1-h381XZE2Eay4crHWPNQ3b7b1tQRQD4m/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.22.10-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- [QGIS 3.22.10-1 Białowieża Portable](https://drive.google.com/file/d/1-g_GH-JqsPqPRd-7mpn0NxmbF_nSy5z5/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.22.10-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- [QGIS 3.22.9-1 Białowieża Portable](https://drive.google.com/file/d/1-S272QXknZdWDbYcI2R9QBWo9pSNlUGI/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.22.9-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- [QGIS 3.22.8-1 Białowieża Portable](https://drive.google.com/file/d/1-ORu2NvPY0rgzddS9LTq03it-c_vSLZi/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.22.8-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- [QGIS 3.22.7-1 Białowieża Portable](https://drive.google.com/file/d/1RJzv6xL2iuL89YmQLIHzMYJnEW7EJtSa/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.22.7-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- [QGIS 3.22.6-1 Białowieża Portable](https://drive.google.com/file/d/1-AnZx7TxvP4JZr0er816Ex8ErbavLX1i/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W64-3.22.6-1`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)(bug noti: <https://github.com/qgis/QGIS/issues/48380>)

**NB:**
- 🙊: non funziona più in win7 [issue](https://github.com/qgis/QGIS/issues/56604)
- ⭐⭐⭐: EOL, ultimo rialscio
- ⭐⭐: occorre [rinominare](https://www.facebook.com/pigreco314/posts/pfbid02FAXfkezQXAU65SNzoX2Jq1nrn2jMeCz7w5jDktXbxG8in1ScJhCjL9x4aZsQ3yjml) il file `api-ms-win-core-path-l1-1-0.dll.w7` in `api-ms-win-core-path-l1-1-0.dll` (si trova nella cartella bin) per poterlo utilizzare in macchine che montano windows 7 64 b
- ⭐: utilizzabile anche in macchine che montano windows 7 64 bit

## VECCHIO REPOSITORY OSGeo4W64 v1

<p align="center"> <a href="" target="_blank"><img src="./imgs/info_qgis320RC.png" width="700" title="info QGIS 3.20 RC Odense"></a>
<p align="center"> <a href="" target="_blank"><img src="./imgs/info_osgeo4w_testing.png" width="700" title="info QGIS 3.18 Zürich"></a>
</p>

- [QGIS 3.24.3-1 Tisler Portable](https://drive.google.com/file/d/1-NW6bQGvK4Z4oELeYk0FtpdGxEN-zq1P/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\QGIS-OSGeo4W-3.24.3`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- **QGIS 3.20.1-1 Odense Portable** (grave bug, uso sconsigliato)
- [QGIS 3.20.0-4 RC Odense Portable](https://drive.google.com/file/d/15QNiABWFlBfvxoGAFxJqUThT25Kenwqe/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\QGIS-OSGeo4W-3.20.0-4`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute)
- [QGIS 3.18.2-1 Zürich Portable](https://drive.google.com/file/d/1C04vJNz43dMaVAua3yT_u7e4UasFmLgx/view?usp=sharing) (da unzippare in una pen drive (o dove preferite) `F:\OSGeo4W_31821-testing`, doppio clic su `qgis-grass.bat`)(è una prima versione da testare, ogni suggerimento o segnalazione sono benvenute) [Grazie per l'aiuto a [Andrea Giudiceandrea](https://github.com/agiudiceandrea)]

### Con GRASS GIS 7.8

- [QGIS 3.16.16-1 Hannover Portable Grass 7.8.5 LTR](https://drive.google.com/file/d/1ylrcrQKjpz4AEQPLyAKSZac-EhKpcBAR/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.16.15-1 Hannover Portable Grass 7.8.5 LTR](https://drive.google.com/file/d/18m4DNSkfXAoBbpcnaasrXzmWhHbZvpGA/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.16.14-1 Hannover Portable Grass 7.8.5 LTR](https://drive.google.com/file/d/1-2kJBHUOvlJZlQq7oNyPl8AMFwki8soC/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.16.13-1 Hannover Portable Grass 7.8.5 LTR](è la stessa della 3.16.12, creata solo per motivi di BUG presenti nella MSI) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.16.12-1 Hannover Portable Grass 7.8.5 LTR](https://drive.google.com/file/d/1-2KVy3j0WzOVQ2u2mxybSUgOUADPFqSx/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.16.11-1 Hannover Portable Grass 7.8.5 LTR](https://drive.google.com/file/d/1-1We95MgGXEzIyEoRVe4YA1K3SjlygU6/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.16.10-1 Hannover Portable Grass 7.8.5 LTR](https://drive.google.com/file/d/1XXnPxAXnWunDOS0tZ3YR9L83quORmEpK/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.16.9-1 Hannover Portable Grass 7.8.5 LTR](https://drive.google.com/file/d/1AXUHhw3Py-JTAxqcGayhA1NIxP8dnwZA/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.16.8-1 Hannover Portable Grass 7.8.5 LTR](https://drive.google.com/file/d/1D2DYM2GnercZztNZVCbPFWVX7stpMeCr/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.18.3-1 Zürich Portable Grass 7.8.5](https://drive.google.com/file/d/1EKdhBlfImdJNdHBFfCVSZU2EwtJzaXQg/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.16.7-1 Hannover Portable Grass 7.8.5 LTR](https://drive.google.com/file/d/18AncD24y2DPmWVW9Cp5mYKOE_t1YUMLg/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.18.2-1 Zürich Portable Grass 7.8.5](https://drive.google.com/file/d/1r2wb2psRJlg_3Dw_hErEQsblJpC7MuuD/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.16.6-1 Hannover Portable Grass 7.8.5 LTR](https://drive.google.com/file/d/1em9phgWHZd_gDM2ItiliYWBOEFMx1rOS/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.18.1-1 Zürich Portable Grass 7.8.5](https://drive.google.com/file/d/1WWyjI85c6lAXI4rdX6qMznHEVdE4Kz2I/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.16.5-1 Hannover Portable Grass 7.8.5 - NUOVA LTR](https://drive.google.com/file/d/1iXH2ZbJ1E4So8p67yePiAr1U5aSzydvm/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- **QGIS 3.18.0-1 Zürich** **RITIRATA** (per gravi BUG)
- [QGIS 3.16.4-1 Hannover Portable Grass 7.8.5](https://drive.google.com/file/d/1QarJdO5Ejap1fnR6Abw9ATJZ0mz9mgAF/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.16.3-1 Hannover Portable Grass 7.8.5](https://drive.google.com/file/d/1rFU_jr06Uye94H_x7ebW4o_YCiHsomQi/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.10.14-1 A Coruña Portable Grass 7.8.5 - ultima LTR](https://drive.google.com/file/d/1nCcqao0Fs7vbynvoBhCH9F7IZR56zbGZ/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.16.2-2 Hannover Portable Grass 7.8.5](https://drive.google.com/file/d/16j98oyuNHdI6mzyxqb1LQW_O9EhP4VrV/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.10.13-2 A Coruña Portable Grass 7.8.5](https://drive.google.com/file/d/1bcYf5ymAnC0QDwZBiz6jOnXGyrSjPyu5/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.16.1-1 Hannover Portable](https://drive.google.com/file/d/1V478AX6M704k6XqBqpeCo6u3T6EDdyHY/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.10.12-1 A Coruña Portable](https://drive.google.com/file/d/1avMlzxvUhBulfQoiNQDTtY7LP9wqyjn6/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.16.0-1 Hannover Portable](https://drive.google.com/file/d/1C0i5c07wFW8FUqu4Kmi674P0HCr3-89R/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.10.11-1 A Coruña Portable](https://drive.google.com/file/d/1BwI2ctbCj_09Xiun9Jn-ULUc0Yp_sIVZ/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.14.16-2 Pi Portable](https://drive.google.com/file/d/1PYClM7R6Ig825XwchpdgtAQ7-yc5M0Jg/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W`, doppio clic su `qgis-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.10.10-2 A Coruña Portable](https://drive.google.com/file/d/1l-lVEE7qTleSZ9s-wvvZq8bPYpM73r9j/view?usp=sharing) (da unzippare in una pen drive `F:\OSGeo4W` doppio clic su `qgis-ltr-grass.bat`)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)

Unzippare, per avviare QGIS: doppio clic su `qgis-grass.bat` 

### GRASS GIS non abilitato

- [QGIS 3.14.15-1 Pi Portable](https://mega.nz/file/FYRD3IJT#ebhWN_rfzHS2K9Q_rkgtxJsGwyjQgW5qVe3MrM58eCA) (da unzippare in una pen drive `F:\OSGeo4W` e eseguire punto 8)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.14.0-1 Pi Portable](https://mega.nz/file/kJxAySYI#zh-lNt0VGCmCJBkSgYGWFZTEVOF7kNon6Lg6-A5ci7E) (da unzippare in una pen drive `F:\OSGeo4W` e eseguire punto 8)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.12.2-1 A Coruña Portable](https://mega.nz/file/pZZgAaLS#jeW77H4QWXdWthPU-tACoU1o30vcZKZ6CehXtPFkYxM) (da unzippare in una pen drive `F:\OSGeo4W` e eseguire punto 8)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.10.5-1 LTR A Coruña Portable](https://mega.nz/file/QcwkDCBJ#0bpC4P0dx4euAirNnjUJR34h3ZOUbIXLVDyP_UFVvxY) (da unzippare in una pen drive `F:\OSGeo4W` e eseguire punto 8)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.10.2-2 A Coruña Portable](https://mega.nz/#!hFpGgSqY!ortl0wgzflbQ_-HxrhK4uwu-T7tX5iu1FuwiXp0UQEM) (da unzippare in una pen drive `F:\OSGeo4W` e eseguire punto 8)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.8.3-1 Zanzibar Portable](https://mega.nz/#!xNoUDSKZ!j3yRI0DOGI6AtP_NdqLLsIDSXYX0dbXcaLsoIOcHHFQ) (da unzippare in una pen drive `F:\OSGeo4W` e eseguire punto 8)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.6.3-1 Noosa Portable](https://mega.nz/#!kEACTIiI!9oP4cFzBmb8CmuHsHb7v_y1sxy7kYFpq72GxjCcC3_g) (da unzippare in una pen drive `F:\OSGeo4W` e eseguire punto 8)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.4.15 LTR Madeira Portable](https://mega.nz/#!IYwglCgA!0rQNgcFv_hthCdr_govcKxiTaWBmQKUgRZN_mBjnQcU) (da unzippare in una pen drive `F:\OSGeo4W` e eseguire punto 8)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.4.10 LTR Madeira Portable](https://mega.nz/#!IN5VWaJY!nMUkHxy1krLLm9h1LdISTEVAcTRHyQumpPMDF927CpU) (da unzippare in una pen drive `F:\OSGeo4W` e eseguire punto 8)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.4.9 LTR Madeira Portable](https://mega.nz/#!UYRRFYIY!xljwwxNunudCoGwnvajNHjOuJf35TVYER-TyPx9-5LA) (da unzippare in una pen drive `F:\OSGeo4W` e eseguire punto 8)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.4.8 LTR Madeira Portable](https://mega.nz/#!dQBBzabA!NW76-W72lA7hCwvK9HDukHIWw_A1pOdjXvTdxOeAGLU) (da unzippare in una pen drive `F:\OSGeo4W` e eseguire punto 8)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.2.3-1 Bonn Portable](https://mega.nz/#!4JJxHCRD!eKpBzwTcskJeoY9cxwZzpjsYRmEemkmXT10alDNZ_I4) (da unzippare in una pen drive `F:\OSGeo4W` e eseguire punto 8)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 3.0.3-1 Girona Portable](https://mega.nz/#!JRg0WQIQ!0NK1-o1l1dFNk71E-KLbKxKt-leJKPtC-4JKavTTq3M) (da unzippare in una pen drive `F:\OSGeo4W` e eseguire punto 8)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- [QGIS 2.18.28-3 LTR Las Palmas Portable](https://mega.nz/#!dFRCAAwC!x3hx-EazfFCHsWXNrUE4zQbzDp8FIXEQzRcoxMIOz7g) (da unzippare in una pen drive `F:\OSGeo4W` e eseguire punto 8)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)

**DISCLAIMER**

Questa guida è stata realizzata e testata nel mio laptop e funziona bene, si connette al web. Non mi assumo nessuna responsabilità su eventuali incidenti di percorso!!!

<p align="center"> <a href="https://giphy.com/explore/free-gif" target="_blank"><img src="./imgs/giphy.gif" width="500" title="avvio QGIS"></a>
</p>