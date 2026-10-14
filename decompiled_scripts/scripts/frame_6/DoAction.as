function initAwalan()
{
   petamaKali = false;
   delayHari = 9000;
   qualityGame = 1;
   posSatu = 0;
   posDua = 0;
   jenisKerajaan = 1;
   jenisMusuh = 2;
   tingkatSulit = 1;
   xpilihKota = 1;
   xpilihMap = 1;
}
function backMusic()
{
   myMusic.stop();
   myMusic = new Sound(music);
   myMusic.attachSound("backMusic");
   myMusic.setVolume(volum1);
   myMusic.start(0,1);
   myMusic.onSoundComplete = function()
   {
      backMusic();
   };
}
function backPerang()
{
   myMusic.stop();
   myMusic = new Sound(music);
   myMusic.attachSound("backPerang");
   myMusic.setVolume(volum1);
   myMusic.start(0,1);
   myMusic.onSoundComplete = function()
   {
      backPerang();
   };
}
function backDarah()
{
   rand = random(2);
   if(rand == 0)
   {
      mySound = new Sound(sound);
      mySound.attachSound("backDarah");
      mySound.start(0,1);
      mySound.setVolume(volum2);
   }
}
function backPedang()
{
   rand = random(4);
   if(rand == 0)
   {
      mySound = new Sound(sound);
      mySound.attachSound("backPedang");
      mySound.start(0,1);
      mySound.setVolume(volum2);
   }
}
function backPanah()
{
   rand = random(3);
   if(rand == 0)
   {
      mySound = new Sound(sound);
      mySound.attachSound("backPanah");
      mySound.start(0,1);
      mySound.setVolume(volum2);
   }
}
function backBatu()
{
   rand = random(3);
   if(rand == 0)
   {
      mySound = new Sound(sound);
      mySound.attachSound("backPanah");
      mySound.start(0,1);
      mySound.setVolume(volum2);
   }
}
function backTombak()
{
   rand = random(3);
   if(rand == 0)
   {
      mySound = new Sound(sound);
      mySound.attachSound("backTombak");
      mySound.start(0,1);
      mySound.setVolume(volum2);
   }
}
function backMati()
{
   mySound = new Sound(sound);
   mrand = random(4) + 1;
   mySound.attachSound("backMati" + mrand);
   mySound.start(0,1);
   mySound.setVolume(volum2);
}
function backKuda()
{
   mySound = new Sound(sound);
   mySound.attachSound("backKuda");
   mySound.start(0,1);
   mySound.setVolume(volum2);
}
function backBangun()
{
   mySound = new Sound(sound);
   mySound.attachSound("backBangun");
   mySound.start(0,1);
   mySound.setVolume(volum2);
}
function backMenang()
{
   mySound = new Sound(sound);
   mySound.attachSound("backMenang");
   mySound.start(0,1);
   mySound.setVolume(volum2);
}
function backKalah()
{
   mySound = new Sound(sound);
   mySound.attachSound("backKalah");
   mySound.start(0,1);
   mySound.setVolume(volum2);
}
function backSalah()
{
   mySound = new Sound(sound);
   mySound.attachSound("backSalah");
   mySound.start(0,1);
   mySound.setVolume(volum2);
}
function backApi()
{
   mySound = new Sound(sound);
   mySound.attachSound("backApi");
   mySound.start(0,1);
   mySound.setVolume(volum2);
}
function klik()
{
   mySound = new Sound(sound);
   mySound.attachSound("klik");
   mySound.start(0,1);
   mySound.setVolume(volum2);
}
function over()
{
   mySound = new Sound(sound);
   mySound.attachSound("over");
   mySound.start(0,1);
   mySound.setVolume(volum2);
}
function simpanBangun()
{
   bykKota = 12;
   bykArea = 12;
   xbykArea2 = 12;
   bykProperti = 12;
   bykBangunan = 25;
   namaKota = new Array("","Arigal","Bibaluz","Carex","Deresium","Eradite","Fargaz","Gigelium","Haze","Istanada","Jerax","Konselium","Liures");
   namaEmpire = new Array("","Đế chế Zargas","Đế chế Artavera");
   if(tingkatSulit == 1)
   {
      lawanNyerang = random(75) + 100;
      lawanNyerang2 = random(50) + 75;
   }
   else if(tingkatSulit == 2)
   {
      lawanNyerang = random(50) + 75;
      lawanNyerang2 = random(25) + 50;
   }
   else if(tingkatSulit == 3)
   {
      lawanNyerang = random(25) + 50;
      lawanNyerang2 = random(15) + 35;
   }
   else if(tingkatSulit == 4)
   {
      lawanNyerang = random(15) + 35;
      lawanNyerang2 = random(10) + 25;
   }
   if(lawanNyerang == lawanNyerang2)
   {
      lawanNyerang += random(10) + 10;
   }
   kotaDiserang = xpilihKota;
   jenisBangunan = new Array();
   bisaSungai = new Array();
   bisaHutan = new Array();
   bisaGunung = new Array();
   linkWilayah = new Array();
   i = 1;
   while(i <= 12)
   {
      linkWilayah[i] = new Array();
      if(i == 1)
      {
         linkWilayah[i][1] = 2;
         linkWilayah[i][2] = 3;
      }
      else if(i == 2)
      {
         linkWilayah[i][1] = 1;
         linkWilayah[i][2] = 3;
         linkWilayah[i][3] = 6;
         linkWilayah[i][4] = 7;
      }
      else if(i == 3)
      {
         linkWilayah[i][1] = 1;
         linkWilayah[i][2] = 2;
         linkWilayah[i][3] = 4;
         linkWilayah[i][4] = 8;
      }
      else if(i == 4)
      {
         linkWilayah[i][1] = 3;
         linkWilayah[i][2] = 5;
         linkWilayah[i][3] = 8;
      }
      else if(i == 5)
      {
         linkWilayah[i][1] = 4;
         linkWilayah[i][2] = 8;
         linkWilayah[i][3] = 9;
         linkWilayah[i][4] = 12;
      }
      else if(i == 6)
      {
         linkWilayah[i][1] = 2;
         linkWilayah[i][2] = 7;
      }
      else if(i == 7)
      {
         linkWilayah[i][1] = 2;
         linkWilayah[i][2] = 6;
         linkWilayah[i][3] = 8;
         linkWilayah[i][4] = 10;
      }
      else if(i == 8)
      {
         linkWilayah[i][1] = 3;
         linkWilayah[i][2] = 4;
         linkWilayah[i][3] = 5;
         linkWilayah[i][4] = 7;
         linkWilayah[i][5] = 9;
         linkWilayah[i][6] = 10;
      }
      else if(i == 9)
      {
         linkWilayah[i][1] = 5;
         linkWilayah[i][2] = 8;
         linkWilayah[i][3] = 10;
         linkWilayah[i][4] = 11;
         linkWilayah[i][5] = 12;
      }
      else if(i == 10)
      {
         linkWilayah[i][1] = 7;
         linkWilayah[i][2] = 8;
         linkWilayah[i][3] = 9;
         linkWilayah[i][4] = 11;
      }
      else if(i == 11)
      {
         linkWilayah[i][1] = 9;
         linkWilayah[i][2] = 10;
         linkWilayah[i][3] = 12;
      }
      else if(i == 12)
      {
         linkWilayah[i][1] = 5;
         linkWilayah[i][2] = 9;
         linkWilayah[i][3] = 11;
      }
      i++;
   }
   i = 1;
   while(i <= bykKota)
   {
      bisaSungai[i] = new Array();
      bisaHutan[i] = new Array();
      bisaGunung[i] = new Array();
      j = 1;
      while(j <= bykArea)
      {
         bisaSungai[i][j] = new Array();
         bisaHutan[i][j] = new Array();
         bisaGunung[i][j] = new Array();
         k = 1;
         while(k <= bykProperti)
         {
            bisaSungai[i[j][k]] = 0;
            bisaHutan[i][j][k] = 0;
            bisaGunung[i][j][k] = 0;
            k++;
         }
         j++;
      }
      i++;
   }
}
function initBangun()
{
   judulButton = new Array("Khu đất trống","Nhà dân","Ruộng lúa","Chợ","Xưởng gỗ","Mỏ sắt","Lò rèn kiếm","Lò rèn cung","Doanh trại lính","Hồ cá","Mỏ vàng","Lò rèn giáo","Hồ ngọc trai","Chuồng ngựa","Trại bò","Ao tôm","Chuồng voi","Mỏ than","Nhà máy lọc dầu","Xưởng máy bắn đá","Nhà phù thủy","Mỏ thép","Lò cung lửa","Tiệm đá quý","Trại lính siêu cấp");
   judulButton2 = new Array("","Vàng","Lương thực","Sắt","Gỗ","Kiếm","Cung tên","Binh lính","Dân tự do","Ngọc trai","Than đá","Dầu","Ngựa chiến","Ngọn giáo","Máy bắn đá","Phù thủy","Voi chiến","Cung lửa","Thép","Siêu chiến binh","Bình phép Băng","Bình phép Lửa","Bình phép Độc","Bình phép Cuồng phong","Bình phép Động đất");
   isiButton = xisiButton;//new Array("A place to put down a building, you can put a building here. Please note; there are some buildings that only can be put down in certain areas.","Residence house, one house can be occupied by 50 workers. Every house requires 25 food units per day.","Farm area. Produce agriculture pickings, like grist, maize and potato, can produce 200 food units per day. (Only place near the water)","Traditional Market, a place where\'s residents go to shopping. One market requires 50 food units for sale and produces $100 of income tax per day.","Deforestation Place. Produces logs. One carpenter house requires 20 food units and $10 of wages per day and can produce 10 logs per day. (Only place near the forest)","Iron Mine Area. Produces iron. One iron mine requires 25 food units and $20 in wages per day and can produce 5 iron units per day. (Only place near a mountain)","Produce swords that are used by soldiers. One blacksmith requires 10 food units, 2 logs, 5 irons and $15 in wages per day and can produce 1 sword per day.","Produce arrows that are used by soldiers. One blacksmith requires 10 food units, 4 logs, 2 iron units and $15 in wages per day and can produce 1 arrow set per day.","A place to train the soldiers. One barracks requires 10 food units and $30 in wages and can train 2 workers to be 2 soldiers per day. One soldier requires $2 in wages per day.","A place for a fish net in the ocean. Produces Food, can produce 250 food units per day. (Only place near the water)","Gold Mine Area. Produces gold. One gold mine requires 10 food units and $15 in wages per day and can produce 200 gold units per day. (Only place near a mountain)","Produces spears that are used by soldiers. One blacksmith requires 10 food units, 10 iron units and $15 in wages per day and can produce 1 spear per day.","A place to find pearls in the ocean. Produces Pearls, can produce 4 pearls per day. (Only place near the water)","Horse stable. Produces Horses, One horse stable requires 30 food units and $20 in wages per day and can produce 2 workers to be 2 horse knight per day. One horse knight requires $3 in wages per day.","Cow Farm. A place to process meat, Produces Food, can produce 300 food units per day.","A place for a shrimp net in the ocean. Produces Food, can produce 300 food units per day. (Only place near the water)","Elephant stable. Produces Elephants, One elephant stable requires 40 food units and $30 in wages per day and can train 1 worker to be 1 elephant soldier per day. One elephant soldier requires $4 in wages per day.","Coal Mine Area. Produces coal. One coal mine requires 15 food units and $20 in wages per day and can produce 3 coal units per day. (Only place near the forest)","Oil Refinery, a place to produce oil, One oil refinery requires 25 food units and $40 in wages per day and can produce 100 oil units per day","Catapult Factory. Produces catapults, one catapult factory requires 25 food units, 10 logs, 5 iron units and $50 in wages per day and can train 1 worker to be 1 catapult soldier per day, one catapult soldier requires $7 in wages per day","Witch Houses. Produces witches, one witch houses requires 50 food units and $75 in wages per day and can train 2 witches per day, one witch requires $5 in wages per day","Steel Mine. Produces steel, one steel mine requires 30 food units and $45 in wages per day and can produce 5 steel units per day. (Only place near a mountain)","Produces fire arrows that are used by soldiers. One blacksmith requires 10 food units, 4 logs, 2 iron units, 200 oil units and $25 in wages per day and can produce 1 fire arrow set per day.","Jewel Shop, sell various jewels and other accesories, one jewel shop requires 20 pearls and can produce $2000 of income tax per day.","Super Soldier Barracks, a place to train super soldiers, one super soldier barracks requires 30 food units, 25 steel units and $60 in wages and can train 1 super soldier per day, one super soldier requires $10 in wages per day.");
   isiButton2 = xisiButton2;//new Array("A place to put down a building, you can put a building here. Please note; there are some buildings that only can be put down in certain area.","Residence house, one house can be occupied by 100 workers. Every house requires 50 foods per day","Farm area. Produce agriculture pickings, like grist, maize and potato, can produce 400 foods per day. (Only place at near the water)","Traditional Market, a place where\'s residents go to shopping. One market requires 100 foods for sell and produce $200 income tax per day.","Deforestation Place. Produce logs. One carpenter house requires 40 foods and $20 wages per day and can produce 20 logs per day. (Only place at near the forest)","Iron Mine Area. Produce iron. One iron mine requires 50 foods and $40 wages per day and can produce 10 irons per day. (Only place at near the mount)","Produce swords that are used by soldiers. One blacksmith requires 20 foods, 4 logs, 10 irons and $30 wages per day and can produce 2 sword per day.","Produce arrows that are used by soldiers. One blacksmith requires 20 foods, 8 logs, 4 irons and $30 wages per day and can produce 2 arrow set per day.","A place to train the soldiers. One barracks requires 20 foods and $60 wages and can train 4 workers to be 4 soldiers per day. One soldier requires $2 wage per day.","Place for fish net in ocean. Produce Food, can produce 300 foods per day. (Only place at near the water)","Gold Mine Area. Produce gold. One gold mine requires 20 foods and $30 wages per day and can produce 400 golds per day. (Only place at near the mount)","Produce spear that are used by soldiers. One blacksmith requires 20 foods, 20 irons and $30 wages per day and can produce 2 spear per day.","Place for find the pearl in ocean. Produce Pearl, can produce 8 pearls per day (Only place at near the water)","Horse stable. Produce Horse, One horse stable requires 60 foods and $40 wages per day and can produce 4 workers to be 4 horses knight per day. One horses knight requires $3 wage per day.","Cow Farm. Place to process meat, Produce Food, can produce 600 foods per day.","Place for shrimp net in ocean. Produce Food, can produce 600 foods per day. (Only place at near the water)","Elephant stable. Produce Elephant, One elephant stable requires 80 foods and $60 wages per day and can train 2 workers to be 2 elephant soldier per day. One elephant soldiers requires $4 per day","Coal Mine Area. Produce coal. One coal mine requires 30 foods and $40 wages per day and can produce 6 coals per day. (Only place at near the forest)","Oil Refinery, place to produce oil, One oil refinery requires 50 foods and $80 wages per day and can produce 200 oils per day","Catapult Factory. Produce catapult, one catapult factory requires 50 foods, 20 logs, 10 irons and $100 wages per day and can train 2 workers to be 2 catapult army per 4 day, one catapult army requires $7 per day","Witch Houses. Produce witch, one witch houses requires 100 foods and $150 wages per day and can train 4 witch per 4 day, one witch requires $5 per day","Steel Mine. Produce steel, one steel mine requires 60 foods and 90 wages per day and can produce 10 steel per day (Only place at near the mount)","Produce fire arrows that are used by soldiers. One blacksmith requires 20 foods, 8 logs, 4 irons, 400 oils and $50 wages per day and can produce 2 fire arrow set per day.","Jewel Shop, sell various of jewel and other accesories, one jewel shop requires 40 pearls and can produce $4000 income tax per day.","Super Soldier Barracks, place to train super soldiers, one super soldier barracks requires 60 foods, 50 steel and $120 wages and can train 2 super soldier per 5 day, one super soldier requires $10 per day");
   xisiButton = new Array("Khu đất trống để xây dựng công trình. Lưu ý: một số công trình chỉ có thể xây dựng ở địa hình chỉ định.","Nhà dân: Cung cấp chỗ ở cho 50 dân lao động. Tiêu hao 25 lương thực mỗi ngày.","Ruộng lúa: Sản xuất nông sản hoa màu, cung cấp 200 lương thực mỗi ngày. (Chỉ xây gần nguồn nước)","Chợ truyền thống: Nơi giao thương buôn bán. Tiêu thụ 50 lương thực và đem lại 100 vàng tiền thuế mỗi ngày.","Xưởng khai thác gỗ: Khai thác gỗ rừng. Cần 20 lương thực và 10 vàng tiền công, tạo ra 10 gỗ mỗi ngày. (Chỉ xây gần rừng)","Mỏ sắt: Khai thác quặng sắt. Cần 25 lương thực và 20 vàng tiền công, tạo ra 5 sắt mỗi ngày. (Chỉ xây gần núi)","Lò rèn kiếm: Rèn vũ khí cho binh lính. Cần 10 lương thực, 2 gỗ, 5 sắt và 15 vàng tiền công, rèn 1 thanh kiếm mỗi ngày.","Lò rèn cung: Rèn cung tên cho binh lính. Cần 10 lương thực, 4 gỗ, 2 sắt và 15 vàng tiền công, rèn 1 bộ cung tên mỗi ngày.","Doanh trại quân đội: Huấn luyện binh lính. Cần 10 lương thực và 30 vàng tiền công, huấn luyện 2 dân thành 2 binh lính mỗi ngày.","Hồ đánh bắt cá: Đánh bắt thủy sản. Cung cấp 250 lương thực mỗi ngày. (Chỉ xây gần nguồn nước)","Mỏ vàng: Khai thác quặng vàng. Cần 10 lương thực và 15 vàng tiền công, đem lại 200 vàng mỗi ngày. (Chỉ xây gần núi)","Lò rèn giáo: Rèn giáo dài đánh giáp lá cà. Cần 10 lương thực, 10 sắt và 15 vàng tiền công, rèn 1 ngọn giáo mỗi ngày.","Hồ ngọc trai: Thu thập ngọc quý từ biển hồ. Thu về 4 ngọc trai mỗi ngày. (Chỉ xây gần nguồn nước)","Chuồng ngựa: Huấn luyện kỵ binh. Cần 30 lương thực và 20 vàng tiền công, huấn luyện 2 kỵ sĩ mỗi ngày.","Trại nuôi bò: Nuôi và lấy thịt bò. Cung cấp 300 lương thực mỗi ngày. (Không phụ thuộc nguồn nước)","Ao tôm: Nuôi tôm biển hồ. Cung cấp 300 lương thực mỗi ngày. (Chỉ xây gần nguồn nước)","Chuồng voi: Huấn luyện chiến tượng. Cần 40 lương thực và 30 vàng tiền công, huấn luyện 1 lính voi chiến mỗi ngày.","Mỏ than: Khai thác than đá. Cần 15 lương thực và 20 vàng tiền công, khai thác 3 than đá mỗi ngày. (Chỉ xây gần rừng)","Nhà máy lọc dầu: Tinh chế dầu hỏa. Cần 25 lương thực và 40 vàng tiền công, tinh chế 100 dầu mỗi ngày.","Xưởng máy bắn đá: Chế tạo máy công thành. Cần 25 lương thực, 10 gỗ, 5 sắt và 50 vàng tiền công, chế tạo 1 máy bắn đá mỗi ngày.","Nhà phù thủy: Đào tạo phù thủy yểm thuật. Cần 50 lương thực và 75 vàng tiền công, đào tạo 2 phù thủy mỗi ngày.","Mỏ thép: Luyện kim chế tạo thép cứng. Cần 30 lương thực và 45 vàng tiền công, tạo ra 5 thép mỗi ngày. (Chỉ xây gần núi)","Lò rèn cung lửa: Chế tạo mũi tên lửa. Cần 10 lương thực, 4 gỗ, 2 sắt, 200 dầu và 25 vàng tiền công, rèn 1 bộ cung lửa mỗi ngày.","Tiệm đá quý: Bán các loại ngọc và trang sức. Cần 20 ngọc trai, đem lại 2.000 vàng tiền thuế mỗi ngày.","Trại lính siêu cấp: Đào tạo siêu chiến binh bất bại. Cần 30 lương thực, 25 thép và 60 vàng tiền công, đào tạo 1 siêu chiến binh mỗi ngày.");
   xisiButton2 = new Array("Khu đất trống để xây dựng công trình. Lưu ý: một số công trình chỉ có thể xây dựng ở địa hình chỉ định.","Nhà dân (Cấp 2): Chứa được 100 dân lao động. Tiêu hao 50 lương thực mỗi ngày.","Ruộng lúa (Cấp 2): Sản lượng nông sản cao cấp, cung cấp 400 lương thực mỗi ngày. (Chỉ xây gần nguồn nước)","Chợ truyền thống (Cấp 2): Trung tâm buôn bán lớn. Tiêu thụ 100 lương thực và đem lại 200 vàng tiền thuế mỗi ngày.","Xưởng gỗ (Cấp 2): Quy mô khai thác gấp đôi. Cần 40 lương thực và 20 vàng tiền công, tạo ra 20 gỗ mỗi ngày. (Chỉ xây gần rừng)","Mỏ sắt (Cấp 2): Quy mô khai thác sâu. Cần 50 lương thực và 40 vàng tiền công, tạo ra 10 sắt mỗi ngày. (Chỉ xây gần núi)","Lò rèn kiếm (Cấp 2): Nâng cao công suất. Cần 20 lương thực, 4 gỗ, 10 sắt và 30 vàng tiền công, rèn 2 thanh kiếm mỗi ngày.","Lò rèn cung (Cấp 2): Rèn cung tên nhanh. Cần 20 lương thực, 8 gỗ, 4 sắt và 30 vàng tiền công, rèn 2 bộ cung tên mỗi ngày.","Doanh trại (Cấp 2): Doanh trại mở rộng. Cần 20 lương thực và 60 vàng tiền công, huấn luyện 4 lính mỗi ngày.","Hồ cá (Cấp 2): Lưới đánh cá đại dương. Cung cấp 300 lương thực mỗi ngày. (Chỉ xây gần nguồn nước)","Mỏ vàng (Cấp 2): Đào sâu lòng quặng. Cần 20 lương thực và 30 vàng tiền công, đem lại 400 vàng mỗi ngày. (Chỉ xây gần núi)","Lò rèn giáo (Cấp 2): Rèn giáo quy mô lớn. Cần 20 lương thực, 20 sắt và 30 vàng tiền công, rèn 2 ngọn giáo mỗi ngày.","Hồ ngọc trai (Cấp 2): Khai thác ngọc trai sâu. Thu về 8 ngọc trai mỗi ngày. (Chỉ xây gần nguồn nước)","Chuồng ngựa (Cấp 2): Trại kỵ binh tinh nhuệ. Cần 60 lương thực và 40 vàng tiền công, huấn luyện 4 kỵ sĩ mỗi ngày.","Trại bò (Cấp 2): Trại gia súc lớn. Cung cấp 600 lương thực mỗi ngày. (Không phụ thuộc nguồn nước)","Ao tôm (Cấp 2): Ao tôm quy mô lớn. Cung cấp 600 lương thực mỗi ngày. (Chỉ xây gần nguồn nước)","Chuồng voi (Cấp 2): Trại voi chiến bọc giáp. Cần 80 lương thực và 60 vàng tiền công, huấn luyện 2 lính voi chiến mỗi ngày.","Mỏ than (Cấp 2): Khai thác than hầm lò. Cần 30 lương thực và 40 vàng tiền công, khai thác 6 than đá mỗi ngày. (Chỉ xây gần rừng)","Nhà máy lọc dầu (Cấp 2): Nhà máy công nghiệp. Cần 50 lương thực và 80 vàng tiền công, tinh chế 200 dầu mỗi ngày.","Xưởng máy bắn đá (Cấp 2): Xưởng công thành lớn. Cần 50 lương thực, 20 gỗ, 10 sắt và 100 vàng tiền công, chế tạo 2 máy bắn đá mỗi 4 ngày.","Nhà phù thủy (Cấp 2): Viện ma pháp tối cao. Cần 100 lương thực và 150 vàng tiền công, đào tạo 4 phù thủy mỗi 4 ngày.","Mỏ thép (Cấp 2): Lò luyện thép cao tần. Cần 60 lương thực và 90 vàng tiền công, tạo ra 10 thép mỗi ngày. (Chỉ xây gần núi)","Lò cung lửa (Cấp 2): Rèn cung lửa hàng loạt. Cần 20 lương thực, 8 gỗ, 4 sắt, 400 dầu và 50 vàng tiền công, rèn 2 bộ cung lửa mỗi ngày.","Tiệm đá quý (Cấp 2): Trung tâm kim hoàn cao cấp. Cần 40 ngọc trai, đem lại 4.000 vàng tiền thuế mỗi ngày.","Trại lính siêu cấp (Cấp 2): Căn cứ siêu binh sĩ hoàng gia. Cần 60 lương thực, 50 thép và 120 vàng tiền công, đào tạo 2 siêu chiến binh mỗi 5 ngày.");
   kebutuhanMoney = new Array("",300,200,350,300,400,500,450,400,350,600,500,750,450,350,400,600,500,800,850,500,800,450,900,1000);
   kebutuhanFood = new Array("",25,20,30,20,25,15,15,35,25,25,15,25,20,25,20,40,20,15,30,50,25,15,15,25);
   kebutuhanIron = new Array("",5,0,0,10,25,15,10,20,10,15,20,5,10,5,10,25,15,20,30,0,25,10,30,50);
   kebutuhanWood = new Array("",25,15,30,25,20,10,15,35,20,15,0,5,25,15,10,35,20,15,40,15,15,15,30,10);
   kebutuhanWorker = new Array("",-50,10,20,5,10,5,5,10,10,10,5,10,10,10,10,15,10,15,25,5,10,5,5,30);
}
function ygDiSave()
{
   namaData = "Trống";
   day = 1;
   sudahTutor = false;
   moneyKota = new Array();
   foodKota = new Array();
   ironKota = new Array();
   woodKota = new Array();
   swordKota = new Array();
   xarrowKota = new Array();
   soldierKota = new Array();
   workerKota = new Array();
   spearKota = new Array();
   diamondKota = new Array();
   coalKota = new Array();
   oilKota = new Array();
   horseKota = new Array();
   catapultKota = new Array();
   witchKota = new Array();
   elephantKota = new Array();
   fireKota = new Array();
   steelKota = new Array();
   xsuperKota = new Array();
   iceballKota = new Array();
   fireballKota = new Array();
   poisonKota = new Array();
   hurricaneKota = new Array();
   earthquakeKota = new Array();
   upgradeProperti = new Array();
   punyaWilayah = new Array();
   spellBuat = new Array();
   waktuBuat = new Array();
   i = 1;
   while(i <= 12)
   {
      if(i == 1)
      {
         punyaWilayah[i] = 1;
         posSatu = 1;
      }
      else if(i == 9)
      {
         punyaWilayah[i] = 2;
         posDua = 9;
      }
      else
      {
         punyaWilayah[i] = 0;
      }
      i++;
   }
   i = 1;
   while(i <= bykKota)
   {
      jenisBangunan[i] = new Array();
      upgradeProperti[i] = new Array();
      spellBuat[i] = new Array();
      waktuBuat[i] = new Array();
      if(i == 1)
      {
         moneyKota[i] = 175 * _root.jenisBonus1;
         foodKota[i] = 50 * _root.jenisBonus2;
         ironKota[i] = 25 * _root.jenisBonus3;
         woodKota[i] = 20 * _root.jenisBonus4;
         swordKota[i] = 0;
         xarrowKota[i] = 0;
         soldierKota[i] = 0;
         workerKota[i] = 0;
         diamondKota[i] = 0;
         coalKota[i] = 0;
         oilKota[i] = 0;
         spearKota[i] = 0;
         horseKota[i] = 0;
         catapultKota[i] = 0;
         witchKota[i] = 0;
         elephantKota[i] = 0;
         fireKota[i] = 0;
         steelKota[i] = 0;
         xsuperKota[i] = 0;
         iceballKota[i] = 0;
         fireballKota[i] = 0;
         poisonKota[i] = 0;
         hurricaneKota[i] = 0;
         earthquakeKota[i] = 0;
      }
      else if(i == 9)
      {
         moneyKota[i] = 150 * _root.jenisBonus1;
         foodKota[i] = 40 * _root.jenisBonus2;
         ironKota[i] = 10 * _root.jenisBonus3;
         woodKota[i] = 15 * _root.jenisBonus4;
         swordKota[i] = 0;
         xarrowKota[i] = 0;
         soldierKota[i] = 0;
         workerKota[i] = 0;
         diamondKota[i] = 0;
         coalKota[i] = 0;
         oilKota[i] = 0;
         spearKota[i] = 0;
         horseKota[i] = 0;
         catapultKota[i] = 0;
         witchKota[i] = 0;
         elephantKota[i] = 0;
         fireKota[i] = 0;
         steelKota[i] = 0;
         xsuperKota[i] = 0;
         iceballKota[i] = 0;
         fireballKota[i] = 0;
         poisonKota[i] = 0;
         hurricaneKota[i] = 0;
         earthquakeKota[i] = 0;
      }
      else
      {
         moneyKota[i] = 0;
         foodKota[i] = 0;
         ironKota[i] = 0;
         woodKota[i] = 0;
         swordKota[i] = 0;
         xarrowKota[i] = 0;
         soldierKota[i] = 0;
         workerKota[i] = 0;
         diamondKota[i] = 0;
         coalKota[i] = 0;
         oilKota[i] = 0;
         spearKota[i] = 0;
         horseKota[i] = 0;
         catapultKota[i] = 0;
         witchKota[i] = 0;
         elephantKota[i] = 0;
         fireKota[i] = 0;
         steelKota[i] = 0;
         xsuperKota[i] = 0;
         iceballKota[i] = 0;
         fireballKota[i] = 0;
         poisonKota[i] = 0;
         hurricaneKota[i] = 0;
         earthquakeKota[i] = 0;
      }
      j = 1;
      while(j <= bykArea)
      {
         jenisBangunan[i][j] = new Array();
         upgradeProperti[i][j] = new Array();
         spellBuat[i][j] = new Array();
         waktuBuat[i][j] = new Array();
         k = 1;
         while(k <= bykProperti)
         {
            jenisBangunan[i][j][k] = 1;
            upgradeProperti[i][j][k] = 1;
            spellBuat[i][j][k] = 1;
            waktuBuat[i][j][k] = 0;
            k++;
         }
         j++;
      }
      i++;
   }
}
function simpanJeda(dataKe)
{
   if(keJeda == 1)
   {
      i = 0;
      while(i <= simpanSemua.length - 1)
      {
         _root["idatSimp" + i] = simpanSemua[i] + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp" + i]);
         Cookies.data["isoData" + i] = eval(simpanSemua[i]);
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 2)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp1" + i] = String("punyaWilayah" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp1" + i]);
         Cookies.data["isoData1" + i] = punyaWilayah[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 3)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp2" + i] = String("moneyKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp2" + i]);
         Cookies.data["isoData2" + i] = moneyKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 4)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp3" + i] = String("foodKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp3" + i]);
         Cookies.data["isoData3" + i] = foodKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 5)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp4" + i] = String("foodKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp4" + i]);
         Cookies.data["isoData4" + i] = ironKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 6)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp5" + i] = String("woodKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp5" + i]);
         Cookies.data["isoData5" + i] = woodKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 7)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp6" + i] = String("swordKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp6" + i]);
         Cookies.data["isoData6" + i] = swordKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 8)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp7" + i] = String("xarrowKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp7" + i]);
         Cookies.data["isoData7" + i] = xarrowKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 9)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp8" + i] = String("soldierKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp8" + i]);
         Cookies.data["isoData8" + i] = soldierKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 10)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp9" + i] = String("workerKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp9" + i]);
         Cookies.data["isoData9" + i] = workerKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 11)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp10" + i] = String("diamondKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp10" + i]);
         Cookies.data["isoData10" + i] = diamondKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 12)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp11" + i] = String("coalKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp11" + i]);
         Cookies.data["isoData11" + i] = coalKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 13)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp12" + i] = String("oilKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp12" + i]);
         Cookies.data["isoData12" + i] = oilKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 14)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp13" + i] = String("spearKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp13" + i]);
         Cookies.data["isoData13" + i] = spearKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 15)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp14" + i] = String("horseKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp14" + i]);
         Cookies.data["isoData14" + i] = horseKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 16)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp15" + i] = String("catapultKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp15" + i]);
         Cookies.data["isoData15" + i] = catapultKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 17)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp16" + i] = String("witchKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp16" + i]);
         Cookies.data["isoData16" + i] = witchKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 18)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp17" + i] = String("elephantKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp17" + i]);
         Cookies.data["isoData17" + i] = elephantKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 19)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp18" + i] = String("fireKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp18" + i]);
         Cookies.data["isoData18" + i] = fireKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 20)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp19" + i] = String("steelKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp19" + i]);
         Cookies.data["isoData19" + i] = steelKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 21)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp20" + i] = String("xsuperKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp20" + i]);
         Cookies.data["isoData20" + i] = xsuperKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 22)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp21" + i] = String("iceballKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp21" + i]);
         Cookies.data["isoData21" + i] = iceballKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 23)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp22" + i] = String("fireballKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp22" + i]);
         Cookies.data["isoData22" + i] = fireballKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 24)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp23" + i] = String("poisonKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp23" + i]);
         Cookies.data["isoData23" + i] = poisonKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 25)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp24" + i] = String("hurricaneKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp24" + i]);
         Cookies.data["isoData24" + i] = hurricaneKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 26)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp25" + i] = String("earthquakeKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp25" + i]);
         Cookies.data["isoData25" + i] = earthquakeKota[i];
         Cookies.flush();
         i++;
      }
   }
   else if(keJeda == 27)
   {
      i = 1;
      j = 1;
      while(j <= xbykArea2)
      {
         k = 1;
         while(k <= bykProperti)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            Cookies.data["isoData30" + i + j + k] = jenisBangunan[i][j][k];
            Cookies.flush();
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            Cookies.data["isoData31" + i + j + k] = upgradeProperti[i][j][k];
            Cookies.flush();
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            Cookies.data["isoData32" + i + j + k] = spellBuat[i][j][k];
            Cookies.flush();
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 28)
   {
      i = 2;
      j = 1;
      while(j <= xbykArea2)
      {
         k = 1;
         while(k <= bykProperti)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            Cookies.data["isoData30" + i + j + k] = jenisBangunan[i][j][k];
            Cookies.flush();
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            Cookies.data["isoData31" + i + j + k] = upgradeProperti[i][j][k];
            Cookies.flush();
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            Cookies.data["isoData32" + i + j + k] = spellBuat[i][j][k];
            Cookies.flush();
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 29)
   {
      i = 3;
      j = 1;
      while(j <= xbykArea2)
      {
         k = 1;
         while(k <= bykProperti)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            Cookies.data["isoData30" + i + j + k] = jenisBangunan[i][j][k];
            Cookies.flush();
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            Cookies.data["isoData31" + i + j + k] = upgradeProperti[i][j][k];
            Cookies.flush();
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            Cookies.data["isoData32" + i + j + k] = spellBuat[i][j][k];
            Cookies.flush();
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 30)
   {
      i = 4;
      j = 1;
      while(j <= xbykArea2)
      {
         k = 1;
         while(k <= bykProperti)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            Cookies.data["isoData30" + i + j + k] = jenisBangunan[i][j][k];
            Cookies.flush();
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            Cookies.data["isoData31" + i + j + k] = upgradeProperti[i][j][k];
            Cookies.flush();
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            Cookies.data["isoData32" + i + j + k] = spellBuat[i][j][k];
            Cookies.flush();
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 31)
   {
      i = 5;
      j = 1;
      while(j <= xbykArea2)
      {
         k = 1;
         while(k <= bykProperti)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            Cookies.data["isoData30" + i + j + k] = jenisBangunan[i][j][k];
            Cookies.flush();
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            Cookies.data["isoData31" + i + j + k] = upgradeProperti[i][j][k];
            Cookies.flush();
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            Cookies.data["isoData32" + i + j + k] = spellBuat[i][j][k];
            Cookies.flush();
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 32)
   {
      i = 6;
      j = 1;
      while(j <= xbykArea2)
      {
         k = 1;
         while(k <= bykProperti)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            Cookies.data["isoData30" + i + j + k] = jenisBangunan[i][j][k];
            Cookies.flush();
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            Cookies.data["isoData31" + i + j + k] = upgradeProperti[i][j][k];
            Cookies.flush();
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            Cookies.data["isoData32" + i + j + k] = spellBuat[i][j][k];
            Cookies.flush();
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 33)
   {
      i = 7;
      j = 1;
      while(j <= xbykArea2)
      {
         k = 1;
         while(k <= bykProperti)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            Cookies.data["isoData30" + i + j + k] = jenisBangunan[i][j][k];
            Cookies.flush();
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            Cookies.data["isoData31" + i + j + k] = upgradeProperti[i][j][k];
            Cookies.flush();
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            Cookies.data["isoData32" + i + j + k] = spellBuat[i][j][k];
            Cookies.flush();
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 34)
   {
      i = 8;
      j = 1;
      while(j <= xbykArea2)
      {
         k = 1;
         while(k <= bykProperti)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            Cookies.data["isoData30" + i + j + k] = jenisBangunan[i][j][k];
            Cookies.flush();
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            Cookies.data["isoData31" + i + j + k] = upgradeProperti[i][j][k];
            Cookies.flush();
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            Cookies.data["isoData32" + i + j + k] = spellBuat[i][j][k];
            Cookies.flush();
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 35)
   {
      i = 9;
      j = 1;
      while(j <= xbykArea2)
      {
         k = 1;
         while(k <= bykProperti)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            Cookies.data["isoData30" + i + j + k] = jenisBangunan[i][j][k];
            Cookies.flush();
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            Cookies.data["isoData31" + i + j + k] = upgradeProperti[i][j][k];
            Cookies.flush();
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            Cookies.data["isoData32" + i + j + k] = spellBuat[i][j][k];
            Cookies.flush();
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 36)
   {
      i = 10;
      j = 1;
      while(j <= xbykArea2)
      {
         k = 1;
         while(k <= bykProperti)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            Cookies.data["isoData30" + i + j + k] = jenisBangunan[i][j][k];
            Cookies.flush();
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            Cookies.data["isoData31" + i + j + k] = upgradeProperti[i][j][k];
            Cookies.flush();
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            Cookies.data["isoData32" + i + j + k] = spellBuat[i][j][k];
            Cookies.flush();
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 37)
   {
      i = 11;
      j = 1;
      while(j <= xbykArea2)
      {
         k = 1;
         while(k <= bykProperti)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            Cookies.data["isoData30" + i + j + k] = jenisBangunan[i][j][k];
            Cookies.flush();
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            Cookies.data["isoData31" + i + j + k] = upgradeProperti[i][j][k];
            Cookies.flush();
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            Cookies.data["isoData32" + i + j + k] = spellBuat[i][j][k];
            Cookies.flush();
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 38)
   {
      i = 12;
      j = 1;
      while(j <= xbykArea2)
      {
         k = 1;
         while(k <= bykProperti)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            Cookies.data["isoData30" + i + j + k] = jenisBangunan[i][j][k];
            Cookies.flush();
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            Cookies.data["isoData31" + i + j + k] = upgradeProperti[i][j][k];
            Cookies.flush();
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            Cookies.data["isoData32" + i + j + k] = spellBuat[i][j][k];
            Cookies.flush();
            k++;
         }
         j++;
      }
   }
   msgBox_mc.bar.gotoAndStop(keJeda);
   if(keJeda == 38)
   {
      clearInterval(idJeda);
      initData();
      xloadData(zindi);
      cekData();
   }
   else
   {
      keJeda++;
   }
}
function simpanData(dataKe)
{
   keJeda = 1;
   idJeda = setInterval(simpanJeda,100,dataKe);
}
function loadJeda(dataKe)
{
   if(keJeda == 1)
   {
      i = 0;
      while(i <= simpanSemua.length - 1)
      {
         _root["idatSimp" + i] = simpanSemua[i] + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp" + i]);
         _root[simpanSemua[i]] = Cookies.data["isoData" + i];
         i++;
      }
   }
   else if(keJeda == 2)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp1" + i] = String("punyaWilayah" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp1" + i]);
         punyaWilayah[i] = Cookies.data["isoData1" + i];
         i++;
      }
   }
   else if(keJeda == 3)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp2" + i] = String("moneyKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp2" + i]);
         moneyKota[i] = Cookies.data["isoData2" + i];
         i++;
      }
   }
   else if(keJeda == 4)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp3" + i] = String("foodKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp3" + i]);
         foodKota[i] = Cookies.data["isoData3" + i];
         i++;
      }
   }
   else if(keJeda == 5)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp4" + i] = String("foodKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp4" + i]);
         ironKota[i] = Cookies.data["isoData4" + i];
         i++;
      }
   }
   else if(keJeda == 6)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp5" + i] = String("woodKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp5" + i]);
         woodKota[i] = Cookies.data["isoData5" + i];
         i++;
      }
   }
   else if(keJeda == 7)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp6" + i] = String("swordKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp6" + i]);
         swordKota[i] = Cookies.data["isoData6" + i];
         i++;
      }
   }
   else if(keJeda == 8)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp7" + i] = String("xarrowKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp7" + i]);
         xarrowKota[i] = Cookies.data["isoData7" + i];
         i++;
      }
   }
   else if(keJeda == 9)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp8" + i] = String("soldierKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp8" + i]);
         soldierKota[i] = Cookies.data["isoData8" + i];
         i++;
      }
   }
   else if(keJeda == 10)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp9" + i] = String("workerKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp9" + i]);
         workerKota[i] = Cookies.data["isoData9" + i];
         i++;
      }
   }
   else if(keJeda == 11)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp10" + i] = String("diamondKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp10" + i]);
         diamondKota[i] = Cookies.data["isoData10" + i];
         i++;
      }
   }
   else if(keJeda == 12)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp11" + i] = String("coalKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp11" + i]);
         coalKota[i] = Cookies.data["isoData11" + i];
         i++;
      }
   }
   else if(keJeda == 13)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp12" + i] = String("oilKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp12" + i]);
         oilKota[i] = Cookies.data["isoData12" + i];
         i++;
      }
   }
   else if(keJeda == 14)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp13" + i] = String("spearKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp13" + i]);
         spearKota[i] = Cookies.data["isoData13" + i];
         i++;
      }
   }
   else if(keJeda == 15)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp14" + i] = String("horseKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp14" + i]);
         horseKota[i] = Cookies.data["isoData14" + i];
         i++;
      }
   }
   else if(keJeda == 16)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp15" + i] = String("catapultKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp15" + i]);
         catapultKota[i] = Cookies.data["isoData15" + i];
         i++;
      }
   }
   else if(keJeda == 17)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp16" + i] = String("witchKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp16" + i]);
         witchKota[i] = Cookies.data["isoData16" + i];
         i++;
      }
   }
   else if(keJeda == 18)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp17" + i] = String("elephantKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp17" + i]);
         elephantKota[i] = Cookies.data["isoData17" + i];
         i++;
      }
   }
   else if(keJeda == 19)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp18" + i] = String("fireKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp18" + i]);
         fireKota[i] = Cookies.data["isoData18" + i];
         i++;
      }
   }
   else if(keJeda == 20)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp19" + i] = String("steelKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp19" + i]);
         steelKota[i] = Cookies.data["isoData19" + i];
         i++;
      }
   }
   else if(keJeda == 21)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp20" + i] = String("xsuperKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp20" + i]);
         xsuperKota[i] = Cookies.data["isoData20" + i];
         i++;
      }
   }
   else if(keJeda == 22)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp21" + i] = String("iceballKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp21" + i]);
         iceballKota[i] = Cookies.data["isoData21" + i];
         i++;
      }
   }
   else if(keJeda == 23)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp22" + i] = String("fireballKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp22" + i]);
         fireballKota[i] = Cookies.data["isoData22" + i];
         i++;
      }
   }
   else if(keJeda == 24)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp23" + i] = String("poisonKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp23" + i]);
         poisonKota[i] = Cookies.data["isoData23" + i];
         i++;
      }
   }
   else if(keJeda == 25)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp24" + i] = String("hurricaneKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp24" + i]);
         hurricaneKota[i] = Cookies.data["isoData24" + i];
         i++;
      }
   }
   else if(keJeda == 26)
   {
      i = 1;
      while(i <= 12)
      {
         _root["idatSimp25" + i] = String("earthquakeKota" + i) + dataKe;
         Cookies = SharedObject.getLocal(_root["idatSimp25" + i]);
         earthquakeKota[i] = Cookies.data["isoData25" + i];
         i++;
      }
   }
   else if(keJeda == 27)
   {
      i = 1;
      j = 1;
      while(j <= 4)
      {
         k = 1;
         while(k <= 12)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            jenisBangunan[i][j][k] = Cookies.data["isoData30" + i + j + k];
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            upgradeProperti[i][j][k] = Cookies.data["isoData31" + i + j + k];
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            spellBuat[i][j][k] = Cookies.data["isoData32" + i + j + k];
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 28)
   {
      i = 2;
      j = 1;
      while(j <= 4)
      {
         k = 1;
         while(k <= 12)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            jenisBangunan[i][j][k] = Cookies.data["isoData30" + i + j + k];
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            upgradeProperti[i][j][k] = Cookies.data["isoData31" + i + j + k];
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            spellBuat[i][j][k] = Cookies.data["isoData32" + i + j + k];
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 29)
   {
      i = 3;
      j = 1;
      while(j <= 4)
      {
         k = 1;
         while(k <= 12)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            jenisBangunan[i][j][k] = Cookies.data["isoData30" + i + j + k];
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            upgradeProperti[i][j][k] = Cookies.data["isoData31" + i + j + k];
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            spellBuat[i][j][k] = Cookies.data["isoData32" + i + j + k];
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 30)
   {
      i = 4;
      j = 1;
      while(j <= 4)
      {
         k = 1;
         while(k <= 12)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            jenisBangunan[i][j][k] = Cookies.data["isoData30" + i + j + k];
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            upgradeProperti[i][j][k] = Cookies.data["isoData31" + i + j + k];
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            spellBuat[i][j][k] = Cookies.data["isoData32" + i + j + k];
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 31)
   {
      i = 5;
      j = 1;
      while(j <= 4)
      {
         k = 1;
         while(k <= 12)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            jenisBangunan[i][j][k] = Cookies.data["isoData30" + i + j + k];
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            upgradeProperti[i][j][k] = Cookies.data["isoData31" + i + j + k];
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            spellBuat[i][j][k] = Cookies.data["isoData32" + i + j + k];
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 32)
   {
      i = 6;
      j = 1;
      while(j <= 4)
      {
         k = 1;
         while(k <= 12)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            jenisBangunan[i][j][k] = Cookies.data["isoData30" + i + j + k];
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            upgradeProperti[i][j][k] = Cookies.data["isoData31" + i + j + k];
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            spellBuat[i][j][k] = Cookies.data["isoData32" + i + j + k];
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 33)
   {
      i = 7;
      j = 1;
      while(j <= 4)
      {
         k = 1;
         while(k <= 12)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            jenisBangunan[i][j][k] = Cookies.data["isoData30" + i + j + k];
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            upgradeProperti[i][j][k] = Cookies.data["isoData31" + i + j + k];
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            spellBuat[i][j][k] = Cookies.data["isoData32" + i + j + k];
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 34)
   {
      i = 8;
      j = 1;
      while(j <= 4)
      {
         k = 1;
         while(k <= 12)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            jenisBangunan[i][j][k] = Cookies.data["isoData30" + i + j + k];
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            upgradeProperti[i][j][k] = Cookies.data["isoData31" + i + j + k];
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            spellBuat[i][j][k] = Cookies.data["isoData32" + i + j + k];
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 35)
   {
      i = 9;
      j = 1;
      while(j <= 4)
      {
         k = 1;
         while(k <= 12)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            jenisBangunan[i][j][k] = Cookies.data["isoData30" + i + j + k];
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            upgradeProperti[i][j][k] = Cookies.data["isoData31" + i + j + k];
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            spellBuat[i][j][k] = Cookies.data["isoData32" + i + j + k];
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 36)
   {
      i = 10;
      j = 1;
      while(j <= 4)
      {
         k = 1;
         while(k <= 12)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            jenisBangunan[i][j][k] = Cookies.data["isoData30" + i + j + k];
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            upgradeProperti[i][j][k] = Cookies.data["isoData31" + i + j + k];
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            spellBuat[i][j][k] = Cookies.data["isoData32" + i + j + k];
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 37)
   {
      i = 11;
      j = 1;
      while(j <= 4)
      {
         k = 1;
         while(k <= 12)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            jenisBangunan[i][j][k] = Cookies.data["isoData30" + i + j + k];
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            upgradeProperti[i][j][k] = Cookies.data["isoData31" + i + j + k];
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            spellBuat[i][j][k] = Cookies.data["isoData32" + i + j + k];
            k++;
         }
         j++;
      }
   }
   else if(keJeda == 38)
   {
      i = 12;
      j = 1;
      while(j <= 4)
      {
         k = 1;
         while(k <= 12)
         {
            _root["idatSimp30" + i + j + k] = String("jenisBangunan" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp30" + i + j + k]);
            jenisBangunan[i][j][k] = Cookies.data["isoData30" + i + j + k];
            _root["idatSimp31" + i + j + k] = String("upgradeProperti" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp31" + i + j + k]);
            upgradeProperti[i][j][k] = Cookies.data["isoData31" + i + j + k];
            _root["idatSimp32" + i + j + k] = String("spellBuat" + i + j + k) + dataKe;
            Cookies = SharedObject.getLocal(_root["idatSimp32" + i + j + k]);
            spellBuat[i][j][k] = Cookies.data["isoData32" + i + j + k];
            k++;
         }
         j++;
      }
   }
   msgBox_mc.bar.gotoAndStop(keJeda);
   if(keJeda == 38)
   {
      clearInterval(idJeda2);
      wi = 0;
      while(wi <= 9)
      {
         delete _root["data" + wi].onRollOver;
         delete _root["data" + wi].onRollOut;
         delete _root["data" + wi].onRelease;
         wi++;
      }
      gotoAndStop(129);
   }
   else
   {
      keJeda++;
   }
}
function loadData(dataKe)
{
   initBangun();
   simpanBangun();
   ygDiSave();
   keJeda = 1;
   idJeda2 = setInterval(loadJeda,100,dataKe);
}
function xloadData(dataKe)
{
   i = 0;
   while(i <= simpanSemua.length - 1)
   {
      _root["idatSimp" + i] = simpanSemua[i] + dataKe;
      Cookies = SharedObject.getLocal(_root["idatSimp" + i]);
      _root["c" + simpanSemua[i]] = Cookies.data["isoData" + i];
      i++;
   }
}
stop();
xsound = attachMovie("sound_mc","sound",4);
xmusic = attachMovie("sound_mc","music",5);
volum1 = 100;
volum2 = 75;
_quality = "BEST";
speedGame = 1;
initAwalan();
simpanSemua = new Array("namaData","day","posSatu","posDua","jenisKerajaan","jenisMusuh","tingkatSulit","xpilihKota","xpilihMap","lawanNyerang","lawanNyerang2","speedGame","sudahTutor");
gotoAndStop(38);
