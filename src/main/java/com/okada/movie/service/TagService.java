package com.okada.movie.service;

import com.okada.movie.model.Tag;

import java.util.Date;
import java.util.List;

public interface TagService {

    int countByName(String name);

    int insert(String name, Date addTime);

    List<Tag> list();

    int delete(int id);

    Tag selectById(int id);

    int updateTag(int id, String name);
}
