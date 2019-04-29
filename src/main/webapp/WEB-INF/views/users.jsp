<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<%--修改--%>
<div class="modal fade" id="userUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Update User</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户ID</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="userId_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-8">
                            <input type="text" name="username" class="form-control" id="username_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">身份证号</label>
                        <div class="col-sm-8">
                            <input type="text" name="idNum" class="form-control" id="idNum_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车牌号</label>
                        <div class="col-sm-8">
                            <input type="text" name="carNum" class="form-control" id="carNum_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">联系地址</label>
                        <div class="col-sm-8">
                            <input type="text" name="addr" class="form-control" id="addr_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">联系电话</label>
                        <div class="col-sm-8">
                            <input type="text" name="phone" class="form-control" id="phone_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-8">
                            <input type="text" name="password" class="form-control" id="password_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">类型</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" name="type" id="gender1_update_input" value="0" checked="checked"> 普通用户
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="type" id="gender2_update_input" value="1"> 管理员
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <span class="help-block"></span>
                <button type="button" class="btn btn-default" id="model_close">Close</button>
                <button type="button" class="btn btn-primary" id="user_update_btn">Update</button>
            </div>
        </div>
    </div>
</div>
<%--添加--%>
<div class="modal fade" id="userAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Add User</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="addForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-8">
                            <input type="text" name="username1" class="form-control" id="username_Add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">身份证号</label>
                        <div class="col-sm-8">
                            <input type="text" name="idNum1" class="form-control" id="idNum_Add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车牌号</label>
                        <div class="col-sm-8">
                            <input type="text" name="carNum1" class="form-control" id="carNum_Add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">联系地址</label>
                        <div class="col-sm-8">
                            <input type="text" name="addr1" class="form-control" id="addr_Add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">联系电话</label>
                        <div class="col-sm-8">
                            <input type="text" name="phone1" class="form-control" id="phone_Add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-8">
                            <input type="text" name="password1" class="form-control" id="password_Add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">类型</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" name="type1" id="gender1_Add_input" value="0" checked="checked"> 普通用户
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="type1" id="gender2_Add_input" value="1"> 管理员
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <span class="help-block"></span>
                <button type="button" class="btn btn-default" id="Add_model_close">Close</button>
                <button type="button" class="btn btn-primary" id="user_Add_btn">Add</button>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        <form class="navbar-form navbar-left" role="search">
            <select class="form-group" style="padding: 7px;border-radius:5px">
                <option selected>用户id</option>
                <%--<option>车卡号</option>--%>
                <%--<option>车位号</option>--%>
            </select>
            <div class="form-group">
                <input type="text" class="form-control" id="userId"/>
            </div>
            <button type="button" class="btn btn-info" id="search">查询</button>
            <button type="button" class="btn btn-info" id="addUser">添加</button>
        </form>
    </div>
</div>

<table class="table table-hover table-condensed table-striped">
    <thead>
        <tr>
            <th>用户ID</th>
            <th>用户名</th>
            <th>身份证号</th>
            <th>车牌号</th>
            <th>联系地址</th>
            <th>联系电话</th>
            <th>密码</th>
            <th>类型</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody></tbody>
</table>

<div class="row">
    <div class="col-md-6" id="page_info_area"></div>
    <div class="col-md-6" id="page_nav_area"></div>
    <%--<div class="col-md-4 col-md-offset-8" id="changeDiv">
        <ul class="pagination">
            <li>
                <a href="#">Prev</a>
            </li>
            <li>
                <a href="#">1</a>
            </li>
            <li>
                <a href="#">2</a>
            </li>
            <li>
                <a href="#">3</a>
            </li>
            <li>
                <a href="#">4</a>
            </li>
            <li>
                <a href="#">5</a>
            </li>
            <li>
                <a href="#">Next</a>
            </li>
        </ul>
    </div>--%>
</div>
<%--<script src="${APP_PATH}/js/user.js"></script>--%>
<script>
    var userId ="";
    $( function() {
        to_page(1,userId);
        $("#model_close").click(function () {
            $("#userUpdateModal").modal("hide");
            to_page(1,userId);
        });
        $("#Add_model_close").click(function () {
            $("#userAddModal").modal("hide");
            document.getElementById("addForm").reset();
            to_page(1,userId);
        });
        $("#addUser").click(function () {
            $("#userAddModal").modal({
                backdrop:"static"
            });
        });
        $("#user_Add_btn").click(function () {
            $("#userAddModal .modal-footer>span.help-block").text("");
            var username = $("input[name=username1]").val();
            var idnum = $("input[name=idNum1]").val();

            var carNum = $("input[name=carNum1]").val();

            var addr = $("input[name=addr1]").val();
            var phone = $("input[name=phone1]").val();
            var password = $("input[name=password1]").val();
            var type = $("input[name=type1]:checked").val();
            $.ajax({
                url: "${APP_PATH}/addUser",
                type: "post",
                data: {
                    "username": username,
                    "idnum": idnum,
                    "carNum": carNum,
                    "addr": addr,
                    "phone": phone,
                    "password": password,
                    "type": type
                },
                success: function (result) {
                    if(result.code == "100") {
                        $("#userAddModal .modal-footer>span.help-block").text("添加成功！")
                    }else{
                        $("#userAddModal .modal-footer>span.help-block").text("添加失败！")
                    }
                }
            });
        });
        /* $(".deletebtn1").off("click").on('click',function () {
         let deleteId = $(this).attr("delete-id");
         if(!confirm("是否确定删除ID为"+deleteId+"的用户?")){
         return false;
         }
         $.ajax({
         url: "/deleteUser",
         type: "get",
         data: {"userId":deleteId},
         success: function (result) {
         if(result.code != "200") {
         to_page(1,userId);
         } else{
         alert(result.errMsg);
         }
         }
         });
         });*/
        $(document).off("click",".deletebtn1");
        $(document).on("click",".deletebtn1",function(e){
            e.stopPropagation();
            let deleteId = $(this).attr("delete-id");
            if(!confirm("是否确定删除ID为"+deleteId+"的用户?")){
                return false;
            }
            $.ajax({
                url: "${APP_PATH}/deleteUser",
                type: "get",
                data: {"userId":deleteId},
                success: function (result) {
                    if(result.code != "200") {
                        to_page(1,userId);
                    } else{
                        alert(result.errMsg);
                    }
                }
            });
            // $(".deletebtn1").off('click').on('click', sayHello);
            return false;
        });
        $(document).off("click",".editbtn");
        $(document).on("click",".editbtn",function(){
            $("#userUpdateModal .modal-footer>span.help-block").text("");
//            alert($(this).attr("edit-id"));
            $("#userUpdateModal").modal({
                backdrop:"static"
            });
            $.ajax({
                url: "${APP_PATH}/getUsersById",
                type: "get",
                data:{"userId":$(this).attr("edit-id")},
                success: function (result) {
                    result = result.extend.user;
                    $("p#userId_update_static").text(result.userId);
                    $("input[name=username]").val(result.username);
                    $("input[name=idNum]").val(result.idnum);
                    $("input[name=carNum]").val(result.carNum);
                    $("input[name=addr]").val(result.addr);
                    $("input[name=phone]").val(result.phone);
                    $("input[name=password]").val(result.password);
                    $("input[name=type]").prop("checked",false);
                    $("input[name=type][value="+result.type+"]").prop("checked","checked");
                }
            });
        });

        $("#user_update_btn").click(function () {
            var update_userId = $("p#userId_update_static").text();
            var username = $("input[name=username]").val();
            var idnum = $("input[name=idNum]").val();
            var carNum = $("input[name=carNum]").val();
            var addr = $("input[name=addr]").val();
            var phone = $("input[name=phone]").val();
            var password = $("input[name=password]").val();
            var type = $("input[name=type]:checked").val();
            $.ajax({
                url: "${APP_PATH}/updateUser",
                type: "post",
                data: {
                    "userId": update_userId,
                    "username": username,
                    "idnum": idnum,
                    "carNum": carNum,
                    "addr": addr,
                    "phone": phone,
                    "password": password,
                    "type": type
                },
                success: function (result) {
                    if(result.code == "100") {
                        $("#userUpdateModal .modal-footer>span.help-block").text("更新成功！")
                    }else{
                        $("#userUpdateModal .modal-footer>span.help-block").text("更新失败！")
                    }
                }
            });
        });
        $("#search").click(function () {
            userId = $("#userId").val();
//            alert(userId);
            to_page(1,userId);
        });
    });
    function to_page(pageNum,userId) {
        var data ;
        if(userId == "" || userId == null) {
            data = {"pageNum": pageNum};
        }else{
            data = {"pageNum": pageNum,"userId":userId};
        }

        $.ajax({
            url: "${APP_PATH}/users",
            type: "POST",
            dataType: "json",
            data: data,
            success: function (result) {
//                console.log(result);
                showUsers(result);
                build_page_info(result);
                build_pages_nav(result)
            }
        });
    }
    <!--解析显示分页信息-->
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.users.pageNum+"页，总"
            +result.extend.users.pages+"页，总"+result.extend.users.total+"条记录");
        totalRecord=result.extend.users.total;
        currentPage=result.extend.users.pageNum;
    }
    <!--解析显示分页条，点击分页要能够去该页-->
    function build_pages_nav(result){
        $("#page_nav_area").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.users.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            firstPageLi.click(function(){
                to_page(1,userId);
            });
            prePageLi.click(function(){
                to_page(result.extend.users.pageNum - 1,userId);
            });
        }
        var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.users.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.users.pageNum + 1,userId);
            });
            lastPageLi.click(function(){
                to_page(result.extend.users.pages,userId);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.users.navigatepageNums,function(index,item){
            var numLi=$("<li></li>").append($("<a></a>").append(item));
            if(result.extend.users.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item,userId);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle=$("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area")
    }
    function showUsers(result) {
        $("table tbody").empty();
        $.each(result.extend.users.list,function (index,item) {
//                    alert(item.userId);
            var $userId = $("<td></td>").append(item.userId);
            var $username = $("<td></td>").append(item.username);
            var $idnum = $("<td></td>").append(item.idnum);
            var $carNum = $("<td></td>").append(item.carNum);
            var $addr = $("<td></td>").append(item.addr);
            var $phone = $("<td></td>").append(item.phone);
            var $password = $("<td></td>").append(item.password);
            var $type = $("<td></td>").append(item.type);
            var $operation = $("<td></td>")
                .append($("<button class='btn btn-success editbtn' edit-id="+item.userId+">Edit</button>"))
                .append($("<button class='btn btn-danger deletebtn1' delete-id="+item.userId+">Delete</button>"));
            $("<tr></tr>").append($userId).append($username).append($idnum)
                .append($carNum).append($addr).append($phone)
                .append($password).append($type).append($operation)
                .appendTo("table tbody");
        })
    }
</script>
