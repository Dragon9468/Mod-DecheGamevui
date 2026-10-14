const fs = require('fs');
const path = require('path');

const srcDir = path.join(__dirname, 'exported_texts');
const outDir = path.join(__dirname, 'vietnamese_texts', 'texts');

fs.mkdirSync(outDir, { recursive: true });

// Copy all files first
const files = fs.readdirSync(srcDir);
for (const file of files) {
    fs.copyFileSync(path.join(srcDir, file), path.join(outDir, file));
}

console.log(`Da sao chep ${files.length} file text vao ${outDir}`);

// Bang dich chinh xac tung file text cu the theo ID
const specialFiles = {
    // Tutorial Parchments & Dialogs
    '329.txt': 'CHÀO MỪNG ĐẾN VỚI HƯỚNG DẪN \r\n--- RECORDSEPARATOR ---\r\nCHƠI ĐẾ CHẾ. CHÚNG TÔI SẼ CHỈ \r\n--- RECORDSEPARATOR ---\r\nBẠN CÁCH XÂY DỰNG ĐẾ CHẾ \r\n--- RECORDSEPARATOR ---\r\nHÙNG MẠNH. BẤM BỎ QUA ĐỂ \r\n--- RECORDSEPARATOR ---\r\nVÀO GAME HOẶC TIẾP TỤC ĐỂ \r\n--- RECORDSEPARATOR ---\r\nXEM TIẾP HƯỚNG DẪN.',
    '330.txt': 'TIẾP TỤC',
    '331.txt': 'TIẾP TỤC',
    '333.txt': 'BỎ QUA',
    '334.txt': 'BỎ QUA',
    '339.txt': 'TRƯỚC HẾT, BẠN CẦN NẮM RÕ VỀ \r\n--- RECORDSEPARATOR ---\r\nTÀI NGUYÊN & BINH LÍNH TRONG THÀNH, \r\n--- RECORDSEPARATOR ---\r\nTHANH PHÍA TRÊN HIỂN THỊ SỐ LƯỢNG \r\n--- RECORDSEPARATOR ---\r\nTÀI NGUYÊN BẠN ĐANG CÓ. BẠN CÓ THỂ \r\n--- RECORDSEPARATOR ---\r\nRÊ CHUỘT VÀO TỪNG MỤC ĐỂ XEM \r\n--- RECORDSEPARATOR ---\r\nCHI TIẾT THÔNG TIN.',
    '340.txt': 'QUAY LẠI',
    '341.txt': 'QUAY LẠI',
    '343.txt': 'VỚI BẢNG TÀI NGUYÊN & QUÂN ĐỘI, \r\n--- RECORDSEPARATOR ---\r\nBẠN CÓ THỂ BẤM NÚT MŨI TÊN \r\n--- RECORDSEPARATOR ---\r\nTRÁI HOẶC PHẢI ĐỂ ĐỔI TRANG \r\n--- RECORDSEPARATOR ---\r\nVÀ XEM ĐẦY ĐỦ CÁC MẶT HÀNG, \r\n--- RECORDSEPARATOR ---\r\nCÓ TẤT CẢ 24 LOẠI TÀI NGUYÊN \r\n--- RECORDSEPARATOR ---\r\nTRONG TRÒ CHƠI.',
    '344.txt': 'TIẾP THEO LÀ KHU VỰC CÔNG TRÌNH, \r\n--- RECORDSEPARATOR ---\r\nBẠN CÓ THỂ XÂY DỰNG NHIỀU \r\n--- RECORDSEPARATOR ---\r\nCÔNG TRÌNH BẰNG CÁCH CHỌN \r\n--- RECORDSEPARATOR ---\r\nNÚT DANH MỤC BÊN PHẢI VÀ ĐẶT \r\n--- RECORDSEPARATOR ---\r\nVÀO KHU ĐẤT TRỐNG.',
    '345.txt': 'BẠN CÓ THỂ SỬ DỤNG CÁC NÚT: \r\n--- RECORDSEPARATOR ---\r\nHÀNH ĐỘNG, BẢN ĐỒ VÀ CÀI ĐẶT \r\n--- RECORDSEPARATOR ---\r\nỞ ĐÂY. BẢNG HÀNH ĐỘNG CHO \r\n--- RECORDSEPARATOR ---\r\nPHÉP ĐIỀU CHUYỂN TÀI NGUYÊN, \r\n--- RECORDSEPARATOR ---\r\nTẤN CÔNG XÂM CHIẾM, \r\n--- RECORDSEPARATOR ---\r\nXUẤT VÀ NHẬP KHẨU.',
    '346.txt': 'BẤM NÚT BẢN ĐỒ ĐỂ XEM TOÀN \r\n--- RECORDSEPARATOR ---\r\nCẢNH XỨ DOGLAND, CHỌN VÀ \r\n--- RECORDSEPARATOR ---\r\nĐIỀU HÀNH THÀNH PHỐ KHÁC. NÚT \r\n--- RECORDSEPARATOR ---\r\nCÀI ĐẶT CHO PHÉP TÙY CHỈNH \r\n--- RECORDSEPARATOR ---\r\nCẤU HÌNH, LƯU GAME, \r\n--- RECORDSEPARATOR ---\r\nTẢI LƯU VÀ THOÁT GAME.',
    '347.txt': 'CUỐI CÙNG, BẢN ĐỒ NHỎ THÀNH PHỐ \r\n--- RECORDSEPARATOR ---\r\nCÓ 4 PHÂN KHU ĐẤT. BẠN CÓ THỂ \r\n--- RECORDSEPARATOR ---\r\nBẤM VÀO CÁC PHÂN KHU ĐỂ \r\n--- RECORDSEPARATOR ---\r\nDI CHUYỂN VÀ QUẢN LÝ TỪNG VÙNG \r\n--- RECORDSEPARATOR ---\r\nTRONG THÀNH PHỐ CỦA BẠN. \r\n--- RECORDSEPARATOR ---\r\nCHÚC BẠN CHƠI GAME VUI VẺ!',

    // Welcome Screen & Empire Selection
    '2767.txt': 'CHÀO MỪNG ĐẾN VỚI\r\n--- RECORDSEPARATOR ---\r\nĐẾ CHẾ GAMEVUI\r\n--- RECORDSEPARATOR ---\r\nBƯỚC 1: Chọn đế chế của bạn',
    '2883.txt': 'THẤT BẠI\r\n--- RECORDSEPARATOR ---\r\nNhấn vào màn hình để\r\n--- RECORDSEPARATOR ---\r\nquay lại menu chính',
    '2890.txt': 'CHIẾN THẮNG!\r\n--- RECORDSEPARATOR ---\r\nBạn đã thống nhất thiên hạ!\r\n--- RECORDSEPARATOR ---\r\nNhấn vào màn hình để quay lại menu',

    // Building Area & Help
    '2606.txt': 'Nút Xây Dựng:\r\n--- RECORDSEPARATOR ---\r\nBấm và kéo để xây dựng công trình.',
    '2610.txt': 'Nút Xây Dựng',
    '2707.txt': 'Loại công trình:',
    '2709.txt': 'Để xây: Bấm công trình, kéo vào khu đất trống,\r\n--- RECORDSEPARATOR ---\r\nrồi bấm tiếp vào ô đất trống đó.',
    '2749.txt': 'Bản đồ thành phố có 4 khu vực, mỗi vùng có địa hình khác nhau gồm\r\n--- RECORDSEPARATOR ---\r\nsông nước, núi đá, đồng cỏ và rừng cây. Để khám phá 4 khu vực, chỉ cần bấm\r\n--- RECORDSEPARATOR ---\r\nvào góc bản đồ tương ứng.',
    '2750.txt': 'HÀNH ĐỘNG: Chuyển quân, phát động chiến tranh, xuất nhập khẩu.\r\n--- RECORDSEPARATOR ---\r\nBẢN ĐỒ: Xem bản đồ Dogland và kiểm soát các thành phố.\r\n--- RECORDSEPARATOR ---\r\nCÀI ĐẶT: Mở bảng tùy chọn cấu hình game.',
    '2751.txt': 'Cho phép nhập khẩu hàng hóa từ đế chế khác để giải quyết thiếu hụt trong thành.',
    '2752.txt': 'Cho phép xuất khẩu hàng hóa dư thừa ra bên ngoài để thu về tiền vàng.',
    '2753.txt': 'Cho phép phát động tấn công đánh chiếm thành phố của quân địch.',
    '2754.txt': 'Cho phép điều chuyển tài nguyên, vũ khí, tiền vàng và binh lính sang thành phố khác của bạn.',

    // Buttons
    '1172.txt': 'CÔNG TRÌNH',
    '1173.txt': 'CÀI ĐẶT',
    '1174.txt': 'CÀI ĐẶT',
    '1176.txt': 'BẢN ĐỒ',
    '1177.txt': 'BẢN ĐỒ',
    '1179.txt': 'HÀNH ĐỘNG',
    '1180.txt': 'HÀNH ĐỘNG',
    '1258.txt': 'CÔNG TRÌNH',
    '1281.txt': 'CÔNG TRÌNH',
    '1328.txt': 'CÔNG TRÌNH',
    '1344.txt': 'CÔNG TRÌNH',

    '1504.txt': 'THÔNG TIN',
    '1505.txt': 'VÀO THÀNH',
    '1506.txt': 'VÀO THÀNH',
    '1508.txt': 'THÔNG TIN',
    '1512.txt': 'Thống trị bởi:',
    '1515.txt': 'Yêu cầu | mỗi ngày:',
    '1516.txt': 'NHÀ DÂN',
    '1563.txt': 'Ngựa | mỗi ngày:',
    '1564.txt': 'CHUỒNG NGỰA',
    '1570.txt': 'Vàng mỗi ngày:',
    '1571.txt': 'MỎ VÀNG',
    '1606.txt': 'HỒ CÁ',
    '1624.txt': 'Cung lửa | mỗi ngày:',
    '1625.txt': 'LÒ CUNG LỬA',
    '1637.txt': 'Lương thực | mỗi ngày:',
    '1638.txt': 'RUỘNG LÚA',

    // Battle Result Stats
    '1661.txt': 'Siêu chiến binh tử trận',
    '1663.txt': 'Voi chiến tử trận',
    '1665.txt': 'Phù thủy tử trận',
    '1667.txt': 'Máy bắn đá bị phá hủy',
    '1669.txt': 'Chiến mã tử trận',
    '1672.txt': 'Binh sĩ tử trận',
    '1677.txt': 'Sắt cướp được',
    '1679.txt': 'Gỗ cướp được',
    '1681.txt': 'Lương thực cướp được',
    '1683.txt': 'Vàng cướp được',
    '1685.txt': 'Quân địch bị tiêu diệt',
    '1693.txt': 'Voi chiến tử trận',
    '1700.txt': 'Sắt bị cướp mất',
    '1702.txt': 'Gỗ bị cướp mất',
    '1704.txt': 'Lương thực bị cướp mất',
    '1706.txt': 'Vàng bị cướp mất',
    '1715.txt': 'Voi | mỗi ngày:',
    '1716.txt': 'CHUỒNG VOI',

    // Maps
    '1719.txt': 'CHÀO MỪNG ĐẾN\r\n--- RECORDSEPARATOR ---\r\nBẢN ĐỒ XÂM CHIẾM\r\n--- RECORDSEPARATOR ---\r\nChọn mục tiêu tấn công',
    '1720.txt': 'CHÀO MỪNG ĐẾN\r\n--- RECORDSEPARATOR ---\r\nBẢN ĐỒ ĐIỀU CHUYỂN\r\n--- RECORDSEPARATOR ---\r\nChọn khu vực đích đến',
    '1724.txt': 'Đế chế Artavera',
    '1727.txt': 'Đế chế Zargas',
    '1733.txt': 'Nhấn để xem chi tiết:',

    // Buildings & Production
    '1828.txt': 'TRẠI BÒ',
    '1833.txt': 'Than | mỗi ngày:',
    '1834.txt': 'MỎ THAN',
    '1838.txt': 'Máy bắn đá | mỗi ngày:',
    '1843.txt': 'XƯỞNG MÁY BẮN ĐÁ',
    '1850.txt': 'Gỗ mỗi ngày:',
    '1851.txt': 'XƯỞNG GỖ',

    // Tactics & Battle Controls
    '1877.txt': 'Bố trí tiểu đội (kéo thả các ô bên dưới vào ô xanh lá), xong bấm Bắt đầu',
    '1878.txt': 'HOÀN TÁC',
    '1879.txt': 'HOÀN TÁC',
    '1881.txt': 'NGẪU NHIÊN',
    '1882.txt': 'NGẪU NHIÊN',
    '1884.txt': 'ĐẦU HÀNG',
    '1885.txt': 'ĐẦU HÀNG',
    '1887.txt': 'BẮT ĐẦU',
    '1888.txt': 'BẮT ĐẦU',
    '1912.txt': 'Binh lính | mỗi ngày:',
    '1913.txt': 'DOANH TRẠI',
    '1959.txt': 'Cung tên | mỗi ngày:',
    '1960.txt': 'LÒ RÈN CUNG',

    // Actions Submenu
    '1981.txt': 'CHUYỂN\r\n--- RECORDSEPARATOR ---\r\nTÀI NGUYÊN',
    '1982.txt': 'CHUYỂN\r\n--- RECORDSEPARATOR ---\r\nTÀI NGUYÊN',
    '1984.txt': 'NHẬP KHẨU',
    '1985.txt': 'NHẬP KHẨU',
    '1987.txt': 'XUẤT KHẨU',
    '1988.txt': 'XUẤT KHẨU',
    '1990.txt': 'TẤN CÔNG',
    '1991.txt': 'TẤN CÔNG'
};

// Bang tu dien viet hoa chuan cho cac file text thong dung (match chinh xac ca chuoi)
const exactDictionary = {
    // Buttons & Navigation
    'BUILDING': 'CÔNG TRÌNH',
    'OPTIONS': 'CÀI ĐẶT',
    'MAP': 'BẢN ĐỒ',
    'ACTIONS': 'HÀNH ĐỘNG',
    'SELL': 'BÁN',
    'UPGRADE': 'NÂNG CẤP',
    'UPRGADE': 'NÂNG CẤP',
    'CLOSE': 'ĐÓNG',
    'NEXT': 'TIẾP TỤC',
    'SKIP': 'BỎ QUA',
    'BACK': 'QUAY LẠI',
    'QUIT GAME': 'THOÁT GAME',
    'LOAD GAME': 'TẢI LƯU',
    'SAVE GAME': 'LƯU GAME',
    'PLAY MORE\r\n GAMES': 'GAME KHÁC',
    'PLAY MORE\r\nGAMES': 'GAME KHÁC',
    'PLAY MORE GAMES': 'GAME KHÁC',
    'BACK TO\r\nGAME': 'VÀO GAME',
    'BACK TO GAME': 'VÀO GAME',
    'SOUND FX': 'ÂM THANH',
    'MUSIC': 'NHẠC NỀN',
    'GRAPHIC QUALITY': 'ĐỒ HỌA',
    'GAME SPEED': 'TỐC ĐỘ',
    'EASY': 'DỄ',
    'NORMAL': 'TRUNG BÌNH',
    'HARD': 'KHÓ',
    'IMPOSSIBLE': 'CỰC KHÓ',
    'Day 10': 'Ngày 10',
    'LOADING...': 'ĐANG TẢI...',
    'UNDEFINED': 'CHƯA ĐẶT TÊN',
    'INFO': 'THÔNG TIN',
    'GO TO CITY': 'VÀO THÀNH',
    
    // Welcome & Steps
    'Select your empire:': 'Chọn đế chế của bạn:',
    'SECOND STEP: Customize your goods': 'BƯỚC 2: Tùy chỉnh tài nguyên ban đầu',
    'higher goods = easier game': 'Nhiều tài nguyên hơn = Game dễ hơn',
    'THIRD STEP: Select level': 'BƯỚC 3: Chọn độ khó',
    'Bonus left:': 'Điểm thưởng còn:',
    'Wood': 'Gỗ',
    'Iron': 'Sắt',
    'Food': 'Lương thực',
    'Money': 'Tiền vàng',
    'Tips and Tricks': 'Mẹo và Hướng dẫn',
    'ACTION BUTTON': 'BẢNG HÀNH ĐỘNG',
    'set amount': 'Số lượng chuyển',
    'arrow to switch': 'Mũi tên để đổi',
    'weapon type': 'Chủng loại vũ khí',
    'soldier type': 'Chủng loại binh lính',
    'To Build Requires:': 'Yêu cầu xây dựng:',
    'To Upgrade Requires:': 'Yêu cầu nâng cấp:',
    'Workers (Unemployment)': 'Dân tự do',
    'Witch per day:': 'Phù thủy/ngày:',
    'WITCH HOUSE': 'NHÀ PHÙ THỦY',
    'SWORD BLACKSMITH': 'LÒ RÈN KIẾM',
    'SUPER SOLDIER BARRACKS': 'TRẠI LÍNH SIÊU CẤP',
    'STEEL MINE': 'MỎ THÉP',
    'SPEAR BLACKSMITH': 'LÒ RÈN GIÁO',
    'SHRIMP POND': 'AO TÔM',
    'PEARL POND': 'HỒ NGỌC TRAI',
    'OIL REFINERY': 'NHÀ MÁY LỌC DẦU',
    'IRON MINE': 'MỎ SẮT',
    'MARKET': 'CHỢ TRUYỀN THỐNG',
    'Tax per day:': 'Tiền thuế/ngày:',
    'Irons per day:': 'Sắt khai thác/ngày:'
};

let replacedCount = 0;

for (const file of files) {
    const filePath = path.join(outDir, file);
    if (specialFiles[file]) {
        fs.writeFileSync(filePath, specialFiles[file], 'utf8');
        replacedCount++;
        continue;
    }

    let content = fs.readFileSync(filePath, 'utf8').trim();
    if (exactDictionary[content]) {
        fs.writeFileSync(filePath, exactDictionary[content], 'utf8');
        replacedCount++;
    }
}

console.log(`===> HOAN TAT DICH BUTTON & STATIC TEXT! Da cap nhat ${replacedCount} texts.`);
