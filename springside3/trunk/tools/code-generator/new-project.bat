@echo off
echo [INFO] �뱣֤�Ѱ�װspringside archetypes.

if exist generated-project (rmdir /s/q generated-project)
mkdir generated-project
cd generated-project

call mvn archetype:generate -DarchetypeCatalog=local

echo [INFO] ����%cd%��������Ŀ.

pause