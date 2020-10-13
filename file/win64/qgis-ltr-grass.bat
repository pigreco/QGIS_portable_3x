@ECHO OFF
REM Totò Fiandaca - 17/09/2020
REM ensures that that the commands in your batch file are not printed; only their output is printed
REM @ECHO OFF
REM expands to the drive letter and path in which that batch file is located and set a variable
REM SET DRV_LTR=%~dp0
SET DRV_LTR=%cd%
REM set a specific Qgis variable with a variable setting before
SET OSGEO4W_ROOT=%DRV_LTR%\qgis
REM add a new path to the system path
path %PATH%;%OSGEO4W_ROOT%\apps\qgis-ltr\bin;%OSGEO4W_ROOT%\apps;%OSGEO4W_ROOT%\bin;%OSGEO4W_ROOT%\apps\grass
REM if the bat file find one argument (project name), open it. Else open a Qgis program with a new empty project
IF "%1" == "" (start "QGIS" /B %OSGEO4W_ROOT%\bin\qgis-ltr.bat --profiles-path %DRV_LTR%\qgisconfig) ELSE (start "QGIS" /B %OSGEO4W_ROOT%\bin\qgis-ltr.bat --profiles-path %DRV_LTR%\qgisconfig --project %1)

REM usare le righe di sotto se trattasi di LTR, togliere REM iniziale e metterlo nelle righe 11 e 13
REM path %PATH%;%OSGEO4W_ROOT%\apps\qgis-ltr\bin;%OSGEO4W_ROOT%\apps;%OSGEO4W_ROOT%\bin;%OSGEO4W_ROOT%\apps\grass
REM if the bat file find one argument (project name), open it. Else open a Qgis program with a new empty project
REM IF "%1" == "" (start "QGIS" /B %OSGEO4W_ROOT%\bin\qgis-ltr.bat --profiles-path %DRV_LTR%\qgisconfig) ELSE (start "QGIS" /B %OSGEO4W_ROOT%\bin\qgis-ltr.bat --profiles-path %DRV_LTR%\qgisconfig --project %1)
