#!/bin/sh
echo "[INFO] ʹ��maven������Ŀ��������tomcat��."
echo "[INFO] ��ȷ��Tomcat 6������������conf/tomcat-users.xml������admin�û�."

cd ..
mvn package cargo:redeploy