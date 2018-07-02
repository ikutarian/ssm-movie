package com.okada.movie.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.okada.movie.constant.SessionConstants;
import com.okada.movie.model.Admin;
import com.okada.movie.model.Role;
import com.okada.movie.model.Tag;
import com.okada.movie.service.AdminService;
import com.okada.movie.service.RoleService;
import com.okada.movie.util.MsgUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 管理员
 */
@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private RoleService roleService;

    /**
     * 登陆
     */
    @GetMapping("login")
    public String loginView(ModelMap map) {
        return "admin/login";
    }

    /**
     * 登陆
     */
    @PostMapping("login")
    public String login(ModelMap map,
                        HttpServletRequest request,
                        String user,
                        String pwd) {
        if (StringUtils.isBlank(user) || StringUtils.isBlank(pwd)) {
            MsgUtils.msgFailure(map, "账号或密码不能为空");
            return "admin/login";
        }

        Admin admin = adminService.check(user, pwd);
        if (admin == null) {
            MsgUtils.msgFailure(map, "账号或密码不正确");
            return "admin/login";
        }

        // 插入一条登陆日志
        adminService.insertLog(admin.getId(), request.getRemoteAddr(), new Date());

        // 设置session
        request.getSession().setAttribute(SessionConstants.ADMIN_INFO, admin);

        return "redirect:/admin/index";
    }

    /**
     * 退出
     */
    @RequestMapping("logout")
    public String logout(HttpServletRequest request) {
        // 清除session
        request.getSession().setAttribute(SessionConstants.ADMIN_INFO, null);

        return "redirect:/admin/login";
    }

    /**
     * 修改密码
     */
    @GetMapping("pwd")
    public String pwd() {
        return "admin/pwd";
    }

    /**
     * 修改密码
     */
    @PostMapping("pwd")
    public String pwd(HttpServletRequest request,
                      ModelMap map,
                      RedirectAttributesModelMap logoutMap,
                      @RequestParam("old_pwd") String oldPassword,
                      @RequestParam("new_pwd") String newPassword) {
        Admin admin = (Admin) request.getSession().getAttribute(SessionConstants.ADMIN_INFO);
        Admin adminInDB = adminService.selectById(admin.getId());
        if (!adminInDB.getPassword().equals(oldPassword)) {
            MsgUtils.msgFailure(map, "旧密码错误");
            return "admin/pwd";
        }

        int effect = adminService.updatePassword(adminInDB.getId(), newPassword);
        MsgUtils.msg(logoutMap, effect, "修改密码成功，请重新登陆", "修改失败");
        request.getSession().setAttribute(SessionConstants.ADMIN_INFO, null);

        return "redirect:/admin/login";
    }

    /**
     * 添加管理员
     */
    @GetMapping("admin/add")
    public String adminAdd(ModelMap map) {
        List<Role> roleList = roleService.list();
        map.put("roleList", roleList);
        return "admin/admin_add";
    }

    /**
     * 添加普通管理员
     */
    @PostMapping("admin/add")
    public String normalAdminAdd(RedirectAttributesModelMap map,
                           @RequestParam("name") String name,
                           @RequestParam("pwd") String password,
                           @RequestParam("role") Integer roleId) {
        int effect = adminService.insertNormalAdmin(name, password, roleId);
        MsgUtils.msg(map, effect, "添加成功", "添加失败");

        return "redirect:/admin/admin/add";
    }

    /**
     * 管理员列表
     */
    @RequestMapping("admin/list")
    public String adminList(ModelMap map,
                            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                            @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Admin> adminList = adminService.list();
        PageInfo<Admin> adminPageInfo = new PageInfo<>(adminList);
        map.put("pageInfo", adminPageInfo);

        return "admin/admin_list";
    }
}
