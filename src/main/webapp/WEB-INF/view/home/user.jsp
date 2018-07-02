<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
                <jsp:include page="../ui/admin_msg.jsp"/>
                <form id="form-data" action="${pageContext.request.contextPath}/user" method="post" enctype="multipart/form-data" role="form">
                    <fieldset>
                        <div class="form-group">
                            <label for="input_name"><span class="glyphicon glyphicon-user"></span>&nbsp;昵称</label>
                            <input id="input_name" class="form-control" placeholder="昵称" name="name" type="text" autofocus value="${user.name}">
                        </div>
                        <div class="col-md-12" id="error_name"></div>
                        <div class="form-group">
                            <label for="input_email"><span class="glyphicon glyphicon-envelope"></span>&nbsp;邮箱</label>
                            <input id="input_email" class="form-control" placeholder="邮箱" name="email" type="email" autofocus value="${user.email}">
                        </div>
                        <div class="col-md-12" id="error_email"></div>
                        <div class="form-group">
                            <label for="input_phone"><span class="glyphicon glyphicon-phone"></span>&nbsp;手机</label>
                            <input id="input_phone" class="form-control" placeholder="手机" name="phone" type="text" autofocus value="${user.phone}">
                        </div>
                        <div class="col-md-12" id="error_phone"></div>
                        <div class="form-group">
                            <label for="input_face"><span class="glyphicon glyphicon-picture"></span>&nbsp;头像</label>
                            <input name="face" type="file" id="input_face">
                            <c:choose>
                                <c:when test="${user.face == null}">
                                    <img data-src="holder.js/100x100" class="img-responsive img-rounded">
                                </c:when>
                                <c:otherwise>
                                    <img src="/upload/img/${user.face}" style="width: 100px;height: 100px;" class="img-responsive img-rounded">
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="col-md-12" id="error_face"></div>
                        <div class="form-group">
                            <label for="input_info"><span class="glyphicon glyphicon-edit"></span>&nbsp;简介</label>
                            <textarea name="info" class="form-control" rows="10" id="input_info">${user.info}</textarea>
                        </div>
                        <div class="col-md-12" id="error_info"></div>
                        <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-saved"></span>&nbsp;保存修改</button>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</rapid:override>

<rapid:override name="js">
    <script>
        $(document).ready(function(){
            $("#m-1").addClass("active");
        });

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
                }
            }
        });
    </script>
</rapid:override>

<%@ include file="home.jsp"%>