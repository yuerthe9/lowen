title bat�Զ�������
@echo ������ļ�
@echo off

::set basePath=g:\lwh\xwandou\code\monkeytest\
set basePath=%1
echo basePath:%basePath%

echo -
echo -
echo -

echo ----------------------��ʼ�������蹺---------------------------------
::--------1.��ʼ��·����ʱ��-------------
set currentTestName=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%_MMG
set starttime=%date:~0,4%-%date:~5,2%-%date:~8,2%_%time:~0,2%:%time:~3,2%:%time:~6,2%
::currentTestName��ʾÿһ��ִ�в��Խű���out�����Ŀ¼

echo currentTestName:%currentTestName%
if not exist %basePath%out\%currentTestName% mkdir %basePath%out\%currentTestName%


::--------2.�����̼߳�¼cpu���ڴ����־-------------
::���������ڴ�cpu��־��¼
start %basePath%\bin\apkinfo.bat com.motherbuy.bmec.android %basePath%out\%currentTestName%

::--------3.�����̼߳�¼adb log��־-------------
::��д����־�ļ���·��������������log.bat
start %basePath%\bin\log.bat %basePath%out\%currentTestName%


::--------4.ִ��py�ű�-------------
::�˴�ֱ��ִ��monkeyrunner����ᵼ�º�����������޷����У���Ҫʹ��call����
call monkeyrunner %basePath%tools\monkey_test.py  %currentTestName%  %basePath%

::--------5.�رռ�¼��־���̣߳��رմ��ڣ�-------------
::�ر������ڴ�cpu��־��¼
taskkill  /FI "WINDOWTITLE eq AndroidInfo"

::--------6.��ȡadb log��־ �ж��Ƿ�crash-------------
set rrrstr=�ɹ�
findstr   "motherbuy" %basePath%out\%currentTestName%\androidlog.txt

set rrr=%errorlevel%
if %rrr%==0 set rrrstr=ʧ��|echo --------------------�ű�(%currentTestName%)������Crash------------------- else echo �ű�(%currentTestName%)����ok



::--------7.���html����-------------
set endtime=%date:~0,4%-%date:~5,2%-%date:~8,2%_%time:~0,2%:%time:~3,2%:%time:~6,2%
java -jar %basePath%\bin\HtmlOutPutCore.jar   out=%currentTestName% path=%basePath% -l   apkPath=G:\lwh\zhenkun\B2C1.apk aaptPath=%basePath%bin\aapt.exe result=%rrrstr% starttime=%starttime% endtime=%endtime%

echo ----------------------�����������蹺---------------------------------

echo -
echo -
echo -
echo ----------------------��ʼ����sfa------------------------------------

set currentTestName=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%_SFA
set starttime=%date:~0,4%-%date:~5,2%-%date:~8,2%_%time:~0,2%:%time:~3,2%:%time:~6,2%
::set basePath=g:\lwh\xwandou\code\monkeytest\
if not exist %basePath%out\%currentTestName% mkdir %basePath%out\%currentTestName%

::���������ڴ�cpu��־��¼
start %basePath%\bin\apkinfo.bat com.ebest.sfa %basePath%out\%currentTestName%

start %basePath%\bin\log.bat %basePath%out\%currentTestName%
:: 
call monkeyrunner %basePath%tools\monkey_playbackNew.py %basePath%mr\sfadaka2.mr  %currentTestName%  %basePath%

::�ر������ڴ�cpu��־��¼
taskkill  /FI "WINDOWTITLE eq AndroidInfo"

set rrrstr=�ɹ�

findstr   "com.ebest.sfa" %basePath%out\%currentTestName%\androidlog.txt
set rrr=%errorlevel%
::if %rrr%==0 echo --------------------�ű�(%currentTestName%)������Crash------------------- else echo �ű�(%currentTestName%)����ok
if %rrr%==0 set rrrstr=ʧ��|echo --------------------�ű�(%currentTestName%)������Crash------------------- else echo �ű�(%currentTestName%)����ok

set endtime=%date:~0,4%-%date:~5,2%-%date:~8,2%_%time:~0,2%:%time:~3,2%:%time:~6,2%
java -jar %basePath%\bin\HtmlOutPutCore.jar   out=%currentTestName% path=%basePath% -l apkPath=E:\lwh\apk\SFADali-2.1.0.1-1230-03-beta.apk aaptPath=%basePath%bin\aapt.exe result=%rrrstr% starttime=%starttime% endtime=%endtime%
echo ----------------------��������sfa------------------------------------



echo -
echo -
echo -


:: ���ұ���ΪAndroidMonkeyLog�Ľ���
:: tasklist /FI "WINDOWTITLE eq AndroidMonkeyLog"
:: taskkill  /FI "WINDOWTITLE eq AndroidMonkeyLog"

pause

