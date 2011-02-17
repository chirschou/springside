@echo off
echo [INFO] ȷ��Ĭ��JDK�汾ΪJDK6.0�����ϰ汾,������JAVA_HOME.

echo [INFO] �粻������Maven�ٷ���վ, �޸ı��ļ�ȥ������һ�е�ע��.

set MVN=mvn
set ANT=ant
set MAVEN_OPTS=%MAVEN_OPTS% -XX:MaxPermSize=128m

if exist "tools\maven\apache-maven-3.0.2\" set MVN="%cd%\tools\maven\apache-maven-3.0.2\bin\mvn.bat"
if exist "tools\ant\apache-ant-1.8.2\" set ANT="%cd%\tools\ant\apache-ant-1.8.2\bin\ant.bat"
echo Maven����Ϊ%MVN%
echo Ant����Ϊ%ANT%


echo [Step 1] ��װSpringSide ����modules������Maven�ֿ�, ����Eclipse��Ŀ�ļ�.
call %MVN% clean install -Dmaven.test.skip=true
call %MVN% eclipse:clean eclipse:eclipse

echo [Step 2] ����H2���ݿ�.
cd tools/h2
start "H2" %MVN% exec:java
cd ..\..\

echo [Step 3] ΪMini-Service ��ʼ�����ݿ�, ����Jetty.
cd examples\mini-service
call %MVN% eclipse:clean eclipse:eclipse
call %ANT% -f bin/build.xml init-db 
start "Mini-Service" %MVN% jetty:run -Djetty.port=8083
cd ..\..\

echo [Step 4] ΪMini-Web ��ʼ�����ݿ�, ����Jetty.
cd examples\mini-web
call %MVN% eclipse:clean eclipse:eclipse
call %ANT% -f bin/build.xml init-db 
start "Mini-Web" %MVN% jetty:run -Djetty.port=8084
cd ..\..\

echo [Step 5] ΪShowcase ����Eclipse��Ŀ�ļ�, ����, ���, ��ʼ�����ݿ�, ����Jetty.
cd examples\showcase
call %MVN% eclipse:clean eclipse:eclipse
call %ANT% -f bin/build.xml init-db
start "Showcase" %MVN% jetty:run
cd ..\..\

echo [INFO] SpringSide3.0 �����������.
echo [INFO] �ɷ���������ʾ��ַ:
echo [INFO] http://localhost:8083/mini-service
echo [INFO] http://localhost:8084/mini-web
echo [INFO] http://localhost:8080/showcase

:end
pause