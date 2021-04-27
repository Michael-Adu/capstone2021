
cd .

if "%1"=="" ("D:\PROGRA~1\MATLAB\R2020b\bin\win64\gmake"  -f Fuzzy0.mk all) else ("D:\PROGRA~1\MATLAB\R2020b\bin\win64\gmake"  -f Fuzzy0.mk %1)
@if errorlevel 1 goto error_exit

exit 0

:error_exit
echo The make command returned an error of %errorlevel%
exit 1