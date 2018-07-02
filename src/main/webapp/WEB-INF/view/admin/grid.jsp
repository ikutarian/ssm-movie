<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="sidebar-menu">
    <li class="header">管理菜单</li>
    <li class="treeview" id="g-1">
        <a href="#">
            <i class="fa fa-home" aria-hidden="true"></i>
            <span>首页</span>
            <span class="label label-primary pull-right">1</span>
        </a>
        <ul class="treeview-menu">
            <li id="g-1-1">
                <a href="${pageContext.request.contextPath}/admin/index">
                    <i class="fa fa-circle-o"></i> 控制面板
                </a>
            </li>
        </ul>
    </li>
    <li class="treeview" id="g-2">
        <a href="#">
            <i class="fa fa-tags" aria-hidden="true"></i>
            <span>标签管理</span>
            <span class="label label-primary pull-right">2</span>
        </a>
        <ul class="treeview-menu">
            <li id="g-2-1">
                <a href="${pageContext.request.contextPath}/admin/tag/add">
                    <i class="fa fa-circle-o"></i> 添加标签
                </a>
            </li>
            <li id="g-2-2">
                <a href="${pageContext.request.contextPath}/admin/tag/list">
                    <i class="fa fa-circle-o"></i> 标签列表
                </a>
            </li>
        </ul>
    </li>
    <li class="treeview" id="g-3">
        <a href="#">
            <i class="fa fa-file-video-o" aria-hidden="true"></i>
            <span>电影管理</span>
            <span class="label label-primary pull-right">2</span>
        </a>
        <ul class="treeview-menu">
            <li id="g-3-1">
                <a href="${pageContext.request.contextPath}/admin/movie/add">
                    <i class="fa fa-circle-o"></i> 添加电影
                </a>
            </li>
            <li id="g-3-2">
                <a href="${pageContext.request.contextPath}/admin/movie/list">
                    <i class="fa fa-circle-o"></i> 电影列表
                </a>
            </li>
        </ul>
    </li>
    <li class="treeview" id="g-4">
        <a href="#">
            <i class="fa fa-film" aria-hidden="true"></i>
            <span>预告管理</span>
            <span class="label label-primary pull-right">2</span>
        </a>
        <ul class="treeview-menu">
            <li id="g-4-1">
                <a href="${pageContext.request.contextPath}/admin/preview/add">
                    <i class="fa fa-circle-o"></i> 添加预告
                </a>
            </li>
            <li id="g-4-2">
                <a href="${pageContext.request.contextPath}/admin/preview/list">
                    <i class="fa fa-circle-o"></i> 预告列表
                </a>
            </li>
        </ul>
    </li>
    <li class="treeview" id="g-5">
        <a href="#">
            <i class="fa fa-users" aria-hidden="true"></i>
            <span>会员管理</span>
            <span class="label label-primary pull-right">1</span>
        </a>
        <ul class="treeview-menu">
            <li id="g-5-1">
                <a href="${pageContext.request.contextPath}/admin/user/list">
                    <i class="fa fa-circle-o"></i> 会员列表
                </a>
            </li>
        </ul>
    </li>
    <li class="treeview" id="g-6">
        <a href="#">
            <i class="fa fa-comments" aria-hidden="true"></i>
            <span>评论管理</span>
            <span class="label label-primary pull-right">1</span>
        </a>
        <ul class="treeview-menu">
            <li id="g-6-1">
                <a href="${pageContext.request.contextPath}/admin/comment/list">
                    <i class="fa fa-circle-o"></i> 评论列表
                </a>
            </li>
        </ul>
    </li>
    <li class="treeview" id="g-7">
        <a href="#">
            <i class="fa fa-heart" aria-hidden="true"></i>
            <span>收藏管理</span>
            <span class="label label-primary pull-right">1</span>
        </a>
        <ul class="treeview-menu">
            <li id="g-7-1">
                <a href="${pageContext.request.contextPath}/admin/moviecol/list">
                    <i class="fa fa-circle-o"></i> 收藏列表
                </a>
            </li>
        </ul>
    </li>
    <li class="treeview" id="g-8">
        <a href="#">
            <i class="fa fa-file-text" aria-hidden="true"></i>
            <span>日志管理</span>
            <span class="label label-primary pull-right">3</span>
        </a>
        <ul class="treeview-menu">
            <li id="g-8-1">
                <a href="${pageContext.request.contextPath}/admin/oplog/list">
                    <i class="fa fa-circle-o"></i> 操作日志列表
                </a>
            </li>
            <li id="g-8-2">
                <a href="${pageContext.request.contextPath}/admin/adminloginlog/list">
                    <i class="fa fa-circle-o"></i> 管理员登录日志列表
                </a>
            </li>
            <li id="g-8-3">
                <a href="${pageContext.request.contextPath}/admin/userloginlog/list">
                    <i class="fa fa-circle-o"></i> 会员登录日志列表
                </a>
            </li>
        </ul>
    </li>
    <li class="treeview" id="g-9">
        <a href="#">
            <i class="fa fa-lock" aria-hidden="true"></i>
            <span>权限管理</span>
            <span class="label label-primary pull-right">2</span>
        </a>
        <ul class="treeview-menu">
            <li id="g-9-1">
                <a href="${pageContext.request.contextPath}/admin/auth/add">
                    <i class="fa fa-circle-o"></i> 添加权限
                </a>
            </li>
            <li id="g-9-2">
                <a href="${pageContext.request.contextPath}/admin/auth/list">
                    <i class="fa fa-circle-o"></i> 权限列表
                </a>
            </li>
        </ul>
    </li>
    <li class="treeview" id="g-10">
        <a href="#">
            <i class="fa fa-user-secret" aria-hidden="true"></i>
            <span>角色管理</span>
            <span class="label label-primary pull-right">2</span>
        </a>
        <ul class="treeview-menu">
            <li id="g-10-1">
                <a href="${pageContext.request.contextPath}/admin/role/add">
                    <i class="fa fa-circle-o"></i> 添加角色
                </a>
            </li>
            <li id="g-10-2">
                <a href="${pageContext.request.contextPath}/admin/role/list">
                    <i class="fa fa-circle-o"></i> 角色列表
                </a>
            </li>
        </ul>
    </li>
    <li class="treeview" id="g-11">
        <a href="#">
            <i class="fa fa-user-circle" aria-hidden="true"></i>
            <span>管理员管理</span>
            <span class="label label-primary pull-right">2</span>
        </a>
        <ul class="treeview-menu">
            <li id="g-11-1">
                <a href="${pageContext.request.contextPath}/admin/admin/add">
                    <i class="fa fa-circle-o"></i> 添加管理员
                </a>
            </li>
            <li id="g-11-2">
                <a href="${pageContext.request.contextPath}/admin/admin/list">
                    <i class="fa fa-circle-o"></i> 管理员列表
                </a>
            </li>
        </ul>
    </li>
</ul>