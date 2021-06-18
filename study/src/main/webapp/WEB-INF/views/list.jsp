<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><center>리스트</center></h2>
	<table border="1" align="center" bgcolor="ivory">
		<tr>
			<td>작성자</td>
			<td>글제목</td>
			<td>등록일</td>
			<td>조회수</td>
		</tr>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.writer}</td>
				<td><a href="/content.do?no=${dto.no}">${dto.title}</a></td>
				<td><fmt:formatDate value="${dto.writeDate}" type="date"/></td>
				<td>${dto.hit}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
