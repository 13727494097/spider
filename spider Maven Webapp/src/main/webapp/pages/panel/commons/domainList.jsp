<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gaoshen
  Date: 16/5/5
  Time: 下午6:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网站列表</title>
    <%@include file="../../commons/header.jsp" %>
</head>
<body>
<%@include file="../../commons/head.jsp" %>
<div class="container">
    <table class="table table-hover">
        <thead>
        <tr>
            <th style="text-align:center">#</th>
            <th style="text-align:center">网站域名</th>
            <th style="text-align:center">资讯数</th>
            <th style="text-align:center">查看列表</th>
            <th style="text-align:center">删除</th>
            <th style="text-align:center">导出数据</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${domainList}" var="domain" varStatus="index">
            <tr>
                <th scope="row" style="text-align:center">${index.count}</th>
                <td style="text-align:center">${domain.key}</td>
                <td style="text-align:center">${domain.value}</td>
                <td style="text-align:center"><a class="btn btn-info"
                       href="${pageContext.request.contextPath}/panel/commons/list?domain=${domain.key}">查看资讯列表</a>
                </td>
                <td style="text-align:center"><a class="btn btn-danger"
                       onclick="rpcAndShowData2('删除网站数据','${pageContext.request.contextPath}/commons/webpage/deleteByDomain', {domain: '${domain.key}'},'${pageContext.request.contextPath}/panel/commons/domainList');">删除网站数据</a>
                </td>
                <td style="text-align:center">
                <div class="btn-group">
                            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                导出数据
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item"
                       				href="${pageContext.request.contextPath}/commons/webpage/exportWebpageJSONByDomain?domain=${domain.key}">导出该网站数据JSON</a>
                                <a  class="dropdown-item"
                                	onclick="rpcAndShowData2('导出到数据库','${pageContext.request.contextPath}/commons/webpage/exportWebpageDATABASEyDomain',{domain:'${domain.key}'},'${pageContext.request.contextPath}/panel/commons/domainList')"
                                   >导出到数据库</a>
                            </div>
                        </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="container" id="wordCloudBody" style="height:400px"></div>
<%@include file="../../commons/allScript.jsp" %>
</body>
</html>
