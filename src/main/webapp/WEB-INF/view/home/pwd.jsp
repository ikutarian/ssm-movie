<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="css">
    <style>
        .col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9{
            padding-right: 3px;
            padding-left: 3px;
        }
    </style>
</rapid:override>

<rapid:override name="content">

    <jsp:include page="menu.jsp"/>

    <div class="col-md-9">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <h3 class="panel-title"><span class="glyphicon glyphicon-map-marker"></span>&nbsp;会员中心</h3>
            </div>
            <div class="panel-body">
                <form id="form-data" action="${pageContext.request.contextPath}/pwd" method="post" role="form">
                    <jsp:include page="../ui/admin_msg.jsp"/>
                    <fieldset>
                        <div class="form-group">
                            <label for="input_oldpwd"><span class="glyphicon glyphicon-lock"></span>&nbsp;旧密码</label>
                            <input id="input_oldpwd" class="form-control" placeholder="旧密码" name="old_pwd" type="password" autofocus>
                        </div>
                        <div class="col-md-12" id="error_oldpwd"></div>
                        <div class="form-group">
                            <label for="input_newpwd"><span class="glyphicon glyphicon-lock"></span>&nbsp;新密码</label>
                            <input id="input_newpwd" class="form-control" placeholder="新密码" name="new_pwd" type="password" autofocus>
                        </div>
                        <div class="col-md-12" id="error_newpwd"></div>
                        <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-edit"></span>&nbsp;修改密码</button>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</rapid:override>

<rapid:override name="js">
    <script>
        $(document).ready(function(){
            $("#m-2").addClass("active");

            $('#form-data').bootstrapValidator({
                fields: {
                    old_pwd: {
                        validators: {
                            notEmpty: {
                                message: '请输入旧密码'
                            }
                        }
                    },
                    new_pwd: {
                        validators: {
                            notEmpty: {
                                message: '请输入新密码'
                            }
                        }
                    }
                }
            });
        });
    </script>
</rapid:override>

<%@ include file="home.jsp"%>