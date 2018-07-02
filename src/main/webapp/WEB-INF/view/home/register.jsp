<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<rapid:override name="content">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title"><span class="glyphicon glyphicon-plus"></span>&nbsp;会员注册</h3>
                </div>
                <div class="panel-body">
                    <c:choose>
                        <c:when test="${success == true}">
                            <p style="color: green;">${msg}</p>
                        </c:when>
                        <c:when test="${success == false}">
                            <p style="color: red;">${msg}</p>
                        </c:when>
                    </c:choose>
                    <form id="form-data" method="post" role="form">
                        <fieldset>
                            <div class="form-group">
                                <label for="input_name"><span class="glyphicon glyphicon-user"></span>&nbsp;昵称</label>
                                <input id="input_name" class="form-control input-lg" placeholder="昵称" name="name" type="text" autofocus>
                            </div>
                            <div class="col-md-12" id="error_name"></div>
                            <div class="form-group">
                                <label for="input_email"><span class="glyphicon glyphicon-envelope"></span>&nbsp;邮箱</label>
                                <input id="input_email" class="form-control input-lg" placeholder="邮箱" name="email" type="email" autofocus>
                            </div>
                            <div class="col-md-12" id="error_email"></div>
                            <div class="form-group">
                                <label for="input_phone"><span class="glyphicon glyphicon-phone"></span>&nbsp;手机</label>
                                <input id="input_phone" class="form-control input-lg" placeholder="手机" name="phone" type="text" autofocus>
                            </div>
                            <div class="col-md-12" id="error_phone"></div>
                            <div class="form-group">
                                <label for="input_password"><span class="glyphicon glyphicon-lock"></span>&nbsp;密码</label>
                                <input id="input_password" class="form-control input-lg" placeholder="密码" name="pwd" type="password" value="">
                            </div>
                            <div class="col-md-12" id="error_password"></div>
                            <div class="form-group">
                                <label for="input_repassword"><span class="glyphicon glyphicon-lock"></span>&nbsp;确认密码</label>
                                <input id="input_repassword" class="form-control input-lg" placeholder="确认密码" name="re_pwd" type="password" value="">
                            </div>
                            <div class="col-md-12" id="error_repassword"></div>
                            <button type="submit" class="btn btn-lg btn-success btn-block">注册</button>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</rapid:override>

<rapid:override name="js">
    <script>
        $('#form-data').bootstrapValidator({
            fields: {
                name: {
                    validators: {
                        notEmpty: {
                            message: '名称不能为空'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: '请输入邮箱'
                        },
                        emailAddress: {
                            message: '邮箱格式不正确'
                        }
                    }
                },
                phone: {
                    validators: {
                        notEmpty: {
                            message: '请输入手机号码'
                        },
                        phone: {
                            country: 'CN',
                            message: '手机号码格式不正确'
                        }
                    }
                },
                pwd: {
                    validators: {
                        notEmpty: {
                            message: '请输入密码'
                        },
                        identical: {
                            field: 're_pwd',
                            message: '密码不一致'
                        }
                    }
                },
                re_pwd: {
                    validators: {
                        notEmpty: {
                            message: '请确认密码'
                        },
                        identical: {
                            field: 'pwd',
                            message: '密码不一致'
                        }
                    }
                }
            }
        });
    </script>
</rapid:override>

<%@ include file="home.jsp"%>