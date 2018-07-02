package com.okada.movie.interceptor;

import com.okada.movie.anno.UserLoginRequired;
import com.okada.movie.constant.SessionConstants;
import com.okada.movie.model.User;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *会员登陆
 */
public class UserLoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            // 如果不是映射到方法直接通过
            return true;
        }

        HandlerMethod handlerMethod = (HandlerMethod) handler;
        if (handlerMethod.getMethodAnnotation(UserLoginRequired.class) != null) {
            // 判断session，session存在的话，登陆后台
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute(SessionConstants.USER_INFO);
            if (user != null) {
                // 身份存在，放行
                return true;
            } else {
                // 跳转到登陆页面
                request.getRequestDispatcher("/WEB-INF/view/home/login.jsp").forward(request, response);
                return false;
            }
        } else {
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
