package com.okada.movie.service.impl;

import com.okada.movie.constant.AdminConstants;
import com.okada.movie.dao.AdminDAO;
import com.okada.movie.dao.LogDAO;
import com.okada.movie.model.Admin;
import com.okada.movie.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDAO adminDAO;

    @Autowired
    private LogDAO logDAO;

    @Override
    public Admin check(String name, String password) {
        return adminDAO.check(name, password);
    }

    @Override
    public Admin selectById(Integer id) {
        return adminDAO.selectById(id);
    }

    @Override
    public int updatePassword(int id, String newPassword) {
        return adminDAO.updatePassword(id, newPassword);
    }

    @Override
    public int insertLog(int adminId, String ip, Date loginTime) {
        return logDAO.insertAdminLoginLog(adminId, ip, loginTime);
    }

    @Override
    public int insertNormalAdmin(String name, String password, Integer roleId) {
        return adminDAO.tNormalAdmin(name, password, roleId, AdminConstants.NORMAL, new Date());
    }

    @Override
    public List<Admin> list() {
        return adminDAO.list();
    }
}
