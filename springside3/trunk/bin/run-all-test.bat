@echo off
echo [INFO] ��maven�ֿ⸴��jar��������ĿĿ¼.

cd ..\
call mvn test -Pmodules
call mvn  integration-test -Pexamples -Pintegration
call mvn  integration-test -Pexamples -Pfunctional
pause
