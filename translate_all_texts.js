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

// Bang tu dien viet hoa chuan
const dictionary = {
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
    'BACK TO\r\nGAME': 'VÀO GAME',
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
    'Swords \r\n--- RECORDSEPARATOR ---\r\nper day:': 'Kiếm rèn \r\n--- RECORDSEPARATOR ---\r\nmỗi ngày:',
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

// Cac file can thay the dac biet
const specialFiles = {
    '2767.txt': 'CHÀO MỪNG ĐẾN VỚI\r\n--- RECORDSEPARATOR ---\r\nĐẾ CHẾ GAMEVUI\r\n--- RECORDSEPARATOR ---\r\nBƯỚC 1: Chọn đế chế của bạn',
    '2883.txt': 'THẤT BẠI\r\n--- RECORDSEPARATOR ---\r\nNhấn vào màn hình để\r\n--- RECORDSEPARATOR ---\r\nquay lại menu chính',
    '2890.txt': 'CHIẾN THẮNG!\r\n--- RECORDSEPARATOR ---\r\nBạn đã thống nhất thiên hạ!\r\n--- RECORDSEPARATOR ---\r\nNhấn vào màn hình để quay lại menu',
    '2750.txt': 'HÀNH ĐỘNG: Chuyển quân, phát động chiến tranh, xuất nhập khẩu.\r\n--- RECORDSEPARATOR ---\r\nBẢN ĐỒ: Xem bản đồ Dogland và kiểm soát các thành phố.\r\n--- RECORDSEPARATOR ---\r\nCÀI ĐẶT: Mở bảng tùy chọn cấu hình game.',
    '2751.txt': 'Cho phép nhập khẩu hàng hóa từ đế chế khác để giải quyết thiếu hụt trong thành.',
    '2752.txt': 'Cho phép xuất khẩu hàng hóa dư thừa ra bên ngoài để thu về tiền vàng.',
    '2753.txt': 'Cho phép phát động tấn công đánh chiếm thành phố của quân địch.',
    '2754.txt': 'Cho phép điều chuyển tài nguyên, vũ khí, tiền vàng và binh lính sang thành phố khác của bạn.'
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
    if (dictionary[content]) {
        fs.writeFileSync(filePath, dictionary[content], 'utf8');
        replacedCount++;
    } else {
        // Thu kiem tra replace mot phan
        let modified = false;
        for (const [en, vi] of Object.entries(dictionary)) {
            if (content.includes(en)) {
                content = content.split(en).join(vi);
                modified = true;
            }
        }
        if (modified) {
            fs.writeFileSync(filePath, content, 'utf8');
            replacedCount++;
        }
    }
}

console.log(`===> HOAN TAT DICH BUTTON & STATIC TEXT! Da cap nhat ${replacedCount} texts.`);
