@echo off
echo [INFO] ʹ��maven����selenium ���ܲ���.

cd ..
call mvn integration-test -Pfunctional
cd bin
pause