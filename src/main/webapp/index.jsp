<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/23
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <!-- web路径：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
    以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/crud -->
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <%--    引入jquery--%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <%--    引入bootstrap样式--%>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

</head>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pn=1",
            type: "get",
            success: function (result) {
                build_emps_table(result)
            }
        })

        // 表格内容
        function build_emps_table(result) {
            var emps = result.extend.pageInfo.list;
            $.each(emps, function (index, item) {
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var emialTd = $("<td></td>").append(item.email);
                var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
                var deptNameTd = $("<td></td>").append(item.department.deptName);
                var editBtn = $("<button></button>").addClass("btn btn-info btn-sm")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑"));
                var deletBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash").append("删除"));
                var btnTd = $("<td></td>").append(editBtn).append(" ").append(deletBtn);
                $("<tr></tr>").append(empIdTd)
                    .append(empNameTd)
                    .append(emialTd)
                    .append(genderTd)
                    .append(deptNameTd)
                    .append(btnTd).appendTo($("#emps_table tbody"));
            })
        }

        // 分页信息
        function build_page_info(result) {
            
        }

        // 分页导航栏

    })
</script>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>

    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-info">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--    显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table id="emps_table" class="table table-hover">
                <%--                表头--%>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>姓名</th>
                        <th>邮箱</th>
                        <th>性别</th>
                        <th>部门名字</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <%--                表格内容--%>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <%--    显示分页信息--%>
    <div class="row">
        <%--        分页文字信息--%>
        <div class="col-md-6">
            当前第页，共有页，总计条记录
        </div>
    </div>


    <%--    分页条--%>
    <div class="row">
        <div class="col-md-6 col-md-offset-6">

        </div>
    </div>

</div>

</body>
</html>

