package com.okada.movie.controller.home;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.okada.movie.anno.UserLoginRequired;
import com.okada.movie.config.PathConfig;
import com.okada.movie.constant.SessionConstants;
import com.okada.movie.model.Admin;
import com.okada.movie.model.AdminLoginLog;
import com.okada.movie.model.User;
import com.okada.movie.model.UserLoginLog;
import com.okada.movie.service.LogService;
import com.okada.movie.service.UserService;
import com.okada.movie.util.MsgUtils;
import com.okada.movie.util.MultipartFileUtils;
import com.okada.movie.view.UserView;
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
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller("home_user_controller")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private LogService logService;

    /**
     * 登陆
     */
    @RequestMapping("login")
    public String login() {
        return "home/login";
    }

    /**
     * 登陆
     */
    @PostMapping("login")
    public String login(ModelMap map,
                        HttpServletRequest request,
                        String name,
                        String pwd) {
        if (StringUtils.isBlank(name) || StringUtils.isBlank(pwd)) {
            MsgUtils.msgFailure(map, "账号或密码不能为空");
            return "home/login";
        }

        User user = userService.check(name, pwd);
        if (user == null) {
            MsgUtils.msgFailure(map, "账号或密码不正确");
            return "home/login";
        }

        // 插入一条登陆日志
        logService.insertUserLoginLog(user.getId(), request.getRemoteAddr());
        // 设置session
        request.getSession().setAttribute(SessionConstants.USER_INFO, user);

        return "redirect:/user";
    }


    /**
     * 退出
     */
    @RequestMapping("logout")
    public String logout(HttpServletRequest request) {
        request.getSession().setAttribute(SessionConstants.USER_INFO, null);
        return "redirect:/login";
    }

    /**
     * 注册
     */
    @GetMapping("register")
    public String register(ModelMap map) {
        return "home/register";
    }

    /**
     * 注册
     */
    @PostMapping("register")
    public String register(ModelMap map, UserView userView) {
        if (userService.countByName(userView.getName()) > 0) {
            MsgUtils.msgFailure(map, "昵称已存在");
            return "home/register";
        }
        if (userService.countByEmail(userView.getEmail()) > 0) {
            MsgUtils.msgFailure(map, "邮箱已存在");
            return "home/register";
        }
        if (userService.countByPhone(userView.getPhone()) > 0) {
            MsgUtils.msgFailure(map, "手机号已存在");
            return "home/register";
        }

        User user = new User();
        user.setName(userView.getName());
        user.setEmail(userView.getEmail());
        user.setPhone(userView.getPhone());
        user.setPassword(userView.getPwd());
        user.setUuid(UUID.randomUUID().toString());
        user.setAddTime(new Date());
        int effect = userService.insert(user);
        MsgUtils.msg(map, effect, "注册成功", "注册失败");

        return "home/register";
    }

    /**
     * 会员中心
     */
    @UserLoginRequired
    @GetMapping("user")
    public String user(HttpServletRequest request, ModelMap map) {
        User user = (User) request.getSession().getAttribute(SessionConstants.USER_INFO);
        map.put("user", userService.selectById(user.getId()));

        return "home/user";
    }

    /**
     * 会员中心 - 修改资料
     */
    @UserLoginRequired
    @PostMapping("user")
    public String user(HttpServletRequest request, RedirectAttributesModelMap map, UserView userView) throws IOException {
        User userInSession = (User) request.getSession().getAttribute(SessionConstants.USER_INFO);

        User userInDB = userService.selectById(userInSession.getId());
        if (!userView.getName().equals(userInDB.getName()) && userService.countByName(userView.getName()) > 0) {
            MsgUtils.msgFailure(map, "昵称已存在");
            return "redirect:/user";
        }
        if (!userView.getEmail().equals(userInDB.getEmail()) && userService.countByEmail(userView.getEmail()) > 0) {
            MsgUtils.msgFailure(map, "邮箱已存在");
            return "redirect:/user";
        }
        if (!userView.getPhone().equals(userInDB.getPhone()) && userService.countByPhone(userView.getPhone()) > 0) {
            MsgUtils.msgFailure(map, "手机号已存在");
            return "redirect:/user";
        }


        User user = new User();
        user.setId(userInSession.getId());
        user.setName(userView.getName());
        user.setEmail(userView.getEmail());
        user.setPhone(userView.getPhone());
        if (!userView.getFace().isEmpty()) {
            String faceFilename = MultipartFileUtils.saveFile(userView.getFace(), PathConfig.getInstance().getImageBsePath());
            user.setFace(faceFilename);
        }
        user.setInfo(userView.getInfo());
        int effect = userService.updateUser(user);
        MsgUtils.msg(map, effect, "修改成功", "修改失败");

        return "redirect:/user";
    }

    /**
     * 修改密码
     */
    @UserLoginRequired
    @GetMapping("pwd")
    public String pwd() {
        return "home/pwd";
    }

    /**
     * 修改密码
     */
    @UserLoginRequired
    @PostMapping("pwd")
    public String pwd(HttpServletRequest request,
                      ModelMap map,
                      RedirectAttributesModelMap logoutMap,
                      @RequestParam("old_pwd") String oldPassword,
                      @RequestParam("new_pwd") String newPassword) {
        User user = (User) request.getSession().getAttribute(SessionConstants.USER_INFO);
        User userInDB = userService.selectById(user.getId());
        if (!userInDB.getPassword().equals(oldPassword)) {
            MsgUtils.msgFailure(map, "旧密码错误");
            return "home/pwd";
        }

        userInDB.setPassword(newPassword);
        int effect = userService.updateUser(userInDB);
        MsgUtils.msg(logoutMap, effect, "修改密码成功，请重新登陆", "修改失败");
        request.getSession().setAttribute(SessionConstants.USER_INFO, null);

        return "redirect:/login";
    }

    /**
     * 登陆日志
     */
    @UserLoginRequired
    @RequestMapping("loginlog")
    public String log(ModelMap map,
                      HttpServletRequest request,
                      @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                      @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        User userInSession = (User) request.getSession().getAttribute(SessionConstants.USER_INFO);

        PageHelper.startPage(pageNum, pageSize);
        List<UserLoginLog> userLoginLogs = logService.userLoginLogList(userInSession.getId());
        PageInfo<UserLoginLog> userLoginLogPageInfo = new PageInfo<>(userLoginLogs);
        map.put("pageInfo", userLoginLogPageInfo);

        return "home/loginlog";
    }
}
