const fs = require('fs');
const path = require('path');

console.log('=== BẮT ĐẦU CẬP NHẬT TIẾNG VIỆT 100% VÀ KHÓA CỨNG MÀN HÌNH GAME ===');

const baseDir = path.join(__dirname, 'decompiled_scripts', 'scripts');

function normalizeNewlines(str) {
    return str.replace(/\r\n/g, '\n');
}

function replaceOrFail(code, search, replace, name) {
    const normCode = normalizeNewlines(code);
    const normSearch = normalizeNewlines(search);
    const normReplace = normalizeNewlines(replace);
    
    if (!normCode.includes(normSearch)) {
        throw new Error(`[LỖI] Không tìm thấy chuỗi để thay thế: "${name}"`);
    }
    console.log(`[OK] Đã thay thế: ${name}`);
    return normCode.replace(normSearch, normReplace).replace(/\n/g, '\r\n');
}

// =========================================================================
// 1. FRAME 1: KHÓA CỨNG MÀN HÌNH (ASPECT RATIO 4:3, LETTERBOX CHỐNG ZOOM LỆCH)
// =========================================================================
const f1Path = path.join(baseDir, 'frame_1', 'DoAction.as');
let f1 = fs.readFileSync(f1Path, 'utf8');

const f1Original = `stop();
Stage.showMenu = false;
fscommand("fullscreen",false);
fscommand("allowscale",false);
fscommand("showmenu",false);`;

const f1Fixed = `stop();
Stage.showMenu = false;
Stage.scaleMode = "showAll";
Stage.align = "";
fscommand("fullscreen", "false");
fscommand("allowscale", "false");
fscommand("showmenu", "false");`;

if (normalizeNewlines(f1).includes(normalizeNewlines(f1Original))) {
    f1 = replaceOrFail(f1, f1Original, f1Fixed, 'Frame 1: Khóa cứng tỷ lệ màn hình showAll + Stage align centered');
    fs.writeFileSync(f1Path, f1, 'utf8');
} else {
    console.log('[INFO] Frame 1 đã được áp dụng khóa tỷ lệ màn hình.');
}

// =========================================================================
// 2. FRAME 6: DỊCH CÔNG TRÌNH, TÀI NGUYÊN, MÔ TẢ NÂNG CẤP
// =========================================================================
const f6Path = path.join(baseDir, 'frame_6', 'DoAction.as');
let f6 = fs.readFileSync(f6Path, 'utf8');

// 2.1 Tên Đế chế
f6 = replaceOrFail(
    f6,
    `namaEmpire = new Array("","Zargas","Artavera");`,
    `namaEmpire = new Array("","Đế chế Zargas","Đế chế Artavera");`,
    'Frame 6: Tên Đế chế Tiếng Việt'
);

// 2.2 Tên Công trình (judulButton)
const oldJudulButton = `judulButton = new Array("Building Area","House","Farm","Market","Carpenter House","Iron Mine","Sword Blacksmith","Arrow Blacksmith","Barracks","Fish Pond","Gold Mine","Spear Blacksmith","Pearl Pond","Horse Stable","Cow Farm","Shirmp Pond","Elephant Stable","Coal Mine","Oil Refinery","Catapult Factory","Witch House","Steel Mine","Fire Arrow Blacksmith","Jewel Shop","Super Soldier Barracks");`;
const newJudulButton = `judulButton = new Array("Khu đất trống","Nhà dân","Ruộng lúa","Chợ","Xưởng gỗ","Mỏ sắt","Lò rèn kiếm","Lò rèn cung","Doanh trại lính","Hồ cá","Mỏ vàng","Lò rèn giáo","Hồ ngọc trai","Chuồng ngựa","Trại bò","Ao tôm","Chuồng voi","Mỏ than","Nhà máy lọc dầu","Xưởng máy bắn đá","Nhà phù thủy","Mỏ thép","Lò cung lửa","Tiệm đá quý","Trại lính siêu cấp");`;
f6 = replaceOrFail(f6, oldJudulButton, newJudulButton, 'Frame 6: Tên công trình Tiếng Việt');

// 2.3 Tên Tài nguyên (judulButton2)
const oldJudulButton2 = `judulButton2 = new Array("","Money","Foods","Irons","Logs","Swords","Arrows","Soldiers","Workers (Unemployment)","Pearls","Coals","Oils","Horses","Spears","Catapults","Witches","Elephants","Fire Arrows","Steel","Super Soldiers","Ice Ball Magic","Fire Ball Magic","Poison Magic","Hurricane Magic","Earthquake Magic");`;
const newJudulButton2 = `judulButton2 = new Array("","Vàng","Lương thực","Sắt","Gỗ","Kiếm","Cung tên","Binh lính","Dân tự do","Ngọc trai","Than đá","Dầu","Ngựa chiến","Ngọn giáo","Máy bắn đá","Phù thủy","Voi chiến","Cung lửa","Thép","Siêu chiến binh","Bình phép Băng","Bình phép Lửa","Bình phép Độc","Bình phép Cuồng phong","Bình phép Động đất");`;
f6 = replaceOrFail(f6, oldJudulButton2, newJudulButton2, 'Frame 6: Tên tài nguyên Tiếng Việt');

// 2.4 Mô tả công trình cấp 1 (xisiButton)
const oldXisiButton = `xisiButton = new Array("A place to put down a building, you can put a building here. Please note; there are some buildings that only can be put down in certain area.","Residence house, one house can be occupied by 50 workers. Every house requires 25 foods per day","Farm area. Produce agriculture pickings, like grist, maize and potato, can produce 200 foods per day. (Only place at near the water)","Traditional Market, a place where\\'s residents go to shopping. One market requires 50 foods for sell and produce $100 income tax per day.","Deforestation Place. Produce logs. One carpenter house requires 20 foods and $10 wages per day and can produce 10 logs per day. (Only place at near the forest)","Iron Mine Area. Produce iron. One iron mine requires 25 foods and $20 wages per day and can produce 5 irons per day. (Only place at near the mount)","Produce swords that are used by soldiers. One blacksmith requires 10 foods, 2 logs, 5 irons and $15 wages per day and can produce 1 sword per day.","Produce arrows that are used by soldiers. One blacksmith requires 10 foods, 4 logs, 2 irons and $15 wages per day and can produce 1 arrow set per day.","A place to train the soldiers. One barracks requires 10 foods and $30 wages and can train 2 workers to be 2 soldiers per day.","Place for fish net in ocean. Produce Food, can produce 250 foods per day. (Only place at near the water)","Gold Mine Area. Produce gold. One gold mine requires 10 foods and $15 wages per day and can produce 200 golds per day. (Only place at near the mount)","Produce spear that are used by soldiers. One blacksmith requires 10 foods, 10 irons and $15 wages per day and can produce 1 spear per day.","Place for find the pearl in ocean. Produce Pearl, can produce 4 pearls per day (Only place at near the water)","Horse stable. Produce Horse, One horse stable requires 30 foods and $20 wages per day and can produce 2 workers to be 2 horses knight per day.","Cow Farm. Place to process meat, Produce Food, can produce 300 foods per day.","Place for shrimp net in ocean. Produce Food, can produce 300 foods per day. (Only place at near the water)","Elephant stable. Produce Elephant, One elephant stable requires 40 foods and $30 wages per day and can train 1 worker to be 1 elephant soldier per day.","Coal Mine Area. Produce coal. One coal mine requires 15 foods and $20 wages per day and can produce 3 coals per day. (Only place at near the forest)","Oil Refinery, place to produce oil, One oil refinery requires 25 foods and $40 wages per day and can produce 100 oils per day","Catapult Factory. Produce catapult, one catapult factory requires 25 foods, 10 logs, 5 irons and $50 wages per day and can train 1 worker to be 1 catapult army per day.","Witch Houses. Produce witch, one witch houses requires 50 foods and $75 wages per day and can train 2 witch per day.","Steel Mine. Produce steel, one steel mine requires 30 foods and 45 wages per day and can produce 5 steel per day (Only place at near the mount)","Produce fire arrows that are used by soldiers. One blacksmith requires 10 foods, 4 logs, 2 irons, 200 oils and $25 wages per day and can produce 1 fire arrow set per day.","Jewel Shop, sell various of jewel and other accesories, one jewel shop requires 20 pearls and can produce $2000 income tax per day.","Super Soldier Barracks, place to train super soldiers, one super soldier barracks requires 30 foods, 25 steel and $60 wages and can train 1 super soldier per day.");`;

const newXisiButton = `xisiButton = new Array("Khu đất trống để xây dựng công trình. Lưu ý: một số công trình chỉ có thể xây dựng ở địa hình chỉ định.","Nhà dân: Cung cấp chỗ ở cho 50 dân lao động. Tiêu hao 25 lương thực mỗi ngày.","Ruộng lúa: Sản xuất nông sản hoa màu, cung cấp 200 lương thực mỗi ngày. (Chỉ xây gần nguồn nước)","Chợ truyền thống: Nơi giao thương buôn bán. Tiêu thụ 50 lương thực và đem lại 100 vàng tiền thuế mỗi ngày.","Xưởng khai thác gỗ: Khai thác gỗ rừng. Cần 20 lương thực và 10 vàng tiền công, tạo ra 10 gỗ mỗi ngày. (Chỉ xây gần rừng)","Mỏ sắt: Khai thác quặng sắt. Cần 25 lương thực và 20 vàng tiền công, tạo ra 5 sắt mỗi ngày. (Chỉ xây gần núi)","Lò rèn kiếm: Rèn vũ khí cho binh lính. Cần 10 lương thực, 2 gỗ, 5 sắt và 15 vàng tiền công, rèn 1 thanh kiếm mỗi ngày.","Lò rèn cung: Rèn cung tên cho binh lính. Cần 10 lương thực, 4 gỗ, 2 sắt và 15 vàng tiền công, rèn 1 bộ cung tên mỗi ngày.","Doanh trại quân đội: Huấn luyện binh lính. Cần 10 lương thực và 30 vàng tiền công, huấn luyện 2 dân thành 2 binh lính mỗi ngày.","Hồ đánh bắt cá: Đánh bắt thủy sản. Cung cấp 250 lương thực mỗi ngày. (Chỉ xây gần nguồn nước)","Mỏ vàng: Khai thác quặng vàng. Cần 10 lương thực và 15 vàng tiền công, đem lại 200 vàng mỗi ngày. (Chỉ xây gần núi)","Lò rèn giáo: Rèn giáo dài đánh giáp lá cà. Cần 10 lương thực, 10 sắt và 15 vàng tiền công, rèn 1 ngọn giáo mỗi ngày.","Hồ ngọc trai: Thu thập ngọc quý từ biển hồ. Thu về 4 ngọc trai mỗi ngày. (Chỉ xây gần nguồn nước)","Chuồng ngựa: Huấn luyện kỵ binh. Cần 30 lương thực và 20 vàng tiền công, huấn luyện 2 kỵ sĩ mỗi ngày.","Trại nuôi bò: Nuôi và lấy thịt bò. Cung cấp 300 lương thực mỗi ngày. (Không phụ thuộc nguồn nước)","Ao tôm: Nuôi tôm biển hồ. Cung cấp 300 lương thực mỗi ngày. (Chỉ xây gần nguồn nước)","Chuồng voi: Huấn luyện chiến tượng. Cần 40 lương thực và 30 vàng tiền công, huấn luyện 1 lính voi chiến mỗi ngày.","Mỏ than: Khai thác than đá. Cần 15 lương thực và 20 vàng tiền công, khai thác 3 than đá mỗi ngày. (Chỉ xây gần rừng)","Nhà máy lọc dầu: Tinh chế dầu hỏa. Cần 25 lương thực và 40 vàng tiền công, tinh chế 100 dầu mỗi ngày.","Xưởng máy bắn đá: Chế tạo máy công thành. Cần 25 lương thực, 10 gỗ, 5 sắt và 50 vàng tiền công, chế tạo 1 máy bắn đá mỗi ngày.","Nhà phù thủy: Đào tạo phù thủy yểm thuật. Cần 50 lương thực và 75 vàng tiền công, đào tạo 2 phù thủy mỗi ngày.","Mỏ thép: Luyện kim chế tạo thép cứng. Cần 30 lương thực và 45 vàng tiền công, tạo ra 5 thép mỗi ngày. (Chỉ xây gần núi)","Lò rèn cung lửa: Chế tạo mũi tên lửa. Cần 10 lương thực, 4 gỗ, 2 sắt, 200 dầu và 25 vàng tiền công, rèn 1 bộ cung lửa mỗi ngày.","Tiệm đá quý: Bán các loại ngọc và trang sức. Cần 20 ngọc trai, đem lại 2.000 vàng tiền thuế mỗi ngày.","Trại lính siêu cấp: Đào tạo siêu chiến binh bất bại. Cần 30 lương thực, 25 thép và 60 vàng tiền công, đào tạo 1 siêu chiến binh mỗi ngày.");`;

f6 = replaceOrFail(f6, oldXisiButton, newXisiButton, 'Frame 6: Mô tả công trình xisiButton');

// 2.5 Mô tả công trình cấp 2 (xisiButton2)
const oldXisiButton2 = `xisiButton2 = new Array("A place to put down a building, you can put a building here. Please note; there are some buildings that only can be put down in certain area.","Residence house, one house can be occupied by 100 workers. Every house requires 50 foods per day","Farm area. Produce agriculture pickings, like grist, maize and potato, can produce 400 foods per day. (Only place at near the water)","Traditional Market, a place where\\'s residents go to shopping. One market requires 100 foods for sell and produce $200 income tax per day.","Deforestation Place. Produce logs. One carpenter house requires 40 foods and $20 wages per day and can produce 20 logs per day. (Only place at near the forest)","Iron Mine Area. Produce iron. One iron mine requires 50 foods and $40 wages per day and can produce 10 irons per day. (Only place at near the mount)","Produce swords that are used by soldiers. One blacksmith requires 20 foods, 4 logs, 10 irons and $30 wages per day and can produce 2 sword per day.","Produce arrows that are used by soldiers. One blacksmith requires 20 foods, 8 logs, 4 irons and $30 wages per day and can produce 2 arrow set per day.","A place to train the soldiers. One barracks requires 20 foods and $60 wages and can train 4 workers to be 4 soldiers per day.","Place for fish net in ocean. Produce Food, can produce 300 foods per day. (Only place at near the water)","Gold Mine Area. Produce gold. One gold mine requires 20 foods and $30 wages per day and can produce 400 golds per day. (Only place at near the mount)","Produce spear that are used by soldiers. One blacksmith requires 20 foods, 20 irons and $30 wages per day and can produce 2 spear per day.","Place for find the pearl in ocean. Produce Pearl, can produce 8 pearls per day (Only place at near the water)","Horse stable. Produce Horse, One horse stable requires 60 foods and $40 wages per day and can produce 4 workers to be 4 horses knight per day.","Cow Farm. Place to process meat, Produce Food, can produce 600 foods per day.","Place for shrimp net in ocean. Produce Food, can produce 600 foods per day. (Only place at near the water)","Elephant stable. Produce Elephant, One elephant stable requires 80 foods and $60 wages per day and can train 2 workers to be 2 elephant soldier per day.","Coal Mine Area. Produce coal. One coal mine requires 30 foods and $40 wages per day and can produce 6 coals per day. (Only place at near the forest)","Oil Refinery, place to produce oil, One oil refinery requires 50 foods and $80 wages per day and can produce 200 oils per day","Catapult Factory. Produce catapult, one catapult factory requires 50 foods, 20 logs, 10 irons and $100 wages per day and can train 2 workers to be 2 catapult army per 4 day.","Witch Houses. Produce witch, one witch houses requires 100 foods and $150 wages per day and can train 4 witch per 4 day.","Steel Mine. Produce steel, one steel mine requires 60 foods and 90 wages per day and can produce 10 steel per day (Only place at near the mount)","Produce fire arrows that are used by soldiers. One blacksmith requires 20 foods, 8 logs, 4 irons, 400 oils and $50 wages per day and can produce 2 fire arrow set per day.","Jewel Shop, sell various of jewel and other accesories, one jewel shop requires 40 pearls and can produce $4000 income tax per day.","Super Soldier Barracks, place to train super soldiers, one super soldier barracks requires 60 foods, 50 steel and $120 wages and can train 2 super soldier per 5 day.");`;

const newXisiButton2 = `xisiButton2 = new Array("Khu đất trống để xây dựng công trình. Lưu ý: một số công trình chỉ có thể xây dựng ở địa hình chỉ định.","Nhà dân (Cấp 2): Chứa được 100 dân lao động. Tiêu hao 50 lương thực mỗi ngày.","Ruộng lúa (Cấp 2): Sản lượng nông sản cao cấp, cung cấp 400 lương thực mỗi ngày. (Chỉ xây gần nguồn nước)","Chợ truyền thống (Cấp 2): Trung tâm buôn bán lớn. Tiêu thụ 100 lương thực và đem lại 200 vàng tiền thuế mỗi ngày.","Xưởng gỗ (Cấp 2): Quy mô khai thác gấp đôi. Cần 40 lương thực và 20 vàng tiền công, tạo ra 20 gỗ mỗi ngày. (Chỉ xây gần rừng)","Mỏ sắt (Cấp 2): Quy mô khai thác sâu. Cần 50 lương thực và 40 vàng tiền công, tạo ra 10 sắt mỗi ngày. (Chỉ xây gần núi)","Lò rèn kiếm (Cấp 2): Nâng cao công suất. Cần 20 lương thực, 4 gỗ, 10 sắt và 30 vàng tiền công, rèn 2 thanh kiếm mỗi ngày.","Lò rèn cung (Cấp 2): Rèn cung tên nhanh. Cần 20 lương thực, 8 gỗ, 4 sắt và 30 vàng tiền công, rèn 2 bộ cung tên mỗi ngày.","Doanh trại (Cấp 2): Doanh trại mở rộng. Cần 20 lương thực và 60 vàng tiền công, huấn luyện 4 lính mỗi ngày.","Hồ cá (Cấp 2): Lưới đánh cá đại dương. Cung cấp 300 lương thực mỗi ngày. (Chỉ xây gần nguồn nước)","Mỏ vàng (Cấp 2): Đào sâu lòng quặng. Cần 20 lương thực và 30 vàng tiền công, đem lại 400 vàng mỗi ngày. (Chỉ xây gần núi)","Lò rèn giáo (Cấp 2): Rèn giáo quy mô lớn. Cần 20 lương thực, 20 sắt và 30 vàng tiền công, rèn 2 ngọn giáo mỗi ngày.","Hồ ngọc trai (Cấp 2): Khai thác ngọc trai sâu. Thu về 8 ngọc trai mỗi ngày. (Chỉ xây gần nguồn nước)","Chuồng ngựa (Cấp 2): Trại kỵ binh tinh nhuệ. Cần 60 lương thực và 40 vàng tiền công, huấn luyện 4 kỵ sĩ mỗi ngày.","Trại bò (Cấp 2): Trại gia súc lớn. Cung cấp 600 lương thực mỗi ngày. (Không phụ thuộc nguồn nước)","Ao tôm (Cấp 2): Ao tôm quy mô lớn. Cung cấp 600 lương thực mỗi ngày. (Chỉ xây gần nguồn nước)","Chuồng voi (Cấp 2): Trại voi chiến bọc giáp. Cần 80 lương thực và 60 vàng tiền công, huấn luyện 2 lính voi chiến mỗi ngày.","Mỏ than (Cấp 2): Khai thác than hầm lò. Cần 30 lương thực và 40 vàng tiền công, khai thác 6 than đá mỗi ngày. (Chỉ xây gần rừng)","Nhà máy lọc dầu (Cấp 2): Nhà máy công nghiệp. Cần 50 lương thực và 80 vàng tiền công, tinh chế 200 dầu mỗi ngày.","Xưởng máy bắn đá (Cấp 2): Xưởng công thành lớn. Cần 50 lương thực, 20 gỗ, 10 sắt và 100 vàng tiền công, chế tạo 2 máy bắn đá mỗi 4 ngày.","Nhà phù thủy (Cấp 2): Viện ma pháp tối cao. Cần 100 lương thực và 150 vàng tiền công, đào tạo 4 phù thủy mỗi 4 ngày.","Mỏ thép (Cấp 2): Lò luyện thép cao tần. Cần 60 lương thực và 90 vàng tiền công, tạo ra 10 thép mỗi ngày. (Chỉ xây gần núi)","Lò cung lửa (Cấp 2): Rèn cung lửa hàng loạt. Cần 20 lương thực, 8 gỗ, 4 sắt, 400 dầu và 50 vàng tiền công, rèn 2 bộ cung lửa mỗi ngày.","Tiệm đá quý (Cấp 2): Trung tâm kim hoàn cao cấp. Cần 40 ngọc trai, đem lại 4.000 vàng tiền thuế mỗi ngày.","Trại lính siêu cấp (Cấp 2): Căn cứ siêu binh sĩ hoàng gia. Cần 60 lương thực, 50 thép và 120 vàng tiền công, đào tạo 2 siêu chiến binh mỗi 5 ngày.");`;

f6 = replaceOrFail(f6, oldXisiButton2, newXisiButton2, 'Frame 6: Mô tả công trình xisiButton2');

// 2.6 Đồng bộ isiButton sang Tiếng Việt
f6 = replaceOrFail(
    f6,
    `isiButton = new Array("A place to put down a building`,
    `isiButton = xisiButton;//new Array("A place to put down a building`,
    'Frame 6: Đồng bộ isiButton'
);

f6 = replaceOrFail(
    f6,
    `isiButton2 = new Array("A place to put down a building`,
    `isiButton2 = xisiButton2;//new Array("A place to put down a building`,
    'Frame 6: Đồng bộ isiButton2'
);

// 2.7 Lưu tên slot mặc định
f6 = replaceOrFail(f6, `namaData = "Empty";`, `namaData = "Trống";`, 'Frame 6: Tên slot lưu Trống');

fs.writeFileSync(f6Path, f6, 'utf8');

// =========================================================================
// 3. FRAME 77: MENU SAVE / LOAD / TÙY CHỌN DỮ LIỆU
// =========================================================================
const f77Path = path.join(baseDir, 'frame_77', 'DoAction.as');
let f77 = fs.readFileSync(f77Path, 'utf8');

f77 = replaceOrFail(f77, `vtingkatSulit = "Easy";`, `vtingkatSulit = "Dễ";`, 'Frame 77: Dễ');
f77 = replaceOrFail(f77, `vtingkatSulit = "Normal";`, `vtingkatSulit = "Trung bình";`, 'Frame 77: Trung bình');
f77 = replaceOrFail(f77, `vtingkatSulit = "Hard";`, `vtingkatSulit = "Khó";`, 'Frame 77: Khó');
f77 = replaceOrFail(f77, `vtingkatSulit = "Impossible";`, `vtingkatSulit = "Cực khó";`, 'Frame 77: Cực khó');

f77 = replaceOrFail(f77, `vspeedGame = "SLOW";`, `vspeedGame = "CHẬM";`, 'Frame 77: Tốc độ Chậm');
f77 = replaceOrFail(f77, `vspeedGame = "NORMAL";`, `vspeedGame = "BÌNH THƯỜNG";`, 'Frame 77: Tốc độ Bình thường');
f77 = replaceOrFail(f77, `vspeedGame = "FAST";`, `vspeedGame = "NHANH";`, 'Frame 77: Tốc độ Nhanh');

f77 = replaceOrFail(f77, `msgBox_mc.bar.tipe = "Saving..";`, `msgBox_mc.bar.tipe = "Đang lưu..";`, 'Frame 77: Đang lưu');
f77 = replaceOrFail(f77, `msgBox_mc.bar.tipe = "Loading..";`, `msgBox_mc.bar.tipe = "Đang tải..";`, 'Frame 77: Đang tải');

fs.writeFileSync(f77Path, f77, 'utf8');

// =========================================================================
// 4. FRAME 128: CHỌN ĐẾ CHẾ VÀ THIẾT LẬP BAN ĐẦU
// =========================================================================
const f128Path = path.join(baseDir, 'frame_128', 'DoAction.as');
let f128 = fs.readFileSync(f128Path, 'utf8');

f128 = replaceOrFail(f128, `indo = "Select your empire:";`, `indo = "Hãy chọn đế chế của bạn:";`, 'Frame 128: Tiêu đề chọn đế chế');
f128 = replaceOrFail(f128, `indo = "Your selected empire";`, `indo = "Đế chế bạn đã chọn";`, 'Frame 128: Đế chế bạn đã chọn 1');
f128 = replaceOrFail(f128, `indo = "Your selected empire";`, `indo = "Đế chế bạn đã chọn";`, 'Frame 128: Đế chế bạn đã chọn 2');

fs.writeFileSync(f128Path, f128, 'utf8');

// =========================================================================
// 5. FRAME 129: GIAO DIỆN CHÍNH, THÔNG BÁO TÀI NGUYÊN, TẤN CÔNG, LOGISTICS
// =========================================================================
const f129Path = path.join(baseDir, 'frame_129', 'DoAction.as');
let f129 = fs.readFileSync(f129Path, 'utf8');

// 5.1 Nhãn độ khó trên bản đồ
f129 = replaceOrFail(f129, `map.list_mc.xlevel = "EASY";`, `map.list_mc.xlevel = "DỄ";`, 'Frame 129: map xlevel DỄ');
f129 = replaceOrFail(f129, `map.list_mc.xlevel = "NORMAL";`, `map.list_mc.xlevel = "TRUNG BÌNH";`, 'Frame 129: map xlevel TRUNG BÌNH');
f129 = replaceOrFail(f129, `map.list_mc.xlevel = "HARD";`, `map.list_mc.xlevel = "KHÓ";`, 'Frame 129: map xlevel KHÓ');
f129 = replaceOrFail(f129, `map.list_mc.xlevel = "IMPOSSIBLE";`, `map.list_mc.xlevel = "CỰC KHÓ";`, 'Frame 129: map xlevel CỰC KHÓ');

// 5.2 Hiển thị NGÀY
f129 = replaceOrFail(f129, `map.day = "DAY \\n" + day;`, `map.day = "NGÀY \\n" + day;`, 'Frame 129: map.day 1');
f129 = replaceOrFail(f129, `map.day = "DAY \\n" + day;`, `map.day = "NGÀY \\n" + day;`, 'Frame 129: map.day 2');
f129 = replaceOrFail(f129, `map.day = "DAY \\n" + day;`, `map.day = "NGÀY \\n" + day;`, 'Frame 129: map.day 3');
f129 = replaceOrFail(f129, `map.day = "DAY \\n" + day;`, `map.day = "NGÀY \\n" + day;`, 'Frame 129: map.day 4');

// 5.3 Thông báo thiếu lương thực (nhà dân bị bỏ hoang)
const oldFoodAbandoned = `cekInfo(2000,"One residence house in " + namaKota[i] + " has been abandoned by residents because insufficient food. (TIPS: You can import foods by click ACTIONS BUTTON, and then click IMPORT BUTTON. Build more food buildings quickly)",2,i);`;
const newFoodAbandoned = `cekInfo(2000,"Một ngôi nhà dân tại " + namaKota[i] + " đã bị bỏ hoang do thiếu hụt lương thực! (MẸO: Nhấn HÀNH ĐỘNG -> NHẬP KHẨU hoặc xây thêm ruộng lúa, ao tôm, trại bò ngay)",2,i);`;
f129 = replaceOrFail(f129, oldFoodAbandoned, newFoodAbandoned, 'Frame 129: Bỏ hoang nhà do thiếu thực');

// 5.4 Thông báo lính rời bỏ doanh trại do thiếu tiền trả lương / thiếu chỗ ở
const troopDepartures = [
    {
        old: `cekInfo(2000,"Your troops in " + namaKota[i] + " have left barracks because there is no money to pay your workers wages. (TIPS: You can export goods to make enough money by click ACTIONS BUTTON, and then click EXPORT BUTTON or build more gold mine or market buildings)",2,i);`,
        new: `cekInfo(2000,"Binh lính tại " + namaKota[i] + " đã đào ngũ do ngân khố không đủ tiền trả lương! (MẸO: Nhấn HÀNH ĐỘNG -> XUẤT KHẨU hoặc xây thêm mỏ vàng, chợ)",2,i);`
    },
    {
        old: `cekInfo(2000,"Your troops in " + namaKota[i] + " have left barracks because there is not enough residence house. (TIPS: Build houses as many as possible for soldiers places)",2,i);`,
        new: `cekInfo(2000,"Binh lính tại " + namaKota[i] + " đã rời đi do không có đủ nhà dân để cư trú! (MẸO: Hãy xây dựng thêm nhà ở)",2,i);`
    },
    {
        old: `cekInfo(2000,"Your knights in " + namaKota[i] + " have left barracks because there is no money to pay your workers wages. (TIPS: You can export goods to make enough money by click ACTIONS BUTTON, and then click EXPORT BUTTON or build more gold mine or market buildings)",2,i);`,
        new: `cekInfo(2000,"Kỵ binh tại " + namaKota[i] + " đã đào ngũ do không có tiền trả lương! (MẸO: Xuất khẩu hàng hóa hoặc xây mỏ vàng, chợ)",2,i);`
    },
    {
        old: `cekInfo(2000,"Your knights in " + namaKota[i] + " have left barracks because there is not enough residence house. (TIPS: Build houses as many as possible for horses places)",2,i);`,
        new: `cekInfo(2000,"Kỵ binh tại " + namaKota[i] + " đã rời đi do không đủ nhà ở! (MẸO: Xây thêm nhà ở)",2,i);`
    },
    {
        old: `cekInfo(2000,"Your catapult troops in " + namaKota[i] + " have left barracks because there is no money to pay your workers wages. (TIPS: You can export goods to make enough money by click ACTIONS BUTTON, and then click EXPORT BUTTON or build more gold mine or market buildings)",2,i);`,
        new: `cekInfo(2000,"Lính máy bắn đá tại " + namaKota[i] + " đã rời đi do không đủ tiền trả lương! (MẸO: Xuất khẩu hàng hóa hoặc xây mỏ vàng, chợ)",2,i);`
    },
    {
        old: `cekInfo(2000,"Your catapult troops in " + namaKota[i] + " have left barracks because there is not enough residence house. (TIPS: Build houses as many as possible for catapults places)",2,i);`,
        new: `cekInfo(2000,"Lính máy bắn đá tại " + namaKota[i] + " đã rời đi do thiếu nhà ở! (MẸO: Xây thêm nhà ở)",2,i);`
    },
    {
        old: `cekInfo(2000,"Your witches in " + namaKota[i] + " have left barracks because there is no money to pay your workers wages. (TIPS: You can export goods to make enough money by click ACTIONS BUTTON, and then click EXPORT BUTTON or build more gold mine or market buildings)",2,i);`,
        new: `cekInfo(2000,"Phù thủy tại " + namaKota[i] + " đã rời đi do không có tiền chi trả lương bổng! (MẸO: Xuất khẩu hàng hóa hoặc xây mỏ vàng, chợ)",2,i);`
    },
    {
        old: `cekInfo(2000,"Your witches in " + namaKota[i] + " have left barracks because there is not enough residence house. (TIPS: Build houses as many as possible for witches places)",2,i);`,
        new: `cekInfo(2000,"Phù thủy tại " + namaKota[i] + " đã rời đi do không đủ nhà ở! (MẸO: Xây thêm nhà ở)",2,i);`
    },
    {
        old: `cekInfo(2000,"Your elephant troops in " + namaKota[i] + " have left barracks because there is no money to pay your workers wages. (TIPS: You can export goods to make enough money by click ACTIONS BUTTON, and then click EXPORT BUTTON or build more gold mine or market buildings)",2,i);`,
        new: `cekInfo(2000,"Quân lính voi tại " + namaKota[i] + " đã rời đi do không đủ tiền trả lương! (MẸO: Xuất khẩu hàng hóa hoặc xây mỏ vàng, chợ)",2,i);`
    },
    {
        old: `cekInfo(2000,"Your elephant troops in " + namaKota[i] + " have left barracks because there is not enough residence house. (TIPS: Build houses as many as possible for elephants places)",2,i);`,
        new: `cekInfo(2000,"Quân lính voi tại " + namaKota[i] + " đã rời đi do thiếu nhà ở! (MẸO: Xây thêm nhà ở)",2,i);`
    },
    {
        old: `cekInfo(2000,"Your super soldiers in " + namaKota[i] + " have left barracks because there is no money to pay your workers wages. (TIPS: You can export goods to make enough money by click ACTIONS BUTTON, and then click EXPORT BUTTON or build more gold mine or market buildings)",2,i);`,
        new: `cekInfo(2000,"Siêu chiến binh tại " + namaKota[i] + " đã giải tán do không có tiền chi trả lương! (MẸO: Xuất khẩu hàng hóa hoặc xây mỏ vàng, chợ)",2,i);`
    },
    {
        old: `cekInfo(2000,"Your super soldiers in " + namaKota[i] + " have left barracks because there is not enough residence house. (TIPS: Build houses as many as possible for super soldiers places)",2,i);`,
        new: `cekInfo(2000,"Siêu chiến binh tại " + namaKota[i] + " đã rời đi do không đủ nhà ở! (MẸO: Xây thêm nhà ở)",2,i);`
    }
];

troopDepartures.forEach((td, idx) => {
    f129 = replaceOrFail(f129, td.old, td.new, `Frame 129: Thông báo đào ngũ/rời đi ${idx + 1}`);
});

// 5.5 Tên công trình trong tiếng Việt cho yangHilang
const buildingTranslations = [
    { en: 'super soldier battacks', vi: 'trại lính siêu cấp' },
    { en: 'fire arrow blacksmith', vi: 'lò rèn cung lửa' },
    { en: 'spear blacksmith', vi: 'lò rèn giáo' },
    { en: 'arrow blacksmith', vi: 'lò rèn cung' },
    { en: 'sword blacksmith', vi: 'lò rèn kiếm' },
    { en: 'catapult factory', vi: 'xưởng máy bắn đá' },
    { en: 'witch house', vi: 'nhà phù thủy' },
    { en: 'horse stable', vi: 'chuồng ngựa' },
    { en: 'elephant stable', vi: 'chuồng voi' },
    { en: 'steel mine', vi: 'mỏ thép' },
    { en: 'jewel shop', vi: 'tiệm đá quý' },
    { en: 'pearl pond', vi: 'hồ ngọc trai' },
    { en: 'oil refinery', vi: 'nhà máy lọc dầu' },
    { en: 'coal mine', vi: 'mỏ than' },
    { en: 'gold mine', vi: 'mỏ vàng' },
    { en: 'iron mine', vi: 'mỏ sắt' },
    { en: 'carpenter house', vi: 'xưởng gỗ' },
    { en: 'cow farm', vi: 'trại bò' },
    { en: 'shrimp pond', vi: 'ao tôm' },
    { en: 'market', vi: 'chợ' },
    { en: 'farm', vi: 'ruộng lúa' },
    { en: 'fish pond', vi: 'hồ cá' },
    { en: 'barracks', vi: 'doanh trại lính' }
];

buildingTranslations.forEach(b => {
    f129 = f129.split(`yangHilang = "${b.en}";`).join(`yangHilang = "${b.vi}";`);
});
console.log('[OK] Đã cập nhật tên công trình tiếng Việt trong yangHilang');

// 5.6 Thông báo công trình bị phá hủy / bị bán
const oldBldgAbandoned = `cekInfo(2000,"One " + yangHilang + " in " + namaKota[i] + " was abandoned by residents because there is not enough residence house. (TIPS: Don\\'t let your houses abandoned, always check your remain worker)",2,i);`;
const newBldgAbandoned = `cekInfo(2000,"Một " + yangHilang + " tại " + namaKota[i] + " đã bị bỏ hoang do không đủ nhà ở cho thợ! (MẸO: Đừng để nhà ở thiếu hụt, luôn kiểm tra dân số tự do)",2,i);`;
f129 = replaceOrFail(f129, oldBldgAbandoned, newBldgAbandoned, 'Frame 129: Công trình bị bỏ hoang');

const oldBldgSold = `cekInfo(2000,"One " + yangHilang + " in " + namaKota[i] + " has been sold because there is no money to pay your workers wages. (TIPS: You can export goods to make money by clicking ACTIONS BUTTON, and then click EXPORT BUTTON or build more market buildings or gold mine)",2,i);`;
const newBldgSold = `cekInfo(2000,"Một " + yangHilang + " tại " + namaKota[i] + " đã bị bán tháo do không đủ tiền trả công cho thợ! (MẸO: Xuất khẩu hàng hóa hoặc xây thêm mỏ vàng, chợ)",2,i);`;
f129 = replaceOrFail(f129, oldBldgSold, newBldgSold, 'Frame 129: Công trình bị bán tháo');

// 5.7 Thông báo quân man tộc & đế chế địch tấn công
f129 = replaceOrFail(
    f129,
    `cekInfo(2000,"Barbarian soldiers have attacked your city, " + namaKota[yangDiserang] + " from " + namaKota[yangMenyerang]);`,
    `cekInfo(2000,"Quân Man Tộc đã tấn công thành phố " + namaKota[yangDiserang] + " của bạn từ " + namaKota[yangMenyerang] + "!");`,
    'Frame 129: Man tộc tấn công thành bạn'
);

f129 = replaceOrFail(
    f129,
    `cekInfo(2000,"Barbarian soldiers have attacked " + namaKota[yangDiserang] + " from " + namaKota[yangMenyerang] + " and success to occupied " + namaKota[yangDiserang] + " city");`,
    `cekInfo(2000,"Quân Man Tộc đã tấn công " + namaKota[yangDiserang] + " từ " + namaKota[yangMenyerang] + " và đã chiếm đóng thành công thành phố!");`,
    'Frame 129: Man tộc chiếm thành khác'
);

f129 = replaceOrFail(
    f129,
    `cekInfo(2000,"Barbarian soldiers have attacked" + namaKota[yangDiserang] + " from " + namaKota[yangMenyerang] + " but unsuccess to occupied " + namaKota[yangDiserang] + " city");`,
    `cekInfo(2000,"Quân Man Tộc đã tấn công " + namaKota[yangDiserang] + " từ " + namaKota[yangMenyerang] + " nhưng đã bị đẩy lùi thất bại!");`,
    'Frame 129: Man tộc tấn công thất bại'
);

f129 = replaceOrFail(
    f129,
    `cekInfo(2000,namaEmpire[jenisMusuh] + " soldiers have attacked your city, " + namaKota[yangDiserang] + " from " + namaKota[yangMenyerang]);`,
    `cekInfo(2000,"Quân đội " + namaEmpire[jenisMusuh] + " đã tấn công thành phố " + namaKota[yangDiserang] + " của bạn từ " + namaKota[yangMenyerang] + "!");`,
    'Frame 129: Địch tấn công thành bạn'
);

f129 = replaceOrFail(
    f129,
    `cekInfo(2000,namaEmpire[jenisMusuh] + " soldiers have attacked " + namaKota[yangDiserang] + " from " + namaKota[yangMenyerang] + " and success to occupied " + namaKota[yangDiserang] + " city");`,
    `cekInfo(2000,"Quân đội " + namaEmpire[jenisMusuh] + " đã tấn công " + namaKota[yangDiserang] + " từ " + namaKota[yangMenyerang] + " và chiếm đóng thành phố thành công!");`,
    'Frame 129: Địch chiếm thành khác'
);

f129 = replaceOrFail(
    f129,
    `cekInfo(2000,namaEmpire[jenisMusuh] + " soldiers have attacked " + namaKota[yangDiserang] + " from " + namaKota[yangMenyerang] + " but unsuccess to occupied " + namaKota[yangDiserang] + " city");`,
    `cekInfo(2000,"Quân đội " + namaEmpire[jenisMusuh] + " đã tấn công " + namaKota[yangDiserang] + " từ " + namaKota[yangMenyerang] + " nhưng đã bị đẩy lùi thất bại!");`,
    'Frame 129: Địch tấn công thất bại'
);

// 5.8 Hộp thoại phòng thủ / hối lộ / đầu hàng
const oldUnderAttack = `actions.isi = "Your city, " + namaKota[yangDiserang] + " is under attacking by " + aindi + ", what action will you choose? DEFENSE: War against enemy. BRIBE: Give enemy some goods. RETREAT: Retreat to another own city. SURENDER: Abandond city without resistance.";`;
const newUnderAttack = `actions.isi = "Thành phố " + namaKota[yangDiserang] + " đang bị " + aindi + " tấn công! Bạn chọn phương án nào?\\nPHÒNG THỦ: Nghênh chiến chống giặc.\\nHỐI LỘ: Cống nạp của cải cầu hòa.\\nRÚT LUI: Rút quân về thành lân cận.\\nĐẦU HÀNG: Bỏ thành không kháng cự.";`;
f129 = replaceOrFail(f129, oldUnderAttack, newUnderAttack, 'Frame 129: Hộp thoại bị tấn công');

const oldNoSoldiers = `actions.isi = "There are no soldiers or weapons in your city, choose another actions: BRIBE: Give enemy some goods. RETREAT: Retreat to another own city. SURENDER: Abandond city without resistance.";`;
const newNoSoldiers = `actions.isi = "Thành phố không có binh lính hoặc vũ khí để phòng thủ! Hãy chọn hành động khác:\\nHỐI LỘ: Cống nạp của cải để địch rút lui.\\nRÚT LUI: Rút về thành trì khác.\\nĐẦU HÀNG: Nhường thành trì không giao chiến.";`;
f129 = replaceOrFail(f129, oldNoSoldiers, newNoSoldiers, 'Frame 129: Không có lính phòng thủ');

// 5.9 Hối lộ thành công / thất bại
f129 = replaceOrFail(
    f129,
    `actions.isi = "Your enemies haven\\'t accepted your gift, they want to attack your city";`,
    `actions.isi = "Kẻ địch khinh thường lễ vật và từ chối lời cầu hòa! Chúng quyết tâm công phá thành phố của bạn!";`,
    'Frame 129: Địch từ chối hối lộ'
);

f129 = replaceOrFail(
    f129,
    `actions.isi = "Your enemies have accepted your gift, they cancell to attack your city";`,
    `actions.isi = "Kẻ địch đã chấp nhận cống phẩm! Chúng đã rút quân và hủy bỏ cuộc tấn công!";`,
    'Frame 129: Địch chấp nhận hối lộ'
);

f129 = replaceOrFail(
    f129,
    `actions.winfo = "Can\\'t bribe, you don\\'t have goods or money";`,
    `actions.winfo = "Không thể hối lộ, bạn không có đủ tiền hoặc của cải!";`,
    'Frame 129: Không đủ đồ hối lộ'
);

// 5.10 Báo cáo tăng giảm tài nguyên (Tăng / Giảm)
f129 = f129.split('"Increased " +').join('"Tăng +" +');
f129 = f129.split('"Decreased " +').join('"Giảm -" +');
console.log('[OK] Đã thay thế Increased/Decreased sang Tăng/Giảm');

// 5.11 Tooltip công trình & bản đồ
f129 = replaceOrFail(
    f129,
    `"\\n\\nPress here for upgrade or sell the building"`,
    `"\\n\\nNhấn vào đây để nâng cấp hoặc bán công trình"`,
    'Frame 129: Hướng dẫn nâng cấp/bán 1'
);
f129 = replaceOrFail(
    f129,
    `"\\n\\nPress here for upgrade or sell the building"`,
    `"\\n\\nNhấn vào đây để nâng cấp hoặc bán công trình"`,
    'Frame 129: Hướng dẫn nâng cấp/bán 2'
);

// Tooltip bản đồ thành phố
const oldCityMapHover = `this.isi = "Daily Exports: $" + _root.exportGdpKota[pilihButton] + " | Imports: $" + _root.importGdpKota[pilihButton] + "\\n(Click to travel | Press 'L' for Logistics routes)";`;
const newCityMapHover = `this.isi = "Xuất khẩu hàng ngày: $" + _root.exportGdpKota[pilihButton] + " | Nhập khẩu: $" + _root.importGdpKota[pilihButton] + "\\n(Nhấp chuột để di chuyển tới | Nhấn phím 'L' để mở Mạng lưới Vận tải)";`;
f129 = replaceOrFail(f129, oldCityMapHover, newCityMapHover, 'Frame 129: Tooltip bản đồ thành phố');

// 5.12 Giao diện Vận tải & Di cư dân số (Logistics & Migration)
f129 = replaceOrFail(
    f129,
    `p.title_tf.text = "REGIONAL LOGISTICS & POPULATION NETWORK";`,
    `p.title_tf.text = "MẠNG LƯỚI VẬN TẢI & ĐIỀU ĐỘNG DÂN SỐ";`,
    'Frame 129: Tiêu đề Logistics'
);

f129 = replaceOrFail(
    f129,
    `p.city_info.text = "Origin City: " + _root.namaKota[curC] + " (Workers: " + _root.workerKota[curC] + ")";`,
    `p.city_info.text = "Thành phố xuất phát: " + _root.namaKota[curC] + " (Dân tự do: " + _root.workerKota[curC] + ")";`,
    'Frame 129: Thành phố xuất phát'
);

f129 = replaceOrFail(
    f129,
    `"< Prev City"`,
    `"< Thành trước"`,
    'Frame 129: Nút Thành trước'
);

f129 = replaceOrFail(
    f129,
    `"Next City >"`,
    `"Thành sau >"`,
    'Frame 129: Nút Thành sau'
);

f129 = replaceOrFail(
    f129,
    `"[1] COMMODITY LOGISTICS (1 Good/Region)"`,
    `"[1] VẬN TẢI HÀNG HÓA (1 Mặt hàng/Vùng)"`,
    'Frame 129: Tab 1 Logistics'
);

f129 = replaceOrFail(
    f129,
    `"[2] WORKER / POPULATION MIGRATION"`,
    `"[2] DI DÂN / ĐIỀU ĐỘNG LAO ĐỘNG"`,
    'Frame 129: Tab 2 Logistics'
);

f129 = replaceOrFail(
    f129,
    `p.sec1_tf.text = "CHOSEN EXPORT RESOURCE (1 commodity per region):";`,
    `p.sec1_tf.text = "MẶT HÀNG XUẤT CUNG ỨNG (Tối đa 1 mặt hàng mỗi vùng):";`,
    'Frame 129: Tiêu đề chọn tài nguyên xuất khẩu'
);

f129 = replaceOrFail(
    f129,
    `var resNames = new Array("None", "Food", "Iron", "Wood", "Pearl", "Coal", "Oil", "Steel", "Money");`,
    `var resNames = new Array("Không", "Lương thực", "Sắt", "Gỗ", "Ngọc trai", "Than đá", "Dầu", "Thép", "Tiền vàng");`,
    'Frame 129: Mảng tên tài nguyên Logistics'
);

f129 = replaceOrFail(
    f129,
    `p.sec2_tf.text = "DESTINATION REGIONS (Daily automatic deliveries):";`,
    `p.sec2_tf.text = "CÁC VÙNG ĐÍCH TIẾP NHẬN (Tự động vận chuyển mỗi ngày):";`,
    'Frame 129: Tiêu đề vùng tiếp nhận hàng'
);

f129 = replaceOrFail(
    f129,
    `p.no_target_tf.text = "You do not own any other cities yet. Conquer neighboring territories to establish trade!";`,
    `p.no_target_tf.text = "Bạn chưa có thành phố trực thuộc nào khác. Hãy mở rộng lãnh thổ để thiết lập tuyến thương mại!";`,
    'Frame 129: Chưa có thành để giao thương'
);

f129 = replaceOrFail(
    f129,
    `p.summary_tf.text = "DAILY TRADE: Sending " + totalDailySending + " " + resNames[curRes] + "/day | Export: $" + curExp + " | Import: $" + curImp + "\\nNET REGIONAL TRADE GDP: " + (curGdpVal >= 0 ? "+$" : "-$") + Math.abs(curGdpVal) + " /day";`,
    `p.summary_tf.text = "THƯƠNG MẠI MỖI NGÀY: Chuyển " + totalDailySending + " " + resNames[curRes] + "/ngày | Xuất: $" + curExp + " | Nhập: $" + curImp + "\\nTHẶNG DƯ GDP THƯƠNG MẠI: " + (curGdpVal >= 0 ? "+$" : "-$") + Math.abs(curGdpVal) + " /ngày";`,
    'Frame 129: Thống kê thương mại mỗi ngày'
);

f129 = replaceOrFail(
    f129,
    `p.wsec_tf.text = "POPULATION MIGRATION (Independent from goods limit - reinforce frontline/low-land cities):";`,
    `p.wsec_tf.text = "ĐIỀU ĐỘNG DÂN CƯ (Không giới hạn tài nguyên - chi viện cho tiền tuyến và vùng ít đất):";`,
    'Frame 129: Tiêu đề tab di dân'
);

f129 = replaceOrFail(
    f129,
    `dIdx + ". " + _root.namaKota[dIdx] + " (Workers: " + _root.workerKota[dIdx] + ")"`,
    `dIdx + ". " + _root.namaKota[dIdx] + " (Dân số: " + _root.workerKota[dIdx] + ")"`,
    'Frame 129: Nhãn dân số thành tiếp nhận'
);

f129 = replaceOrFail(
    f129,
    `wAmt + " citizens/day"`,
    `wAmt + " người/ngày"`,
    'Frame 129: Số người gửi mỗi ngày'
);

f129 = replaceOrFail(
    f129,
    `sendAmt + " /day"`,
    `sendAmt + " /ngày"`,
    'Frame 129: Lượng hàng gửi mỗi ngày'
);

f129 = replaceOrFail(
    f129,
    `p.no_target_tf.text = "You do not own any other cities yet. Conquer neighboring territories to migrate population!";`,
    `p.no_target_tf.text = "Bạn chưa có thành phố trực thuộc nào khác. Hãy mở rộng lãnh thổ để điều động di dân!";`,
    'Frame 129: Chưa có thành để di dân'
);

f129 = replaceOrFail(
    f129,
    `p.summary_tf.text = "DAILY MIGRATION: Sending " + totalWorkersMoving + " citizens/day from " + _root.namaKota[curC] + "\\nCitizens can be recruited into troops or work in buildings in recipient cities.";`,
    `p.summary_tf.text = "DI DÂN MỖI NGÀY: Điều động " + totalWorkersMoving + " người/ngày từ " + _root.namaKota[curC] + "\\nDân di cư đến nơi có thể nhập ngũ thành lính hoặc lao động trong các công trình.";`,
    'Frame 129: Thống kê di dân mỗi ngày'
);

f129 = replaceOrFail(
    f129,
    `"DONE"`,
    `"XONG"`,
    'Frame 129: Nút Xong Logistics'
);

f129 = replaceOrFail(
    f129,
    `"Clear"`,
    `"Xóa"`,
    'Frame 129: Nút Xóa Logistics'
);

// 5.13 Cảnh báo chiến tranh / hành động
f129 = replaceOrFail(
    f129,
    `actions.winfo = "Can\\'t war, not enough soldier";`,
    `actions.winfo = "Không thể xuất trận: không có đủ binh lính!";`,
    'Frame 129: Thiếu lính xuất trận'
);

f129 = replaceOrFail(
    f129,
    `actions.winfo = "Can\\'t war, please put your soldiers to war";`,
    `actions.winfo = "Không thể xuất trận: hãy bố trí quân đội lên chiến trường!";`,
    'Frame 129: Chưa bố trí lính'
);

f129 = replaceOrFail(
    f129,
    `actions.winfo = "Can\\'t war, not enough weapon";`,
    `actions.winfo = "Không thể xuất trận: không có đủ vũ khí!";`,
    'Frame 129: Thiếu vũ khí'
);

f129 = replaceOrFail(
    f129,
    `actions.winfo = "Can\\'t brought, too many goods";`,
    `actions.winfo = "Không thể mang theo: vượt quá khối lượng chở hàng!";`,
    'Frame 129: Quá tải chở hàng'
);

f129 = replaceOrFail(
    f129,
    `actions.winfo = "Can\\'t move, too many goods";`,
    `actions.winfo = "Không thể di chuyển: vượt quá lượng hàng cho phép!";`,
    'Frame 129: Quá tải di chuyển'
);

// 5.14 Cảnh báo Xuất nhập khẩu
f129 = replaceOrFail(
    f129,
    `actions.info = "Can\\'t Export, amount of export more than your supplies";`,
    `actions.info = "Không thể xuất khẩu: số lượng xuất vượt quá kho dự trữ!";`,
    'Frame 129: Xuất khẩu vượt kho'
);

f129 = replaceOrFail(
    f129,
    `actions.info = "Can\\'t Import, you have not enough money";`,
    `actions.info = "Không thể nhập khẩu: bạn không có đủ tiền vàng!";`,
    'Frame 129: Thiếu tiền nhập khẩu'
);

f129 = replaceOrFail(
    f129,
    `cekInfo(2000,"Impossible difficulty: Foreign imports are completely prohibited!");`,
    `cekInfo(2000,"Độ khó Cực Khó: Nghiêm cấm hoàn toàn hoạt động nhập khẩu từ bên ngoài!");`,
    'Frame 129: Cấm nhập khẩu ở Cực Khó'
);

// 5.15 Cảnh báo xây dựng địa hình & nâng cấp
f129 = replaceOrFail(
    f129,
    `cekInfo(750,"Can\\'t build, Farm must be near the water");`,
    `cekInfo(750,"Không thể xây: Ruộng lúa bắt buộc phải ở gần nguồn nước!");`,
    'Frame 129: Xây ruộng gần nước'
);

f129 = replaceOrFail(
    f129,
    `cekInfo(750,"Can\\'t build, Pearl Pond must be near the water");`,
    `cekInfo(750,"Không thể xây: Hồ ngọc trai bắt buộc phải ở gần nguồn nước!");`,
    'Frame 129: Xây hồ ngọc gần nước'
);

f129 = replaceOrFail(
    f129,
    `cekInfo(750,"Can\\'t build, Shrimp Pond must be near the water");`,
    `cekInfo(750,"Không thể xây: Ao tôm bắt buộc phải ở gần nguồn nước!");`,
    'Frame 129: Xây ao tôm gần nước'
);

f129 = replaceOrFail(
    f129,
    `cekInfo(750,"Can\\'t build, Coal Mine must be near the forest");`,
    `cekInfo(750,"Không thể xây: Mỏ than bắt buộc phải ở gần rừng cây!");`,
    'Frame 129: Xây mỏ than gần rừng'
);

f129 = replaceOrFail(
    f129,
    `cekInfo(750,"Can\\'t build, Fish Pond must be near the water");`,
    `cekInfo(750,"Không thể xây: Hồ cá bắt buộc phải ở gần nguồn nước!");`,
    'Frame 129: Xây hồ cá gần nước'
);

f129 = replaceOrFail(
    f129,
    `cekInfo(750,"Can\\'t build, Carpenter House must be near the forest");`,
    `cekInfo(750,"Không thể xây: Xưởng gỗ bắt buộc phải ở gần rừng cây!");`,
    'Frame 129: Xây xưởng gỗ gần rừng'
);

f129 = replaceOrFail(
    f129,
    `cekInfo(750,"Can\\'t build, Iron Mine must be near the mount");`,
    `cekInfo(750,"Không thể xây: Mỏ sắt bắt buộc phải ở gần vách núi!");`,
    'Frame 129: Xây mỏ sắt gần núi'
);

f129 = replaceOrFail(
    f129,
    `cekInfo(750,"Can\\'t build, Gold Mine must be near the mount");`,
    `cekInfo(750,"Không thể xây: Mỏ vàng bắt buộc phải ở gần vách núi!");`,
    'Frame 129: Xây mỏ vàng gần núi'
);

f129 = replaceOrFail(
    f129,
    `cekInfo(750,"Can\\'t build, Steel Mine must be near the mount");`,
    `cekInfo(750,"Không thể xây: Mỏ thép bắt buộc phải ở gần vách núi!");`,
    'Frame 129: Xây mỏ thép gần núi'
);

// Thiếu tài nguyên khi xây / nâng cấp
f129 = replaceOrFail(
    f129,
    `cekInfo2(750,"Can\\'t upgrade, not enough: " + tambahanKata);`,
    `cekInfo2(750,"Không thể nâng cấp, còn thiếu: " + thêmTàiNguyên);`,
    'Frame 129: Không thể nâng cấp thiếu'
);

f129 = replaceOrFail(
    f129,
    `cekInfo(750,"Can\\'t build, not enough: " + tambahanKata);`,
    `cekInfo(750,"Không thể xây dựng, còn thiếu: " + thêmTàiNguyên);`,
    'Frame 129: Không thể xây dựng thiếu'
);

// Tên tài nguyên thiếu:
f129 = f129.split(`tambahan1 = "Money ";`).join(`tambahan1 = "Tiền vàng ";`);
f129 = f129.split(`tambahan2 = "Food ";`).join(`tambahan2 = "Lương thực ";`);
f129 = f129.split(`tambahan3 = "Iron ";`).join(`tambahan3 = "Sắt ";`);
f129 = f129.split(`tambahan4 = "Log ";`).join(`tambahan4 = "Gỗ ";`);
f129 = f129.split(`tambahan5 = "Worker ";`).join(`tambahan5 = "Dân lao động ";`);
console.log('[OK] Đã cập nhật nhãn tài nguyên thiếu trong tambahan1..5');

fs.writeFileSync(f129Path, f129, 'utf8');

// =========================================================================
// 6. FRAME 130 & FRAME 131: GIAO DIỆN CHIẾN TRƯỜNG & KẾT THÚC TRẬN ĐÁNH
// =========================================================================
function updateBattleFrame(frameNum, filePath) {
    let code = fs.readFileSync(filePath, 'utf8');
    
    // 6.1 Hướng dẫn dàn trận
    code = replaceOrFail(
        code,
        `bawah.atas = "Place a battalion (press, hold and drag buttons below to green box) after finished, click start.";`,
        `bawah.atas = "Bố trí quân đoàn (nhấn, giữ và kéo các biểu tượng xuống ô xanh). Sau khi xong, nhấn BẮT ĐẦU.";`,
        `Frame ${frameNum}: Hướng dẫn dàn trận`
    );
    
    // 6.2 Nút đầu hàng
    code = replaceOrFail(
        code,
        `bawah.atas = "Click surender if you want to surender.";`,
        `bawah.atas = "Nhấn nút ĐẦU HÀNG nếu bạn muốn rút lui dâng thành.";`,
        `Frame ${frameNum}: Hướng dẫn nút đầu hàng`
    );
    
    // 6.3 Nhãn Ngày
    code = replaceOrFail(
        code,
        `xxday = "DAY " + day;`,
        `xxday = "NGÀY " + day;`,
        `Frame ${frameNum}: Nhãn NGÀY`
    );
    
    // 6.4 Nhãn độ khó chiến trường
    code = replaceOrFail(code, `xxlevel = "EASY";`, `xxlevel = "DỄ";`, `Frame ${frameNum}: Độ khó DỄ`);
    code = replaceOrFail(code, `xxlevel = "NORMAL";`, `xxlevel = "TRUNG BÌNH";`, `Frame ${frameNum}: Độ khó TRUNG BÌNH`);
    code = replaceOrFail(code, `xxlevel = "HARD";`, `xxlevel = "KHÓ";`, `Frame ${frameNum}: Độ khó KHÓ`);
    code = replaceOrFail(code, `xxlevel = "IMPOSSIBLE";`, `xxlevel = "CỰC KHÓ";`, `Frame ${frameNum}: Độ khó CỰC KHÓ`);
    
    fs.writeFileSync(filePath, code, 'utf8');
}

updateBattleFrame(130, path.join(baseDir, 'frame_130', 'DoAction.as'));
updateBattleFrame(131, path.join(baseDir, 'frame_131', 'DoAction.as'));

console.log('=== HOÀN TẤT CẬP NHẬT MÃ NGUỒN TIẾNG VIỆT VÀ KHÓA MÀN HÌNH! ===');
