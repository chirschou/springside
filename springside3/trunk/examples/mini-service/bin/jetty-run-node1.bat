@echo off
echo [INFO] ʹ��maven jetty plugin ������Ŀ��node1�ڵ�8080�˿�.

cd ..
call mvn jetty:run-war -Pnotest -Djetty.port=8080 -Dcluster.nodename=node1

pause