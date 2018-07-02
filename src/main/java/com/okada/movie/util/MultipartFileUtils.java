package com.okada.movie.util;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class MultipartFileUtils {

    /**
     * 保存用户上传的文件
     *
     * @return 文件名
     */
    public static String saveFile(MultipartFile file, String basePath) throws IOException {
        // 使用 时间 + uuid + 后缀 作为文件名
        String filename = new SimpleDateFormat("yyyyMMddHHmmss-").format(new Date())
                + UUID.randomUUID()
                + getPostfix(file.getOriginalFilename());

        File baseDir = new File(basePath);
        if (!baseDir.exists()) {
            baseDir.mkdirs();
        }

        File saveFile = new File(basePath + filename);
        file.transferTo(saveFile);

        return filename;
    }

    /**
     * 获取文件后缀
     */
    private static String getPostfix(String filename) {
        if (StringUtils.isBlank(filename)) {
            return "";
        } else {
            return filename.substring(filename.lastIndexOf("."));
        }
    }
}
