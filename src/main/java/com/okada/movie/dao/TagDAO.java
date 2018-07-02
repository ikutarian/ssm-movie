package com.okada.movie.dao;

import com.okada.movie.model.Tag;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface TagDAO {

    int countByName(String name);

    int insert(@Param("name") String name,
               @Param("addtime") Date addTime);

    List<Tag> list();

    int delete(int id);

    Tag selectById(int id);

    int updateTag(@Param("id") int id,
                  @Param("name") String name);
}
