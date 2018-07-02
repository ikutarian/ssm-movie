package com.okada.movie.controller.admin;

import com.okada.movie.constant.SessionConstants;
import com.okada.movie.model.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 首页
 */
@Controller
@RequestMapping("admin")
public class IndexController {

    /**
     * 首页
     */
    @RequestMapping(value = {"/", "index"})
    public String index(ModelMap map, HttpServletRequest request) {
        Admin admin = (Admin) request.getSession().getAttribute(SessionConstants.ADMIN_INFO);
        map.put("admin", admin);

        return "admin/index";
    }
}