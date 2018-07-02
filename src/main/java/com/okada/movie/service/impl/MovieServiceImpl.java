package com.okada.movie.service.impl;

import com.okada.movie.dao.MovieDAO;
import com.okada.movie.model.Movie;
import com.okada.movie.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MovieServiceImpl implements MovieService {

    @Autowired
    private MovieDAO movieDAO;

    @Override
    public int saveOne(Movie movie) {
        return movieDAO.saveOne(movie);
    }

    @Override
    public List<Movie> list() {
        return movieDAO.list();
    }

    @Override
    public int delete(int id) {
        return movieDAO.delete(id);
    }

    @Override
    public Movie selectById(int id) {
        return movieDAO.selectById(id);
    }

    @Override
    public int countByTitle(String title) {
        return movieDAO.countByTitle(title);
    }

    @Override
    public int updateOne(Movie movie) {
        return movieDAO.updateOne(movie);
    }

    @Override
    public List<Movie> listBy(Integer tid, Integer star, Integer time, Integer pm, Integer cm) {
        return movieDAO.listBy(tid, star, time, pm, cm);
    }

    @Override
    public List<Movie> searchByTitle(String title) {
        return movieDAO.searchByTitle(title);
    }
}
