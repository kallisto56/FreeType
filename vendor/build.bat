@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: ==========================================================================
::  FreeType + HarfBuzz as DLLs with the static CRT (/MT, /MTd), Debug + Release
::
::  src\  sources (cloned once, pinned to the tags below)
::  tmp\  build trees and a staging install (deleted at the start of every run)
::  dst\  final result: dst\<Config>_Win64\bin (DLLs), lib (import libs), include
::
::  Usage: build.bat [nopause]
:: ==========================================================================

:: ---- CONFIGURATION --------------------------------------------------------

:: Versions the Beef wrapper was written against
set "FT_TAG=VER-2-15-0"
set "HB_TAG=14.6.0"

:: NONE   = FreeType is built without HarfBuzz. Two builds per configuration. Recommended:
::          FreeType only uses HarfBuzz to improve its auto-hinter, your shaping goes through
::          hb_shape directly.
:: LINKED = FreeType is rebuilt against HarfBuzz at the end (three builds per configuration).
::          freetype.dll and harfbuzz.dll then import each other, a circular DLL dependency.
set "FT_HARFBUZZ=NONE"

set "SRC_DIR=%~dp0src"
set "TMP_DIR=%~dp0tmp"
set "DST_DIR=%~dp0dst"
set "STAGE_DIR=%TMP_DIR%\install"

:: ---- MAIN -----------------------------------------------------------------

call :setup_vs || goto :error
call :require_tool git || goto :error
call :require_tool cmake || goto :error

if /i not "%FT_HARFBUZZ%"=="NONE" if /i not "%FT_HARFBUZZ%"=="LINKED" (
    echo [ERROR] FT_HARFBUZZ must be NONE or LINKED.
    goto :error
)

echo ==========================================
echo  FREETYPE and HARFBUZZ DLL BUILD, STATIC CRT
echo  FreeType %FT_TAG%, HarfBuzz %HB_TAG%, FreeType HarfBuzz mode: %FT_HARFBUZZ%
echo ==========================================

if exist "%TMP_DIR%" rmdir /s /q "%TMP_DIR%"
if not exist "%SRC_DIR%" mkdir "%SRC_DIR%"

call :ensure_repo freetype https://github.com/freetype/freetype %FT_TAG% || goto :error
call :ensure_repo harfbuzz https://github.com/harfbuzz/harfbuzz %HB_TAG% || goto :error

set "CONFIG=Debug"
set "CRT_FLAG=MultiThreadedDebug"
call :build_pipeline || goto :error

set "CONFIG=Release"
set "CRT_FLAG=MultiThreaded"
call :build_pipeline || goto :error

call :publish || goto :error

echo.
echo ==========================================
echo  BUILD COMPLETE
echo  DLLs and import libs are in: %DST_DIR%
echo ==========================================
if /i not "%~1"=="nopause" pause
exit /b 0

:error
echo.
echo [FAIL] Build failed. The dst folder was not modified.
if /i not "%~1"=="nopause" pause
exit /b 1

:: ==========================================================================
::  SUBROUTINE: set up the x64 Visual Studio environment
:: ==========================================================================
:setup_vs
:: Already inside a Developer / Native Tools prompt: only check the architecture
if defined VSINSTALLDIR (
    if /i not "%VSCMD_ARG_TGT_ARCH%"=="x64" (
        echo [ERROR] This prompt targets "%VSCMD_ARG_TGT_ARCH%". Use an x64 Native Tools prompt.
        exit /b 1
    )
    exit /b 0
)

set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
if not exist "%VSWHERE%" (
    echo [ERROR] vswhere.exe was not found. Is Visual Studio installed?
    exit /b 1
)

:: -latest = newest installation that has the C++ x64 tools
set "VS_PATH="
for /f "usebackq tokens=*" %%i in (`"%VSWHERE%" -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`) do set "VS_PATH=%%i"
if not defined VS_PATH (
    echo [ERROR] No Visual Studio installation with the C++ x64 tools was found.
    exit /b 1
)
if not exist "%VS_PATH%\VC\Auxiliary\Build\vcvars64.bat" (
    echo [ERROR] vcvars64.bat was not found in the Visual Studio installation.
    exit /b 1
)
call "%VS_PATH%\VC\Auxiliary\Build\vcvars64.bat" >nul || exit /b 1
exit /b 0

:: ==========================================================================
::  SUBROUTINE: check that a command line tool is available
:: ==========================================================================
:require_tool
where %~1 >nul 2>nul
if errorlevel 1 (
    echo [ERROR] %~1 was not found in PATH.
    exit /b 1
)
exit /b 0

:: ==========================================================================
::  SUBROUTINE: clone a repository at a tag, or check an existing clone
::  %1 = folder name   %2 = url   %3 = tag
:: ==========================================================================
:ensure_repo
set "REPO_DIR=%SRC_DIR%\%~1"
if not exist "%REPO_DIR%\.git" (
    if exist "%REPO_DIR%" rmdir /s /q "%REPO_DIR%"
    echo [INFO] Cloning %~1 %~3
    git clone --depth 1 --branch %~3 %~2 "%REPO_DIR%" || exit /b 1
    exit /b 0
)

set "CUR="
for /f "delims=" %%t in ('git -C "%REPO_DIR%" describe --tags --exact-match 2^>nul') do set "CUR=%%t"
if /i not "!CUR!"=="%~3" (
    echo [ERROR] src\%~1 is not at tag %~3. Delete that folder to clone it again.
    exit /b 1
)
exit /b 0

:: ==========================================================================
::  SUBROUTINE: build everything for %CONFIG% into the staging folder
:: ==========================================================================
:build_pipeline
echo.
echo ------------------------------------------
echo  Building configuration: %CONFIG%
echo ------------------------------------------

set "PREFIX=%STAGE_DIR%\%CONFIG%_Win64"
set "FT_BUILD=%TMP_DIR%\freetype_%CONFIG%"
set "HB_BUILD=%TMP_DIR%\harfbuzz_%CONFIG%"
set "FT_FINAL_BUILD=%TMP_DIR%\freetype_final_%CONFIG%"

:: Options for every configure step.
::  -A x64                      explicit platform for the Visual Studio generator
::  CMAKE_POLICY_DEFAULT_CMP0091=NEW   HarfBuzz asks for CMake 3.14 only, and without this policy
::                              CMAKE_MSVC_RUNTIME_LIBRARY is silently ignored (you would get /MD)
::  (CMAKE_BUILD_TYPE is not needed: the Visual Studio generator is multi-config, --config is used)
set "COMMON=-A x64 -DBUILD_SHARED_LIBS=ON -DCMAKE_MSVC_RUNTIME_LIBRARY=%CRT_FLAG% -DCMAKE_POLICY_DEFAULT_CMP0091=NEW"

:: Same optional dependencies switched off in every FreeType build
set "FT_OPTS=-DFT_DISABLE_ZLIB=ON -DFT_DISABLE_BZIP2=ON -DFT_DISABLE_PNG=ON -DFT_DISABLE_BROTLI=ON"

:: In NONE mode this FreeType build is the final one. In LINKED mode it is only a stage 1
:: that HarfBuzz is built against.
set "FT1_PREFIX=%PREFIX%"
if /i "%FT_HARFBUZZ%"=="LINKED" set "FT1_PREFIX=%TMP_DIR%\freetype_stage1\%CONFIG%"

echo [INFO] Configuring FreeType...
cmake -S "%SRC_DIR%\freetype" -B "%FT_BUILD%" %COMMON% %FT_OPTS% -DFT_DISABLE_HARFBUZZ=ON -DCMAKE_INSTALL_PREFIX="%FT1_PREFIX%" || exit /b 1
echo [INFO] Building FreeType...
cmake --build "%FT_BUILD%" --config %CONFIG% --target install || exit /b 1

:: harfbuzz-subset is not wrapped, so it is not built. No CMAKE_CXX_FLAGS: HarfBuzz defines
:: HB_DLL_EXPORT itself for shared MSVC builds, and setting CMAKE_CXX_FLAGS would replace
:: the default MSVC flags.
echo [INFO] Configuring HarfBuzz...
cmake -S "%SRC_DIR%\harfbuzz" -B "%HB_BUILD%" %COMMON% -DHB_HAVE_FREETYPE=ON -DHB_BUILD_SUBSET=OFF -DCMAKE_PREFIX_PATH="%FT1_PREFIX%" -DCMAKE_INSTALL_PREFIX="%PREFIX%" || exit /b 1
echo [INFO] Building HarfBuzz...
cmake --build "%HB_BUILD%" --config %CONFIG% --target install || exit /b 1

if /i not "%FT_HARFBUZZ%"=="LINKED" exit /b 0

:: LINKED mode only: FreeType again, this time linked to HarfBuzz.
:: FT_DYNAMIC_HARFBUZZ=OFF is required. By default FreeType enables dynamic loading on Windows,
:: which skips linking and would look for "libharfbuzz-0.dll" at run time.
:: FT_REQUIRE_HARFBUZZ=ON turns a failed lookup into an error instead of a silent build without it.
echo [INFO] Configuring FreeType, final stage...
cmake -S "%SRC_DIR%\freetype" -B "%FT_FINAL_BUILD%" %COMMON% %FT_OPTS% -DFT_DISABLE_HARFBUZZ=OFF -DFT_DYNAMIC_HARFBUZZ=OFF -DFT_REQUIRE_HARFBUZZ=ON -DCMAKE_PREFIX_PATH="%PREFIX%" -DCMAKE_INSTALL_PREFIX="%PREFIX%" || exit /b 1
echo [INFO] Building FreeType, final stage...
cmake --build "%FT_FINAL_BUILD%" --config %CONFIG% --target install || exit /b 1
exit /b 0

:: ==========================================================================
::  SUBROUTINE: verify the result and copy the staging folder to dst
:: ==========================================================================
:publish
call :verify_crt || exit /b 1

if exist "%DST_DIR%" rmdir /s /q "%DST_DIR%"
:: pkgconfig files contain the staging path, so they are not copied
robocopy "%STAGE_DIR%" "%DST_DIR%" /E /XD pkgconfig /NFL /NDL /NJH /NJS /NP >nul
if errorlevel 8 exit /b 1

echo.
echo [INFO] Result:
dir /s /b "%DST_DIR%\*.dll" "%DST_DIR%\*.lib"
exit /b 0

:: ==========================================================================
::  SUBROUTINE: fail if any DLL imports the dynamic C runtime
:: ==========================================================================
:verify_crt
where dumpbin >nul 2>nul
if errorlevel 1 (
    echo [WARN] dumpbin not found, the static CRT check was skipped.
    exit /b 0
)

set "CRT_BAD="
for %%f in ("%STAGE_DIR%\Debug_Win64\bin\*.dll" "%STAGE_DIR%\Release_Win64\bin\*.dll") do (
    dumpbin /dependents "%%~f" | findstr /i /c:"vcruntime" /c:"msvcp" /c:"ucrtbase" /c:"api-ms-win-crt" >nul && (
        echo [ERROR] %%~nxf imports the dynamic C runtime.
        set "CRT_BAD=1"
    )
)
if defined CRT_BAD exit /b 1
exit /b 0