package com.okada.movie.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class Comment {

    private int id;
    private String content;
    private Movie movie;
    private User user;
    private Date addTime;
}
