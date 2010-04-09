@echo off
echo [INFO] ȷ��Ĭ��JDK�汾ΪJDK5.0�����ϰ汾.
echo [INFO] ȷ��Maven�Ŀ�ִ��������PATH��.
echo [INFO] ȷ��Ant�Ŀ�ִ��������PATH��, ���ѽ�maven-ant-task.jar����Ant��lib��.

echo [Step 1] ����tools/maven/central-repository �� %userprofile%\.m2\repository
xcopy /s/e/i/h/d/y "tools\maven\central-repository" "%USERPROFILE%\.m2\repository"

echo [Step 2] ����H2���ݿ�.
cd tools/h2
call mvn initialize -o -Pstartdb
cd ..\..\

echo [Step 3] ��װSpringSide3 ����modules,examples��Ŀ������Maven�ֿ�,����Eclipse��Ŀ�ļ�.
call mvn -o eclipse:clean eclipse:eclipse
call mvn -o clean install -Dmaven.test.skip=true

echo [Step 4] ΪMini-Service ��ʼ�����ݿ�, ����Jetty.
cd examples\mini-service
call ant init-db 
start "Mini-Service" mvn -o -Djetty.port=8080 jetty:run
cd ..\..\

echo [Step 5] ΪMini-Web ��ʼ�����ݿ�, ����Jetty.
cd examples\mini-web
call ant init-db 
start "Mini-Web" mvn -o -Djetty.port=8081 jetty:run
cd ..\..\

echo [Step 6] ΪShowcase ����Eclipse��Ŀ�ļ�, ����, ���, ��ʼ�����ݿ�, ����Jetty.
cd examples\showcase
call ant init-db
start "Showcase" mvn -o -Djetty.port=8082 jetty:run
cd ..\..\

echo [INFO] SpringSide3.0 �����������.
echo [INFO] �ɷ���������ʾ��ַ:
echo [INFO] http://localhost:8080/mini-service
echo [INFO] http://localhost:8081/mini-web
echo [INFO] http://localhost:8082/showcase

:end
pause