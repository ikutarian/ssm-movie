package com.okada.movie.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.okada.movie.model.Role;
import com.okada.movie.service.AuthService;
import com.okada.movie.service.RoleService;
import com.okada.movie.util.MsgUtils;
import com.okada.movie.view.RoleView;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 角色
 */
@Controller
@RequestMapping("admin")
public class RoleController {

    @Autowired
    private AuthService authService;
    @Autowired
    private RoleService roleService;

    /**
     * 添加角色
     */
    @GetMapping("role/add")
    public String add(ModelMap map) {
        map.put("authList", authService.list());

        return "admin/role_add";
    }

    /**
     * 添加角色
     */
    @PostMapping("role/add")
    public String add(RedirectAttributesModelMap map, RoleView roleView) {
        Role role = new Role();
        role.setName(roleView.getName());
        role.setAuths(StringUtils.join(roleView.getAuthList(), ","));
        role.setAddTime(new Date());
        int effect = roleService.insert(role);
        MsgUtils.msg(map, effect, "添加成功", "添加失败");

        return "redirect:/admin/role/add";
    }

    /**
     * 角色列表
     */
    @RequestMapping("role/list")
    public String list(ModelMap map,
                       @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Role> roleList = roleService.list();
        PageInfo<Role> rolePageInfo = new PageInfo<>(roleList);
        map.put("pageInfo", rolePageInfo);

        return "admin/role_list";
    }

    /**
     * 删除角色
     */
    @GetMapping("role/del/{id}")
    public String delete(RedirectAttributesModelMap map, @PathVariable("id") int id) {
        int effect = roleService.delete(id);
        MsgUtils.msg(map, effect, "删除成功", "删除失败");

        return "redirect:/admin/role/list";
    }

    /**
     * 编辑角色
     */
    @GetMapping("role/edit/{id}")
    public String edit(ModelMap map, @PathVariable("id") int id) {
        Role role = roleService.selectById(id);
        List<Integer> checkedAuthIds = new ArrayList<>();
        for (String idStr : StringUtils.split(role.getAuths(), ",")) {
            checkedAuthIds.add(NumberUtils.toInt(idStr));
        }

        map.put("role", role);
        map.put("checkedAuthIds", checkedAuthIds);
        map.put("authList", authService.list());

        return "admin/role_edit";
    }

    /**
     * 编辑角色
     */
    @PostMapping("role/edit")
    public String edit(RedirectAttributesModelMap map, RoleView roleView) {
        Role role = new Role();
        role.setId(roleView.getId());
        role.setName(roleView.getName());
        role.setAuths(StringUtils.join(roleView.getAuthList(), ","));
        int effect = roleService.updateRole(role);
        MsgUtils.msg(map, effect, "修改成功", "修改失败");

        return "redirect:/admin/role/edit/" + roleView.getId();
    }
}
