@echo off
echo [INFO] ��network serverģʽ����tools/derby�е�Derby���ݿ�.

set CLASSPATH=lib\derby.jar;lib\derbynet.jar;
java org.apache.derby.drda.NetworkServerControl start