@echo off
echo [INFO] ��maven�ֿ⸴��jar��������ĿĿ¼.

cd ..\
call mvn -o dependency:copy-dependencies -DoutputDirectory=lib -Pmodules
call mvn -o dependency:copy-dependencies -DoutputDirectory=lib -DexcludeScope=runtime -Dsilent=true -Pexamples
call mvn -o dependency:copy-dependencies -DoutputDirectory=webapp/WEB-INF/lib -DincludeScope=runtime -Dsilent=true -Pexamples

pause
