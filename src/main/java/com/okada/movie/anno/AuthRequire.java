package com.okada.movie.anno;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 在 Controller 的方法上使用此注解
 * 该方法在映射时会检查用户是否有权限访问改 url，没有就抛出 404 异常
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface AuthRequire {
}
