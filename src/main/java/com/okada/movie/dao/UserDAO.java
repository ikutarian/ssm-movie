package com.okada.movie.dao;

import com.okada.movie.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDAO {

    List<User> list();

    User selectById(int id);

    int delete(int id);

    int insert(User user);

    int countByName(String name);

    int countByEmail(String email);

    int countByPhone(String phone);

    User check(@Param("name") String name,
               @Param("password") String password);

    int updateUser(User user);
}
