@echo off
call "%~dp0\o4w_env.bat"
call "%OSGEO4W_ROOT%\apps\grass\grass78\etc\env.bat"
call qt5_env.bat
call py3_env.bat
@echo off
path %OSGEO4W_ROOT%\apps\qgis\bin;%OSGEO4W_ROOT%\apps\grass\grass78\lib;%OSGEO4W_ROOT%\apps\grass\grass78\bin;%PATH%
set QGIS_PREFIX_PATH=%OSGEO4W_ROOT:\=/%/apps/qgis
set GDAL_FILENAME_IS_UTF8=YES
rem Set VSI cache to be used as buffer, see #6448
set VSI_CACHE=TRUE
set VSI_CACHE_SIZE=1000000
set QT_PLUGIN_PATH=%OSGEO4W_ROOT%\apps\qgis\qtplugins;%OSGEO4W_ROOT%\apps\qt5\plugins
start "QGIS" /B "%OSGEO4W_ROOT%\bin\qgis-bin.exe" %*
exit
