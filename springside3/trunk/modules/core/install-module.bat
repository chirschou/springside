@echo off
set local_driver=%cd:~0,2%
set local_path=%cd%

set exec_path=%0
set exec_path=%exec_path:~0,-13%"
set exec_driver=%exec_path:~1,2%
%exec_driver%
cd %exec_path%

call mvn install

%local_driver%
cd %local_path%
pause