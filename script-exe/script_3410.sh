#!/bin/bash

set -x

curl http://download.osgeo.org/qgis/win64/QGIS-OSGeo4W-3.4.10-1-Setup-x86_64.exe >QGIS-OSGeo4W-3.4.10-1-Setup-x86_64.exe
7z x QGIS-OSGeo4W-3.4.10-1-Setup-x86_64.exe
mv '$_25_' OSGeo4W
mv '$PLUGINSDIR' OSGeo4W
cd OSGeo4W/bin
mv qgis-ltr.bat.tmpl qgis-ltr.bat
cd ../apps/qgis-ltr/bin
curl -L "https://github.com/pigreco/QGIS_portable_3x/raw/master/file/win64/win64.zip" >win64.zip
7z x win64.zip
rm win64.zip
cd ../../../../
7z a OSGeo4W_3410.7z OSGeo4W