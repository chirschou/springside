@echo off
echo [INFO] ��maven�ֿ⸴��jar��������ĿĿ¼.

cd ..\
call mvn  integration-test -Pexamples
pause
