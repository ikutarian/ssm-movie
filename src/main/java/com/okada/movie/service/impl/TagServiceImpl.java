package com.okada.movie.service.impl;

import com.okada.movie.dao.TagDAO;
import com.okada.movie.model.Tag;
import com.okada.movie.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class TagServiceImpl implements TagService {

    @Autowired
    private TagDAO tagDAO;

    @Override
    public int countByName(String name) {
        return tagDAO.countByName(name);
    }

    @Override
    public int insert(String name, Date addTime) {
        return tagDAO.insert(name, addTime);
    }

    @Override
    public List<Tag> list() {
        return tagDAO.list();
    }

    @Override
    public int delete(int id) {
        return tagDAO.delete(id);
    }

    @Override
    public Tag selectById(int id) {
        return tagDAO.selectById(id);
    }

    @Override
    public int updateTag(int id, String name) {
        return tagDAO.updateTag(id, name);
    }
}
