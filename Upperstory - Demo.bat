@echo off
:startup

title LOADING...

echo LOADING LOGIN SYSTEM

echo PLEASE WAIT...

echo Upperstory 1.5 Demo
echo Demo mode

cd %userprofile%/documents

if exist "Login system" goto skip

md "Login System"

:skip

cd "Login System"

ping localhost -n 5 >nul

goto Home

:Home

color 7

title HOME

cls

echo --------------

echo Upperstory login
echo Demo 1.5

echo --------------

echo.

echo 1. SIGNUP
echo Locked

echo --------------

echo 2. LOGIN
echo Locked

echo --------------

echo 3. DELETE ACCOUNT
echo Locked

echo --------------

echo 4. PLAY AS GUEST

echo --------------

echo.

set /p "a=Choice: "

if ["%a%"] == ["1"] goto playasguest

if ["%a%"] == ["2"] goto playasguest

if ["%a%"] == ["4"] goto playasguest

if ["%a%"] == ["3"] goto playasguest

if ["%a%"] == [""] goto playasguest

:signup

color 7

title SIGNUP

cls

set /p "nuser=New Username: "

if ["%nuser%"] == [""] goto signuperror

if EXIST "%nuser%.bat" goto usertaken

goto npass

:usertaken

cls

color c

echo USERNAME taken, please try another one.

pause >nul

goto signup

:npass

set /p "npass=New Password: "

if ["%npass%"] == [""] goto signuperror

set /p "npassr=Repeat Password: "

if ["%npassr%"] == ["%npass%"] goto signupc

goto signuperror

:signupc

echo set "auser=%nuser%"> %nuser%.bat

echo set "apass=%npass%">> %nuser%.bat

cls

color a

echo Signup successful!

echo press any button to continue!

pause >nul

goto home

:login

color 7

title LOGIN

cls

set /p "user=Username: "

if ["%user%"] == [""] goto LOGIN

if EXIST "%user%.bat" goto pass

goto usernotexist

:usernotexist

color c

cls

echo USERNAME doesn't exist.

pause >nul

goto login

:pass

call %user%.bat

set /p "pass=Password: "

if ["%pass%"] == ["%apass%"] goto logingood

goto passinvalid

:passinvalid

color c

cls

echo The PASSWORD you entered is INVALID

pause >nul

goto login

:logingood

color a

cls

echo You have Successfully logged in %user%

echo Redirect to the main game!
echo Thank you for using the login system
echo coded by someone!

pause
goto Menu

:delaccount

color 7

title DELETE ACCOUNT

cls

set /p "duser=Username: "

if ["%duser%"] == [""] goto delaccount

if exist "%duser%.bat" goto contin

goto usernotexistdel

:contin

call %duser%.bat

set /p "dpass=Password: "

if ["%dpass%"] == ["%apass%"] goto contin2

goto passerror

:contin2

cls

echo Are you sure you want to echo delete you account?

set /p "delacc=y/n: "

if ["%delacc%"] == ["n"] goto home

echo Deleting you account...

del "%duser%.bat"

ping localhost -n 2 >nul

cls

color a

echo Account deleted.

echo Redirecting to home

ping localhost -n 3 >nul

goto home

:playasguest

title Guest

cls

echo Loading
pause

goto Menu

:signuperror

color c

cls

echo ERROR

echo proceeding back to SIGNUP...

ping localhost -n 2 >nul

goto signup

:passerror

color c

cls

echo PASSWORD INVALID

pause >nul

goto delaccount

:usernotexistdel

color c

cls

echo USERNAME doesn't exist.

pause >nul

goto delaccount

color 0A
if "%1" neq "" ( goto %1)
:Menu
cls
title Upperstory Demo
echo -----------------------------
echo UPPERSTORY
echo by LSS on github
echo Demo 1.5
echo -----------------------------
echo 1. Start
echo 2. Instructions
echo 3. Updatelog
echo 4. Exit
set /p answer=Type the number of your option and press enter : 
if %answer%==1 goto Start_1
if %answer%==2 goto Instructions
if %answer%==3 goto Updatelog
if %answer%==4 goto Exit
:Exit
cls
echo We Hope You Enjoyed The Game . Thanks for playing %user%!
pause
exit /b
:Updatelog
cls
echo BETAS
echo 1.0 added the log and title.
echo 1.1 added more fights and build numbers
echo 1.2 added a Username
echo 1.3 added ending and boss.
echo i forgot to add 1.4 and 1.5 but i think they were just QOL updates
pause
goto Menu
:Addname
cls
echo Hello %user% an adventure awaits!
pause
goto Start_1
:Instructions
cls
echo Instructions
echo.
echo Yes, How do you play?
pause
goto Menu
:Start_1
cls
echo Hurry up %user%! Some bad guys Surrounded You.
echo They are totally 5 gang-stars
echo You are having a high chance of winning.
set /p answer=Would you like to fight or run ?
if %answer%==fight goto Fight_1
if %answer%==run goto Run_1
pause
:Run_1
cls
echo You ran away safely!
pause
goto Start_1
:Fight_1
echo Get ready for a hardcore fight.
echo The battle is waging.
set /p answer= Type number 1 and press enter to continue:
if %answer%==1 goto Fight_1_Loop
:Fight_1_Loop
set /a num=%random%
if %num% gtr 4 goto Fight_1_Loop
if %num% lss 1 goto Fight_1_Loop
if %num%==1 goto Lose_Fight_1
if %num%==2 goto Win_Fight_1
if %num%==3 goto Win_Fight_1
if %num%==4 goto Win_Fight_1
:Lose_Fight_1
cls
echo Sorry, you lost the fight :(
pause
goto Menu
:Win_Fight_1
cls
echo Congrats, you won the fight!!!
set /p answer='Would you like to save?' Type yes to save or type no .
if %answer%=='yes' goto 'Save'
if %answer%=='no' goto 'Start_2'
:Save
goto Start_2
:Start_2
cls
echo You beat the first of them
echo but more are coming!
echo You have a low chance of winning
set /p answer=Would you like to fight or run ?
if %answer%==fight goto Fight_2
if %answer%==run goto Run_2
pause
:Fight_2
echo Get ready for a hardcore fight.
echo The battle is waging.
set /p answer= Type number 1 and press enter to continue:
if %answer%==1 goto Fight_2_Loop
:Fight_2_Loop
set /a num=%random%
if %num% gtr 4 goto Fight_2_Loop
if %num% lss 1 goto Fight_2_Loop
if %num%==1 goto Lose_Fight_2
if %num%==2 goto Win_Fight_2
if %num%==3 goto Win_Fight_2
if %num%==4 goto Win_Fight_2
:Lose_Fight_2
cls
echo Sorry, you lost the fight :(
pause
goto Menu
:Win_Fight_2
cls
echo Congrats, you won the fight!!!
set /p answer='Would you like to save?' Type yes to save or type no .
if %answer%=='yes' goto 'Save2'
if %answer%=='no' goto 'Start_3'
:Save2
goto Start_3
:Start_3
cls
echo MORE!??!?
echo You have a low chance of winning
set /p answer=Would you like to fight or run ?
if %answer%==fight goto Fight_3
if %answer%==run goto Run_3
pause
:Fight_3
echo Get ready for a hardcore fight.
echo The battle is waging.
set /p answer= Type number 1 and press enter to continue:
if %answer%==1 goto Fight_3_Loop
:Fight_3_Loop
set /a num=%random%
if %num% gtr 4 goto Fight_3_Loop
if %num% lss 1 goto Fight_3_Loop
if %num%==1 goto Lose_Fight_3
if %num%==2 goto Win_Fight_3
if %num%==3 goto Win_Fight_3
if %num%==4 goto Win_Fight_3
:Lose_Fight_3
cls
echo Sorry, you lost the fight :(
pause
goto Menu
:Win_Fight_3
cls
echo Congrats %user%, you won the fight!!!
set /p answer='Would you like to save?' Type yes to save or type no .
if %answer%=='yes' goto 'Save3'
if %answer%=='no' goto 'Start_4'
:Save3
goto Start_4
:Start_4
cls
echo Whos that?
echo Its a boss!
echo You have a low chance of winning
set /p answer=Would you like to fight or run ?
if %answer%==fight goto Fight_4
if %answer%==run goto Run_4
pause
:Fight_4
echo Get ready for a hardcore fight.
echo The battle is waging.
set /p answer= Type number 1 and press enter to continue:
if %answer%==1 goto Fight_4_Loop
:Fight_3_Loop
set /a num=%random%
if %num% gtr 4 goto Fight_4_Loop
if %num% lss 1 goto Fight_4_Loop
if %num%==1 goto Lose_Fight_4
if %num%==2 goto Win_Fight_4
if %num%==3 goto Lose_Fight_4
if %num%==4 goto Win_Fight_4
:Lose_Fight_4
cls
echo Sorry, you lost the boss fight :(
pause
goto Menu
:Win_Fight_4
cls
echo Congrats %user%, you won the boss fight!!!
set /p answer='Would you like to save?' Type yes to save or type no .
if %answer%=='yes' goto 'Demoend'
if %answer%=='no' goto 'Demoend'
:Demoend
cls
echo Your journey was long, and many
echo fights have come, but...
pause
goto Demoend2
:Demoend2
echo You have beat the demo %user%!
echo %user%, your journey does not end here,
echo you can continue if you download the full game!
:goto Menu2
:Menu2
echo -----------------------------
echo UPPERSTORY
echo by LSS on github
echo Demo 1.5
echo -----------------------------
echo Demo completed
echo 1. Start
echo 2. Instructions
echo 3. Updatelog
echo 4. Exit
set /p answer=Type the number of your option and press enter : 
if %answer%==1 goto Start_1
if %answer%==2 goto Instructions
if %answer%==3 goto Updatelog
if %answer%==4 goto Exit