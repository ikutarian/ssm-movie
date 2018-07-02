package com.okada.movie.interceptor;

import com.okada.movie.anno.AuthRequire;
import com.okada.movie.constant.SessionConstants;
import com.okada.movie.model.Admin;
import com.okada.movie.model.Auth;
import com.okada.movie.model.Role;
import com.okada.movie.service.AuthService;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * 自定义拦截器，判断此次请求的用户是否已登录
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private AuthService authService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            // 如果不是映射到方法直接通过
            return true;
        }

        Admin AdminInSession = (Admin) request.getSession().getAttribute(SessionConstants.ADMIN_INFO);
        Role role = AdminInSession.getRole();
        if (role == null) {
            // 没有角色，直接通过吧
            return true;
        }
        String[] authIds = StringUtils.split(role.getAuths(), ",");
        List<String> urls = new ArrayList<>();
        for (Auth auth : authService.list()) {
            for (String authId : authIds) {
                if (auth.getId() == NumberUtils.toInt(authId)) {
                    urls.add(auth.getUrl());
                }
            }
        }

        if (urls.contains(request.getRequestURI())) {
            return true;
        } else {
            // 如果权限验证失败，并且方法注明了AuthRequire，就告诉客户端无权限访问
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            if (handlerMethod.getMethodAnnotation(AuthRequire.class) != null) {
                // 跳转到拒绝访问的页面
                request.getRequestDispatcher("/WEB-INF/view/refuse.jsp").forward(request, response);
                return false;
            } else {
                return true;
            }
        }
    }
}