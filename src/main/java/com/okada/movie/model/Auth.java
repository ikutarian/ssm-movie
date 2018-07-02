package com.okada.movie.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class Auth {

    private int id;
    private String name;
    private String url;
    private Date addTime;
}
