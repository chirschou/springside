@echo off
echo [INFO] ʹ��maven eclipse plugin ��������jar������Eclipse��Ŀ�ļ�.

cd ..
call mvn eclipse:clean eclipse:eclipse
pause