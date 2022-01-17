#!/bin/bash

# crea una cartella OSGeo4W e lavora da qui

set -x
# variabile con nome versione
versione=QGIS-OSGeo4W-3.16.5-1-Setup-x86_64
# scarico il file eseguibile
curl http://download.osgeo.org/qgis/win64/"$versione".exe >"$versione".exe
# unzippo il file eseguibile
7z x "$versione".exe
# rinomino la cartella
mv '$_25_' qgis
# sposto la cartella
mv '$PLUGINSDIR' qgis
# scarico file qgis-grass.bat
curl -L "https://github.com/pigreco/QGIS_portable_3x/raw/master/file/win64/qgis-ltr-grass.bat" >qgis-ltr-grass.bat
#cambio cartella
cd qgis/bin
# scarico file qgis.bat e py3_env.bat
# curl -L "https://github.com/pigreco/QGIS_portable_3x/raw/master/file/win64/qgis.bat" >qgis.bat
curl -L "https://github.com/pigreco/QGIS_portable_3x/raw/master/file/win64/py3_env.bat" >py3_env.bat
# nel caso sia una LTR
curl -L "https://github.com/pigreco/QGIS_portable_3x/raw/master/file/win64/qgis-ltr.bat" >qgis-ltr.bat
# cambio cartella
cd ../apps/qgis-ltr/bin
# scarico cartella zippata
curl -L "https://github.com/pigreco/QGIS_portable_3x/raw/master/file/win64/win64.zip" >win64.zip
# unzippo cartella
7z x win64.zip
# rimuovo file inutili
rm win64.zip
# cambio cartella
cd ../../../../
rm *.exe
# cambio cartella
cd ..
# creo unica cartella zippata, adeguare i numeri finali
7z a OSGeo4W64_31651-ltr_grass78.7z OSGeo4W