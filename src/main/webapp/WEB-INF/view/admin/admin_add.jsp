<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<rapid:override name="content">
    <section class="content-header">
        <h1>微电影管理系统</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 管理员管理</a></li>
            <li class="active">添加管理员</li>
        </ol>
    </section>
    <section class="content" id="showcontent">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">添加管理员</h3>
                    </div>
                    <form id="form-data" action="${pageContext.request.contextPath}/admin/admin/add" method="post" role="form">
                        <div class="box-body">
                            <jsp:include page="../ui/admin_msg.jsp"/>
                            <div class="form-group">
                                <label for="input_name">管理员名称</label>
                                <input name="name" type="text" class="form-control" id="input_name" placeholder="请输入管理员名称！">
                            </div>
                            <div class="form-group">
                                <label for="input_pwd">管理员密码</label>
                                <input name="pwd" type="password" class="form-control" id="input_pwd" placeholder="请输入管理员密码！">
                            </div>
                            <div class="form-group">
                                <label for="input_re_pwd">管理员重复密码</label>
                                <input name="re_pwd" type="password" class="form-control" id="input_re_pwd"
                                       placeholder="请输入管理员重复密码！">
                            </div>
                            <div class="form-group">
                                <label for="input_role_id">所属角色</label>
                                <select name="role" class="form-control" id="input_role_id">
                                    <option value="">---请选择所属角色---</option>
                                    <c:forEach var="role" items="${roleList}">
                                        <option value="${role.id}">${role.name}</option>
                                    </c:forEach>
                                </select>
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
            $("#g-11").addClass("active");
            $("#g-11-1").addClass("active");

            $('#form-data').bootstrapValidator({
                fields: {
                    name: {
                        validators: {
                            notEmpty: {
                                message: '管理员名称不能为空'
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
                                message: '请输入确认密码'
                            },
                            identical: {
                                field: 'pwd',
                                message: '密码不一致'
                            }
                        }
                    }
                }
            });
        });
    </script>
</rapid:override>

<%@ include file="admin.jsp" %>