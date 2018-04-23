REM Build
msbuild darknet\build\darknet\darknet.sln /p:Configuration=Release /p:Platform=x64 /v:minimal
msbuild Yolo_mark\yolo_mark.sln /p:Configuration=Release /p:Platform=x64 /v:minimal
msbuild yolo2_light\yolo_gpu.sln /p:Configuration=Release /p:Platform=x64 /v:minimal
robocopy C:\opencv_3.0\opencv\build\x64\vc14\bin\ %~dp0\darknet\build\darknet\x64\ opencv_world340.dll
robocopy C:\opencv_3.0\opencv\build\x64\vc14\bin\ %~dp0\Yolo_mark\x64\Release\ opencv_world340.dll

REM Deploy to bin/
robocopy darknet\build\darknet\x64\ bin\ darknet.exe
robocopy darknet\build\darknet\x64\ bin\ pthreadVC2.dll
robocopy darknet\cfg bin\cfg /E
robocopy darknet\data bin\data /E
robocopy Yolo_mark\x64\Release\ bin\ yolo_mark.exe
robocopy yolo2_light\bin\ bin\ yolo_gpu.exe
robocopy C:\opencv_3.0\opencv\build\x64\vc14\bin\ bin\ opencv_world340.dll
