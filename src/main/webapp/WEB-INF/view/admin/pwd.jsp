<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="content">
<section class="content-header">
    <h1>微电影管理系统</h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 个人资料</a></li>
        <li class="active">修改密码</li>
    </ol>
</section>
<section class="content" id="showcontent">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">修改密码</h3>
                </div>
                <form id="form-data" role="form" action="${pageContext.request.contextPath}/admin/pwd" method="post">
                    <div class="box-body">
                        <jsp:include page="../ui/admin_msg.jsp"/>
                        <div class="form-group">
                            <label for="input_pwd">旧密码</label>
                            <input name="old_pwd" type="password" class="form-control" id="input_pwd" placeholder="请输入旧密码！">
                        </div>
                        <div class="form-group">
                            <label for="input_newpwd">新密码</label>
                            <input name="new_pwd" type="password" class="form-control" id="input_newpwd" placeholder="请输入新密码！">
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

<%@ include file="admin.jsp"%>