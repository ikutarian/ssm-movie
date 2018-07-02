package com.okada.movie.dao;

import com.okada.movie.model.Role;

import java.util.List;

public interface RoleDAO {

    int insert(Role role);

    List<Role> list();

    int delete(int id);

    Role selectById(int id);

    int updateRole(Role role);
}
