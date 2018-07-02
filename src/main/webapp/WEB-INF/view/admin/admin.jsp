<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>微电影管理系统</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/base/images/logo.png">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/bootstrap/css/bootstrap.min.css">--%>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/fonts/css/font-awesome.min.css">--%>
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/ionicons/css/ionicons.min.css">--%>
    <link href="https://cdn.bootcss.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/dist/css/AdminLTE.min.css">--%>
    <link href="https://cdn.bootcss.com/admin-lte/2.3.3/css/AdminLTE.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/dist/css/skins/_all-skins.min.css">--%>
    <link href="https://cdn.bootcss.com/admin-lte/2.3.3/css/skins/_all-skins.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/plugins/datepicker/datepicker3.css">
    <link href="https://cdn.bootcss.com/bootstrap-validator/0.5.3/css/bootstrapValidator.css" rel="stylesheet">
    <style>
        *{
            font-family:"Microsoft YaHei";
        }
        .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
            vertical-align:middle;
            text-align:center;
        }
    </style>
    <rapid:block name="css">
    </rapid:block>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <header class="main-header">
        <a href="${pageContext.request.contextPath}/admin/index" class="logo">
            <span class="logo-mini"><img src="${pageContext.request.contextPath}/static/base/images/logo.png" style="height:40px;width:40px;">电影系统</span>
            <span class="logo-lg"><img src="${pageContext.request.contextPath}/static/base/images/logo.png" style="height:40px;width:40px;">微电影管理系统</span>
        </a>
        <nav class="navbar navbar-static-top">
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">下拉菜单</span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="${pageContext.request.contextPath}/static/admin/dist/img/user2-160x160.jpg"
                                 class="user-image" alt="User Image">
                            <span class="hidden-xs">${admin.name}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-header">
                                <img src="${pageContext.request.contextPath}/static/admin/dist/img/user2-160x160.jpg"
                                     class="img-circle" alt="User Image">
                                <p>
                                    ${admin.name}
                                    <small>2017-06-01</small>
                                </p>
                            </li>
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="${pageContext.request.contextPath}/admin/pwd" class="btn btn-default btn-flat">修改密码</a>
                                </div>
                                <div class="pull-right">
                                    <a href="${pageContext.request.contextPath}/admin/login" class="btn btn-default btn-flat">退出系统</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <aside class="main-sidebar">
        <section class="sidebar">
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${pageContext.request.contextPath}/static/admin/dist/img/user2-160x160.jpg" class="img-circle"
                         alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>用户${admin.name}</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                </div>
            </div>
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="搜索...">
                    <span class="input-group-btn">
                        <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i
                                class="fa fa-search"></i>
                        </button>
                    </span>
                </div>
            </form>
            <jsp:include page="grid.jsp"/>
        </section>
    </aside>
    <div class="content-wrapper">
        <!--内容-->
        <rapid:block name="content">
        </rapid:block>
        <!--内容-->
    </div>
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>版本</b> 1.0
        </div>
        <strong>版权 &copy; 2017-2018 归<a href="">okada</a>.</strong> 所有
    </footer>
    <div class="control-sidebar-bg"></div>
</div>
<%--<script src="${pageContext.request.contextPath}/static/admin/plugins/jQuery/jQuery-2.2.0.min.js"></script>--%>
<script src="https://cdn.bootcss.com/jquery/2.2.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/admin/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/admin/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/static/admin/plugins/fastclick/fastclick.js"></script>
<script src="${pageContext.request.contextPath}/static/admin/dist/js/app.min.js"></script>
<script src="${pageContext.request.contextPath}/static/admin/dist/js/demo.js"></script>
<script src="//cdn.bootcss.com/holder/2.9.4/holder.min.js"></script>
<script src="${pageContext.request.contextPath}/static/admin/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/static/admin/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js" charset="UTF-8"></script>
<script src="https://cdn.bootcss.com/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
<%--<script src="https://cdn.bootcss.com/twbs-pagination/1.4.1/jquery.twbsPagination.js"></script>--%>
<script src="https://cdn.bootcss.com/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>
<rapid:block name="js">
</rapid:block>
</body>
</html>