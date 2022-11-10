@echo off
SETLOCAL enabledelayedexpansion
title CyberPatriot Starting Script - RUN AS ADMIN

rem Variables

rem net session
if %errorlevel%==0 (
	echo Admin rights granted!
    timeout /t 1 /NOBREAK>nul
    cls
) else (
    echo Failure, no rights
    timeout /t 1 /NOBREAK>nul
    exit
)

echo confirm you have completed the forensic questions (y/n)
set /p forensics=
    if /I %forensics%==y (
        goto :mainmenu
    ) else (
        echo then go answer them dummy
        timeout /t 2 /NOBREAK>nul
        exit
    )
    
:mainmenu
    cls
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo " _____                       __          ___ _   _       _______ _             _    _                                  
	echo "|  __ \                      \ \        / (_) | | |     |__   __| |           | |  | |                                 
	echo "| |  | | _____      ___ __    \ \  /\  / / _| |_| |__      | |  | |__   ___   | |__| | _____  ____ _  __ _  ___  _ __  
	echo "| |  | |/ _ \ \ /\ / / '_ \    \ \/  \/ / | | __| '_ \     | |  | '_ \ / _ \  |  __  |/ _ \ \/ / _` |/ _` |/ _ \| '_ \ 
	echo "| |__| | (_) \ V  V /| | | |    \  /\  /  | | |_| | | |    | |  | | | |  __/  | |  | |  __/>  < (_| | (_| | (_) | | | |
	echo "|_____/ \___/ \_/\_/ |_| |_|     \/  \/   |_|\__|_| |_|    |_|  |_| |_|\___|  |_|  |_|\___/_/\_\__,_|\__, |\___/|_| |_|
	echo "                                                                                                      __/ |
    echo "                                               ~~~~~~~~~~~~~~~~~~~~~~~                               |___/           
    echo "                                        __      ___         _                                                          
    echo "                                        \ \    / (_)_ _  __| |_____ __ _____                                           
    echo "                                         \ \/\/ /| | ' \/ _` / _ \ V  V (_-<                                           
    echo "                                          \_/\_/ |_|_||_\__,_\___/\_/\_//__/                                                                     
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Developer: David Mazilu~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo ~
    echo 01} create a user           02} remove a user
	echo 03} change administrator    05} set password
	echo 05} updates                 06} 
	echo 07} security policies       08} enable defender/firewall
	echo 09} search files            10} disable services
	echo 11}                         12} RDS configuration
	echo 13}                         14} launch checklist w/ notes
	echo 15} full scan cachine       16} edit groups
    echo 17} set audits              18} check ports/netcat
	echo 19} view changes            20} exit
    echo [91m66} execute order 66 [0m
    echo ~

                                    rem Table Of Contents (i am aware there is probably a better way to do this, i am also ignorant)
    set /p navigate=select--
    if %navigate%==1 (
        goto :createUser
    )
    if %navigate%==01 (
        goto :createUser
    )
    if %navigate%==2 (
        echo registered two, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==02 (
        echo registered two, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==3 (
        echo registered three, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==03 (
        echo registered three, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==4 (
        echo registered four, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==04 (
        echo registered four, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==5 (
        echo registered five, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==05 (
        echo registered five, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==6 (
        echo registered six, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu 
    )
    if %navigate%==06 (
        echo registered six, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu 
    )
    if %navigate%==7 (
        echo registered seven, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==07 (
        echo registered seven, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==8 (
        echo registered eight, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==08 (
        echo registered eight, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==9 (
        echo registered nine, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==09 (
        echo registered nine, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==10 (
        echo registered 10, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu 
    )
    if %navigate%==11 (
        echo registered 11, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==12 (
        echo registered 12, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==13 (
        echo registered 13, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==14 (
        echo registered 14, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==15 (
        echo registered 15, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==16 (
        echo registered 16, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==17 (
        echo registered 17, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==18 (
        echo registered 18, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu
    )
    if %navigate%==19 (
        echo registered 19, page unavailable, still in development, press any key to reset. . .
        pause>nul
        goto :mainmenu          
    )
    if %navigate%==20 (
            goto :exit
    )

    echo error 404, directory not found, unknown input
    echo press any key to reset. . . 
    pause>nul
        goto :mainmenu

                                    rem Functions
:createUser
    cls
    echo creating new user...
    echo please input name of new user:
    set /p userplus=
    net user !userplus! /add
    echo user !userplus! created, revert changes? (y/n) [if error occured input 'y']
    set /p revert1=
    if %revert1%==n (
        echo action confirmed, press any key to return to menu. . .
        pause>nul
        rem audit

            goto :mainmenu
    ) else (
        rem undo
        echo this change has been successfully reverted, press any key to return to menu. . . 
        pause>nul
            goto :mainmenu
    )

:disableUser
    cls
    
        
        
:exit
    echo cya sucker
    timeout /t 2 /NOBREAK>nul
    exit