#!/bin/bash

# crea una cartella OSGeo4W64 e lavora da qui
# a partire da questa versione non c'è più SAGA GIS nel core

set -x
# variabile con nome file: da qui http://download.osgeo.org/qgis/win64/
nomefile="QGIS-OSGeo4W-3.30.1-1"
# estrae numero versione: 3.xx.x
nr=`echo "$nomefile" | sed s/QGIS-OSGeo4W-// | sed -E s/-.$//`
# scarica il file eseguibile
curl http://download.osgeo.org/qgis/win64/"$nomefile".msi >"$nomefile".msi
# unzippa il file eseguibile msi
msiextract -C ./ "$nomefile".msi
# rinomina la cartella
mv 'QGIS '"$nr" qgis
# scarica file qgis-grass.bat
curl -L "https://github.com/pigreco/QGIS_portable_3x/raw/master/file/win64/qgis-grass.bat" >qgis-grass.bat
# elimina file non necessari
rm *.msi
rm *.sh
# cambia cartella
cd ..
# crea unica cartella zippata
7z a OSGeo4W64_"$nr"_grass.7z OSGeo4W64
