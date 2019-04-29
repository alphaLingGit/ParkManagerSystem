<%@ page import="com.ling.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
        User user = (User)session.getAttribute("user");
    %>
    <title>小区停车场管理系统</title>
    <link rel="icon" href="1223422.png" type="img/x-ico" />
    <link href="${APP_PATH}/bootstrap3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <style>
        #imgDiv{
            background: #ffffff url('indexCar.jpg') no-repeat fixed center;
        }
        #changeDiv{
            background-color: inherit;
            /*position: relative;*/
        }
        /*@media screen and (min-width: 1300px) {
            .navbar-toggle {
                display: none;
            }
            .navbar-collapse {
                display: block;
            }
        }
        @media (min-width: 1300px)
            .navbar-collapse.collapse {
                display: block!important;
                height: auto!important;
                padding-bottom: 0;
                overflow: visible!important;
            }*/
    </style>

</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="${APP_PATH}/">ParkManagerSystem</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="#" id="getUserPage">用户管理</a></li>
                            <li><a href="#" id="getCarPage">车辆管理</a></li>
                            <li><a href="#" id="getParkingPage">车位管理</a></li>
                            <li><a href="#" id="getCardPage">车卡管理</a></li>
                            <li><a href="#" id="getEzstopPage">停车记录管理</a></li>
                            <li><a href="#" id="getRecordPage">收费记录管理</a></li>
                        </ul>
                        <form class="navbar-form navbar-left" role="search">
                            <select class="form-control" style="padding: 4px;border-radius:6px">
                                <option selected>车卡号</option>
                            </select>
                            <input type="text" class="form-control" id="cardKey"/>
                            <button type="button" class="btn btn-info" id="saveCar">存车</button>
                            <button type="button" class="btn btn-info" id="returnVar">还车</button>
                        </form>
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <c:if test="${not empty user}">
                                        欢迎，<%=user.getUsername()%> <span class="glyphicon glyphicon-user"></span>
                                    </c:if>
                                    <c:if test="${empty user}">
                                        请登录
                                    </c:if>
                                    <strong class="caret"></strong>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="${APP_PATH}/log-out">
                                            <c:if test="${not empty user}">退出</c:if>
                                            <c:if test="${empty user}">登录</c:if>
                                        </a>
                                    </li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Separated link</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <div class="row">
            <div class="clearfix" style="height: 60px"></div>
        </div>
        <div class="row">
            <div class="col-md-12" id="changeDiv">
                <div style="height: 560px" id="imgDiv">
                    <h1>小区停车场管理系统</h1>
                </div>
            </div>
        </div>

        <%--<div class="row">--%>
            <%--<div class="col-md-12 column">--%>
                <%--<h2>Welcome To ParkManagerSystem</h2>--%>
                <%--<a href="/users" >显示用户列表</a>--%>
                <%----%>

                <%--<button type="button" class="btn btn-primary btn-lg">按钮</button>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>



    <script src="${APP_PATH}/js/jquery-1.9.1.min.js"></script>
    <%--<script src="${APP_PATH}/js/user.js"></script>--%>
    <%--<script src="${APP_PATH}/js/index.js"></script>--%>
    <script src="${APP_PATH}/bootstrap3.3.5/js/bootstrap.min.js"></script>

    <script>
        $(function () {
            $.ajaxSetup({cache:true});
            let user = '<%= session.getAttribute("user")%>';
            if(user == 'null') {
                loadChange();
            }
            $("#saveCar").click(function () {
                if(user == 'null') {
                    alert("请登录！")
                    loadChange();
                    return false;
                }else {
                    let userType = '<%= (session.getAttribute("userType"))%>';
                    if(userType=="0") {
                        alert("无访问权限！");
                        return false;
                    }
                }
                let CardKey = $("input#cardKey").val();
                if(CardKey == "") {
                    alert("输入值不能为空！");
                    return false;
                }
                $.ajax({
                    url: "${APP_PATH}/addEzstop",
                    type: "post",
                    dataType: "json",
                    data: {"cardNum":CardKey},
                    success: function (result) {
                        if(result.code == "100") {
                            alert("存车成功！");
                            $("input#cardKey").val("");
                            loadUsersPage("getEzstopPage");
                        }else{
                            // console.log(result);
                            alert(result.errMsg);
                        }
                    }
                });
            });
            $("#returnVar").click(function () {
                if(user == 'null') {
                    alert("请登录！")
                    loadChange();
                    return false;
                }else {
                    let userType = '<%= (session.getAttribute("userType"))%>';
                    if(userType=="0") {
                        alert("无访问权限！");
                        return false;
                    }
                }
                let CardKey = $("input#cardKey").val();
                if(CardKey == "") {
                    alert("输入值不能为空！");
                    return false;
                }
                $.ajax({
                    url: "${APP_PATH}/updateEzstop",
                    type: "post",
                    dataType: "json",
                    data: {"cardNum":CardKey},
                    success: function (result) {
                        if(result.code == "100") {
                            alert("还车成功！");
                            $("input#cardKey").val("");
                            loadUsersPage("getEzstopPage");
                        }else{
                            // console.log(result);
                            alert(result.errMsg);
                        }
                    }
                });
            });

            $("#getUserPage").click(function () {
                loadUsersPage(this.id);
            });
            $("#getCarPage").click(function () {
                loadUsersPage(this.id);
            });
            $("#getParkingPage").click(function () {
                loadUsersPage(this.id);
            });
            $("#getCardPage").click(function () {
                loadUsersPage(this.id);
            });
            $("#getEzstopPage").click(function () {
                loadUsersPage(this.id);
            });
            $("#getRecordPage").click(function () {
                loadUsersPage(this.id);
            });
        });
        function loadChange() {
            $.ajax({
                url: "${APP_PATH}/login",
                type: "get",
                success: function (result) {
                    $("#changeDiv").empty();
                    $("#changeDiv").html(result);
                }
            });
        }
        function loadUsersPage(key) {
            // alert("111");
            switch (key) {
                case "getUserPage" :
                    $.ajax({
                        url: "${APP_PATH}/users",
                        type: "get",
                        success: function (result) {
                            $("#changeDiv").empty();
                            $("#changeDiv").html(result);
                        }
                    });
                    // userload();
                    break;
                case "getCarPage" :
                    $.ajax({
                        url: "${APP_PATH}/cars",
                        type: "get",
                        success: function (result) {
                            $("#changeDiv").empty();
                            $("#changeDiv").html(result);
                        }
                    });
                    break;
                case "getParkingPage" :
                    $.ajax({
                        url: "${APP_PATH}/parking_info",
                        type: "get",
                        success: function (result) {
                            $("#changeDiv").empty();
                            $("#changeDiv").html(result);
                        }
                    });
                    break;
                case "getCardPage" :
                    $.ajax({
                        url: "${APP_PATH}/cards",
                        type: "get",
                        success: function (result) {
                            $("#changeDiv").empty();
                            $("#changeDiv").html(result);
                        }
                    });
                    break;
                case "getEzstopPage" :
                    $.ajax({
                        url: "${APP_PATH}/ezstops",
                        type: "get",
                        success: function (result) {
                            $("#changeDiv").empty();
                            $("#changeDiv").html(result);
                        }
                    });
                    break;
                case "getRecordPage" :
                    $.ajax({
                        url: "${APP_PATH}/records",
                        type: "get",
                        success: function (result) {
                            $("#changeDiv").empty();
                            $("#changeDiv").html(result);
                        }
                    });
                    break;
            }
        }
        function dateFtt(fmt,myDate) {
            if(myDate=="" || myDate==null) {
                return "";
            }
            let date =new Date();
            date.setTime(parseInt(myDate));
            var o = {
                "M+" : date.getMonth()+1,                 //月份
                "d+" : date.getDate(),                    //日
                "h+" : date.getHours(),                   //小时
                "m+" : date.getMinutes(),                 //分
                "s+" : date.getSeconds(),                 //秒
                "q+" : Math.floor((date.getMonth()+3)/3), //季度
                "S"  : date.getMilliseconds()             //毫秒
            };
            if(/(y+)/.test(fmt))
                fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));
            for(var k in o)
                if(new RegExp("("+ k +")").test(fmt))
                    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
            return fmt;
        }
    </script>
</body>
</html>
