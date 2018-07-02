<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<rapid:override name="content">
    <section class="content-header">
        <h1>微电影管理系统</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 电影管理</a></li>
            <li class="active">修改电影</li>
        </ol>
    </section>
    <section class="content" id="showcontent">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">修改电影</h3>
                    </div>
                    <form id="form-data" role="form" action="${pageContext.request.contextPath}/admin/movie/edit" method="post" enctype="multipart/form-data">
                        <div class="box-body">
                            <jsp:include page="../ui/admin_msg.jsp"/>
                            <input type="hidden" name="id" value="${movie.id}"/>
                            <div class="form-group">
                                <label for="input_title">片名</label>
                                <input name="title" value="${movie.title}" type="text" class="form-control" id="input_title" placeholder="请输入片名！">
                            </div>
                            <div class="form-group">
                                <label for="input_url">文件</label>
                                <input name="movie" type="file" id="input_url">
                                <div style="margin-top:5px;">
                                    <div id="moviecontainer"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input_info">介绍</label>
                                <textarea name="info" class="form-control" rows="10" id="input_info">${movie.info}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="input_logo">封面</label>
                                <input name="logo" type="file" id="input_logo">
                                <img src="/upload/img/${movie.logo}" style="margin-top:5px; width: 262px; height: 166px;" class="img-responsive" alt="">
                            </div>
                            <div class="form-group">
                                <label for="input_star">星级</label>
                                <select name="star" class="form-control" id="input_star">
                                    <option <c:if test="${1 == movie.star}">selected</c:if> value="1">1星</option>
                                    <option <c:if test="${2 == movie.star}">selected</c:if> value="2">2星</option>
                                    <option <c:if test="${3 == movie.star}">selected</c:if> value="3">3星</option>
                                    <option <c:if test="${4 == movie.star}">selected</c:if> value="4">4星</option>
                                    <option <c:if test="${5 == movie.star}">selected</c:if> value="5">5星</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="input_tag_id">标签</label>
                                <select name="tag_id" class="form-control" id="input_tag_id">
                                    <option value="">请选择标签</option>
                                    <c:forEach var="tag" items="${tagList}">
                                        <option <c:if test="${tag.id == movie.tag.id}">selected</c:if> value="${tag.id}">${tag.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="input_area">地区</label>
                                <input name="area" value="${movie.area}" type="text" class="form-control" id="input_area" placeholder="请输入地区！">
                            </div>
                            <div class="form-group">
                                <label for="input_length">片长</label>
                                <input name="length" value="${movie.length}" type="text" class="form-control" id="input_length" placeholder="请输入片长！">
                            </div>
                            <div class="form-group">
                                <label for="input_release_time">上映时间</label>
                                <input name="release_time" value="<fmt:formatDate value="${movie.addTime}" type="date" pattern="yyyy-MM-dd"/>" type="text" class="form-control" id="input_release_time"
                                       placeholder="请选择上映时间！">
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary">添加</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</rapid:override>

<rapid:override name="js">
    <!--播放页面-->
    <script src="${pageContext.request.contextPath}/static/jwplayer/jwplayer.js"></script>
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
            "playlist.size": 200,
            height: 250,
            width: 387,
        });
    </script>
    <script>
        $(document).ready(function(){
            $("#input_release_time").datepicker({
                autoclose: true,
                todayHighlight : true,
                format: 'yyyy-mm-dd',
                language: 'zh-CN'
            }).on('hide',function(e) {
                $('#form-data').data('bootstrapValidator')
                    .updateStatus('release_time', 'NOT_VALIDATED',null)
                    .validateField('release_time');
            });
        });
    </script>

    <script>
        $(document).ready(function () {
            $("#g-3").addClass("active");
            $("#g-3-2").addClass("active");

            $('#form-data').bootstrapValidator({
                fields: {
                    title: {
                        validators: {
                            notEmpty: {
                                message: '片名不能为空'
                            }
                        }
                    },
                    info: {
                        validators: {
                            notEmpty: {
                                message: '介绍不能为空'
                            }
                        }
                    },
                    star: {
                        validators: {
                            notEmpty: {
                                message: '星级不能为空'
                            }
                        }
                    },
                    tag_id: {
                        validators: {
                            notEmpty: {
                                message: '标签不能为空'
                            }
                        }
                    },
                    area: {
                        validators: {
                            notEmpty: {
                                message: '地区不能为空'
                            }
                        }
                    },
                    length: {
                        validators: {
                            notEmpty: {
                                message: '片长不能为空'
                            }
                        }
                    },
                    release_time: {
                        validators: {
                            notEmpty: {
                                message: '上映时间不能为空'
                            }
                        }
                    }
                }
            });
        });
    </script>
</rapid:override>

<%@ include file="admin.jsp" %>