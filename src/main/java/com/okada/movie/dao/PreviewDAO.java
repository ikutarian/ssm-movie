package com.okada.movie.dao;

import com.okada.movie.model.Preview;

import java.util.List;

public interface PreviewDAO {

    int saveOne(Preview preview);

    List<Preview> list();

    int delete(int id);

    Preview selectById(int id);

    int countByTitle(String title);

    int updateOne(Preview preview);
}
