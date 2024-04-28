@echo off
SETLOCAL enabledelayedexpansion
title CyberPatriot Starting Script - RUN AS ADMIN
cd /d "%~dp0" 

net session<nul
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
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
	echo " _____                      __          ___ _   _      _______ _             _    _                                   "
	echo "|  __ \                     \ \        / (_) | | |    |__   __| |           | |  | |                                  "
	echo "| |  | | _____      ___ __   \ \  /\  / / _| |_| |__     | |  | |__   ___   | |__| | _____  ____ _  __ _  ___  _ __   "
	echo "| |  | |/ _ \ \ /\ / / '_ \   \ \/  \/ / | | __| '_ \    | |  | '_ \ / _ \  |  __  |/ _ \ \/ / _` |/ _` |/ _ \| '_ \  "
	echo "| |__| | (_) \ V  V /| | | |   \  /\  /  | | |_| | | |   | |  | | | |  __/  | |  | |  __/>  < (_| | (_| | (_) | | | | "
	echo "|_____/ \___/ \_/\_/ |_| |_|    \/  \/   |_|\__|_| |_|   |_|  |_| |_|\___|  |_|  |_|\___/_/\_\__,_|\__, |\___/|_| |_| "
	echo "                                                                                                    __/ |             "
    echo "                                               ~~~~~~~~~~~~~~~~~~~~~~~                             |___/              "
    echo "                                        __      ___         _                                                         "
    echo "                                        \ \    / (_)_ _  __| |_____ __ _____                                          "
    echo "                                         \ \/\/ /| | ' \/ _` / _ \ V  V (_-<                                          "
    echo "                                          \_/\_/ |_|_||_\__,_\___/\_/\_//__/                                          "                        
	echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Developer: David Mazilu~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	echo ~ 
    echo 01} create a user           02} remove a user 
	echo 03} change administrator    04} set password  
	echo 05} updates                 06} edit/view groups 
	echo 07} security policies       08} set audit policies 
	echo 09} defender/firewall on    10} disable services  
	echo 11} full scan machine       12} RDS configuration  
	echo 13} FTP configuration       14} launch checklist w/ notes   
	echo 15} full scan machine       16} create backup  
    echo 17} view changelog          18} check ports/netcat  
	echo 19} revert all changes      20} exit   
    echo ~  
    
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
            echo [91merror: no user name provided. press any key to return to menu. . .[0m
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
                echo %time% - %userAdd% was created >> log.txt
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

    if not defined userDel (
                echo [91merror: no user name provided. press any key to return to menu. . .[0m
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
                echo %time% - %userDel% was deleted >> log.txt
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
                echo note: reverting deletion of an adminstrator does not reinstate administrator rights
                pause>nul
                    goto :mainMenu
            ) else (
                echo [91mfailure to revert change, press any key to return to menu. . .[0m
                pause>nul
                    goto :mainMenu
            )

:menuOption3
    cls
    
    rem Backs out in case of mistake
    echo continue changing user administrator status? (y/n) [input n to return to menu]
    set /p confirm3=
        if %confirm3%==n (goto :mainMenu)

    :chooseUser1
    cls
    echo [92mall current administrators are listed below[0m
    net localgroup Administrators
    
    echo enter username to edit administrator status
    set /p userStatusEdit=

        net user %userStatusEdit%>nul
            if %ERRORLEVEL%==0 (
                goto :editingStatus
            ) else (
                echo [91muser not found, press any key to try again. . .[0m   
                pause>nul
                goto :chooseUser1  
            )

    :editingStatus
        cls
        echo Editing [92m%userStatusEdit%[0m. . .
        echo -
        echo select (1) to grant administrator rights
        echo select (2) to deny adminstrator rights
        set /p grantDeny=
            if %grantDeny%==1 (
                net localgroup Administrators %userStatusEdit% /add
                echo administrator rights granted, press any key to return to main menu. . .
                echo %TIME% administrator rights granted to %userStatusEdit% >> log.txt
                pause>nul
                goto :mainMenu
            ) else if %grantDeny%==2 (
                net localgroup Administrators %userStatusEdit% /delete
                echo administrator rights denied, press any key to return to main menu. . . 
                echo %TIME% administrator rights denied for %userStatusEdit% >> log.txt
                pause>nul
                goto :mainMenu
            ) else (
                echo [91minvalid input, press any key to try again. . .[0m
                pause>nul
                goto :editingStatus
            )


    





:menuOption17
    cls
    type log.txt
    echo ~
    echo [92mpress any key to return to menu. . .[0m 
    pause>nul
        goto :mainMenu


:menuOption20
    echo are you sure you want to exit the script? (y/n)
    set /p confirm20=
        if %confirm20%==n (goto :mainMenu)
    echo why didnt you just press the x and close the application...
    timeout /t 2 /NOBREAK>nul
    exit

