# QGIS portable 3.x

Creare una versione **Portable di QGIS 3.x** usando il file `*.exe` scaricato dal sito http://download.osgeo.org/qgis/

## Perché questo repository

Per tenere traccia di come realizzare una **versione Portable di QGIS 3.x** senza necessariamente aver installato il software.

## Che cosa è una versione Portable

Per applicazione portabile (o applicazione portatile; in inglese portable application) si intende un software applicativo che non necessita di installazione all’interno del sistema operativo su cui viene eseguito. Programmi di questo genere possono essere memorizzati su supporto rimovibile come cd-rom o memorie flash. 
Un’applicazione portabile può indistintamente essere eseguita su qualsiasi computer in cui si dispone di un sistema operativo compatibile con l’applicazione stessa. Il vantaggio per l’utente è quindi quello di poter utilizzare la medesima applicazione su macchine diverse mantenendo le impostazioni personalizzate nell’uso dell’applicazione. Un secondo vantaggio delle applicazioni portabili deriva dal fatto che non richiedendo installazione possono spesso essere eseguite anche in ambienti in cui non si dispone dei diritti di amministrazione sul sistema operativo. [Wikipedia](https://it.wikipedia.org/wiki/Applicazione_portabile).

## step by step

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

<p align="center"> <a href="" target="_blank"><img src="./imgs/splash_3_4_0.png" width="500" title="pen drive"></a>
</p>

Nella pen drive: (quelli evidenziato non servono più)

<p align="center"> <a href="" target="_blank"><img src="./imgs/img_03.png" width="500" title="pen drive"></a>
</p>

Buon lavoro!!!

<p align="center"> <a href="" target="_blank"><img src="./imgs/animazione.gif" width="700" title="avvio QGIS"></a>
</p>

**Riferimenti:**

- Idea presa da [qui](https://www.youtube.com/watch?v=iWbB0WPn6rM)
- [copia del mio test](https://mega.nz/#!sc40FITK!KhyszFO4kg54PxFzITSqAvX323Vh_K_ej5meEd68Reo) (da unzippare in una pen drive `F:\OSGeo4W` e eseguire punto 8)(al primo avvio potrebbe non funzionare, quindi tentare almeno due volte... ci stiamo lavorando per risolvere il bug!)
- Blog post su [Pigrecoinfinito](https://pigrecoinfinito.wordpress.com/2019/02/26/creare-una-versione-portable-di-qgis-2-18-ltr/)

**DISCLAIMER**

Questa guida è stata realizzata e testata nel mio laptop e funziona bene, si connette al web. Non mi assumo nessuna responsabilità su eventuali incidenti di percorso!!!

<p align="center"> <a href="https://giphy.com/explore/free-gif" target="_blank"><img src="./imgs/giphy.gif" width="700" title="avvio QGIS"></a>
</p>