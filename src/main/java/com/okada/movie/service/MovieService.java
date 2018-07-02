package com.okada.movie.service;

import com.okada.movie.model.Movie;

import java.util.List;

public interface MovieService {

    int saveOne(Movie movie);

    List<Movie> list();

    int delete(int id);

    Movie selectById(int id);

    int countByTitle(String title);

    int updateOne(Movie movie);

    List<Movie> listBy(Integer tid, Integer star, Integer time, Integer pm, Integer cm);

    List<Movie> searchByTitle(String title);
}
