# procedura

1. scaricare il file *.msi da qui : <http://download.osgeo.org/qgis/win64/>
2. estrarlo seguendo questo link : <https://superuser.com/a/307679>
3. rinominare la cartella in `qgis`
4. all'interno della cartella `qgis` incollare il file `qgis-grass.bat` della procedura classica
5. nella cartella `apps\qgis\python\plugins\processing\algs\saga` rimoninare il file `SagaAlgorithmProvider.py.tmpl` in `SagaAlgorithmProvider.py` e modificare la riga 43 da `REQUIRED_VERSION = @saga@` a `REQUIRED_VERSION = '7.8.2'` vedi commento <https://www.facebook.com/pigreco314/posts/10225680038096594?comment_id=10225681201165670&reply_comment_id=10225901495232884>
6. ricercare, dentro la cartella `qgis` tutti i file `*.tmpl` e rinominarli togliendo `.tmpl`
7. zippare e la portable è pronta.

grazie Andrea Giudiceandrea