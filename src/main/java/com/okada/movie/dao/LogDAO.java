package com.okada.movie.dao;

import com.okada.movie.model.AdminLoginLog;
import com.okada.movie.model.UserLoginLog;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface LogDAO {

    int insertAdminLoginLog(@Param("adminId") int adminId,
                            @Param("ip") String ip,
                            @Param("loginTime") Date loginTime);

    List<AdminLoginLog> adminLoginLogList();

    int insertUserLoginLog(@Param("user_id") int id,
                           @Param("ip") String ip);

    List<UserLoginLog> userLoginLogList(int userId);
}
