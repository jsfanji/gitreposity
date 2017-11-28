<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
td{
width: 100px;
border: 1px solid red;
}
</style>
</head>
<body>
	<img alt="此图确实" src="<%=basePath%>resources/img/bg.jpg" width="600px;"
		height="300px;">
		<table>
		<tr>
		<td>序号</td>
		<td>姓名</td>
		<td>账号</td>
		<td>创建时间</td>
		</tr>
		<c:forEach var="user" items="${result}">
		<tr>
		<td>${user.id}</td>
		<td>${user.name}</td>
		<td>${user.phone}</td>
		<td><fmt:formatDate value="${user.created_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
   		 </c:forEach>
		</table>
		
	<button onclick="testBtn()">按钮</button>
	
</body>
<script type="text/javascript">
	function testBtn() {
		alert("点击成功");
	}
</script>
</html>