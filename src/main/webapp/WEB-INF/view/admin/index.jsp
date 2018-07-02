<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<rapid:override name="content">
    <section class="content-header">
        <h1>微电影管理系统</h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
            <li class="active">控制面板</li>
        </ol>
    </section>
    <section class="content" id="showcontent">
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">内存使用率</h3>
                    </div>
                    <div class="box-body" id="meminfo" style="height:600px;"></div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">系统设置</h3>
                    </div>
                    <form role="form">
                        <div class="box-body" style="height:600px;">
                            <div class="form-group">
                                <label for="input_speed">限制速率大小</label>
                                <input type="text" class="form-control" id="input_speed" placeholder="请输入限制速率！"
                                       value="512">
                            </div>
                            <div class="form-group">
                                <label for="input_mem">限制内存大小</label>
                                <input type="text" class="form-control" id="input_mem" placeholder="请输入限制内存！"
                                       value="10m">
                            </div>
                            <div class="form-group">
                                <label for="input_num">限制客户端数量</label>
                                <input type="text" class="form-control" id="input_num" placeholder="请输入限制客户端数量！"
                                       value="4">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">保存并重启服务</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</rapid:override>

<rapid:override name="js">
    <script src="${pageContext.request.contextPath}/static/js/echarts.min.js"></script>
    <script>
        var myChart = echarts.init(document.getElementById('meminfo'));
        option = {
            backgroundColor: "white",
            tooltip: {
                formatter: "{a} <br/>{b} : {c}%"
            },
            toolbox: {
                feature: {
                    restore: {},
                    saveAsImage: {}
                }
            },
            series: [{
                name: '内存使用率',
                type: 'gauge',
                detail: {
                    formatter: '{value}%'
                },
                data: [{
                    value: 50,
                    name: '内存使用率'
                }]
            }]
        };
        setInterval(function () {
            option.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
            myChart.setOption(option, true);
        },2000);

    </script>
    <script>
        $(document).ready(function(){
            $("#g-1").addClass("active");
            $("#g-1-1").addClass("active");
        });
    </script>
</rapid:override>

<%@ include file="admin.jsp"%>