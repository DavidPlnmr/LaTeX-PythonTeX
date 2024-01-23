@echo off
set LATEX_COMPILER=pdflatex
set PYTHONTEX=pythontex
set FILE_NAME=main
set MAIN_TEX_FILE=%FILE_NAME%.tex

rem Vérifier quel est le paramètre passé et appeler la règle correspondante
if "%1"=="" goto all
if "%1"=="pdf" goto pdf
if "%1"=="clean" goto clean


rem Cible par défaut
:all
call :pdf
goto :eof

rem Règle pour générer le PDF
:pdf
%LATEX_COMPILER% %MAIN_TEX_FILE%
%PYTHONTEX% %MAIN_TEX_FILE%
%LATEX_COMPILER% %MAIN_TEX_FILE%
rem Can be optional if you don't use biblatex
%LATEX_COMPILER% %MAIN_TEX_FILE%
goto :eof

rem Règle pour nettoyer les fichiers générés
:clean
del *.aux *.log *.out *.pytxcode *.pytxmcr *.synctex.gz *.toc *.pdf *.fdb_latexmk *.fls 
rmdir /s /q pythontex-files-%FILE_NAME%
goto :eof
