<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-3">
    <div class="list-group">
        <a id="m-1" href="${pageContext.request.contextPath}/user" class="list-group-item">
            <span class="glyphicon glyphicon-user"></span>&nbsp;会员中心
        </a>
        <a id="m-2" href="${pageContext.request.contextPath}/pwd" class="list-group-item">
            <span class="glyphicon glyphicon-lock"></span>&nbsp;修改密码
        </a>
        <a id="m-3" href="${pageContext.request.contextPath}/comments" class="list-group-item">
            <span class="glyphicon glyphicon-comment"></span>&nbsp;评论记录
        </a>
        <a id="m-4" href="${pageContext.request.contextPath}/loginlog" class="list-group-item">
            <span class="glyphicon glyphicon-calendar"></span>&nbsp;登录日志
        </a>
        <a id="m-5" href="${pageContext.request.contextPath}/moviecol" class="list-group-item">
            <span class="glyphicon glyphicon-heart"></span>&nbsp;收藏电影
        </a>
    </div>
</div>