@echo off
C:\Users\23287\AppData\Local\Android\Sdk\platform-tools\adb.exe -s MNMZGERSNJJFIF9X reverse tcp:8000 tcp:8000
C:\Users\23287\AppData\Local\Android\Sdk\platform-tools\adb.exe -s MNMZGERSNJJFIF9X reverse tcp:8002 tcp:8002
C:\Users\23287\AppData\Local\Android\Sdk\platform-tools\adb.exe -s MNMZGERSNJJFIF9X forward --list
C:\Users\23287\AppData\Local\Android\Sdk\platform-tools\adb.exe -s MNMZGERSNJJFIF9X reverse --list
echo Done
pause
