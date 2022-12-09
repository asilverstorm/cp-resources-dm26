@echo off
SETLOCAL enabledelayedexpansion
title CyberPatriot Starting Script - RUN AS ADMIN

rem Variables

rem net session>nul
    if %errorlevel%==0 (
	    echo Admin rights granted!
        timeout /t 1 /NOBREAK>nul
        cls
    ) else (
        echo Failure, no rights
        timeout /t 1 /NOBREAK>nul
        exit
    )

:forensicsConfirm
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
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ >> menu.txt
	echo " _____                      __          ___ _   _      _______ _             _    _                                   ">> menu.txt
	echo "|  __ \                     \ \        / (_) | | |    |__   __| |           | |  | |                                  ">> menu.txt
	echo "| |  | | _____      ___ __   \ \  /\  / / _| |_| |__     | |  | |__   ___   | |__| | _____  ____ _  __ _  ___  _ __   ">> menu.txt
	echo "| |  | |/ _ \ \ /\ / / '_ \   \ \/  \/ / | | __| '_ \    | |  | '_ \ / _ \  |  __  |/ _ \ \/ / _` |/ _` |/ _ \| '_ \  ">> menu.txt
	echo "| |__| | (_) \ V  V /| | | |   \  /\  /  | | |_| | | |   | |  | | | |  __/  | |  | |  __/>  < (_| | (_| | (_) | | | | ">> menu.txt
	echo "|_____/ \___/ \_/\_/ |_| |_|    \/  \/   |_|\__|_| |_|   |_|  |_| |_|\___|  |_|  |_|\___/_/\_\__,_|\__, |\___/|_| |_| ">> menu.txt
	echo "                                                                                                    __/ |             ">> menu.txt
    echo "                                               ~~~~~~~~~~~~~~~~~~~~~~~                             |___/              ">> menu.txt
    echo "                                        __      ___         _                                                         ">> menu.txt
    echo "                                        \ \    / (_)_ _  __| |_____ __ _____                                          ">> menu.txt
    echo "                                         \ \/\/ /| | ' \/ _` / _ \ V  V (_-<                                          ">> menu.txt
    echo "                                          \_/\_/ |_|_||_\__,_\___/\_/\_//__/                                          ">> menu.txt                        
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Developer: David Mazilu~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>> menu.txt
	echo ~  >> menu.txt
    echo 01} create a user           02} remove a user >> menu.txt
	echo 03} change administrator    05} set password  >> menu.txt
	echo 05} updates                 06} edit/view groups >> menu.txt
	echo 07} security policies       08} set audit policies  >> menu.txt
	echo 09} defender/firewall on    10} disable services  >> menu.txt
	echo 11} full scan machine       12} RDS configuration  >> menu.txt
	echo 13} FTP configuration       14} launch checklist w/ notes  >> menu.txt
	echo 15} full scan machine       16} view changes made  >> menu.txt
    echo 17} view changelog          18} check ports/netcat  >> menu.txt
	echo 19} save changes            20} exit  >> menu.txt
    echo [91m66} execute order 66 [0m  >> menu.txt
    echo ~  >> menu.txt

    for /f "delims=" %%a in (menu.txt) do (
        echo %%a
        ping 127.0.0.1 -n 1 -w 500 >nul
    )
    
    del menu.txt
    set /p navigate=select--
    for /l %%i in (1,1,20) do (
        if "!navigate!"=="0%%i" (
            goto :menuOption%%i
        )
        if "!navigate!"=="%%i" (
            goto :menuOption%%i
        )
    )
    echo error 404, directory not found, unknown input
    echo [91m!%navigate%[0m registered, page may be unavailable
    echo press any key to reset. . . 
    pause>nul
    goto :mainMenu



rem create user
:menuOption1 
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

    rem Runs a fail check, may be redundant/unnecessary 
    net user %userAdd%>nul
        
        if not defined userAdd (
            echo Error: no user name provided. Press any key to return to menu. . .
            pause>nul
                goto :mainMenu
        )        
        
        if %ERRORLEVEL%==0 (goto :continueAdd) else (
            echo [91mfailure to add user, press any key to return to menu. . .[0m
            pause>nul
                goto :mainMenu
        )


    :continueAdd
        echo user [92m!userAdd![0m created, revert changes? (y/n)
        set /p revert1=
            if %revert1%==n (
                echo %date% %time% - %userAdd% was created >> log.txt
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


:menuOption2
    cls

    rem Backs out in case of mistake
    echo continue removing a user? (y/n) [input n to return to menu]
    set /p confirm2=
        if %confirm2%==n (goto :mainMenu)

    rem Actually removes user (after input)
    net user
    echo please choose a user to be removed:
    set /p userDel=
    net user !userDel! /delete

    rem Runs a fail check

    if not defined userAdd (
                echo Error: no user name provided. Press any key to return to menu. . .
                pause>nul
                    goto :mainMenu
            ) 

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
                echo %date% %time% - %userDel% was deleted >> log.txt
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
                echo (reverting deletion of an adminstrator does not reinstate administrator rights)
                pause>nul
                    goto :mainMenu
            ) else (
                echo [91mfailure to revert change, press any key to return to menu. . .[0m
                pause>nul
                    goto :mainMenu
            )

    

:menuOption17 rem /// also add stuff like net user to like show even more sys info
    cls
    for /f "delims=" %%a in (log.txt) do (
        echo %%a
        ping 127.0.0.1 -n 1 -w 500 >nul
    )
    
    del menu.txt
    echo ~
    echo ~
    net user
    echo "(more info to be added in future)"
    echo ~
    echo ~
    echo changelog can also be found in a .txt file on the directory this file is present in
    echo [92mpress any key to return to menu. . .[0m 
    pause>nul
        goto :mainMenu

    rem ADD REVERT FEATURE - BOTH ALL AT ONCE AND ONE DEPENDING ON NUMBERED CHANGE

    
:order66
    cls 
    echo [91mare you sure you want to do this..? (y/n)[0m
    set /p confirm66=
        if %confirm66%==y (
            echo input passphrase to start killing jedi kids
            set /p execute=%
                if %execute%==
            rem execute
            echo review/revert changes? (y/n)
            set /p anakinregret=
                if %anakinregret%==y (
                    goto :changelog
                )        
    ) else (
        goto :mainmenu
    )


:menuOption20
    echo are you sure you want to exit the script? (y/n)
    set /p confirm20=
        if %confirm20%==n (goto :mainMenu)
    echo why didnt you just press the x and close the application...
    timeout /t 2 /NOBREAK>nul
    exit

