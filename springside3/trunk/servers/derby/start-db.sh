#!/bin/sh
echo "[INFO] ��network serverģʽ����servers/derby�е�Derby���ݿ�."

set CLASSPATH=$CLASSPATH:lib/derby.jar:lib/derbynet.jar
java org.apache.derby.drda.NetworkServerControl start