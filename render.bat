@ECHO OFF

SET "file="
SET "renderF="
SET "startFrame="
SET "endFrame="
SET "renderA="
SET "render="
set "result="

IF NOT EXIST %1 (
SET file=D:/BlenderFiles/ProjectFiles/%1.blend
) ELSE (
SET file=%1.blend
)

SHIFT

:loop
IF NOT "%1"=="" (
	IF "%1"=="-f" (
		SET renderF=-f %2
		SHIFT
	)
	IF "%1"=="-s" (
		SET startFrame=-s %2
		SHIFT
	)
	IF "%1"=="-e" (
		SET endFrame=-e %2
		SHIFT
	)
	IF "%1"=="-a" (
		SET renderA=%1
		SHIFT
	)
	SHIFT
	GOTO :loop
)

IF NOT "%file%"=="" ECHO %file%
IF NOT "%startFrame%"=="" ECHO %startFrame%
IF NOT "%endFrame%"=="" ECHO %endFrame%  
IF NOT "%renderA%"=="" ( 
	ECHO %renderA%   
	SET render=%startFrame% %endFrame% %renderA%
)
IF NOT "%renderF%"=="" ( 
	ECHO %renderF%
	SET render=%renderF%
)   

"C:\Program Files (x86)\Steam\steamapps\common\Blender\blender.exe" -b %file% -o D:/BlenderFiles/Finals/Images/CMDRendered/ %render%>output.txt && SET result=Completed
IF errorlevel 1 set result=Failed

echo Render %result%!

SwithMail.exe /s /x "D:\BlenderFiles\Notification System\SwithMailSettings.xml" /p1 %file% /p2 %result%

exit /b

) ELSE (
blender -b %1 -o D:/BlenderFiles/Finals/Images/CMDRendered/ -a 0
echo "Render Done!"
SwithMail.exe /s /x "D:\BlenderFiles\Notification System\SwithMailSettings.xml" /p1 %1
)
pause
EXIT