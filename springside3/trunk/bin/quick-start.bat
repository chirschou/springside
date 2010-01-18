@echo off
echo [INFO] ȷ��Ĭ��JDK�汾ΪJDK5.0�����ϰ汾.

if exist "..\tools\maven\apache-maven-2.2.1\" goto begin
echo [ERROR] ..\tools\maven\apache-maven-2.2.1Ŀ¼�����ڣ�������all-in-one�汾
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
call %MAVEN_BAT% -o clean install -Dmaven.test.skip=true

echo [Step 4] ΪMini-Service ����, ���, ��ʼ�����ݿ�, ����Jetty.
cd examples\mini-service
start "Mini-Service" %MAVEN_BAT% -o -Djetty.port=8080 jetty:run
cd ..\..\

echo [Step 5] ΪMini-Web ����, ���, ��ʼ�����ݿ�, ����Jetty.
cd examples\mini-web
call %MAVEN_BAT% -o clean package -Pinitdb -Dmaven.test.skip=true
start "Mini-Web" %MAVEN_BAT% -o -Djetty.port=8082 jetty:run
cd ..\..\

echo [Step 6] ΪShowcase ����, ���, ��ʼ�����ݿ�, ����Jetty.
cd examples\showcase
call %MAVEN_BAT% -o clean package -Pinitdb -Dmaven.test.skip=true
start "Showcase" %MAVEN_BAT% -o -Djetty.port=8084 jetty:run
cd ..\..\

echo [INFO] SpringSide3.0 �����������.
echo [INFO] �ɷ���������ʾ��ַ:
echo [INFO] http://localhost:8080/mini-service
echo [INFO] http://localhost:8082/mini-web
echo [INFO] http://localhost:8084/showcase

:end
pause


