@echo off
echo [INFO] [INFO] ʹ��soapUi maven plugin ִ���Զ�������.

cd ..
call mvn eviware:maven-soapui-plugin:test -Psoapui
pause