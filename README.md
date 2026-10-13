# Mod Đế Chế Game Vui (The Imperium - Offline Standalone & Mod)

Dự án chuyển đổi tựa game chiến thuật kinh điển **The Imperium** (Đế chế trên Game Vui) thành bản chơi độc lập trên máy tính (Desktop App) kèm hệ thống Mod / Cheat Menu tùy biến.

---

## 🎮 Cách Chơi Ngay Trên Máy Tính (Offline 100%)
1. Chạy file [`Choi_Game_Mod.bat`](Choi_Game_Mod.bat) (hoặc mở trực tiếp file [`imperium_modded.swf`](imperium_modded.swf) bằng [`FlashPlayer.exe`](FlashPlayer.exe)).
2. Không cần kết nối internet, không phụ thuộc vào trình duyệt web hay lỗi chặn Flash.

---

## ⚡ Các Tính Năng Mod & Cơ Chế Mới Đã Triển Khai

### 1. 🏳️ Vùng Trung Lập Phòng Thủ Thụ Động
* Các vùng đất trung lập (chưa bị chiếm / rợ) **không tự động chủ động tấn công** phe ta hay phe máy (`lawanNyerang` bị bỏ qua).
* Vùng trung lập chỉ phòng thủ khi bị tấn công, tạo không gian chiến lược và thời gian chuẩn bị vững chắc cho người chơi.

### 2. ⚖️ Tái Cân Bằng 4 Độ Khó Hợp Logic
* **Dễ (Easy):**
  * Sức mạnh vùng trung lập cố định (không tăng tiến theo ngày).
  * Phe máy bành trướng chậm hơn (giãn cách thời gian giữa các đợt xuất quân của máy dài hơn).
  * Không có bất kỳ debuff nào cho phe ta.
* **Trung bình (Normal):**
  * Vùng trung lập có khả năng tích lũy trữ quân và tăng tiến sức mạnh dần theo thời gian (`_root.neutralAccumulatedGarrison` tăng tiến mỗi ngày).
* **Khó (Hard):**
  * Áp dụng debuff tài nguyên cho phe ta:
    * **Công trình lương thực không gắn với nước** (cụ thể là Trại bò - `Cow Farm`) bị **giảm 50% sản lượng** thực sản xuất (từ 300 ➔ 150 thực).
    * *Các công trình gắn liền với nước như Vườn lúa (lúa nước: 200 thực), Hồ cá (250 thực), Ao tôm (300 thực) giữ nguyên 100% sản lượng.*
    * **Lợi nhuận từ xuất khẩu** tài nguyên bị **giảm 20%**.
    * **Doanh thu thuế từ chợ** bị **giảm 50%** (từ 100 ➔ 50 vàng/ngày).
* **Cực khó (Impossible):**
  * Áp dụng toàn bộ debuff của độ khó Khó, cộng thêm:
    * **Hoàn toàn cấm nhập khẩu** tài nguyên (chặn giao thương mua vào).
    * **Lợi nhuận từ xuất khẩu** bị **giảm 50%**.
    * **Nhà ở cư dân tiêu hao thực tăng 100%** (gấp đôi: từ 25 ➔ 50 thực mỗi cấp nhà).

### 3. ⚔️ Tiêu Hao Lực Lượng Chiến Tranh (War Attrition)
* **Khắc phục cơ chế reset cũ:** Trước đây khi đánh thua, phe ta mất quân nhưng địch lại được hồi đầy 100%.
* **Cơ chế mới:** Khi ta đánh thua (`perangMenang == false`), **quân địch vẫn bị trừ hao đúng với số lượng thương vong mà ta đã tiêu diệt**. Trận đánh tiếp theo tại thành phố đó, kẻ địch chỉ còn lại đúng số tàn quân sống sót (`_root.citySurvivingTroops[kotaDiserang]`), tạo điều kiện cho chiến thuật đánh tiêu hao nhiều đợt.

### 4. 🚚 Hệ Thống Logistics Tự Động & Điều Phối Dân Số (Worker Migration)
Bấm phím **`[L]`** hoặc **`[F4]`** bất kỳ lúc nào để mở bảng điều khiển với 2 Tab chức năng:
* **Tab 1: 📦 Vận Chuyển Hàng Hóa (Commodity Logistics):**
  * Mỗi vùng chỉ được chọn **gửi 1 loại tài nguyên duy nhất** (Thực, Sắt, Gỗ, Ngọc trai, Than, Dầu, Thép, Vàng) nhằm cân bằng và tránh giật lag.
  * Có thể gửi đến nhiều vùng đích khác nhau với số lượng tùy chỉnh.
* **Tab 2: 👥 Điều Phối Dân Số / Gửi Người (Worker Migration):**
  * **Cơ chế riêng biệt:** Hoàn toàn tách biệt khỏi nhóm tài nguyên, **không bị giới hạn** bởi loại hàng hóa (vùng vừa có thể xuất khẩu thép/thực vừa có thể gửi dân đi).
  * **Cân bằng slot phát triển:** Giúp chuyển dân cư từ các vùng hậu phương (nhiều ô đất/nhà ở) sang các vùng ít ô đất hoặc các vùng tiền tuyến cần nhiều slot dân để chiêu mộ quân đội quy mô lớn.
  * Nút tăng giảm nhanh: `[+5]`, `[+20]`, `[+50]`, `[+100]`, `[Clear]`.
* **Chỉ số GDP Vùng (Regional Trade GDP):**
  * Trên bản đồ thế giới (`World Map`) và thanh thông tin thành phố sẽ hiển thị trực tiếp số tiền GDP ròng hàng ngày của từng vùng:
    $$\text{GDP Ròng} = \text{Giá trị hàng xuất khẩu} - \text{Giá trị hàng nhập về}$$
  * Giúp người chơi theo dõi cán cân kinh tế vùng để điều chỉnh sản xuất và giao thương tối ưu.

### 5. ⌨️ Phím Tắt Tiện Ích (Hotkeys)
* `[F1]`: Thêm +50.000 Vàng & Tài nguyên vào thành phố đang chọn.
* `[F2]`: Thêm +100 tất cả chủng loại quân vào thành phố đang chọn.
* `[F3]`: Tăng tốc độ ngày (x5 tốc độ phát triển / thu hoạch).
* `[L]` / `[F4]`: Bật/Tắt bảng điều khiển Logistics & Điều phối Dân số liên vùng (hoặc bấm nút cảm ứng `[VẬN TẢI (L)]` ở góc phải trên Mobile).

### 6. 🇻🇳 Việt Hóa 100% & Khóa Cứng Màn Hình (Tỷ Lệ 4:3)
* **Việt hóa toàn diện:** Toàn bộ công trình cấp 1 & cấp 2, tài nguyên, chủng loại lính, thông báo cảnh báo thời chiến, đào ngũ, đói kém, giao diện chiến trường và bảng kết trận đều được dịch sang Tiếng Việt chuẩn.
* **Khóa cứng tỷ lệ 4:3:** Khắc phục triệt để hiện tượng màn hình 16:9 hoặc độ phân giải cao phóng to làm lệch góc nhìn của game.

---

## 📱 Hướng Dẫn Cài Đặt Cho Mobile (Android)

Game hỗ trợ điều khiển cảm ứng (Point & Click và Kéo - Thả quân đoàn) hoàn hảo trên điện thoại.

### Cách 1: Tải file APK trực tiếp (Không cần xác thực bên thứ 3)
* **Đóng gói Captive Runtime:** Khi build bằng Adobe AIR với cờ `-target apk-captive-runtime`, file APK đã tích hợp sẵn môi trường chạy mà không yêu cầu máy cài đặt Adobe AIR hay dịch vụ ngoài.
* **Cài đặt:**
  1. Tải file `The_Imperium_Mod.apk` về điện thoại.
  2. Mở file APK và chọn **Cài đặt (Install)**. Nếu điện thoại hỏi quyền "Cài đặt ứng dụng không rõ nguồn gốc", chọn **Cho phép**.
  3. Mở game và trải nghiệm trực tiếp!

### Cách 2: Chơi nhanh bằng ứng dụng SWF Player (Không cần compile)
1. Tải ứng dụng **SWF Player** hoặc bất kỳ trình phát Flash nào từ Google Play.
2. Chép file [`imperium_modded.swf`](imperium_modded.swf) vào điện thoại.
3. Mở file SWF trong ứng dụng để chơi ngay lập tức.

---

## 🛠️ Công Cụ Kỹ Thuật
* **Engine:** ActionScript 2 / Adobe Flash Player Standalone Projector.
* **Decompiler / Compiler:** JPEXS Free Flash Decompiler (`ffdec.jar`).
* **Source scripts:** Thư mục [`decompiled_scripts/`](decompiled_scripts/) chứa mã nguồn ActionScript đã mod để đóng gói CI/CD tự động.
* **Đóng gói Standalone PC:** Chạy `node build_standalone_exe.js` để tạo file `The_Imperium_Mod.exe`.
* **Đóng gói Mobile APK:** Chạy file [`build_apk_android.bat`](build_apk_android.bat) hoặc sử dụng file cấu hình [`app-descriptor.xml`](app-descriptor.xml).


