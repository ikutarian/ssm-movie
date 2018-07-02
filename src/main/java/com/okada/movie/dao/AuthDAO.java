package com.okada.movie.dao;

import com.okada.movie.model.Auth;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface AuthDAO {

    int add(@Param("name") String name,
            @Param("url") String url,
            @Param("addTime") Date addTime);

    List<Auth> list();

    int delete(int id);

    Auth selectById(int id);

    int updateAuth(Auth auth);
}
