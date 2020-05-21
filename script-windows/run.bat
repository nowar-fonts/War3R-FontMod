%~d0
cd "%~dp0"

.\otfccdump.exe --ignore-hints -o base.otd "%~1"

.\phantom.exe base.otd

@echo off
IF %ERRORLEVEL% NEQ 0 ( 
	echo [31mFAILED![0m

	del base.otd
	pause
) ELSE (
	IF exist Fonts rmdir /s /q Fonts
	mkdir Fonts

	.\otfccbuild.exe -q -O3 -o Fonts\FRIZQT__.ttf base.otd
	copy Fonts\FRIZQT__.ttf Fonts\BLQ55Web.ttf
	copy Fonts\FRIZQT__.ttf Fonts\BLQ85Web.ttf
	copy Fonts\FRIZQT__.ttf Fonts\THOWR___.ttf
	copy Fonts\FRIZQT__.ttf Fonts\NimrodMT.ttf

	del base.otd
	pause
)
