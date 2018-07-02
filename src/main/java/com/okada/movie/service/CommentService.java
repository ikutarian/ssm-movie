package com.okada.movie.service;

import com.okada.movie.model.Comment;

import java.util.List;

public interface CommentService {

    List<Comment> list();

    int delete(int id);

    int insert(int movieId, int userId, String content);

    List<Comment> listByMovieId(int movieId);

    List<Comment> listByUserId(int userId);
}
