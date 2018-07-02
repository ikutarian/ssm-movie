package com.okada.movie.dao;

import com.okada.movie.model.Movie;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MovieDAO {

    int saveOne(Movie movie);

    List<Movie> list();

    int delete(int id);

    Movie selectById(int id);

    int countByTitle(String title);

    int updateOne(Movie movie);

    List<Movie> listBy(@Param("tid") Integer tid,
                       @Param("star") Integer star,
                       @Param("time") Integer time,
                       @Param("pm") Integer pm,
                       @Param("cm") Integer cm);

    List<Movie> searchByTitle(String title);
}
