@echo off
echo [INFO] ȷ������PATHϵͳ������maven2.0.9�����ϰ汾��binĿ¼.

echo [INOF] ��װSpringSide3��archetypes �� ����Maven�ֿ�.
cd archetypes/service-archetype
call mvn clean install

cd ../web-archetype
call mvn clean install

pause


