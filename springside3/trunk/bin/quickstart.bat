@echo off
echo [INFO] ȷ��Ĭ��JDK�汾ΪJDK6.0.
echo [INFO] ȷ������PATHϵͳ��������maven2.0.9�����ϰ汾��binĿ¼.

echo [Step 1] �뽫servers/tomcat/ci-config-sample/conf/tomcat-user.xml ���Ƶ����tomcatĿ¼��Ȼ���ֹ�����tomcat(�˿�Ϊ8080)����ɺ��밴���������
pause

echo [Step 2] ִ��servers/derby/start-db.bat ��Standalone��ʽ����Derby���ݿ�
cd ..\servers\derby
start start-db.bat
cd ..\..\

echo [Step 3] ��װSpringSide3 modules ��archetypes������Maven�ֿ�.
call mvn dependency:copy-dependencies -DoutputDirectory=lib -Pmodules
call mvn clean install -Pmodules

echo [Step 4] ��ʼ������Jar������ʼ�����ݿ⣬���롢�������������Examles��Ŀ��tomcat
call mvn dependency:copy-dependencies -DoutputDirectory=lib -DexcludeScope=runtime -Pexamples
call mvn dependency:copy-dependencies -DoutputDirectory=webapp/WEB-INF/lib  -DincludeScope=runtime -Pexamples
call mvn tomcat:undeploy -Pexamples
call mvn clean compile war:exploded tomcat:exploded -Pinitdb  -Pnotest -Pexamples

echo [Step 5] ����IE�������������Ŀ .
explorer http://localhost:8080/mini-web
explorer http://localhost:8080/mini-service
explorer http://localhost:8080/showcase

echo [INFO] SpringSide3.0 �����������.
pause