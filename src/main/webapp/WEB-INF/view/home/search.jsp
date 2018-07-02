<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<rapid:override name="content">
<div class="row">
    <div class="col-md-12">
        <ol class="breadcrumb" style="margin-top:6px;">
            <li>与"${key}"有关的电影，共${pageInfo.getTotal()}部</li>
        </ol>
    </div>

    <div class="col-md-12">
        <c:forEach items="${pageInfo.list}" var="movie">
        <div class="media">
            <div class="media-left">
                <a href="${pageContext.request.contextPath}/play/${movie.id}">
                    <img class="media-object" src="/upload/img/${movie.logo}" style="width: 131px;height: 83px;" alt="${movie.title}">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading">${movie.title}<a href="${pageContext.request.contextPath}/play/${movie.id}" class="label label-primary pull-right"><span class="glyphicon glyphicon-play"></span>播放影片</a></h4>
                ${movie.info}
            </div>
        </div>
        </c:forEach>
    </div>

    <div class="col-md-12 text-center">
        <nav aria-label="Page navigation">
            <ul id="pagination" class="pagination"></ul>
        </nav>
    </div>
</div>
</rapid:override>

<rapid:override name="js">
    <script>
        $(document).ready(function () {
            $('#pagination').pagination({
                items: ${pageInfo.getPages()},
                currentPage: ${pageInfo.getPageNum()},
                cssStyle: '',
                prevText: '上一页',
                nextText: '下一页',
                onPageClick: function (page, evt) {
                    window.location.href = '${pageContext.request.contextPath}/search?key=' + ${key};
                }
            });
        });
    </script>
</rapid:override>

<%@ include file="home.jsp"%>