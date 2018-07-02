package com.okada.movie.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class AdminLoginLog {

    private int id;
    private Admin admin;
    private String ip;
    private Date addTime;
}
