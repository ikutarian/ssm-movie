package com.okada.movie.service.impl;

import com.okada.movie.dao.UserDAO;
import com.okada.movie.model.User;
import com.okada.movie.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public List<User> list() {
        return userDAO.list();
    }

    @Override
    public User selectById(int id) {
        return userDAO.selectById(id);
    }

    @Override
    public int delete(int id) {
        return userDAO.delete(id);
    }

    @Override
    public int insert(User user) {
        return userDAO.insert(user);
    }

    @Override
    public int countByName(String name) {
        return userDAO.countByName(name);
    }

    @Override
    public int countByEmail(String email) {
        return userDAO.countByEmail(email);
    }

    @Override
    public int countByPhone(String phone) {
        return userDAO.countByPhone(phone);
    }

    @Override
    public User check(String name, String password) {
        return userDAO.check(name, password);
    }

    @Override
    public int updateUser(User user) {
        return userDAO.updateUser(user);
    }
}
