@echo off
chcp 65001 >nul
rem === CHINH TOC DO DOC TAI DAY: -10%% hoi cham, -15%% (mac dinh), -25%% rat cham ===
set RATE=-15%%
where edge-tts >nul 2>nul
if errorlevel 1 (
  echo Chua cai edge-tts. Hay chay lenh: pip install edge-tts
  pause
  exit /b 1
)
if not exist audio mkdir audio
for %%f in (texts\*.txt) do (
  echo Dang tao %%~nf.mp3 ...
  edge-tts --file "%%f" --voice zh-CN-XiaoxiaoNeural --rate=%RATE% --write-media "audio\%%~nf.mp3"
)
echo.
echo Xong! 15 file MP3 nam trong thu muc audio.
pause
