import com.jpexs.decompiler.flash.SWF;
import com.jpexs.decompiler.flash.tags.Tag;
import com.jpexs.decompiler.flash.tags.DefineFont3Tag;
import com.jpexs.decompiler.flash.tags.DefineFont2Tag;
import com.jpexs.decompiler.flash.tags.base.FontTag;

import java.awt.Font;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class EmbedVietnameseFont {
    // Bang ma tieng Viet day du Unicode (hoa, thuong, dau thanh, ky tu thong dung)
    private static final String VIETNAMESE_CHARS = 
        "àáảãạăằắẳẵặâầấẩẫậđèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ" +
        "ÀÁẢÃẠĂẰẮẲẴẶÂẦẤẨẪẬĐÈÉẺẼẸÊỀẾỂỄỆÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴ" +
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" +
        " .,:;!?'\"()-+*=/\\%&@#$[]{}<>|_^~`₫–—…–•★⚔🚚🏛🛡";

    public static void main(String[] args) throws Exception {
        if (args.length < 2) {
            System.out.println("Usage: java -cp ffdec.jar;. EmbedVietnameseFont <in_swf> <out_swf>");
            return;
        }

        // Khoi tao cac map static trong FontTag
        try {
            FontTag.getInstalledFontsByName();
        } catch (Exception ignore) {}
        
        for (Field f : FontTag.class.getDeclaredFields()) {
            if (java.lang.reflect.Modifier.isStatic(f.getModifiers()) && java.util.Map.class.isAssignableFrom(f.getType())) {
                f.setAccessible(true);
                if (f.get(null) == null) {
                    f.set(null, new HashMap<>());
                }
            }
        }

        String inPath = args[0];
        String outPath = args[1];

        System.out.println("Dang doc SWF: " + inPath);
        FileInputStream fis = new FileInputStream(inPath);
        SWF swf = new SWF(fis, false, null);
        fis.close();

        // Load font he thong
        File fontFile = new File("C:/Windows/Fonts/arial.ttf");
        if (!fontFile.exists()) {
            fontFile = new File("C:/Windows/Fonts/tahoma.ttf");
        }
        System.out.println("Su dung font mau: " + fontFile.getAbsolutePath());
        Font baseFont = Font.createFont(Font.TRUETYPE_FONT, fontFile);
        Font awtFont = baseFont.deriveFont(Font.PLAIN, 24);

        // Sao chep danh sach tag tranh ConcurrentModificationException
        List<Tag> fontTags = new ArrayList<>();
        for (Tag tag : swf.getTags()) {
            if (tag instanceof DefineFont3Tag || tag instanceof DefineFont2Tag) {
                fontTags.add(tag);
            }
        }

        int totalAdded = 0;
        for (Tag tag : fontTags) {
            if (tag instanceof DefineFont3Tag) {
                DefineFont3Tag f3 = (DefineFont3Tag) tag;
                String existing = "";
                try { existing = f3.getCharacters(); } catch (Exception ignore) {}
                int added = 0;
                for (int i = 0; i < VIETNAMESE_CHARS.length(); i++) {
                    char c = VIETNAMESE_CHARS.charAt(i);
                    if (existing != null && existing.indexOf(c) != -1) {
                        continue; // Giu nguyen ky tu goc cua game, khong ghi de!
                    }
                    try {
                        if (f3.addCharacter(c, awtFont)) {
                            added++;
                        }
                    } catch (Exception ex) {
                        // ignore
                    }
                }
                f3.setModified(true);
                System.out.println("DefineFont3 (id " + f3.getCharacterId() + ", " + f3.getFontName() + "): Da them " + added + " ky tu.");
                totalAdded += added;
            } else if (tag instanceof DefineFont2Tag) {
                DefineFont2Tag f2 = (DefineFont2Tag) tag;
                String existing = "";
                try { existing = f2.getCharacters(); } catch (Exception ignore) {}
                int added = 0;
                for (int i = 0; i < VIETNAMESE_CHARS.length(); i++) {
                    char c = VIETNAMESE_CHARS.charAt(i);
                    if (existing != null && existing.indexOf(c) != -1) {
                        continue; // Giu nguyen ky tu goc cua game, khong ghi de!
                    }
                    try {
                        if (f2.addCharacter(c, awtFont)) {
                            added++;
                        }
                    } catch (Exception ex) {
                        // ignore
                    }
                }
                f2.setModified(true);
                System.out.println("DefineFont2 (id " + f2.getCharacterId() + ", " + f2.getFontName() + "): Da them " + added + " ky tu.");
                totalAdded += added;
            }
        }

        System.out.println("Ghi SWF ket qua: " + outPath);
        FileOutputStream fos = new FileOutputStream(outPath);
        BufferedOutputStream bos = new BufferedOutputStream(fos);
        swf.saveTo(bos);
        bos.close();
        fos.close();

        System.out.println("===> NHUNG FONT TIENG VIET THANH CONG! Tong glyphs them moi: " + totalAdded);
    }
}
