@echo off
echo [INFO] ��maven�ֿ⸴��jar��������ĿĿ¼.

cd ..\
call mvn  dependency:copy-dependencies -DoutputDirectory=lib -Dsilent=true -Pmodules
call mvn  dependency:copy-dependencies -DoutputDirectory=lib -DexcludeScope=runtime -Dsilent=true -Pexamples
call mvn  dependency:copy-dependencies -DoutputDirectory=webapp/WEB-INF/lib -DincludeScope=runtime -Dsilent=true -Pexamples

pause
