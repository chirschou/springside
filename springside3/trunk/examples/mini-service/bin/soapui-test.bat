@echo off
echo [INFO] ʹ��soapUi maven plugin ִ���Զ�������.
echo [INFO] ��ȷ��Tomcat 6������������conf/tomcat-users.xml������admin�û�.

cd ..
call mvn eviware:maven-soapui-plugin:test -Psoapui
pause