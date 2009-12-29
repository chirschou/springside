@echo off
echo [INFO] ȷ��Ĭ��JDK�汾ΪJDK5.0�����ϰ汾.

if exist "..\tools\tomcat\apache-tomcat-6.0.20\" goto begin
echo [ERROR] ..\tools\tomcat\apache-tomcat-6.0.20Ŀ¼�����ڣ�������all-in-one�汾
goto end

:begin
set MAVEN_BAT="%cd%\..\tools\maven\apache-maven-2.2.1\bin\mvn.bat"
cd ..\

echo [Step 1] ����tools/maven/central-repository �� %userprofile%\.m2\repository
xcopy /s/e/i/h/d/y "tools\maven\central-repository" "%USERPROFILE%\.m2\repository"

echo [Step 2] ִ��tools/h2/h2w.bat ����H2���ݿ�.
cd tools\h2
call h2w.bat
cd ..\..\

echo [Step 3] ִ��tools/tomcat/apache-tomcat-6.0.20/bin/startup.bat ����Tomcat������.
cd  tools\tomcat\apache-tomcat-6.0.20\bin\
start startup.bat
cd ..\..\..\..\

echo [Step 3] ��װSpringSide3 modules ��archetypes�� ����Maven�ֿ�.
call %MAVEN_BAT% -o clean install  -Pmodules -Dmaven.test.skip=true

echo [Step 4] ΪMini-Service ��ʼ�����ݿ⡢���롢���.
cd examples\mini-service
call %MAVEN_BAT% -o clean package -Pinitdb -Dmaven.test.skip=true
cd ..\..\

echo [Step 5] ΪMini-Web ��ʼ�����ݿ⡢���롢���.
cd examples\mini-web
call %MAVEN_BAT% -o clean package -Pinitdb -Dmaven.test.skip=true
cd ..\..\

echo [Step 6] ΪShowcase ��ʼ�����ݿ⡢���롢���.
cd examples\showcase
call %MAVEN_BAT% -o clean package -Pinitdb -Dmaven.test.skip=true
cd ..\..\

echo [Step 7] ����3��ʾ����Ŀ��tomcat������tomcat.
call %MAVEN_BAT% cargo:deploy

echo [Step 8] Ϊ������Ŀ��ʼ������Jar����lib��webapp/WEB-INF/libĿ¼,�������
call %MAVEN_BAT% -o dependency:copy-dependencies -DoutputDirectory=lib -Dsilent=true -Pmodules
call %MAVEN_BAT% -o dependency:copy-dependencies -DoutputDirectory=lib -DexcludeScope=runtime -Dsilent=true -Pexamples
call %MAVEN_BAT% -o dependency:copy-dependencies -DoutputDirectory=webapp/WEB-INF/lib -DincludeScope=runtime -Dsilent=true -Pexamples

echo [INFO] SpringSide3.0 �����������.
echo [INFO] �ɷ���������ʾ��ַ:
echo [INFO] http://localhost:8080/mini-service
echo [INFO] http://localhost:8080/mini-web
echo [INFO] http://localhost:8080/showcase

start http://localhost:8080/mini-service
start http://localhost:8080/mini-web
start http://localhost:8080/showcase

:end
pause


