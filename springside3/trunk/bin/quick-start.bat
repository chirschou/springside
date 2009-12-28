@echo off
echo [INFO] ȷ��Ĭ��JDK�汾ΪJDK5.0.

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

echo [Step 3] ��װSpringSide3 modules ��archetypes�� ����Maven�ֿ�.
call %MAVEN_BAT% -o clean install  -Pmodules -Dmaven.test.skip=true

echo [Step 4] ΪMini-Service ��ʼ�����ݿ⡢���롢���.
cd examples\mini-service
call %MAVEN_BAT% -o clean package -Pinitdb -Dmaven.test.skip=true

echo [Step 5] ΪMini-Web ��ʼ�����ݿ⡢���롢���.
cd ..\mini-web
call %MAVEN_BAT% -o clean package -Pinitdb -Dmaven.test.skip=true

echo [Step 6] ΪShowcase ��ʼ�����ݿ⡢���롢���.
cd ..\showcase
call %MAVEN_BAT% -o clean package -Pinitdb -Dmaven.test.skip=true

echo [Step 7] ����3��ʾ����Ŀ��tomcat������tomcat.
cd ..\..
start "Tomcat Server" "%MAVEN_BAT%" cargo:deploy cargo:start

echo [Step 8] Ϊ������Ŀ��ʼ������Jar����lib��webapp/WEB-INF/libĿ¼,�������
call %MAVEN_BAT% -o dependency:copy-dependencies -DoutputDirectory=lib -Dsilent=true -Pmodules
call %MAVEN_BAT% -o dependency:copy-dependencies -DoutputDirectory=lib -DexcludeScope=runtime -Dsilent=true -Pexamples
call %MAVEN_BAT% -o dependency:copy-dependencies -DoutputDirectory=webapp/WEB-INF/lib -DincludeScope=runtime -Dsilent=true -Pexamples

echo [INFO] SpringSide3.0 �����������.
echo [INFO] ��ʹ�����������������ַ.
echo [INFO] http://localhost:8080/mini-service
echo [INFO] http://localhost:8080/mini-web
echo [INFO] http://localhost:8080/showcase
:end
pause


