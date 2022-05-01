#!/bin/bash

# crea una cartella OSGeo4W e lavora da qui

set -x
# variabile con nome file
nomefile="QGIS-OSGeo4W-3.22.6-1"
# estrae numero versione
nr=`echo "$nomefile" | sed s/QGIS-OSGeo4W-// | sed -E s/-1$//`
# scarica il file eseguibile
curl http://download.osgeo.org/qgis/win64/"$nomefile".msi >"$nomefile".msi
# unzippa il file eseguibile msi
msiextract -C ./ "$nomefile".msi
# rinomina la cartella
mv 'QGIS '"$nr" qgis
# scarica file qgis-grass.bat
curl -L "https://github.com/pigreco/QGIS_portable_3x/raw/master/file/win64/qgis-ltr-grass.bat" >qgis-ltr-grass.bat
#cambia cartella
cd qgis/apps/qgis-ltr/python/plugins/sagaprovider
# rinomina file 
mv SagaAlgorithmProvider.py.tmpl SagaAlgorithmProvider.py
# modificare la riga 43 del file
sed -i "s/@saga@/'7.8.2'/" SagaAlgorithmProvider.py
# cambio cartella
cd ../../../../../../

-- in contruzione --

# rinominare tutti i file `*.py.tmpl` togliendo `.tmpl`
mv *.py.tmpl *.py
# cambio cartella
cd ..
# creo unica cartella zippata, adeguare i numeri finali
7z a OSGeo4W64_$nr-ltr_grass-saga.7z OSGeo4W