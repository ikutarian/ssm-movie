package com.okada.movie.view;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class RoleView {

    private int id;
    private String name;
    private List<Integer> authList;
}
