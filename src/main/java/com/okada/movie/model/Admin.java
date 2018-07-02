package com.okada.movie.model;

import com.okada.movie.constant.AdminConstants;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Admin {

    private Integer id;
    private String name;
    private String password;
    private Integer isSuper;
    private Role role;
    private Date addTime;

    public String getTypeName() {
        if (isSuper == AdminConstants.SUPER) {
            return "超级管理员";
        } else if (isSuper == AdminConstants.NORMAL) {
            return "普通管理员";
        } else {
            return "";
        }
    }
}
