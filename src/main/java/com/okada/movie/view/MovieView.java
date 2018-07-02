package com.okada.movie.view;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class MovieView {

    private int id;
    private String title;
    private MultipartFile movie;
    private String info;
    private MultipartFile logo;
    private int star;
    private int tag_id;
    private String area;
    private String length;
    private String release_time;
}
