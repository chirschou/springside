@echo off
echo [INFO] ȷ������CXF_HOMEϵͳ������cxf����Ŀ¼.
echo [INFO] ȷ������JAVA_HOMEϵͳ������JDK5.0���ϵ�JDKĿ¼.
echo [INFO] ȷ������WebServiceӦ��������.

call "%CXF_HOME%/bin/wsdl2java.bat" -client -b build-client-binding.xml -exsh true http://localhost:8080/${artifactId}/services/UserService?wsdl

echo [INFO] �����������ڵ�ǰĿ¼��.
pause