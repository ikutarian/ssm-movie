<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<rapid:override name="css">
    <style>
        .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
            vertical-align:middle;
            text-align:left;
        }
        .td_bd{
            font-weight:bold;
        }
    </style>
</rapid:override>

<rapid:override name="content">
    <section class="content-header">
        <h1>微电影管理系统</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 会员管理</a></li>
            <li class="active">查看会员</li>
        </ol>
    </section>
    <section class="content" id="showcontent">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">会员详情</h3>
                    </div>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <td class="td_bd">编号：</td>
                                <td>${user.id}</td>
                            </tr>
                            <tr>
                                <td class="td_bd">昵称：</td>
                                <td>${user.name}</td>
                            </tr>
                            <tr>
                                <td class="td_bd">邮箱：</td>
                                <td>${user.email}</td>
                            </tr>
                            <tr>
                                <td class="td_bd">手机：</td>
                                <td>${user.phone}</td>
                            </tr>
                            <tr>
                                <td class="td_bd">头像：</td>
                                <td>
                                    <img src="/upload/img/${user.face}" style="width: 100px;height: 100px;" class="img-responsive" alt="">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_bd">注册时间：</td>
                                <td>
                                    <fmt:formatDate value="${user.addTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_bd">唯一标志符：</td>
                                <td>
                                    ${user.uuid}
                                </td>
                            </tr>
                            <tr>
                                <td class="td_bd">个性简介：</td>
                                <td>
                                    ${user.info}
                                </td>
                            </tr>
                            </tbody>
                        </table>
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
        });
    </script>
</rapid:override>

<%@ include file="admin.jsp" %>