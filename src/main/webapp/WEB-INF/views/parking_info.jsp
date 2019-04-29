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
                <h4 class="modal-title">Update ParkingInfo</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车位编号</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="parkingNum_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车位位置</label>
                        <div class="col-sm-8">
                            <input type="text" name="location" class="form-control" id="location_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车位类型</label>
                        <div class="col-sm-8">
                            <%--<input type="text" name="parkingType" class="form-control" id="parkingType_update_input">--%>
                            <select name="parkingType" id="parkingType_update_input" style="padding: 7px;border-radius:5px">
                                <option>固定车位</option>
                                <option>自由车位</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车位利率</label>
                        <div class="col-sm-8">
                            <input type="text" name="rate" class="form-control" id="rate_update_input">
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
                <h4 class="modal-title">Add ParkingInfo</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="addForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车位位置</label>
                        <div class="col-sm-8">
                            <input type="text" name="location1" class="form-control" id="location_Add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车位类型</label>
                        <div class="col-sm-8">
                            <%--<input type="text" name="parkingType1" class="form-control" id="parkingType_Add_input">--%>
                            <select name="parkingType1" id="parkingType_Add_input" style="padding: 7px;border-radius:5px">
                                <option>固定车位</option>
                                <option>自由车位</option>
                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车位利率</label>
                        <div class="col-sm-8">
                            <input type="text" name="rate1" class="form-control" id="rate_Add_input">
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
                <option selected>车位编号</option>
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
            <th>车位编号</th>
            <th>车位位置</th>
            <th>车位类型</th>
            <th>车位利率</th>
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
    let userId ="";
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
            let carBrand1 = $("input[name=location1]").val();
//            let carColor1 = $("input[name=parkingType1]").val();
            let carColor1 = $("#parkingType_Add_input option:selected").text();
            let carPicture1 = $("input[name=rate1]").val();
//            alert(carColor1);return false;
            $.ajax({
                url: "/addParkingInfo",
                type: "post",
                data: {
                    "location": carBrand1,
                    "parkingType": carColor1,
                    "rate": carPicture1
                },
                success: function (result) {
                    if(result.code == "100") {
                        $("#userAddModal .modal-footer>span.help-block").text("添加成功！")
                    }else{
                        $("#userAddModal .modal-footer>span.help-block").text(result.errMsg)
                    }
                }
            });
        });
        $(document).off("click",".deletebtn3");
        $(document).on("click",".deletebtn3",function(e){
            e.stopPropagation();
            let deleteId = $(this).attr("delete-id");
            if(!confirm("是否确定删除ID为"+deleteId+"的车位?")){
                return false;
            }
            $.ajax({
                url: "${APP_PATH}/deletePark",
                type: "get",
                data: {"parkNum":deleteId},
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
                url: "${APP_PATH}/getParkingInfo",
                type: "post",
                data:{"parkingNum":$(this).attr("edit-id")},
                success: function (result) {
                    result = result.extend.parkingInfo;
                    $("p#parkingNum_update_static").text(result.parkingNum);
                    $("input[name=location]").val(result.location);
//                    $("input[name=parkingType]").val(result.parkingType);
//                    $("#parkingType_update_input option[text="+result.parkingType+"]").attr("selected", true);
//                    alert(result.parkingType);
//                    $("#parkingType_update_input").find("option:contains("+result.parkingType+")").attr("selected",true);
//                    $("#parkingType_update_input").find("option:[text="+result.parkingType+"]").attr("selected",true);
                    $("#parkingType_update_input").children("option").each(
                        function () {
                            if($(this).text()==result.parkingType) {
//                                alert(result.parkingType);
                                $(this).attr("selected",true);
                            }else{
                                $(this).attr("selected",false);
                            }
                        }
                    );

                    $("input[name=rate]").val(result.rate);
                }
            });
        });

        $("#user_update_btn").click(function () {
            let parkingNum = $("p#parkingNum_update_static").text();
            let location = $("input[name=location]").val();
//            let parkingType = $("input[name=parkingType]").val();
            let parkingType = $("#parkingType_update_input option:selected").text();

            let rate = $("input[name=rate]").val();
//            alert(parkingType);return false;
            $.ajax({
                url: "${APP_PATH}/updateParkingInfo",
                type: "post",
                data: {
                    "parkingNum": parkingNum,
                    "location": location,
                    "parkingType": parkingType,
                    "rate": rate
                },
                success: function (result) {
                    if(result.code == "100") {
                        $("#userUpdateModal .modal-footer>span.help-block").text("更新成功！")
                    }else{
                        $("#userUpdateModal .modal-footer>span.help-block").text(result.errMsg)
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
        let data ;
        if(userId == "" || userId == null) {
            data = {"pageNum": pageNum};
        }else{
            data = {"pageNum": pageNum,"parkingNum":userId};
        }
        $.ajax({
            url: "${APP_PATH}/parking_info",
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
        $("#page_info_area").append("当前"+result.extend.parkingInfos.pageNum+"页，总"
            +result.extend.parkingInfos.pages+"页，总"+result.extend.parkingInfos.total+"条记录");
        totalRecord=result.extend.parkingInfos.total;
        currentPage=result.extend.parkingInfos.pageNum;
    }
    <!--解析显示分页条，点击分页要能够去该页-->
    function build_pages_nav(result){
        $("#page_nav_area").empty();
        let ul=$("<ul></ul>").addClass("pagination");
        let firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        let prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.parkingInfos.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            firstPageLi.click(function(){
                to_page(1,userId);
            });
            prePageLi.click(function(){
                to_page(result.extend.parkingInfos.pageNum - 1,userId);
            });
        }
        let nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
        let lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.parkingInfos.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.parkingInfos.pageNum + 1,userId);
            });
            lastPageLi.click(function(){
                to_page(result.extend.parkingInfos.pages,userId);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.parkingInfos.navigatepageNums,function(index,item){
            let numLi=$("<li></li>").append($("<a></a>").append(item));
            if(result.extend.parkingInfos.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item,userId);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        let navEle=$("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area")
    }
    /**
     * 显示信息
     */
    function showUsers(result) {
        $("table tbody").empty();
        $.each(result.extend.parkingInfos.list,function (index,item) {
            let $userId = $("<td></td>").append(item.parkingNum);
            let $username = $("<td></td>").append(item.location);
            let $idnum = $("<td></td>").append(item.parkingType);
            let $carNum = $("<td></td>").append(item.rate);
            let $operation = $("<td></td>")
                .append($("<button class='btn btn-success editbtn' edit-id="+item.parkingNum+">Edit</button>"))
                        .append($("<button class='btn btn-danger deletebtn3'delete-id="+item.parkingNum+">Delete</button>"));
            if(item.parkingNum=="0") {
                $operation = $("<td></td>");
            }
            $("<tr></tr>").append($userId).append($username).append($idnum)
                .append($carNum).append($operation)
                .appendTo("table tbody");
        })
    }
</script>
