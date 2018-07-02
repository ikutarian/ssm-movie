package com.okada.movie.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.okada.movie.model.Comment;
import com.okada.movie.service.CommentService;
import com.okada.movie.util.MsgUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import java.util.List;

/**
 * 评论
 */
@Controller
@RequestMapping("admin")
public class CommentController {

    @Autowired
    private CommentService commentService;

    /**
     * 评论列表
     */
    @RequestMapping("comment/list")
    public String commentList(ModelMap map,
                              @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                              @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Comment> commentList = commentService.list();
        PageInfo<Comment> commentPageInfo = new PageInfo<>(commentList);
        map.put("pageInfo", commentPageInfo);

        return "admin/comment_list";
    }

    /**
     * 评论删除
     */
    @GetMapping("comment/del/{id}")
    public String commentDelete(RedirectAttributesModelMap map, @PathVariable("id") int id) {
        int effect = commentService.delete(id);
        MsgUtils.msg(map, effect, "删除成功", "删除失败");

        return "redirect:/admin/comment/list";
    }
}
