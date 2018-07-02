<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<rapid:override name="css">
    <style>
        #auth_list .col-md-12,#auth_list .col-md-2{
            padding:0px;
        }
    </style>
</rapid:override>

<rapid:override name="content">
    <section class="content-header">
        <h1>微电影管理系统</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 角色管理</a></li>
            <li class="active">添加角色</li>
        </ol>
    </section>
    <section class="content" id="showcontent">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">添加角色</h3>
                    </div>
                    <form id="form-data" action="${pageContext.request.contextPath}/admin/role/add" method="post" role="form">
                        <jsp:include page="../ui/admin_msg.jsp"/>
                        <div class="box-body">
                            <div class="form-group">
                                <label for="input_name">角色名称</label>
                                <input name="name" type="text" class="form-control" id="input_name" placeholder="请输入角色名称！">
                            </div>
                            <div class="form-group" id="auth_list">
                                <div class="col-md-12">
                                    <label>操作权限</label>
                                </div>
                                <c:forEach items="${authList}" var="auth">
                                <div class="col-md-2">
                                    <label>
                                        <input type="checkbox" name="authList" value="${auth.id}"> ${auth.name}
                                    </label>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">添加</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</rapid:override>

<rapid:override name="js">
    <script>
        $(document).ready(function () {
            $("#g-10").addClass("active");
            $("#g-10-1").addClass("active");
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
                authList: {
                    validators: {
                        notEmpty: {
                            message: '请选择权限'
                        }
                    }
                }
            }
        });
    </script>
</rapid:override>

<%@ include file="admin.jsp" %>