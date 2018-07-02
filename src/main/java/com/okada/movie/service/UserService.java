package com.okada.movie.service;

import com.okada.movie.model.User;

import java.util.List;

public interface UserService {

    List<User> list();

    User selectById(int id);

    int delete(int id);

    int insert(User user);

    int countByName(String name);

    int countByEmail(String email);

    int countByPhone(String phone);

    User check(String name, String password);

    int updateUser(User user);
}
