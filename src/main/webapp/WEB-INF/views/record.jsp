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
                        <label class="col-sm-2 control-label">车卡编号</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="cardNum_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户ID</label>
                        <div class="col-sm-8">
                            <input type="text" name="userId" class="form-control" id="userId_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车卡类型</label>
                        <div class="col-sm-8">
                            <input type="text" name="cardType" class="form-control" id="cardType_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车位编号</label>
                        <div class="col-sm-8">
                            <input type="text" name="parkingNum" class="form-control" id="parkingNum_update_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车卡余额</label>
                        <div class="col-sm-8">
                            <input type="text" name="balance" class="form-control" id="balance_update_input">
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
                        <label class="col-sm-2 control-label">用户ID</label>
                        <div class="col-sm-8">
                            <input type="text" name="userId1" class="form-control" id="userId_Add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车卡类型</label>
                        <div class="col-sm-8">
                            <input type="text" name="cardype1" class="form-control" id="cardType_Add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">车位编号</label>
                        <div class="col-sm-8">
                            <input type="text" name="parkingNum1" class="form-control" id="parkingNum_Add_input">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">余额</label>
                        <div class="col-sm-8">
                            <input type="text" name="balance1" class="form-control" id="balance_Add_input">
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
                <option selected>发票编号</option>
                <%--<option>车卡号</option>--%>
                <%--<option>车位号</option>--%>
            </select>
            <div class="form-group">
                <input type="text" class="form-control" id="userId"/>
            </div>
            <button type="button" class="btn btn-info" id="search">查询</button>
            <%--<button type="button" class="btn btn-info" id="addUser">添加</button>--%>
        </form>
    </div>
</div>

<table class="table table-hover table-condensed table-striped">
    <thead>
    <tr>
        <th>车位编号</th>
        <th>车牌号</th>
        <th>停车时间</th>
        <th>花费金额</th>
        <th>发票编号</th>
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
            let userId1 = $("input[name=userId1]").val();
            let cardType1 = $("input[name=cardType1]").val();
            let parkingNum1 = $("input[name=parkingNum1]").val();
            let balance1 = $("input[name=balance1]").val();
            $.ajax({
                url: "${APP_PATH}/addCard",
                type: "post",
                data: {
                    "userId": userId1,
                    "cardType": cardType1,
                    "parkingNum": parkingNum1,
                    "balance": balance1
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
                url: "${APP_PATH}/getCardByCardNum",
                type: "post",
                data:{"cardNum":$(this).attr("edit-id")},
                success: function (result) {
                    result = result.extend.card;
                    $("p#cardNum_update_static").text(result.cardNum);
                    $("input[name=userId]").val(result.userId);
                    $("input[name=cardType]").val(result.cardType);
                    $("input[name=parkingNum]").val(result.parkingNum);
                    $("input[name=balance]").val(result.balance);
                }
            });
        });

        $("#user_update_btn").click(function () {
            let cardNum = $("p#cardNum_update_static").text();
            let userId = $("input[name=userId]").val();
            let cardType = $("input[name=cardType]").val();
            let parkingNum = $("input[name=parkingNum]").val();
            let balance = $("input[name=balance]").val();
            $.ajax({
                url: "${APP_PATH}/updateCard",
                type: "post",
                data: {
                    "cardNum": cardNum,
                    "userId": userId,
                    "cardType": cardType,
                    "parkingNum": parkingNum,
                    "balance": balance
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
        let data ;
        if(userId == "" || userId == null) {
            data = {"pageNum": pageNum};
        }else{
            data = {"pageNum": pageNum,"invoice":userId};
        }
        $.ajax({
            url: "${APP_PATH}/records",
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
        $("#page_info_area").append("当前"+result.extend.cards.pageNum+"页，总"
            +result.extend.cards.pages+"页，总"+result.extend.cards.total+"条记录");
        totalRecord=result.extend.cards.total;
        currentPage=result.extend.cards.pageNum;
    }
    <!--解析显示分页条，点击分页要能够去该页-->
    function build_pages_nav(result){
        $("#page_nav_area").empty();
        let ul=$("<ul></ul>").addClass("pagination");
        let firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        let prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.cards.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            firstPageLi.click(function(){
                to_page(1,userId);
            });
            prePageLi.click(function(){
                to_page(result.extend.cards.pageNum - 1,userId);
            });
        }
        let nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
        let lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.cards.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.cards.pageNum + 1,userId);
            });
            lastPageLi.click(function(){
                to_page(result.extend.cards.pages,userId);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.cards.navigatepageNums,function(index,item){
            let numLi=$("<li></li>").append($("<a></a>").append(item));
            if(result.extend.cards.pageNum == item){
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
        $.each(result.extend.cards.list,function (index,item) {
            let $userId = $("<td></td>").append(item.parkingNum);
            let $username = $("<td></td>").append(item.carNum);
            let $balance = $("<td></td>").append(item.parkingTime);
            let $isInPosition = $("<td></td>").append(item.cost);
            let $invoice = $("<td></td>").append(item.invoice);
            let $operation = $("<td></td>")
                .append($("<button class='btn btn-success editbtn' edit-id="+item.cardNum+">Edit</button>"));
//                        .append($("<button class='btn btn-danger deletebtn'delete-id="+item.userId+">Delete</button>"));
            $("<tr></tr>").append($userId).append($username)
                .append($balance).append($isInPosition).append($invoice)
//                .append($operation)
                .appendTo("table tbody");
        })
    }
</script>
