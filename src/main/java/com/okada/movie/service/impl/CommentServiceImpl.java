package com.okada.movie.service.impl;

import com.okada.movie.dao.CommentDAO;
import com.okada.movie.model.Comment;
import com.okada.movie.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDAO commentDAO;

    @Override
    public List<Comment> list() {
        return commentDAO.list();
    }

    @Override
    public int delete(int id) {
        return commentDAO.delete(id);
    }

    @Override
    public int insert(int movieId, int userId, String content) {
        return commentDAO.insert(movieId, userId, content);
    }

    @Override
    public List<Comment> listByMovieId(int movieId) {
        return commentDAO.listByMovieId(movieId);
    }

    @Override
    public List<Comment> listByUserId(int userId) {
        return commentDAO.listByUserId(userId);
    }
}
