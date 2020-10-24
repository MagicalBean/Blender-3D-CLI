@ECHO OFF

:: =====VARIABLES=====

:: default directory for blend files 
SET baseDir=""
:: default directory output
SET outputDir=""

:: Using SwithMail
SET xmlFile=""

:: ===================

:: Reset all runtime variables
SET "file="
SET "renderF="
SET "startFrame="
SET "endFrame="
SET "renderA="
SET "render="
set "result="

:: Find blend file
IF NOT EXIST %1 (
SET file=%baseDir%%1
) ELSE (
SET file=%1
)

SHIFT

:: Find all other args
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
	IF "%1"=="-o" (
		SET outputDir=-o %2
		SHIFT
	)
	SHIFT
	GOTO :loop
)

:: Check args and prepare for commands
IF NOT "%renderA%"=="" ( 
	SET render=%startFrame% %endFrame% %renderA%
)
IF NOT "%renderF%"=="" ( 
	SET render=%renderF%
)

IF "%file%"=="" ECHO ERROR: No file was found
IF "%render%"=="" ECHO ERROR: No render type defined
If "%outputDir%"=="" ECHO ERROR: No output directory defined

:: Render the file
:: BLENDER.EXE FILE
"C:\Program Files (x86)\Steam\steamapps\common\Blender\blender.exe" -b %file% -o %outputDir% %render%>output.txt && SET result=Completed
IF errorlevel 1 set result=Failed

echo Render %result%!

:: SWITHMAIL.EXE FILE
:: UNCOMMENT FOR THE AUTOMATIC EMAIL SERVICE
::SwithMail.exe /s /x %xmlFile% /p1 %file% /p2 %result%

exit /b
