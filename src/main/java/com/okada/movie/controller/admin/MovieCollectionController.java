package com.okada.movie.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.okada.movie.model.MovieCollection;
import com.okada.movie.service.MovieCollectionService;
import com.okada.movie.util.MsgUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import java.util.List;

/**
 * 电影收藏
 */
@Controller
@RequestMapping("admin")
public class MovieCollectionController {

    @Autowired
    private MovieCollectionService movieCollectionService;

    /**
     * 电影收藏列表
     */
    @RequestMapping("moviecol/list")
    public String list(ModelMap map,
                       @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<MovieCollection> movieCollectionList = movieCollectionService.list();
        PageInfo<MovieCollection> movieCollectionPageInfo = new PageInfo<>(movieCollectionList);
        map.put("pageInfo", movieCollectionPageInfo);

        return "admin/moviecol_list";
    }

    /**
     * 删除电影收藏
     */
    @RequestMapping("moviecol/del/{id}")
    public String delete(RedirectAttributesModelMap map, @PathVariable("id") int id) {
        int effect = movieCollectionService.delete(id);
        MsgUtils.msg(map, effect, "删除成功", "删除失败");

        return "redirect:/admin/moviecol/list";
    }
}
