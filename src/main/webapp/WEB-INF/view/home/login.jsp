<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<rapid:override name="content">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><span class="glyphicon glyphicon-log-in"></span>&nbsp;会员登录</h3>
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
                    <form id="form-data" action="${pageContext.request.contextPath}/login" method="post" role="form">
                        <fieldset>
                            <div class="form-group">
                                <label for="input_contact"><span class="glyphicon glyphicon-user"></span>&nbsp;账号</label>
                                <input id="input_contact" class="form-control input-lg" placeholder="账号" name="name" type="text" autofocus>
                            </div>
                            <div class="col-md-12" id="error_contact"></div>
                            <div class="form-group">
                                <label for="input_password"><span class="glyphicon glyphicon-lock"></span>&nbsp;密码</label>
                                <input id="input_password" class="form-control input-lg" placeholder="密码" name="pwd" type="password" value="">
                            </div>
                            <div class="col-md-12" id="error_password"></div>
                            <button type="submit" class="btn btn-lg btn-success btn-block">登录</button>
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
                            message: '请输入账号'
                        }
                    }
                },
                pwd: {
                    validators: {
                        notEmpty: {
                            message: '请输入密码'
                        }
                    }
                }
            }
        });
    </script>
</rapid:override>

<%@ include file="home.jsp"%>