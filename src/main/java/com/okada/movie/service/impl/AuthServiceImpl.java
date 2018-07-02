package com.okada.movie.service.impl;

import com.okada.movie.dao.AuthDAO;
import com.okada.movie.model.Auth;
import com.okada.movie.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private AuthDAO authDAO;

    @Override
    public int add(String name, String url) {
        return authDAO.add(name, url, new Date());
    }

    @Override
    public List<Auth> list() {
        return authDAO.list();
    }

    @Override
    public int delete(int id) {
        return authDAO.delete(id);
    }

    @Override
    public Auth selectById(int id) {
        return authDAO.selectById(id);
    }

    @Override
    public int updateAuth(Auth auth) {
        return authDAO.updateAuth(auth);
    }
}
