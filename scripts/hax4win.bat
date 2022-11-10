@echo off
SETLOCAL enabledelayedexpansion
title CyberPatriot Starting Script - RUN AS ADMIN

rem Variables

net session>nul
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
        goto :mainMenu
    ) else (
        echo then go answer them dummy
        timeout /t 2 /NOBREAK>nul
        exit
    )
    
:mainMenu
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

    set /p navigate=select--

rem Table Of Contents
rem possible to condense in 2 lines? both navigation inputs and outputs into strings/tables
        if %navigate%==1 ( goto :createUser )
        if %navigate%==01 ( goto :createUser )
        if %navigate%==2 ( goto :removeUser )
        if %navigate%==02 ( goto :removeUser )
        if %navigate%==3 ( goto :placeHolder )
        if %navigate%==03 ( goto :placeHolder )
        if %navigate%==4 ( goto :placeHolder )
        if %navigate%==04 ( goto :placeHolder )
        if %navigate%==5 ( goto :placeHolder )
        if %navigate%==05 ( goto :placeHolder )
        if %navigate%==6 ( goto :placeHolder )
        if %navigate%==06 ( goto :placeHolder )
        if %navigate%==7 ( goto :placeHolder )
        if %navigate%==07 ( goto :placeHolder )
        if %navigate%==8 ( goto :placeHolder )
        if %navigate%==08 ( goto :placeHolder )
        if %navigate%==9 ( goto :placeHolder )
        if %navigate%==09 ( goto :placeHolder )
        if %navigate%==10 ( goto :placeHolder )
        if %navigate%==11 ( goto :placeHolder )
        if %navigate%==12 ( goto :placeHolder )
        if %navigate%==13 ( goto :placeHolder )
        if %navigate%==14 ( goto :placeHolder )
        if %navigate%==15 ( goto :placeHolder )
        if %navigate%==16 ( goto :placeHolder )
        if %navigate%==17 ( goto :placeHolder )
        if %navigate%==18 ( goto :placeHolder )
        if %navigate%==19 ( goto :placeHolder )
        if %navigate%==20 ( goto :exit )

        echo error 404, directory not found, unknown input
        echo press any key to reset. . . 
        pause>nul
           goto :mainMenu

rem Functions - AUDITS NEEDED

:placeHolder
    echo %navigate% registered, page unavailable, still in development, press any key to reset. . .
    pause>nul
    goto:mainMenu

:createUser
    cls

    rem Backs out in case of mistake
    echo continue creating a user? (y/n) [input n to return to menu]
    set /p confirm1=
        if %confirm1%==n (goto :mainMenu)

    rem Actually creates user (after input)
    echo creating new user...
    echo please input name of new user:
    set /p userAdd=
    net user !userAdd! /add

    rem Runs a fail check
    net user %userAdd%>nul
        if %ERRORLEVEL%==0 (goto :continueAdd) else (
            echo [91mfailure to add user, press any key to return to menu. . .[0m
            pause>nul
                goto :mainMenu
        )

    :continueAdd
        echo user [92m!userAdd![0m created, revert changes? (y/n)
        set /p revert1=
            if %revert1%==n (
                echo action confirmed, press any key to return to menu. . .
                pause>nul
                    goto :mainMenu
            ) else (
                goto :revertAdd
            )
    
    :revertAdd
        net user %UserAdd% /delete
        net user %userAdd%>nul
            if %ERRORLEVEL%==0 (
                echo [91mfailure to revert change, press any key to return to menu. . .[0m
                pause>nul
                    goto :mainMenu
            ) else (
                echo [92mthis change has been successfully reverted, press any key to return to menu. . .[0m 
                pause>nul
                    goto :mainMenu
            )


:removeUser
    cls

    rem Backs out in case of mistake
    echo continue removing a user? (y/n) [input n to return to menu]
    set /p confirm2=
        if %confirm2%==n (goto :mainMenu)

    rem Actually removes user (after input)
    echo removing a user...
    echo please input name of unlucky user:
    set /p userDel=
    net user !userDel! /delete

    rem Runs a fail check
    net user %userDel%>nul
        if %ERRORLEVEL%==0 (
            echo [91mfailure to remove user, press any key to return to menu. . .[0m
            pause>nul
                goto :mainMenu
        ) else (
            goto :continueDel
        )

    :continueDel
        echo user [92m!userDel![0m removed, revert changes? (y/n)
        set /p revert2=
            if %revert2%==n (
                echo action confirmed, press any key to return to menu. . .
                pause>nul
                    goto :mainMenu
            ) else (
                goto :revertDel
            )
    
    :revertDel
        net user %UserDel% /add
        net user %userDel%>nul
            if %ERRORLEVEL%==0 (
                echo [92mthis change has been successfully reverted, press any key to return to menu. . .[0m 
                echo reverting deletion of an adiminstrator does NOT reinstate administrator
                pause>nul
                    goto :mainMenu
            ) else (
                echo [91mfailure to revert change, press any key to return to menu. . .[0m
                pause>nul
                    goto :mainMenu
            )

    
        
        
:exit
    echo are you sure you want to exit the script?
    set /p confirm20=
        if %confirm20%==n (goto :mainMenu)
    echo why didnt you just press the x and close the application...
    timeout /t 2 /NOBREAK>nul
    exit