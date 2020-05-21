#! /bin/bash

source ./version.bash

VERSION=$VERSION-win64

x86_64-w64-mingw32-g++ src/phantom.cpp src/iostream.cpp -Isrc/ -std=c++2a -O3 -static -s -o bin-win64/phantom.exe

mkdir -p release
cd release


R=War3R-FontMod-$VERSION

mkdir -p $R

cp ../bin-win64/{otfccbuild,otfccdump,phantom}.exe $R/
cp ../font/sample-font.ttf $R/
cp ../script-windows/run.bat $R/
cp ../script-windows/github-repo.url $R/

7z a -tzip -mm=Deflate:fb=258:pass=3 -mcu=on $R.zip $R/
