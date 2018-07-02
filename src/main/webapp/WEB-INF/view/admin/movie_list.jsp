<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<rapid:override name="content">
    <section class="content-header">
        <h1>微电影管理系统</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 电影管理</a></li>
            <li class="active">电影列表</li>
        </ol>
    </section>
    <section class="content" id="showcontent">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">电影列表</h3>
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
                                <th>片名</th>
                                <th>片长</th>
                                <th>标签</th>
                                <th>地区</th>
                                <th>星级</th>
                                <th>播放数量</th>
                                <th>评论数量</th>
                                <th>上映时间</th>
                                <th>操作事项</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="movie">
                            <tr>
                                <td>${movie.id}</td>
                                <td>${movie.title}</td>
                                <td>${movie.length}分钟</td>
                                <td>${movie.tag.name}</td>
                                <td>${movie.area}</td>
                                <td>${movie.star}</td>
                                <td>${movie.playNum}</td>
                                <td>${movie.commentNum}</td>
                                <td><fmt:formatDate value="${movie.releaseTime}" type="date" pattern="yyyy-MM-dd"/></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/movie/edit/${movie.id}" class="label label-success">编辑</a>
                                    &nbsp;
                                    <a href="${pageContext.request.contextPath}/admin/movie/del/${movie.id}" class="label label-danger">删除</a>
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
            $("#g-3").addClass("active");
            $("#g-3-2").addClass("active");

            $('#pagination').pagination({
                items: ${pageInfo.getPages()},
                currentPage: ${pageInfo.getPageNum()},
                cssStyle: '',
                prevText: '上一页',
                nextText: '下一页',
                onPageClick: function (page, evt) {
                    window.location.href = '${pageContext.request.contextPath}/admin/movie/list?pageNum=' + page;
                }
            });
        });
    </script>
</rapid:override>

<%@ include file="admin.jsp" %>