<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<rapid:override name="content">
    <!--热门电影-->
    <section id="hotmovie" style="margin-top:76px">
        <div class="container">
            <div class="row wow fadeInRight" data-wow-delay="0.6s">
                <div class="row">
                    <iframe class="wow fadeIn" width="100%" height="375px" frameborder=0 scrolling=no src="${pageContext.request.contextPath}/animation"></iframe>
                </div>
            </div>
        </div>
    </section>
    <!--热门电影-->
    <!--电影列表-->
    <section id="movielist">
        <div class="container">
            <div class="row wow fadeIn" data-wow-delay="0.6s">
                <div class="col-md-12 table-responsive">
                    <table class="table text-left table-bordered" id="movietags">
                        <tr>
                            <td style="width:10%;">电影标签</td>
                            <td style="width:90%;">
                                <c:forEach items="${tags}" var="tag">
                                <a href="${pageContext.request.contextPath}/?tid=${tag.id}&star=${star}&time=${time}&pm=${pm}&cm=${cm}" class="label label-info"><span class="glyphicon glyphicon-tag"></span>&nbsp;${tag.name}</a>
                                </c:forEach>
                        </tr>
                        <tr>
                            <td>电影星级</td>
                            <td>
                                <c:forEach var="s" begin="1" end="5" step="1">
                                <a href="${pageContext.request.contextPath}/?tid=${tid}&star=${s}&time=${time}&pm=${pm}&cm=${cm}" class="label label-warning"><span class="glyphicon glyphicon-star"></span>&nbsp;${star}星</a>
                                </c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <td>上映时间</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/?tid=${tid}&star=${star}&time=1&pm=${pm}&cm=${cm}" class="label label-default"><span class="glyphicon glyphicon-time"></span>&nbsp;最近</a>
                                &nbsp;
                                <a href="${pageContext.request.contextPath}/?tid=${tid}&star=${star}&time=2&pm=${pm}&cm=${cm}" class="label label-default"><span class="glyphicon glyphicon-time"></span>&nbsp;更早</a>
                            </td>
                        </tr>
                        <tr>
                            <td>播放数量</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/?tid=${tid}&star=${star}&time=${time}&pm=1&cm=${cm}" class="label label-success"><span class="glyphicon glyphicon-arrow-down"></span>&nbsp;从高到底</a>
                                &nbsp;
                                <a href="${pageContext.request.contextPath}/?tid=${tid}&star=${star}&time=${time}&pm=2&cm=${cm}" class="label label-danger"><span class="glyphicon glyphicon-arrow-up"></span>&nbsp;从低到高</a>
                            </td>
                        </tr>
                        <tr>
                            <td>评论数量</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/?tid=${tid}&star=${star}&time=${time}&pm=${pm}&cm=1" class="label label-success"><span class="glyphicon glyphicon-arrow-down"></span>&nbsp;从高到底</a>
                                &nbsp;
                                <a href="${pageContext.request.contextPath}/?tid=${tid}&star=${star}&time=${time}&pm=${pm}&cm=2" class="label label-danger"><span class="glyphicon glyphicon-arrow-up"></span>&nbsp;从低到高</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <c:forEach items="${pageInfo.list}" var="movie">
                <div class="col-md-3">
                    <div class="movielist text-center">
                        <img src="/upload/img/${movie.logo}" style="width: 262px;height: 166px;" class="img-responsive center-block" alt="">
                        <div class="text-left" style="margin-left:auto;margin-right:auto;width:210px;">
                            <span style="color:#999;font-style: italic;">${movie.title}</span><br>
                            <div>
                                <c:forEach var="s" begin="1" end="5" step="1">
                                    <c:choose>
                                        <c:when test="${s <= movie.star}"><span class="glyphicon glyphicon-star" style="color:#FFD119"></span></c:when>
                                        <c:otherwise><span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span></c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/play/${movie.id}" class="btn btn-primary" target="_blank" role="button"><span class="glyphicon glyphicon-play"></span>&nbsp;播放</a>
                    </div>
                </div>
                </c:forEach>
                <div class="col-md-12">
                    <nav aria-label="Page navigation">
                        <ul id="pagination" class="pagination"></ul>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!--电影列表-->
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
                    window.location.href = '${pageContext.request.contextPath}/?tid=${tid}&star=${star}&time=${time}&pm=${pm}&cm=${cm}&pageNum=' + page;
                }
            });
        });
    </script>
</rapid:override>

<%@ include file="layout.jsp"%>