<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>微电影</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/base/images/logo.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/bootstrap-movie.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/base/css/animate.css">
    <link href="https://cdn.bootcss.com/bootstrap-validator/0.5.3/css/bootstrapValidator.css" rel="stylesheet">
    <style>
        .navbar-brand>img {
            display: inline;
        }
        .media{
            padding:3px;
            border:1px solid #ccc
        }
    </style>
    <rapid:block name="css">
    </rapid:block>
</head>

<body>
<!--导航-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!--小屏幕导航按钮和logo-->
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="${pageContext.request.contextPath}/index" class="navbar-brand" style="width:250px;">
                <img src="${pageContext.request.contextPath}/static/base/images/logo.png" style="height:30px;">&nbsp;微电影
            </a>
        </div>
        <!--小屏幕导航按钮和logo-->
        <!--导航-->
        <div class="navbar-collapse collapse">
            <form class="navbar-form navbar-left" role="search" style="margin-top:18px;">
                <div class="form-group input-group">
                    <input type="text" class="form-control" placeholder="请输入电影名！" id="key_movie">
                    <span class="input-group-btn">
                        <a class="btn btn-default" id="do_search"><span class="glyphicon glyphicon-search"></span>&nbsp;搜索</a>
                    </span>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="curlink" href="${pageContext.request.contextPath}/index"><span class="glyphicon glyphicon-film"></span>&nbsp;电影</a>
                </li>
                <li>
                    <a class="curlink" href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span>&nbsp;登录</a>
                </li>
                <li>
                    <a class="curlink" href="${pageContext.request.contextPath}/register"><span class="glyphicon glyphicon-plus"></span>&nbsp;注册</a>
                </li>
                <li>
                    <a class="curlink" href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-out"></span>&nbsp;退出</a>
                </li>
                <li>
                    <a class="curlink" href="${pageContext.request.contextPath}/user"><span class="glyphicon glyphicon-user"></span>&nbsp;会员</a>
                </li>
            </ul>
        </div>
        <!--导航-->

    </div>
</nav>
<!--导航-->
<!--内容-->
<div class="container" style="margin-top:76px">
    <rapid:block name="content">

    </rapid:block>
</div>
<!--内容-->
<!--底部-->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p>
                    ©&nbsp;2017&nbsp;movie.com&nbsp;京ICP备 13046642号-2
                </p>
            </div>
        </div>
    </div>
</footer>
<!--底部-->
<script src="${pageContext.request.contextPath}/static/base/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/base/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/base/js/jquery.singlePageNav.min.js"></script>
<script src="${pageContext.request.contextPath}/static/base/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/static/lazyload/jquery.lazyload.min.js"></script>
<script src="https://cdn.bootcss.com/holder/2.9.4/holder.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-validator/0.5.3/js/language/zh_CN.js"></script>
<script src="https://cdn.bootcss.com/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>
<script>
    $(function() {
        new WOW().init();
    })

</script>
<script>
    $(document).ready(function() {
        $("img.lazy").lazyload({
            effect: "fadeIn"
        });

        $("#do_search").click(function () {
            var key = $("#key_movie").val();
            window.location.href = "${pageContext.request.contextPath}/search?key=" + key;
        });
    });

</script>
<rapid:block name="js">
</rapid:block>
</body>
</html>
