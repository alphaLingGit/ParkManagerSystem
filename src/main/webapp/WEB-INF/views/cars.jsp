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
                <h4 class="modal-title">Update Car</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车牌号</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="carNum_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车辆品牌</label>
                        <div class="col-sm-8">
                            <input type="text" name="carBrand" class="form-control" id="carBrand_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车辆颜色</label>
                        <div class="col-sm-8">
                            <input type="text" name="carColor" class="form-control" id="carColor_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车牌图片</label>
                        <div class="col-sm-8">
                            <input type="text" name="carPicture" class="form-control" id="carPicture_update_input">
                            <span class="help-block"></span>
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
                        <label class="col-sm-2 control-label">车牌号</label>
                        <div class="col-sm-8">
                            <input type="text" name="carNum1" class="form-control" id="carNum_Add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车辆品牌</label>
                        <div class="col-sm-8">
                            <input type="text" name="carBrand1" class="form-control" id="carBrand_Add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车辆颜色</label>
                        <div class="col-sm-8">
                            <input type="text" name="carColor1" class="form-control" id="carColor_Add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车辆图片</label>
                        <div class="col-sm-8">
                            <input type="text" name="carPicture1" class="form-control" id="carPicture_Add_input">
                            <span class="help-block"></span>
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
                <option selected>车牌号</option>
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
            <th>车牌号</th>
            <th>车辆品牌</th>
            <th>车辆颜色</th>
            <th>车辆图片</th>
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

<script>
    var userId ="";
    $(function () {
        to_page(1,userId);
        /**
         * 关闭模态框刷新页面
         */
        $("#model_close").click(function () {
            $("#userUpdateModal").modal("hide");
            to_page(1,userId);
        });
        /**
         * 关闭添加模态框，清空表单
         */
        $("#Add_model_close").click(function () {
            $("#userAddModal").modal("hide");
            document.getElementById("addForm").reset();
            to_page(1,userId);
        });
        /**
         * 显示添加模态框
         */
        $("#addUser").click(function () {
            $("#userAddModal").modal({
                backdrop:"static"
            });
        });

        $("#user_Add_btn").click(function () {
            $("#userAddModal .modal-footer>span.help-block").text("");
            var carNum1 = $("input[name=carNum1]").val();
            var carBrand1 = $("input[name=carBrand1]").val();
            var carColor1 = $("input[name=carColor1]").val();
            var carPicture1 = $("input[name=carPicture1]").val();
            $.ajax({
                url: "/addCar",
                type: "post",
                data: {
                    "carNum": carNum1,
                    "carBrand": carBrand1,
                    "carColor": carColor1,
                    "carPicture": carPicture1,
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
        $(document).off("click",".editbtn");
        /**
         * 显示编辑模态框
         */
        $(document).on("click",".editbtn",function(){
            $("#userUpdateModal .modal-footer>span.help-block").text("");
            $("#userUpdateModal").modal({
                backdrop:"static"
            });
            $.ajax({
                url: "${APP_PATH}/getCarByCarNum",
                type: "post",
                data:{"carNum":$(this).attr("edit-id")},
                success: function (result) {
                    result = result.extend.car;
                    $("p#carNum_update_static").text(result.carNum);
                    $("input[name=carBrand]").val(result.carBrand);
                    $("input[name=carColor]").val(result.carColor);
                    $("input[name=carPicture]").val(result.carPicture);
                }
            });
        });
        $(document).off("click",".deletebtn4");
        $(document).on("click",".deletebtn4",function(e){
            e.stopPropagation();
            let deleteId = $(this).attr("delete-id");
            if(!confirm("是否确定删除ID为"+deleteId+"的车?")){
                return false;
            }
            $.ajax({
                url: "${APP_PATH}/deleteCar",
                type: "get",
                data: {"carNum":deleteId},
                success: function (result) {
                    if(result.code != "200") {
                        to_page(1,userId);
                    } else{
                        alert(result.errMsg);
                    }
                }
            });
            return false;
        });
        $("#user_update_btn").click(function () {
            var carNum = $("p#carNum_update_static").text();
            var carBrand = $("input[name=carBrand]").val();
            var carColor = $("input[name=carColor]").val();
            var carPicture = $("input[name=carPicture]").val();
            $.ajax({
                url: "${APP_PATH}/updateCar",
                type: "post",
                data: {
                    "carNum": carNum,
                    "carBrand": carBrand,
                    "carColor": carColor,
                    "carPicture": carPicture,
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
        /**
         * 查询
         */
        $("#search").click(function () {
            userId = $("#userId").val();
            to_page(1,userId);
        });
    });
    function to_page(pageNum,userId) {
        var data ;
        if(userId == "" || userId == null) {
            data = {"pageNum": pageNum};
        }else{
            data = {"pageNum": pageNum,"carNum":userId};
        }
        $.ajax({
            url: "${APP_PATH}/cars",
            type: "POST",
            dataType: "json",
            data: data,
            success: function (result) {
                console.log(result);
                showUsers(result);
                build_page_info(result);
                build_pages_nav(result)
            }
        });
    }
    <!--解析显示分页信息-->
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.cars.pageNum+"页，总"
            +result.extend.cars.pages+"页，总"+result.extend.cars.total+"条记录");
        totalRecord=result.extend.cars.total;
        currentPage=result.extend.cars.pageNum;
    }
    <!--解析显示分页条，点击分页要能够去该页-->
    function build_pages_nav(result){
        $("#page_nav_area").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.cars.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            firstPageLi.click(function(){
                to_page(1,userId);
            });
            prePageLi.click(function(){
                to_page(result.extend.cars.pageNum - 1,userId);
            });
        }
        var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.cars.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.cars.pageNum + 1,userId);
            });
            lastPageLi.click(function(){
                to_page(result.extend.cars.pages,userId);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.cars.navigatepageNums,function(index,item){
            var numLi=$("<li></li>").append($("<a></a>").append(item));
            if(result.extend.cars.pageNum == item){
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
    /**
     * 显示信息
     */
    function showUsers(result) {
        $("table tbody").empty();
        $.each(result.extend.cars.list,function (index,item) {
            var $userId = $("<td></td>").append(item.carNum);
            var $username = $("<td></td>").append(item.carBrand);
            var $idnum = $("<td></td>").append(item.carColor);
            var $carNum = $("<td></td>").append(item.carPicture);
            var $operation = $("<td></td>")
                .append($("<button class='btn btn-success editbtn' edit-id="+item.carNum+">Edit</button>"))
                        .append($("<button class='btn btn-danger deletebtn4'delete-id="+item.carNum+">Delete</button>"));
            $("<tr></tr>").append($userId).append($username).append($idnum)
                .append($carNum).append($operation)
                .appendTo("table tbody");
        })
    }
</script>
