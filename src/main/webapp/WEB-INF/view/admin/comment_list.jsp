<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<rapid:override name="content">
    <section class="content-header">
        <h1>微电影管理系统</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 评论管理</a></li>
            <li class="active">评论列表</li>
        </ol>
    </section>
    <section class="content" id="showcontent">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">评论列表</h3>
                        <div class="box-tools">
                            <div class="input-group input-group-sm" style="width: 150px;">
                                <input type="text" name="table_search" class="form-control pull-right"
                                       placeholder="请输入关键字...">

                                <div class="input-group-btn">
                                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-body box-comments">
                        <jsp:include page="../ui/admin_msg.jsp"/>
                        <c:forEach items="${pageInfo.list}" var="comment">
                        <div class="box-comment">
                            <img class="img-circle img-sm"
                                 src="/upload/img/${comment.user.face}" alt="User Image">
                            <div class="comment-text">
                                    <span class="username">
                                        ${comment.user.name}
                                        <span class="text-muted pull-right">
                                            <i class="fa fa-calendar" aria-hidden="true"></i>
                                            &nbsp;
                                            <fmt:formatDate value="${comment.addTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </span>
                                    </span>
                                关于电影<a>${comment.movie.title}</a>的评论：${comment.content}
                                <br><a href="${pageContext.request.contextPath}/admin/comment/del/${comment.id}" class="label label-danger pull-right">删除</a>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <div class="box-footer clearfix">
                        <ul id="pagination" class="pagination pagination-sm no-margin pull-right"></ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</rapid:override>

<rapid:override name="js">
    <script>
        $(document).ready(function () {
            $("#g-6").addClass("active");
            $("#g-6-1").addClass("active");
        });

        $('#pagination').pagination({
            items: ${pageInfo.getPages()},
            currentPage: ${pageInfo.getPageNum()},
            cssStyle: '',
            prevText: '上一页',
            nextText: '下一页',
            onPageClick: function (page, evt) {
                window.location.href = '${pageContext.request.contextPath}/admin/comment/list?pageNum=' + page;
            }
        });
    </script>
</rapid:override>

<%@ include file="admin.jsp" %>