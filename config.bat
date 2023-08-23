@echo off
setlocal enabledelayedexpansion

set "conteudoEmail="
set "conteudoName="

set "contador=0"

for /f "delims=" %%i in (email.txt) do (
    set /a "contador+=1"
    if !contador! gtr 1 (
        set "conteudoEmail=!conteudoEmail!\n"
    )
    set "conteudoEmail=!conteudoEmail!%%i"
)

set "contador=0"

for /f "delims=" %%i in (name.txt) do (
    set /a "contador+=1"
    if !contador! gtr 1 (
        set "conteudoName=!conteudoName!\n"
    )
    set "conteudoName=!conteudoName!%%i"
)

echo Email definido: !conteudoEmail!
echo Name definido: !conteudoName!

set "conteudoUrl="

set "contador=0"

for /f "delims=" %%i in (url.txt) do (
    set /a "contador+=1"
    if !contador! gtr 1 (
        set "conteudoUrl=!conteudoUrl!\n"
    )
    set "conteudoUrl=!conteudoUrl!%%i"
)

set "url=!conteudoUrl!"
for %%A in (%url%) do set "texto=%%~nxA"
echo Pasta encontrada: !texto!

cd !texto!

git config --global user.email !conteudoEmail!
git config --global user.name !conteudoName!
git config  --replace-all user.email !conteudoEmail!
git config  --replace-all user.name !conteudoName!
git branch new!conteudoName!
git checkout new!conteudoName!

echo Nova branch criada: new!conteudoName!


endlocal

pause