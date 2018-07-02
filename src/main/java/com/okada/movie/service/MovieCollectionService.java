package com.okada.movie.service;

import com.okada.movie.model.MovieCollection;

import java.util.List;

public interface MovieCollectionService {

    List<MovieCollection> list();

    int delete(int id);

    List<MovieCollection> listByUserId(int userId);

    MovieCollection selectByUserIdMovieId(int userId, int movieId);

    int addOne(int userId, int movieId);
}
