package com.okada.movie.service.impl;

import com.okada.movie.dao.PreviewDAO;
import com.okada.movie.model.Preview;
import com.okada.movie.service.PreviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PreviewServiceImpl implements PreviewService {

    @Autowired
    private PreviewDAO previewDAO;

    @Override
    public int saveOne(Preview preview) {
        return previewDAO.saveOne(preview);
    }

    @Override
    public List<Preview> list() {
        return previewDAO.list();
    }

    @Override
    public int delete(int id) {
        return previewDAO.delete(id);
    }

    @Override
    public Preview selectById(int id) {
        return previewDAO.selectById(id);
    }

    @Override
    public int countByTitle(String title) {
        return previewDAO.countByTitle(title);
    }

    @Override
    public int updateOne(Preview preview) {
        return previewDAO.updateOne(preview);
    }
}
