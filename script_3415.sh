#!/bin/bash

set -x

versione="QGIS-OSGeo4W-3.4.15-1-Setup-x86_64.exe"
nome=$(sed -r 's/(QGIS-)(.+)(-Setup-x86_64.exe)/\2/g' <<<"$versione")
echo "$nome"

curl http://download.osgeo.org/qgis/win64/"$versione" >"$versione"
7z x "$versione"
mv '$_25_' OSGeo4W
mv '$PLUGINSDIR' OSGeo4W
cd OSGeo4W/bin
mv qgis-ltr.bat.tmpl qgis-ltr.bat
cd ../apps/qgis-ltr/bin
curl -L "https://github.com/pigreco/QGIS_portable_3x/raw/master/file/win64/win64.zip" >win64.zip
7z x win64.zip
rm win64.zip
cd ../../../../
7z a "$nome".7z OSGeo4W