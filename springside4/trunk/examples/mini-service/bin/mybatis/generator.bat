@echo off

cd %~dp0/../../
call mvn mybatis-generator:generate

echo [INFO] ���������ɵ�target/generated-sources/mybatis-generatorĿ¼��.
pause