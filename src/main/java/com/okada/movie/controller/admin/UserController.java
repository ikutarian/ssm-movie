package com.okada.movie.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.okada.movie.model.User;
import com.okada.movie.service.UserService;
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
 * 会员
 */
@Controller("admin_user_controller")
@RequestMapping("admin")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 会员列表
     */
    @RequestMapping("user/list")
    public String userList(ModelMap map,
                           @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> tagList = userService.list();
        PageInfo<User> userPageInfo = new PageInfo<>(tagList);
        map.put("pageInfo", userPageInfo);

        return "admin/user_list";
    }

    /**
     * 查看会员详情
     */
    @RequestMapping("user/view/{id}")
    public String userView(ModelMap map,
                           @PathVariable("id") int id) {
        User user = userService.selectById(id);
        map.put("user", user);

        return "admin/user_view";
    }

    /**
     * 刪除会员
     */
    @RequestMapping("user/del/{id}")
    public String userDelete(RedirectAttributesModelMap map,
                           @PathVariable("id") int id) {
        int effect = userService.delete(id);
        MsgUtils.msg(map, effect, "删除成功", "删除失败");

        return "redirect:/admin/user/list";
    }
}
