@echo off
echo [INFO] [INFO] ʹ��maven sql plugin ��ʼ�����ݿ�.

cd ..
call mvn initialize -Pinitdb
rem call mvn dbunit:operation
pause