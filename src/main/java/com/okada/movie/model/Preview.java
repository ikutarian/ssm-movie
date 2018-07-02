package com.okada.movie.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Preview {

    private int id;
    private String title;
    private String logo;
    private Date addTime;
}
