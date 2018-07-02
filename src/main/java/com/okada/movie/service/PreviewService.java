package com.okada.movie.service;

import com.okada.movie.model.Preview;

import java.util.List;

public interface PreviewService {

    int saveOne(Preview preview);

    List<Preview> list();

    int delete(int id);

    Preview selectById(int id);

    int countByTitle(String title);

    int updateOne(Preview preview);
}
