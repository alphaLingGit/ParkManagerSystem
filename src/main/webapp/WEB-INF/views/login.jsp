<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<form class="form-horizontal" role="form">
    <div class="form-group">
        <label for="idnum" class="col-sm-2 control-label">IDNum</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="idnum" />
        </div>
    </div>
    <div class="form-group">
        <label for="password" class="col-sm-2 control-label">Password</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="password" />
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <div class="checkbox">
                <label><input type="checkbox" />Remember me</label>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-5">
            <button type="reset" class="btn btn-info">重置</button>
        </div>
        <div class="col-sm-5">
            <button id="login" type="button" class="btn btn-success">登录</button>
        </div>
    </div>
</form>
<script>
    $(function () {
        $("#login").click(function () {
            var idnum = $("#idnum").val();
            var password = $("#password").val();
//            alert(idnum+","+password);
            if(idnum == "" || password == "") {
                alert("请输入完整信息!");
                return false;
            }
            $.ajax({
                url: "${APP_PATH}/login",
                type: "POST",
                data: {"idnum":idnum,"password":password},
                dataType: "json",
                success: function (result) {
                    var Rcode = result.code;
                    if(Rcode == "100") {
                        alert("登录成功");
                        $(location).attr('href', '${APP_PATH}/');
                    }else{
                        alert("登录失败！请重新输入");
                        return false;
                    }
                }
            });
        });
    });
</script>