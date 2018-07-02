package com.okada.movie.service;

import com.okada.movie.model.Admin;

import java.util.Date;
import java.util.List;

public interface AdminService {

    Admin check(String name, String password);

    Admin selectById(Integer id);

    int updatePassword(int id, String newPassword);

    int insertLog(int adminId, String ip, Date loginTime);

    int insertNormalAdmin(String name, String password, Integer roleId);

    List<Admin> list();
}
