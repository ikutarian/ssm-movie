package com.okada.movie.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class UserLoginLog {

    private int id;
    private String ip;
    private Date addTime;
}
