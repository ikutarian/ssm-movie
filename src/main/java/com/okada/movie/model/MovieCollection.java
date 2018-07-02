package com.okada.movie.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class MovieCollection {

    private int id;
    private Movie movie;
    private User user;
    private Date addTime;
}
