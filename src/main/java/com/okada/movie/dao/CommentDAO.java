package com.okada.movie.dao;

import com.okada.movie.model.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentDAO {

    List<Comment> list();

    int delete(int id);

    int insert(@Param("movieId") int movieId,
               @Param("userId") int userId,
               @Param("content") String content);

    List<Comment> listByMovieId(int movieId);

    List<Comment> listByUserId(int userId);
}
