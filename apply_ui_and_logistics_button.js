const fs = require('fs');
const path = require('path');

const f129Path = path.join(__dirname, 'decompiled_scripts', 'scripts', 'frame_129', 'DoAction.as');
let code = fs.readFileSync(f129Path, 'utf8');

function normalizeNewlines(str) {
    return str.replace(/\r\n/g, '\n');
}

function replaceOrFail(src, search, replace, name) {
    const normSrc = normalizeNewlines(src);
    const normSearch = normalizeNewlines(search);
    const normReplace = normalizeNewlines(replace);

    if (!normSrc.includes(normSearch)) {
        throw new Error(`[FAIL] Không tìm thấy pattern: ${name}`);
    }
    console.log(`[OK] Đã thay thế: ${name}`);
    return normSrc.replace(normSearch, normReplace).replace(/\n/g, '\r\n');
}

// 1. Xóa nút logistics_mobile_btn ở màn hình chính
const oldMobileBtn = `   // Nút mở Vận tải & Di dân cảm ứng trên Mobile (dành cho màn hình cảm ứng không có phím 'L')
   if(map.logistics_mobile_btn == undefined)
   {
      var _lBtn = map.createEmptyMovieClip("logistics_mobile_btn", 9999);
      _lBtn._x = 590;
      _lBtn._y = 6;
      _lBtn.lineStyle(1.5, 0x55AAFF, 100);
      _lBtn.beginFill(0x1B2A42, 90);
      _lBtn.moveTo(0, 0); _lBtn.lineTo(82, 0); _lBtn.lineTo(82, 24); _lBtn.lineTo(0, 24); _lBtn.lineTo(0, 0);
      _lBtn.endFill();
      _lBtn.createTextField("lbl", 1, 0, 2, 82, 22);
      var _lFmt = new TextFormat();
      _lFmt.font = "Arial";
      _lFmt.size = 10;
      _lFmt.bold = true;
      _lFmt.align = "center";
      _lFmt.color = 0x88DDFF;
      _lBtn.lbl.selectable = false;
      _lBtn.lbl.setNewTextFormat(_lFmt);
      _lBtn.lbl.text = "VẬN TẢI (L)";
      _lBtn.onRelease = function() {
         _root.openLogisticsManager();
      };
   }`;

const newMobileBtn = `   // Nút logistics duoc tich hop truc tiep vao ban do Map theo yeu cau UI`;

if (normalizeNewlines(code).includes(normalizeNewlines(oldMobileBtn))) {
    code = replaceOrFail(code, oldMobileBtn, newMobileBtn, '1. Xóa nút logistics lẻ loi ở góc màn hình chính');
}

// 2. Thêm nút Logistics chuẩn La Mã cổ vào trong hàm klikMap (màn hình dunia)
const oldMapClose = `   dunia.close_btn.onRelease = function()
   {
      bisaTombol2(true);
      removeMovieClip(dunia);
      bisaTombol(true);
      removeMovieClip(actions);
      xpause = false;
   };`;

const newMapCloseAndLogistics = `   // ================= NÚT LOGISTICS & DI DÂN PHONG CÁCH LA MÃ CỔ TRÊN BẢN ĐỒ =================
   if(dunia.logistics_btn == undefined)
   {
      var lbtn = dunia.createEmptyMovieClip("logistics_btn", 15000);
      lbtn._x = 95;
      lbtn._y = -215;
      
      // Hàm vẽ khung nút phong cách La Mã cổ đại
      lbtn.drawStyle = function(isOver) {
         this.clear();
         var bgCol = isOver ? 0x48301B : 0x2A1A0D;
         var borderCol = isOver ? 0xFFE082 : 0xC8963E;
         var lightBorder = isOver ? 0xFFF5C0 : 0xE5BD6B;
         var shadowBorder = isOver ? 0x241508 : 0x140B04;
         
         // Lớp nền chính
         this.beginFill(bgCol, 95);
         this.lineStyle(1.5, borderCol, 100);
         this.moveTo(0, 0);
         this.lineTo(165, 0);
         this.lineTo(165, 30);
         this.lineTo(0, 30);
         this.lineTo(0, 0);
         this.endFill();
         
         // Đường viền sáng 3D trên & trái
         this.lineStyle(1, lightBorder, 80);
         this.moveTo(1, 29);
         this.lineTo(1, 1);
         this.lineTo(164, 1);
         
         // Đường viền đổ bóng 3D dưới & phải
         this.lineStyle(1, shadowBorder, 90);
         this.moveTo(164, 1);
         this.lineTo(164, 29);
         this.lineTo(1, 29);
         
         // Vẽ Logo đoàn xe thồ La Mã cổ
         this.lineStyle(1.5, isOver ? 0xFFE599 : 0xDBA848, 100);
         // Bánh xe ngoài
         this.drawCircle = function(cx, cy, r) {
            this.moveTo(cx + r, cy);
            this.curveTo(cx + r, cy + r * 0.414, cx + r * 0.707, cy + r * 0.707);
            this.curveTo(cx + r * 0.414, cy + r, cx, cy + r);
            this.curveTo(cx - r * 0.414, cy + r, cx - r * 0.707, cy + r * 0.707);
            this.curveTo(cx - r, cy + r * 0.414, cx - r, cy);
            this.curveTo(cx - r, cy - r * 0.414, cx - r * 0.707, cy - r * 0.707);
            this.curveTo(cx - r * 0.414, cy - r, cx, cy - r);
            this.curveTo(cx + r * 0.414, cy - r, cx + r * 0.707, cy - r * 0.707);
            this.curveTo(cx + r, cy - r * 0.414, cx + r, cy);
         };
         this.drawCircle(14, 15, 7);
         // Nan hoa xe
         this.moveTo(14, 8); this.lineTo(14, 22);
         this.moveTo(7, 15); this.lineTo(21, 15);
         // Thùng xe hàng
         this.lineStyle(1.5, isOver ? 0xFFD54F : 0xC48E33, 100);
         this.moveTo(14, 11); this.lineTo(26, 11); this.lineTo(24, 19); this.lineTo(14, 19);
      };
      
      lbtn.drawStyle(false);
      
      // Nhãn chữ tiếng Việt có dấu sắc nét
      lbtn.createTextField("txt", 2, 28, 4, 134, 24);
      var fmt = new TextFormat();
      fmt.font = "Arial";
      fmt.size = 11;
      fmt.bold = true;
      fmt.align = "center";
      fmt.color = 0xF5D378;
      lbtn.txt.selectable = false;
      lbtn.txt.setNewTextFormat(fmt);
      lbtn.txt.text = "VẬN TẢI & DI DÂN";
      
      // Tương tác chuột
      lbtn.onRollOver = function() {
         this.drawStyle(true);
         this.txt.textColor = 0xFFFFFF;
      };
      lbtn.onRollOut = function() {
         this.drawStyle(false);
         this.txt.textColor = 0xF5D378;
      };
      lbtn.onPress = function() {
         this._y += 1;
      };
      lbtn.onRelease = function() {
         this._y -= 1;
         _root.openLogisticsManager();
      };
   }

   dunia.close_btn.onRelease = function()
   {
      bisaTombol2(true);
      removeMovieClip(dunia);
      bisaTombol(true);
      removeMovieClip(actions);
      xpause = false;
   };`;

code = replaceOrFail(code, oldMapClose, newMapCloseAndLogistics, '2. Tích hợp nút Logistics phong cách La Mã cổ vào bản đồ Dunia');

// 3. Việt hóa tên hàng hóa trong klikExport
const oldExportNames = `   daftarNama = new Array("","Foods","Irons","Logs","Pearls","Coals","Oils","Steels");
   i = 1;
   while(i <= 7)
   {
      actions["nama" + i] = daftarNama[i];`;

const newExportNames = `   daftarNama = new Array("","Foods","Irons","Logs","Pearls","Coals","Oils","Steels");
   var daftarNamaVN = new Array("","Lương thực","Sắt","Gỗ","Ngọc trai","Than đá","Dầu","Thép");
   i = 1;
   while(i <= 7)
   {
      actions["nama" + i] = daftarNamaVN[i];`;

code = replaceOrFail(code, oldExportNames, newExportNames, '3. Việt hóa danh sách hàng hóa trong Xuất khẩu');

// 4. Việt hóa tên hàng hóa trong klikImport
const oldImportNames = `   daftarNama = new Array("","Foods","Irons","Logs","Pearls","Coals","Oils","Steels");
   i = 1;
   while(i <= 7)
   {
      actions["nama" + i] = daftarNama[i];
      if(daftarNama[i] == "Foods")`;

const newImportNames = `   daftarNama = new Array("","Foods","Irons","Logs","Pearls","Coals","Oils","Steels");
   var daftarNamaVN = new Array("","Lương thực","Sắt","Gỗ","Ngọc trai","Than đá","Dầu","Thép");
   i = 1;
   while(i <= 7)
   {
      actions["nama" + i] = daftarNamaVN[i];
      if(daftarNama[i] == "Foods")`;

if (normalizeNewlines(code).includes(normalizeNewlines(oldImportNames))) {
    code = replaceOrFail(code, oldImportNames, newImportNames, '4. Việt hóa danh sách hàng hóa trong Nhập khẩu');
}

fs.writeFileSync(f129Path, code, 'utf8');
console.log('===> HOÀN TẤT CẬP NHẬT CODE FRAME 129!');
