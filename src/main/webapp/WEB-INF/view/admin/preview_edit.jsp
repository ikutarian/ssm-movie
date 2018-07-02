<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="content">
    <section class="content-header">
        <h1>微电影管理系统</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 预告管理</a></li>
            <li class="active">添加预告</li>
        </ol>
    </section>
    <section class="content" id="showcontent">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">添加预告</h3>
                    </div>
                    <form id="form-data" role="form" action="${pageContext.request.contextPath}/admin/preview/edit" method="post" enctype="multipart/form-data">
                        <div class="box-body">
                            <jsp:include page="../ui/admin_msg.jsp"/>
                            <input type="hidden" name="id" value="${preview.id}"/>
                            <div class="form-group">
                                <label for="input_title">预告标题</label>
                                <input name="title" value="${preview.title}" type="text" class="form-control" id="input_title" placeholder="请输入预告标题！">
                            </div>
                            <div class="form-group">
                                <label for="input_logo">预告封面</label>
                                <input name="logo" type="file" id="input_logo">
                                <img src="/upload/preview/${preview.logo}" style="margin-top:5px;" class="img-responsive"
                                     alt="">
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
            $("#g-4").addClass("active");
            $("#g-4-2").addClass("active");


            $('#form-data').bootstrapValidator({
                fields: {
                    title: {
                        validators: {
                            notEmpty: {
                                message: '片名不能为空'
                            }
                        }
                    }
                }
            });
        });
    </script>
</rapid:override>

<%@ include file="admin.jsp" %>