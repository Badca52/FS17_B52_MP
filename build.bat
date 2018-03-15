mkdir temp
echo f | xcopy /f /y modDesc.xml temp\modDesc.xml
echo f | xcopy /f /y icon.png temp\icon.png
echo d | xcopy /f /y /s scripts temp\scripts
cd temp
7z a -tzip FS17_B52_MP.zip *
echo f | xcopy /f /y FS17_B52_MP.zip ..\FS17_B52_MP.zip
cd ..
rmdir /s /q temp
xcopy /f /y FS17_B52_MP.zip "C:\Users\Jeffrey\Documents\My Games\FarmingSimulator2017\mods\FS17_B52_MP.zip"
del /f /q FS17_B52_MP.zip
