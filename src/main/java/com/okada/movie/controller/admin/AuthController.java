package com.okada.movie.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.okada.movie.model.Auth;
import com.okada.movie.service.AuthService;
import com.okada.movie.util.MsgUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import java.util.List;

/**
 * 权限
 */
@Controller
@RequestMapping("admin")
public class AuthController {

    @Autowired
    private AuthService authService;

    /**
     * 添加权限
     */
    @GetMapping("auth/add")
    public String authAdd(ModelMap modelMap) {
        return "admin/auth_add";
    }

    /**
     * 添加权限
     */
    @PostMapping("auth/add")
    public String authAdd(ModelMap map,
                          String name,
                          String url) {
        int effect = authService.add(name, url);
        MsgUtils.msg(map, effect, "添加成功", "添加失败");
        return "admin/auth_add";
    }

    /**
     * 权限列表
     */
    @RequestMapping("auth/list")
    public String authList(ModelMap map,
                           @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Auth> authList = authService.list();
        PageInfo<Auth> authPageInfo = new PageInfo<>(authList);
        map.put("pageInfo", authPageInfo);

        return "admin/auth_list";
    }

    /**
     * 删除权限
     */
    @GetMapping("auth/del/{id}")
    public String authDelete(RedirectAttributesModelMap map, @PathVariable("id") int id) {
        int effect = authService.delete(id);
        MsgUtils.msg(map, effect, "删除成功", "删除失败");
        return "redirect:/admin/auth/list";
    }

    /**
     * 编辑权限
     */
    @GetMapping("auth/edit/{id}")
    public String authEdit(ModelMap map, @PathVariable("id") int id) {
        Auth auth = authService.selectById(id);
        map.put("auth", auth);

        return "admin/auth_edit";
    }

    /**
     * 编辑权限
     */
    @PostMapping("auth/edit")
    public String tagEdit(ModelMap map,
                          @RequestParam("id") int id,
                          @RequestParam("name") String name,
                          @RequestParam("url") String url) {
        Auth auth = new Auth();
        auth.setId(id);
        auth.setName(name);
        auth.setUrl(url);
        int effect = authService.updateAuth(auth);
        MsgUtils.msg(map, effect, "修改成功", "修改失败");
        map.put("auth", auth);

        return "admin/auth_edit";
    }
}
