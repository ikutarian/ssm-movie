package com.okada.movie.service;

import com.okada.movie.model.Role;

import java.util.List;

public interface RoleService {

    int insert(Role role);

    List<Role> list();

    int delete(int id);

    Role selectById(int id);

    int updateRole(Role role);
}
