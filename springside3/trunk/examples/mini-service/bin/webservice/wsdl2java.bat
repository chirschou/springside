@echo off

cd %~dp0/../../
call mvn cxf-codegen:wsdl2java

echo [INFO] ���������ɵ�target/generated/Ŀ¼��.
pause