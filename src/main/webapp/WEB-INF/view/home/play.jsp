<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<rapid:override name="css">
    <!--播放页面-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jwplayer/skins/stormtrooper.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script>
        SyntaxHighlighter.all();
    </script>
    <!--播放页面-->
    <style>
        .col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {
            padding-right: 3px;
            padding-left: 3px;
        }
    </style>
</rapid:override>

<rapid:override name="content">
    <div class="row">
        <div class="col-md-8">
            <div id="moviecontainer"></div>
        </div>
        <div class="col-md-4" style="height:500px;">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><span class="glyphicon glyphicon-facetime-video"></span>&nbsp;电影介绍</h3>
                </div>
                <div class="panel-body" style="height:459px;">
                    <table class="table">
                        <tr>
                            <td style="width:30%;color:#ccc;font-weight:bold;font-style:italic;">
                                <span class="glyphicon glyphicon-film"></span>&nbsp;片名
                            </td>
                            <td>${movie.title}</td>
                        </tr>
                        <tr>
                            <td style="color:#ccc;font-weight:bold;font-style:italic;">
                                <span class="glyphicon glyphicon-tag"></span>&nbsp;标签
                            </td>
                            <td>${movie.tag.name}</td>
                        </tr>
                        <tr>
                            <td style="color:#ccc;font-weight:bold;font-style:italic;">
                                <span class="glyphicon glyphicon-time"></span>&nbsp;片长
                            </td>
                            <td>${movie.length}</td>
                        </tr>
                        <tr>
                            <td style="color:#ccc;font-weight:bold;font-style:italic;">
                                <span class="glyphicon glyphicon-map-marker"></span>&nbsp;地区
                            </td>
                            <td>${movie.area}</td>
                        </tr>
                        <tr>
                            <td style="color:#ccc;font-weight:bold;font-style:italic;">
                                <span class="glyphicon glyphicon-star"></span>&nbsp;星级
                            </td>
                            <td>
                                <div>
                                    <c:forEach var="s" begin="1" end="5" step="1">
                                        <c:choose>
                                            <c:when test="${s <= movie.star}"><span class="glyphicon glyphicon-star" style="color:#FFD119"></span></c:when>
                                            <c:otherwise><span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span></c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="color:#ccc;font-weight:bold;font-style:italic;">
                                <span class="glyphicon glyphicon-calendar"></span>&nbsp;上映时间
                            </td>
                            <td><fmt:formatDate value="${movie.releaseTime}" type="date" pattern="yyyy-MM-dd"/></td>
                        </tr>
                        <tr>
                            <td style="color:#ccc;font-weight:bold;font-style:italic;">
                                <span class="glyphicon glyphicon-play"></span>&nbsp;播放数量
                            </td>
                            <td>${movie.playNum}</td>
                        </tr>
                        <tr>
                            <td style="color:#ccc;font-weight:bold;font-style:italic;">
                                <span class="glyphicon glyphicon-comment"></span>&nbsp;评论数量
                            </td>
                            <td>${movie.commentNum}</td>
                        </tr>
                        <tr>
                            <td style="color:#ccc;font-weight:bold;font-style:italic;">
                                <span class="glyphicon glyphicon-picture"></span>&nbsp;影片介绍
                            </td>
                            <td>
                                ${movie.info}
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-12" style="margin-top:6px;">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span>&nbsp;电影评论</h3>
                </div>
                <div class="panel-body">
                    <c:if test="${hasLogin != true}">
                    <div class="alert alert-danger alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert">
                            <span aria-hidden="true">×</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>请先<a href="${pageContext.request.contextPath}/login" target="_blank" class="text-info">登录</a>，才可参与评论！</strong>
                    </div>
                    </c:if>
                    <ol class="breadcrumb" style="margin-top:6px;">
                        <li>全部评论(${pageInfo.getTotal()})</li>
                    </ol>
                    <c:if test="${hasLogin == true}">
                    <form id="form-data" method="post" role="form" style="margin-bottom:6px;">
                        <div class="form-group">
                            <div>
                                <label for="input_content">内容</label>
                                <textarea name="content" id="input_content"></textarea>
                            </div>
                            <div class="col-xs-12" id="error_content">
                                <c:choose>
                                    <c:when test="${success == true}">
                                        <p style="color: green;">${msg}</p>
                                    </c:when>
                                    <c:when test="${success == false}">
                                        <p style="color: red;">${msg}</p>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success" id="btn-sub"><span class="glyphicon glyphicon-edit"></span>&nbsp;提交评论</button>
                        &nbsp;
                        <a class="btn btn-danger" id="btn-col"><span class="glyphicon glyphicon-heart"></span>&nbsp;收藏电影</a>
                    </form>
                    <div class="col-md-12">
                        <span style="color: green;" id="show_col_msg"></span>
                    </div>
                    <div class="clearfix"></div>
                    </c:if>

                    <c:forEach items="${pageInfo.list}" var="comment">
                    <ul class="commentList">
                        <li class="item cl">
                            <a>
                                <i class="avatar size-L radius">
                                    <img alt="50x50" src="/upload/img/${comment.user.face}" class="img-circle"
                                         style="border:1px solid #abcdef;width: 50px;height: 50px">
                                </i>
                            </a>
                            <div class="comment-main">
                                <header class="comment-header">
                                    <div class="comment-meta">
                                        <a class="comment-author">${comment.user.name}</a>
                                        评论于
                                        <time title="<fmt:formatDate value="${comment.addTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>" datetime="<fmt:formatDate value="${comment.addTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>">2017-03-01
                                            <fmt:formatDate value="${comment.addTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </time>
                                    </div>
                                </header>
                                <div class="comment-body">
                                    <p>${comment.content}</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                    </c:forEach>
                    <div class="col-md-12 text-center">
                        <nav aria-label="Page navigation">
                            <ul id="pagination" class="pagination"></ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</rapid:override>

<rapid:override name="js">
    <!--播放页面-->
    <script src="${pageContext.request.contextPath}/static/jwplayer/jwplayer.js"></script>
    <script>
        var ue = UE.getEditor('input_content',{
            toolbars: [
                ['fullscreen', 'emotion', 'preview', 'link']
            ],
            initialFrameWidth:"100%",
            initialFrameHeight:"100",
        });
    </script>
    <script type="text/javascript">
        jwplayer.key = "P9VTqT/X6TSP4gi/hy1wy23BivBhjdzVjMeOaQ==";
    </script>
    <script type="text/javascript">
        jwplayer("moviecontainer").setup({
            flashplayer: "${pageContext.request.contextPath}/static/jwplayer/jwplayer.flash.swf",
            playlist: [{
                file: "/upload/movie/${movie.url}",
                title: "${movie.title}"
            }],
            modes: [{
                type: "html5"
            }, {
                type: "flash",
                src: "${pageContext.request.contextPath}/static/jwplayer/jwplayer.flash.swf"
            }, {
                type: "download"
            }],
            skin: {
                name: "vapor"
            },
            "playlist.position": "left",
            "playlist.size": 400,
            height: 500,
            width: 774,
        });
    </script>
    <!--播放页面-->
    <script>
        $(document).ready(function () {
            $('#pagination').pagination({
                items: ${pageInfo.getPages()},
                currentPage: ${pageInfo.getPageNum()},
                cssStyle: '',
                prevText: '上一页',
                nextText: '下一页',
                onPageClick: function (page, evt) {
                    window.location.href = '${pageContext.request.contextPath}/play/' + ${movie.id} + '?pageNum=' + page;
                }
            });

            $('#btn-col').click(function () {
                var movieId = ${movie.id};
                $.ajax({
                    url: "${pageContext.request.contextPath}/moviecol/add",
                    type: "POST",
                    dataType : "json",
                    data: {
                        "movieId": movieId
                    },
                    success: function (res) {
                        if (res.code == '1') {
                            $('#show_col_msg').empty();
                            $('#show_col_msg').append("收藏成功");
                        } else {
                            $('#show_col_msg').empty();
                            $('#show_col_msg').append("已经收藏过了");
                        }
                    }
                });
            });
        });
    </script>
</rapid:override>

<%@ include file="home.jsp" %>