@echo off
echo [INFO] ʹ��maven sql plugin �������ݿ�,ʹ��dbunit��ʼ����������

cd ..
call mvn initialize -Pinitdb
call mvn dbunit:operation
pause