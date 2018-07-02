package com.okada.movie.interceptor;

import com.okada.movie.constant.SessionConstants;
import com.okada.movie.model.Admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 */
public class AdminLoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 获取请求地址
        String url = request.getRequestURI();
        // 对特殊地址，直接放行
        if (url.indexOf("login") > 0) {
            return true;
        }

        // 判断session，session存在的话，登陆后台
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute(SessionConstants.ADMIN_INFO);
        if (admin != null) {
            // 身份存在，放行
            return true;
        }

        // 跳转到登陆页面
        request.getRequestDispatcher("/WEB-INF/view/admin/login.jsp").forward(request, response);

        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
