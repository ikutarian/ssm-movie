package com.okada.movie.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Tag {

    private Integer id;
    private String name;
    private Date addTime;
}
