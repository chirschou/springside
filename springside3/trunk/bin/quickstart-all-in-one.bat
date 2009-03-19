@echo off
echo [INFO] ȷ��Ĭ��JDK�汾ΪJDK6.0.

if exist "..\tools\maven" goto begin
echo [INFO] tools\mavenĿ¼�����ڣ�������all-in-one�汾
goto end

:begin
set MAVEN_BAT="%cd%\..\tools\maven\maven-2.0.10\bin\mvn.bat"
cd ..\

echo [Step 1] ִ��tools/maven/nexus/nexus-webapp/bin/jsw/windows-x86-32/Nexus.bat,����Nexus Maven˽��
start tools\maven\nexus-1.3.1\nexus-webapp-1.3.1\bin\jsw\windows-x86-32\Nexus.bat

echo [Step 2] ִ��servers/derby/start-db.bat ��Standalone��ʽ����Derby���ݿ�
cd servers\derby
start start-db.bat
cd ..\..\

echo [Step 3] ִ��servers/tomcat/apache-tomcat-6.0.18/bin/startup.bat ����Tomcat������
cd  servers\tomcat\apache-tomcat-6.0.18\bin\
start startup.bat
cd ..\..\..\..\

echo [INFO] ��ͣ������ȴ�nexus����.
ping -n 16 127.0.0.1>null

echo [Step 4] ��װSpringSide3 modules ��archetypes�� ����Maven�ֿ�.
call %MAVEN_BAT% dependency:copy-dependencies -DoutputDirectory=lib
call %MAVEN_BAT% clean install 
 
echo [Step 5] ��ʼ��Jar�������롢���ԡ����������mini-web��Ŀ��tomcat������·��Ϊhttp://localhost:8080/mini-web
cd examples\mini-web
call %MAVEN_BAT% dependency:copy-dependencies -DoutputDirectory=lib -DexcludeScope=runtime
call %MAVEN_BAT% dependency:copy-dependencies -DoutputDirectory=webapp/WEB-INF/lib  -DincludeScope=runtime
call %MAVEN_BAT% tomcat:undeploy
call %MAVEN_BAT% clean compile war:exploded tomcat:exploded -Pinitdb -Pnotest
cd ..\..\

echo [Step 6] ��ʼ��Jar�������롢���ԡ����������mini-service��Ŀ��tomcat��http://localhost:8080/mini-service
cd examples\mini-service
call %MAVEN_BAT% dependency:copy-dependencies -DoutputDirectory=lib -DexcludeScope=runtime
call %MAVEN_BAT% dependency:copy-dependencies -DoutputDirectory=webapp/WEB-INF/lib  -DincludeScope=runtime
call %MAVEN_BAT% tomcat:undeploy
call %MAVEN_BAT% clean compile war:exploded tomcat:exploded  -Pnotest
cd ..\..\

echo [Step 7] ��ʼ��Jar�������롢���ԡ����������showcase��Ŀ��tomcat��http://localhost:8080/showcase
cd examples\showcase
call %MAVEN_BAT% dependency:copy-dependencies -DoutputDirectory=lib -DexcludeScope=runtime
call %MAVEN_BAT% dependency:copy-dependencies -DoutputDirectory=webapp/WEB-INF/lib  -DincludeScope=runtime
call %MAVEN_BAT% tomcat:undeploy
call %MAVEN_BAT% clean compile war:exploded tomcat:exploded -Pinitdb  -Pnotest
cd ..\..\

echo [Step 8] ����IE�������������Ŀ .
explorer http://localhost:8080/mini-web
explorer http://localhost:8080/mini-service
explorer http://localhost:8080/showcase

echo [INFO] SpringSide3.0 �����������.
:end
pause


