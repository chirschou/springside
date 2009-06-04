@echo off
echo [INFO] ȷ��Ĭ��JDK�汾ΪJDK5.0.

if exist "..\tools\maven" goto begin
echo [INFO] tools\mavenĿ¼�����ڣ�������all-in-one�汾
goto end

:begin
set MAVEN_BAT="%cd%\..\tools\maven\apache-maven-2.1.0\bin\mvn.bat"
cd ..\

echo [Step 1] ����tools/maven/central-repository �� %userprofile%\.m2\repository
xcopy /s/e/i/h/d "tools\maven\central-repository" "%USERPROFILE%\.m2\repository"

echo [Step 2] ִ��servers/derby/start-db.bat ��Standalone��ʽ����Derby���ݿ�
cd servers\derby
start start-db.bat
cd ..\..\

echo [Step 3] ִ��servers/tomcat/apache-tomcat-6.0.20/bin/startup.bat ����Tomcat������
cd  servers\tomcat\apache-tomcat-6.0.20\bin\
start startup.bat
cd ..\..\..\..\

echo [Step 4] ��װSpringSide3 modules ��archetypes�� ����Maven�ֿ�.
call %MAVEN_BAT% -o dependency:copy-dependencies -DoutputDirectory=lib -Dsilent=true -Pmodules
call %MAVEN_BAT% -o clean install  -Pmodules
 
echo [Step 5] ��ʼ������Jar������ʼ�����ݿ⣬���롢���ԡ��������������Examles��Ŀ��tomcat��
call %MAVEN_BAT% -o dependency:copy-dependencies -DoutputDirectory=lib -DexcludeScope=runtime -Dsilent=true -Pexamples
call %MAVEN_BAT% -o dependency:copy-dependencies -DoutputDirectory=webapp/WEB-INF/lib -DincludeScope=runtime -Dsilent=true -Pexamples
call %MAVEN_BAT% -o clean package cargo:redeploy -Pinitdb  -Pexamples

echo [Step 6] ����IE�������������Ŀ .
explorer http://localhost:8080/mini-web
explorer http://localhost:8080/mini-service
explorer http://localhost:8080/showcase

echo [INFO] SpringSide3.0 �����������.
:end
pause


