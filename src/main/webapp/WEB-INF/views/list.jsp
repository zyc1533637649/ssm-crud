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
            <table class="table table-hover">
                <%--                表头--%>
                <tr>
                    <th>选择框</th>
                    <th>#</th>
                    <th>姓名</th>
                    <th>邮箱</th>
                    <th>性别</th>
                    <th>部门名字</th>
                    <th>操作</th>
                </tr>
                <%--                表格内容--%>
                <c:forEach items="${pageInfo.list}" var="employee">
                    <tr>
                        <th>1</th>
                        <th>#</th>
                        <th>${employee.empName}</th>
                        <th>${employee.email}</th>
                        <th>${employee.gender == "M"?"男":"女"}</th>
                        <th>${employee.department.deptName}</th>
                        <th>
                            <button class="btn btn-info btn-sm">编辑<span class="glyphicon glyphicon-pencil"
                                                                        aria-hidden="true"></span></button>
                            <button class="btn btn-danger btn-sm">删除<span class="glyphicon glyphicon-trash"
                                                                          aria-hidden="true"></span></button>
                        </th>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>

    <%--    显示分页信息--%>
    <div class="row">
        <%--        分页文字信息--%>
        <div class="col-md-6">
            当前第${pageInfo.pageNum}页，共有${pageInfo.pages}页，总计${pageInfo.total}条记录
        </div>
    </div>

    <%--    分页条--%>
    <div class="row">
        <div class="col-md-6 col-md-offset-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pageInfo.pageNum==pageInfo.firstPage}">
                        <li class="disabled"><a>首页</a></li>
                        <li class="disabled">
                            <a aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo.pageNum!=pageInfo.firstPage}">
                        <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                        <c:if test="${pageNum==pageInfo.pageNum}">
                            <li class="active"><a>${pageNum}</a></li>
                        </c:if>
                        <c:if test="${pageNum!=pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/emps?pn=${pageNum}">${pageNum}</a></li>
                        </c:if>

                    </c:forEach>
                    <c:if test="${pageInfo.pageNum==pageInfo.pages}">
                        <li class="disabled">
                            <a aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li class="disabled"><a>尾页</a></li>
                    </c:if>
                    <c:if test="${pageInfo.pageNum!=pageInfo.pages}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">尾页</a></li>
                    </c:if>

                </ul>
            </nav>

        </div>
    </div>


</div>
</body>
</html>

