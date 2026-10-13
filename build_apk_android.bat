@echo off
chcp 65001 >nul
echo =====================================================================
echo  HƯỚNG DẪN BUILD FILE APK CHO ANDROID (ADOBE AIR SDK / HARMAN AIR)
echo =====================================================================
echo.
echo Bước 1: Tải bộ Adobe AIR SDK & Compiler (hoặc Harman AIR SDK miễn phí)
echo         tại: https://airsdk.harman.com/download
echo.
echo Bước 2: Giải nén AIR SDK và thêm thư mục 'bin' vào biến môi trường PATH.
echo.
echo Bước 3: Tạo chứng chỉ tự ký (Self-signed Certificate) để cài đặt trực tiếp
echo         trên Android mà không cần xác thực tài khoản Google:
echo.
echo    adt -certificate -cn TheImperium -ou GameVui -o GameVui -c VN 2048-RSA my-release-key.p12 123456
echo.
echo Bước 4: Đóng gói thành file The_Imperium_Mod.apk:
echo.
echo    adt -package -target apk-captive-runtime -storetype pkcs12 -keystore my-release-key.p12 -storepass 123456 The_Imperium_Mod.apk app-descriptor.xml imperium_modded.swf icon.png
echo.
echo =====================================================================
echo File APK tạo ra bằng 'apk-captive-runtime' sẽ bao gồm sẵn runtime AIR,
echo cho phép bất kỳ máy Android nào cài đặt trực tiếp chỉ với 1 cú chạm!
echo =====================================================================
pause
