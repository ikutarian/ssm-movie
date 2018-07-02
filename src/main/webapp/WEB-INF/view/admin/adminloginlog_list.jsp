<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<rapid:override name="content">
    <section class="content-header">
        <h1>微电影管理系统</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 日志管理</a></li>
            <li class="active">管理员登录日志列表</li>
        </ol>
    </section>
    <section class="content" id="showcontent">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">管理员登录日志列表</h3>
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
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th>编号</th>
                                <th>管理员</th>
                                <th>登录时间</th>
                                <th>登录IP</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="log">
                            <tr>
                                <td>${log.id}</td>
                                <td>${log.admin.name}</td>
                                <td><fmt:formatDate value="${log.addTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>${log.ip}</td>
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
            $("#g-8").addClass("active");
            $("#g-8-2").addClass("active");
        });

        $('#pagination').pagination({
            items: ${pageInfo.getPages()},
            currentPage: ${pageInfo.getPageNum()},
            cssStyle: '',
            prevText: '上一页',
            nextText: '下一页',
            onPageClick: function (page, evt) {
                window.location.href = '${pageContext.request.contextPath}/admin/adminloginlog/list?pageNum=' + page;
            }
        });
    </script>
</rapid:override>

<%@ include file="admin.jsp" %>