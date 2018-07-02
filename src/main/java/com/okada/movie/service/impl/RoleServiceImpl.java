package com.okada.movie.service.impl;

import com.okada.movie.dao.RoleDAO;
import com.okada.movie.model.Role;
import com.okada.movie.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDAO roleDAO;

    @Override
    public int insert(Role role) {
        return roleDAO.insert(role);
    }

    @Override
    public List<Role> list() {
        return roleDAO.list();
    }

    @Override
    public int delete(int id) {
        return roleDAO.delete(id);
    }

    @Override
    public Role selectById(int id) {
        return roleDAO.selectById(id);
    }

    @Override
    public int updateRole(Role role) {
        return roleDAO.updateRole(role);
    }
}
