package com.okada.movie.service;

import com.okada.movie.model.Auth;

import java.util.List;

public interface AuthService {

    int add(String name, String url);

    List<Auth> list();

    int delete(int id);

    Auth selectById(int id);

    int updateAuth(Auth auth);
}
