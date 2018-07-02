package com.okada.movie.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Movie {

    private Integer id;
    private String title;
    private String url;
    private String info;
    private String logo;
    private Integer star;
    private Long playNum;
    private Long commentNum;
    private Tag tag;
    private String area;
    private Date releaseTime;
    private String length;
    private Date addTime;
}
