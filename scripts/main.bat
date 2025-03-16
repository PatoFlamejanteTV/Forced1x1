@echo off
setlocal enabledelayedexpansion

:: Check for ImageMagick installation
where convert >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: ImageMagick is required but not found in PATH.
    echo Install it from https://imagemagick.org/ and make sure convert.exe is available
    exit /b 1
)

:: Process images in all subdirectories
for /r %%F in (
    *.png *.jpg *.jpeg *.gif *.bmp *.tiff *.PNG *.JPG *.JPEG *.GIF *.BMP *.TIFF
) do (
    echo Processing: "%%~fF"
    convert "%%~fF" -resize 1x1! "%%~fF"
)

echo All images have been resized to 1x1 pixels.
endlocal
