@echo off
echo [INFO] ȷ��Ĭ��JDK�汾ΪJDK5.0�����ϰ汾.
echo [INFO] ȷ��Maven�Ŀ�ִ��������PATH��.
echo [INFO] ȷ��Ant�Ŀ�ִ��������PATH��, ���ѽ�maven-ant-task.jar����Ant��lib��.

rem set OFF_LINE=-o

echo [Step 1] ����tools/maven/central-repository �� %userprofile%\.m2\repository
xcopy /s/e/i/h/d/y "tools\maven\central-repository" "%USERPROFILE%\.m2\repository"

echo [Step 2] ����H2���ݿ�.
cd tools/h2
call mvn %OFF_LINE% initialize -Pstartdb
cd ..\..\

echo [Step 3] ��װSpringSide3 ����modules,examples��Ŀ������Maven�ֿ�,����Eclipse��Ŀ�ļ�.
call mvn %OFF_LINE% eclipse:clean eclipse:eclipse
call mvn %OFF_LINE% clean install -Dmaven.test.skip=true

echo [Step 4] ΪMini-Service ��ʼ�����ݿ�, ����Jetty.
cd examples\mini-service
call ant init-db 
start "Mini-Service" mvn %OFF_LINE% -Djetty.port=8080 jetty:run
cd ..\..\

echo [Step 5] ΪMini-Web ��ʼ�����ݿ�, ����Jetty.
cd examples\mini-web
call ant init-db 
start "Mini-Web" mvn %OFF_LINE% -Djetty.port=8082 jetty:run
cd ..\..\

echo [Step 6] ΪShowcase ����Eclipse��Ŀ�ļ�, ����, ���, ��ʼ�����ݿ�, ����Jetty.
cd examples\showcase
call ant init-db
start "Showcase" mvn %OFF_LINE% -Djetty.port=8083 jetty:run
cd ..\..\

echo [INFO] SpringSide3.0 �����������.
echo [INFO] �ɷ���������ʾ��ַ:
echo [INFO] http://localhost:8080/mini-service
echo [INFO] http://localhost:8082/mini-web
echo [INFO] http://localhost:8083/showcase

:end
pause