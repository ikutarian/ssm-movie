<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<rapid:override name="content">
    <section class="content-header">
        <h1>微电影管理系统</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 标签管理</a></li>
            <li class="active">添加标签</li>
        </ol>
    </section>
    <section class="content" id="showcontent">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">添加标签</h3>
                    </div>
                    <form role="form" action="${pageContext.request.contextPath}/admin/tag/add" method="post" id="form-data">
                        <div class="box-body">
                            <jsp:include page="../ui/admin_msg.jsp"/>
                            <div class="form-group">
                                <label for="tag_name">标签名称</label>
                                <input name="name" type="text" class="form-control" id="tag_name" placeholder="请输入标签名称！">
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
            $("#g-2").addClass("active");
            $("#g-2-1").addClass("active");
        });

        $(document).ready(function() {
            $('#form-data').bootstrapValidator({
                fields: {
                    name: {
                        validators: {
                            notEmpty: {
                                message: '标签名不能为空'
                            }
                        }
                    }
                }
            });
        });
    </script>
</rapid:override>

<%@ include file="admin.jsp" %>