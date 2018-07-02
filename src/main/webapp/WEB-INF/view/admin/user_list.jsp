<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<rapid:override name="content">
    <section class="content-header">
        <h1>微电影管理系统</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 会员管理</a></li>
            <li class="active">会员列表</li>
        </ol>
    </section>
    <section class="content" id="showcontent">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">会员列表</h3>
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
                    <div class="box-body table-responsive no-padding">
                        <jsp:include page="../ui/admin_msg.jsp"/>
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th>编号</th>
                                <th>昵称</th>
                                <th>邮箱</th>
                                <th>手机</th>
                                <th>头像</th>
                                <th>状态</th>
                                <th>注册时间</th>
                                <th>操作事项</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="user">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.name}</td>
                                <td>${user.email}</td>
                                <td>${user.phone}</td>
                                <td>
                                    <img src="/upload/img/${user.face}" style="width: 50px;height: 50px;" class="img-responsive center-block" alt="">
                                </td>
                                <td>正常/冻结</td>
                                <td><fmt:formatDate value="${user.addTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>
                                    <a class="label label-success" href="${pageContext.request.contextPath}/admin/user/view/${user.id}">查看</a>
                                    &nbsp;
                                    <a class="label label-info">解冻</a>
                                    &nbsp;
                                    <a class="label label-warning">冻结</a>
                                    &nbsp;
                                    <a class="label label-danger" href="${pageContext.request.contextPath}/admin/user/del/${user.id}">删除</a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
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
            $("#g-5").addClass("active");
            $("#g-5-1").addClass("active");

            $('#pagination').pagination({
                items: ${pageInfo.getPages()},
                currentPage: ${pageInfo.getPageNum()},
                cssStyle: '',
                prevText: '上一页',
                nextText: '下一页',
                onPageClick: function (page, evt) {
                    window.location.href = '${pageContext.request.contextPath}/admin/user/list?pageNum=' + page;
                }
            });
        });
    </script>
</rapid:override>

<%@ include file="admin.jsp" %>