set "PLATFORM=x64"
if "%SUBDIR%"=="win-arm64" set "PLATFORM=arm64"

cd CPP\7zip
if "%SUBDIR%"=="win-arm64" (
  nmake PLATFORM=%PLATFORM% NEW_COMPILER=1 MY_DYNAMIC_LINK=1 NO_ASM_GNU=1
) else (
  nmake PLATFORM=%PLATFORM% NEW_COMPILER=1 MY_DYNAMIC_LINK=1
)

copy Bundles\Alone7z\%PLATFORM%\7zr.exe %LIBRARY_PREFIX%\bin\7zr.exe
copy Bundles\Alone\%PLATFORM%\7za.exe %LIBRARY_PREFIX%\bin\7za.exe
copy UI\Console\%PLATFORM%\7z.exe %LIBRARY_PREFIX%\bin\7z.exe

for /d %%G in (dir Bundles\Format*) do copy %%G\%PLATFORM%\*.dll %LIBRARY_PREFIX%\bin\
for /d %%G in (dir Bundles\Format*) do copy %%G\%PLATFORM%\*.lib %LIBRARY_PREFIX%\lib\
