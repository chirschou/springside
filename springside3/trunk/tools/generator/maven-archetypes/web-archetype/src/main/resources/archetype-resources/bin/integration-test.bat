@echo off
echo [INFO] ʹ��maven���ɲ���.
echo [INFO] ��ȷ�����ݿ�������.

cd ..
call mvn test  -Pintegration
cd bin
pause