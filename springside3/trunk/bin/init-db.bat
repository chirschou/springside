@echo off
echo [INFO] ʹ��maven sql plugin ��ʼ��mini-web��showcase���ݿ�.

cd ..\examples\mini-web
call mvn initialize -Pinitdb

cd ..\showcase
call mvn initialize -Pinitdb
pause
