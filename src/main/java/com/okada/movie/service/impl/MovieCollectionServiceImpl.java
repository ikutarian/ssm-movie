package com.okada.movie.service.impl;

import com.okada.movie.dao.MovieCollectionDAO;
import com.okada.movie.model.MovieCollection;
import com.okada.movie.service.MovieCollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MovieCollectionServiceImpl implements MovieCollectionService {

    @Autowired
    private MovieCollectionDAO movieCollectionDAO;

    @Override
    public List<MovieCollection> list() {
        return movieCollectionDAO.list();
    }

    @Override
    public int delete(int id) {
        return movieCollectionDAO.delete(id);
    }

    @Override
    public List<MovieCollection> listByUserId(int userId) {
        return movieCollectionDAO.listByUserId(userId);
    }

    @Override
    public MovieCollection selectByUserIdMovieId(int userId, int movieId) {
        return movieCollectionDAO.selectByUserIdMovieId(userId, movieId);
    }

    @Override
    public int addOne(int userId, int movieId) {
        return movieCollectionDAO.addOne(userId, movieId);
    }
}
