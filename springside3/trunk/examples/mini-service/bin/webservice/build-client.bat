@echo off
echo [INFO] ȷ������WebServiceӦ��������.

cd %~dp0
call mvn -f build-client-pom.xml cxf-codegen:wsdl2java

echo [INFO] ���������ɵ�target/generated/Ŀ¼��.
pause