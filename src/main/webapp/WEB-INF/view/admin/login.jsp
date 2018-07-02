<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>微电影管理系统</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/base/images/logo.png">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/bootstrap/css/bootstrap.min.css">--%>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/fonts/css/font-awesome.min.css">--%>
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/ionicons/css/ionicons.min.css">--%>
    <link href="https://cdn.bootcss.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/dist/css/AdminLTE.min.css">--%>
    <link href="https://cdn.bootcss.com/admin-lte/2.3.3/css/AdminLTE.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/plugins/iCheck/square/blue.css">--%>
    <link href="https://cdn.bootcss.com/iCheck/1.0.1/skins/square/blue.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-validator/0.5.3/css/bootstrapValidator.css" rel="stylesheet">
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href=""><b>微电影管理系统</b></a>
    </div>
    <div class="login-box-body">

        <c:choose>
            <c:when test="${success == true}">
                <p class="login-box-msg" style="color: green;">${msg}</p>
            </c:when>
            <c:when test="${success == false}">
                <p class="login-box-msg" style="color: red;">${msg}</p>
            </c:when>
        </c:choose>

        <form action="${pageContext.request.contextPath}/admin/login" method="post" id="form-data">
            <div class="form-group has-feedback">
                <input name="user" type="text" class="form-control" placeholder="请输入账号！">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                <div class="col-md-12" id="input_user">
                    <span style="color: red"></span>
                </div>
            </div>
            <div class="form-group has-feedback">
                <input name="pwd" type="password" class="form-control" placeholder="请输入密码！">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                <div class="col-md-12" id="input_pwd">
                    <span style="color: red"></span>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-8">
                </div>
                <div class="col-xs-4">
                    <button id="btn-sub" type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%--<script src="${pageContext.request.contextPath}/static/admin/plugins/jQuery/jQuery-2.2.0.min.js"></script>--%>
<script src="https://cdn.bootcss.com/jquery/2.2.0/jquery.min.js"></script>
<%--<script src="${pageContext.request.contextPath}/static/admin/bootstrap/js/bootstrap.min.js"></script>--%>
<link href="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js" rel="stylesheet">
<%--<script src="${pageContext.request.contextPath}/static/admin/plugins/iCheck/icheck.min.js"></script>--%>
<script src="https://cdn.bootcss.com/iCheck/1.0.1/icheck.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
<script>
    $(document).ready(function() {
        $('#form-data').bootstrapValidator({
            fields: {
                user: {
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        }
                    }
                },
                pwd: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                    }
                }
            }
        });
    });
</script>
</body>
</html>
