@echo off
echo [INFO] ʹ��maven jetty plugin ������Ŀ��node2�ڵ�8081�˿�.

cd ..
call mvn jetty:run-war -Pnotest -Pcluster -Djetty.port=8081 -Dcluster.nodename=node2

pause