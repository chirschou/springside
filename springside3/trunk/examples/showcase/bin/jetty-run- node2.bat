@echo off
echo [INFO] ʹ��maven jetty plugin ������Ŀ.

cd ..
call mvn jetty:run-war -Pnotest -Pcluster -Djetty.port=8081 -Dcluster.nodename=node2

pause