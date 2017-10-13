<%--
  Created by IntelliJ IDEA.
  User: gaoshen
  Date: 2017/1/18
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <title>定时网页抓取任务列表</title>
    <%@include file="../../commons/header.jsp" %>
    <%@include file="../../commons/allScript.jsp" %>
</head>

<body>
<%@include file="../../commons/head.jsp" %>
<div class="container">
    <div class="row">
        <table class="table table-hover">
            <thead>
            <tr>
                <th style="text-align:center">网站名称</th>
                <th style="text-align:center">上次执行时间</th>
                <th style="text-align:center">下次执行时间</th>
                <th style="text-align:center">创建时间</th>
                <th style="text-align:center">删除任务</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="entry">
                <tr>
                    <td style="text-align:center">${entry.value.left.siteName}</td>
                    <td style="text-align:center"><fmt:formatDate value="${entry.value.right.previousFireTime}"
                                        pattern="yyyy/MM/dd HH:mm:ss"/></td>
                    <td style="text-align:center"><fmt:formatDate value="${entry.value.right.nextFireTime}"
                                        pattern="yyyy/MM/dd HH:mm:ss"/></td>
                    <td style="text-align:center"><fmt:formatDate value="${entry.value.right.startTime}"
                                        pattern="yyyy/MM/dd HH:mm:ss"/></td>
                    <td style="text-align:center">
                        <button onclick="rpcAndShowData2('删除定时任务','${pageContext.request.contextPath}/commons/spider/removeQuartzJob',{spiderInfoId: '${entry.key}'},'${pageContext.request.contextPath}/panel/commons/listQuartz')" class="am-btn am-btn-default">删除定时任务
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<%@include file="../../commons/minScript.jsp" %>
<script>
    function deleteQuartzJob(spiderInfoId) {
        var cc = confirm("是否要删除定时任务");
        if (cc) {
            $.get('${pageContext.request.contextPath}/commons/spider/removeQuartzJob', {spiderInfoId: spiderInfoId}, function () {
                alert("删除定时任务成功");
            });
        }
    }
</script>
</body>

</html>