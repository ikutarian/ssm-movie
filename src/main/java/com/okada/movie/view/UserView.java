package com.okada.movie.view;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class UserView {

    private Integer id;
    private String name;
    private String email;
    private String phone;
    private String pwd;
    private MultipartFile face;
    private String info;
}
