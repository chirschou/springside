@echo off
echo [INFO] ʹ��maven jetty plugin ������Ŀ.

cd ..
set MAVEN_OPTS=%MAVEN_OPTS% -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=4000
call mvn jetty:run -Dmaven.test.skip=true