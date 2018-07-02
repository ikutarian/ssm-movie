package com.okada.movie.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Role {

    private int id;
    private String name;
    private String auths;
    private Date addTime;
}
