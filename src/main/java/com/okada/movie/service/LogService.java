package com.okada.movie.service;

import com.okada.movie.model.AdminLoginLog;
import com.okada.movie.model.UserLoginLog;

import java.util.List;

public interface LogService {

    /**
     * 系统管理员登陆日志列表
     */
    List<AdminLoginLog> adminLoginLogList();

    /**
     * 插入一条用户登陆日志
     */
    int insertUserLoginLog(int id, String ip);

    List<UserLoginLog> userLoginLogList(int userId);
}
