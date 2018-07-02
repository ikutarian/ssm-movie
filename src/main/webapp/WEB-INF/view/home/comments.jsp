<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
                <h3 class="panel-title"><span class="glyphicon glyphicon-map-marker"></span>&nbsp;评论记录</h3>
            </div>
            <div class="panel-body">
                <ul class="commentList">
                    <c:forEach items="${pageInfo.list}" var="comment">
                    <li class="item cl">
                        <a>
                            <i class="avatar size-L radius">
                                <img alt="50x50" src="/upload/img/${comment.user.face}" class="img-circle" style="border:1px solid #abcdef;width: 50px;height: 50px">
                            </i>
                        </a>
                        <div class="comment-main">
                            <header class="comment-header">
                                <div class="comment-meta">
                                    <a class="comment-author">${comment.user.name}</a>
                                    评论于
                                    <time title="<fmt:formatDate value="${comment.addTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>"
                                          datetime="<fmt:formatDate value="${comment.addTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>">
                                        <fmt:formatDate value="${comment.addTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    </time>
                                </div>
                            </header>
                            <div class="comment-body">
                                <p>${comment.content}</p>
                            </div>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
                <div class="col-md-12 text-center">
                    <nav aria-label="Page navigation">
                        <ul id="pagination" class="pagination"></ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</rapid:override>

<rapid:override name="js">
    <script>
        $(document).ready(function(){
            $("#m-3").addClass("active");

            $(document).ready(function () {
                $('#pagination').pagination({
                    items: ${pageInfo.getPages()},
                    currentPage: ${pageInfo.getPageNum()},
                    cssStyle: '',
                    prevText: '上一页',
                    nextText: '下一页',
                    onPageClick: function (page, evt) {
                        window.location.href = '${pageContext.request.contextPath}/comments?pageNum=' + page;
                    }
                });
            });
        });
    </script>
</rapid:override>

<%@ include file="home.jsp"%>