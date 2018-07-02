package com.okada.movie.config;

import java.io.File;
import java.io.IOException;
import java.util.Properties;

public class PathConfig {

    private static String SEPARATOR = File.separator;

    /**
     * 图片
     */
    private String imageBsePath;
    /**
     * 电影
     */
    private String movieBasePath;
    /**
     * 预告
     */
    private String previewBasePath;

    private PathConfig(){
        if (imageBsePath == null) {
            try {
                Properties pps = new Properties();
                pps.load(PathConfig.class.getClassLoader().getResourceAsStream("file.properties"));
                imageBsePath = pps.getProperty("imageBasePath");
                movieBasePath = pps.getProperty("movieBasePath");
                previewBasePath = pps.getProperty("previewBasePath");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private static class SingletonInstance {
        private static final PathConfig INSTANCE = new PathConfig();
    }

    public static PathConfig getInstance() {
        return SingletonInstance.INSTANCE;
    }

    /**
     * 返回图片文件夹的根路径
     */
    public String getImageBsePath() {
        return imageBsePath;
    }

    /**
     * 返回电影文件夹的根路径
     */
    public String getMovieBasePath() {
        return movieBasePath;
    }

    /**
     * 返回预告文件夹的根路径
     */
    public String getPreviewBasePath() {
        return previewBasePath;
    }
}
