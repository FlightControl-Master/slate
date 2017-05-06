@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"C:\Users\Hugues\Documents\GitHub\slate\Ruby\bin\ruby.exe" "C:/Users/Hugues/Documents/GitHub/slate/Ruby/bin/bundler" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"C:\Users\Hugues\Documents\GitHub\slate\Ruby\bin\ruby.exe" "%~dpn0" %*
