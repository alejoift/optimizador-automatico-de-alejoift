@echo off

:: administrador
echo adquiriendo permisos de administrador

timeout /t 3 /nobreak > NUL
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto GotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:GotAdmin
    pushd "%CD%"
    CD /D "%~dp0"


:inicio
chcp 65001 >nul 2>&1
cls
set a=[32m
set b=[36m
echo.
echo.
echo.
                                                 
                                                  
echo                                   %a% █████╗ ██╗     ███████╗     ██╗ ██████╗ ██╗███████╗████████╗ %a%   
echo                                   %a%██╔══██╗██║     ██╔════╝     ██║██╔═══██╗██║██╔════╝╚══██╔══╝%a%   
echo                                   %a%███████║██║     █████╗       ██║██║   ██║██║█████╗     ██║        %a%
echo                                   %a%██╔══██║██║     ██╔══╝  ██   ██║██║   ██║██║██╔══╝     ██║       %a%
echo                                   %a%██║  ██║███████╗███████╗╚█████╔╝╚██████╔╝██║██║        ██║    %a%  
echo                                   %a%╚═╝  ╚═╝╚══════╝╚══════╝ ╚════╝  ╚═════╝ ╚═╝╚═╝        ╚═╝      %a%  
echo.                           

echo                                                            Version: 0.1 %                                  
echo.
echo.
echo.
echo                                          [1]nvidia inspector                  [4]liberar espacio
echo.
echo                                          [2]plan de energia     
echo.  
echo                                          [3]timer resolution                      



set choice=                                                                 
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto NVIDIAInspector
if '%choice%'=='2' goto Plandeenergia
if '%choice%'=='3' goto timer
if '%choice%'=='4' goto liberar



:NVIDIAInspector
cls
echo        ELIGE UN PERFIL DE NVIDIA
echo.
echo    PERFIL NVIDIA INSPECTOR NORMAL = 1
echo    PERFIL NVIDIA INSPECTOR VERSION AVANZADA (experimental) = 2
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto NVIDIA
if '%choice%'=='2' goto NVIDIAavanzado


:NVIDIA

echo Aplicando perfil de nvidia inspector
curl -g -k -L -# -o "%temp%\nvidiaProfileInspector.zip" "https://github.com/Orbmu2k/nvidiaProfileInspector/releases/download/2.4.0.19/nvidiaProfileInspector.zip" >> APB_Log.txt
powershell -NoProfile Expand-Archive '%temp%\nvidiaProfileInspector.zip' -DestinationPath 'C:\NvidiaProfileInspector\' >> APB_Log.txt
curl -g -k -L -# -o "C:\NvidiaProfileInspector\alejoiftv1.nip" "https://raw.githubusercontent.com/alejoift/optimizador-automatico-de-alejoift/main/recursos/alejoiftv1.nip" >> APB_Log.txt
start "" /wait "C:\NvidiaProfileInspector\nvidiaProfileInspector.exe" "C:\NvidiaProfileInspector\alejoiftv1.nip" >> APB_Log.txt
timeout /t 3 /nobreak > NUL
goto terminonvidia

:NVIDIAavanzado

echo Aplicando perfil de nvidia inspector
curl -g -k -L -# -o "%temp%\nvidiaProfileInspector.UNLOCKED.zip" "https://raw.githubusercontent.com/alejoift/optimizador-automatico-de-alejoift/main/recursos/nvidiaProfileInspector.UNLOCKED.zip" >> APB_Log.txt
powershell -NoProfile Expand-Archive '%temp%\nvidiaProfileInspector.UNLOCKED.zip' -DestinationPath 'C:\nvidiaProfileInspector.UNLOCKED\' >> APB_Log.txt
curl -g -k -L -# -o "C:\nvidiaProfileInspector.UNLOCKED\alejoiftv1pro.nip" "https://raw.githubusercontent.com/alejoift/optimizador-automatico-de-alejoift/main/recursos/alejoiftv1pro.nip" >> APB_Log.txt
start "" /wait "C:\nvidiaProfileInspector.UNLOCKED\nvidiaProfileInspector.UNLOCKED.exe" "C:\nvidiaProfileInspector.UNLOCKED\alejoiftv1pro.nip" >> APB_Log.txt
timeout /t 3 /nobreak > NUL

goto terminonvidia

:terminonvidia
echo.
echo   [1] volver al inicio
echo.
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto inicio



:Plandeenergia
cls
echo.
echo APLICANDO PLAN DE ENERGIA DE ALEJO
echo.
curl -g -k -L -# -o "C:\alejoiftonsocials.pow" "https://raw.githubusercontent.com/alejoift/optimizador-automatico-de-alejoift/main/recursos/alejoiftonsocials.pow" >> APB_Log.txt
powercfg -import "C:\alejoiftonsocials.pow" 33333333-2222-3333-2222-333333333333 >> APB_Log.txt
powercfg -setactive 33333333-2222-3333-2222-333333333333 >> APB_Log.txt
timeout /t 3 /nobreak > NUL

echo BORRAR TODOS LOS PLANES DE ENERGIA
:: borrar plan de balanceo
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e >> APB_Log.txt

:: borrar plan de ahorro de energia
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a >> APB_Log.txt

:: borrar plan de alto rendimiento
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >> APB_Log.txt

:: borrar plan ultimate
powercfg -delete e9a42b02-d5df-448d-aa00-03f14749eb61 >> APB_Log.txt

:: borrar plan de energia de amd
powercfg -delete 9897998c-92de-4669-853f-b7cd3ecb2790 >> APB_Log.txt
timeout /t 3 /nobreak > NUL

echo.
echo   [1] volver al inicio
echo.
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto inicio


:liberar
cls
echo.
echo   LIBERANDO ESPACIO DEL DISCO
echo.

timeout /t 5 /nobreak >nul

echo   se va a liberar espacio de tu disco lo puedes comprobar tu mismo.

timeout /t 5 /nobreak >nul

::liberando espacio
powercfg -h off & DISM /Online /Set-ReservedStorageState /State:Disabled & reagentc /disable >nul

@echo off
echo 
timeout /t 3 /nobreak >nul

echo presiona cualquier boton para terminar y reiniciar el sistema.
pause

:: echo
echo se ha liberado el espacio se reiniciara el sistema.
shutdown /r /f /t 0

:timer
cls
echo.
echo    TIMER RESOLUTION
echo.
timeout /t 5 /nobreak >nul
echo.
echo     presiona cualquier tecla para que timer resolution se configure automaticamente, 
echo     y no tengas que utilizar iscl o abrirlo manualmente por que va a quedar en segundo
echo     funcionando a 0.5 automaticamente. 
echo.                        
@echo off
title Timer Resolution Auto 0.5ms
echo Configurando Timer Resolution...

:: Descargar
curl -g -k -L -# -o "%temp%\timerresolution.zip" "https://raw.githubusercontent.com/alejoift/optimizador-automatico-de-alejoift/main/recursos/timerresolution.zip" >nul 2>&1

:: Verificar descarga
if not exist "%temp%\timerresolution.zip" (
    echo Error en la descarga
    pause
    exit
)

:: Crear carpeta
if not exist "C:\timerresolution\" mkdir "C:\timerresolution\"

:: Extraer
powershell -NoProfile Expand-Archive "%temp%\timerresolution.zip" -DestinationPath "C:\timerresolution\" -Force >nul 2>&1

timeout /t 2 /nobreak >nul

:: Crear script oculto para inicio
echo Set WshShell = CreateObject("WScript.Shell") > "C:\timerresolution\start_hidden.vbs"
echo WshShell.Run "C:\timerresolution\SetTimerResolution.exe 0.5", 0 >> "C:\timerresolution\start_hidden.vbs"

:: Ejecutar ahora (oculto)
start "" "C:\timerresolution\start_hidden.vbs"

:: Agregar al inicio (100% automático)
copy "C:\timerresolution\start_hidden.vbs" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\" /Y >nul

echo.
echo ✔ Timer Resolution 0.5ms aplicado y configurado al inicio
timeout /t 2 >nul
exit
echo.
@echo off
pause












