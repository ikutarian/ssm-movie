package com.okada.movie.view;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class PreviewView {

    private int id;
    private String title;
    private MultipartFile logo;
}
