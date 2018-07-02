package com.okada.movie.dao;

import com.okada.movie.model.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface AdminDAO {

    Admin check(@Param("name") String name,
                @Param("password") String password);

    int updatePassword(@Param("id") int id,
                       @Param("newPassword") String newPassword);

    Admin selectById(int id);

    int tNormalAdmin(@Param("name") String name,
                     @Param("password") String password,
                     @Param("roleId") Integer roleId,
                     @Param("type") Integer type,
                     @Param("addTime") Date addTime);

    List<Admin> list();
}
