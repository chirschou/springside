@echo off
echo [INFO] ʹ��maven sql plugin ��ʼ��mini-service��mini-web��showcase���ݿ�.

cd ..\examples\mini-service
call mvn initialize -Pinitdb

cd ..\mini-web
call mvn initialize -Pinitdb

cd ..\showcase
call mvn initialize -Pinitdb
pause
