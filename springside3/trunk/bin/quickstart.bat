@echo off
echo [INFO] ȷ������PATHϵͳ��������maven2.0.9�����ϰ汾��binĿ¼.

echo [Step 1] ��װSpringSide3 modules ��archetypes������Maven�ֿ�.
cd ..\
call mvn dependency:copy-dependencies -DoutputDirectory=lib
call mvn clean install

echo [Step 2] ִ��servers/derby/start-db.bat ��Standalone��ʽ����Derby���ݿ�
cd servers\derby
start start-db.bat
cd ..\..\

echo ��ͣ5��ȴ�derby����
ping -n 6 127.0.0.1>null


echo [Step 3] �뽫servers/tomcat/ci-config-sample/conf/tomcat-user.xml ���Ƶ����tomcatĿ¼��Ȼ���ֹ�����tomcat(�˿�Ϊ8080)����ɺ��밴���������
pause


echo [Step 4] ��ʼ��Jar�������롢���ԡ����������mini-web��Ŀ��tomcat������·��Ϊhttp://localhost:8080/mini-web
cd examples\mini-web
call mvn dependency:copy-dependencies -DoutputDirectory=lib -DexcludeScope=runtime
call mvn dependency:copy-dependencies -DoutputDirectory=webapp/WEB-INF/lib  -DincludeScope=runtime
call mvn tomcat:undeploy
call mvn clean compile war:exploded tomcat:exploded -Pinitdb
cd ..\..\

echo [Step 5] ��ʼ��Jar�������롢���ԡ����������mini-service��Ŀ��tomcat��http://localhost:8080/mini-service
cd examples\mini-service
call mvn dependency:copy-dependencies -DoutputDirectory=lib -DexcludeScope=runtime
call mvn dependency:copy-dependencies -DoutputDirectory=webapp/WEB-INF/lib  -DincludeScope=runtime
call mvn tomcat:undeploy
call mvn clean compile war:exploded tomcat:exploded
cd ..\..\

echo [Step 6] ��ʼ��Jar�������롢���ԡ����������showcase��Ŀ��tomcat��http://localhost:8080/showcase
cd examples\showcase
call mvn dependency:copy-dependencies -DoutputDirectory=lib -DexcludeScope=runtime
call mvn dependency:copy-dependencies -DoutputDirectory=webapp/WEB-INF/lib  -DincludeScope=runtime
call mvn tomcat:undeploy
call mvn clean compile war:exploded tomcat:exploded -Pinitdb
cd ..\..\

echo [Step 7] ����IE�������������Ŀ .
explorer http://localhost:8080/mini-web
explorer http://localhost:8080/mini-service
explorer http://localhost:8080/showcase

echo [INFO] SpringSide3.0 �����������.
pause