<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="content">
    <section class="content-header">
        <h1>微电影管理系统</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 权限管理</a></li>
            <li class="active">修改权限</li>
        </ol>
    </section>
    <section class="content" id="showcontent">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">修改权限</h3>
                    </div>
                    <form id="form-data" action="${pageContext.request.contextPath}/admin/auth/edit"  method="post" role="form">
                        <jsp:include page="../ui/admin_msg.jsp"/>
                        <input type="hidden" name="id" value="${auth.id}"/>
                        <div class="box-body">
                            <div class="form-group">
                                <label for="input_name">权限名称</label>
                                <input name="name" value="${auth.name}" type="text" class="form-control" id="input_name" placeholder="请输入权限名称！">
                            </div>
                            <div class="form-group">
                                <label for="input_url">权限地址</label>
                                <input name="url" value="${auth.url}" type="text" class="form-control" id="input_url" placeholder="请输入权限地址！">
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">修改</button>
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
            $("#g-9").addClass("active");
            $("#g-9-2").addClass("active");
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
                url: {
                    validators: {
                        notEmpty: {
                            message: 'url不能为空'
                        }
                    }
                }
            }
        });
    </script>
</rapid:override>

<%@ include file="admin.jsp" %>