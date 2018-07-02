package com.okada.movie.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class User {

    private int id;
    private String name;
    private String password;
    private String email;
    private String phone;
    private String info;
    private String face;
    private String uuid;
    private Date addTime;
}
