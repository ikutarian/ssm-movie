package com.okada.movie.service.impl;

import com.okada.movie.dao.LogDAO;
import com.okada.movie.model.AdminLoginLog;
import com.okada.movie.model.UserLoginLog;
import com.okada.movie.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogServiceImpl implements LogService {

    @Autowired
    private LogDAO logDAO;

    @Override
    public List<AdminLoginLog> adminLoginLogList() {
        return logDAO.adminLoginLogList();
    }

    @Override
    public int insertUserLoginLog(int id, String ip) {
        return logDAO.insertUserLoginLog(id, ip);
    }

    @Override
    public List<UserLoginLog> userLoginLogList(int userId) {
        return logDAO.userLoginLogList(userId);
    }
}
