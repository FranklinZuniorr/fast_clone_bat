@echo off
setlocal enabledelayedexpansion

:: Limpa a variável de conteúdo (caso já exista)
set "conteudo="

:: Contador de linhas
set "contador=0"

:: Lê cada linha do arquivo e armazena na variável "conteudo"
for /f "delims=" %%i in (url.txt) do (
    set /a "contador+=1"
    if !contador! gtr 1 (
        set "conteudo=!conteudo!\n"
    )
    set "conteudo=!conteudo!%%i"
)

:: Exibe o conteúdo armazenado na variável
echo.!conteudo!

git clone !conteudo!

endlocal

start config

pause