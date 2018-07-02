package com.okada.movie.dao;

import com.okada.movie.model.MovieCollection;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MovieCollectionDAO {

    List<MovieCollection> list();

    int delete(int id);

    List<MovieCollection> listByUserId(int userId);

    MovieCollection selectByUserIdMovieId(@Param("userId") int userId,
                                          @Param("movieId") int movieId);

    int addOne(@Param("userId") int userId,
               @Param("movieId") int movieId);
}
