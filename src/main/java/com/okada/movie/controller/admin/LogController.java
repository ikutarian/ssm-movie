package com.okada.movie.controller.admin;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.okada.movie.model.AdminLoginLog;
import com.okada.movie.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 日志
 */
@Controller
@RequestMapping("admin")
public class LogController {

    @Autowired
    private LogService logService;

    /**
     * 管理员登录日志列表
     */
    @RequestMapping("adminloginlog/list")
    public String adminLoginLogList(ModelMap map,
                                    @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                    @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<AdminLoginLog> adminLoginLogs = logService.adminLoginLogList();
        PageInfo<AdminLoginLog> adminLoginLogPageInfo = new PageInfo<>(adminLoginLogs);
        map.put("pageInfo", adminLoginLogPageInfo);

        return "admin/adminloginlog_list";
    }

    /**
     * 操作日志列表
     */
    @RequestMapping("oplog/list")
    public String oplogList() {
        return "admin/oplog_list";
    }

    /**
     * 会员登录日志列表
     */
    @RequestMapping("userloginlog/list")
    public String userloginlogList() {
        return "admin/userloginlog_list";
    }
}
