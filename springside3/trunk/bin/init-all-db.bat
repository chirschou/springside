@echo off
echo [INFO] ʹ��maven sql plugin ��ʼ������Examples�����ݿ�.

cd ..\
call mvn initialize -Pinitdb -Pexamples

cd examples\mini-service
call mvn dbunit:operation

cd ..\mini-web
call mvn dbunit:operation

cd ..\showcase
call mvn dbunit:operation

pause
