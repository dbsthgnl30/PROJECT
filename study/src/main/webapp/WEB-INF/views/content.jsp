<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><center>글 내용 보기</center></h2>
	<table align="center">
		<tr>
			<td align="right">
				<a href="/updateForm.do?no=${boardDto.no}">글수정</a>
				<a href="/delete.do?no=${boardDto.no}">글삭제</a>
				<a href="/writeForm.do">글쓰기</a>
				<a href="/list.do">글목록</a>
			</td>
		</tr>
	</table>
	<table border="1" align="center" bgcolor="ivory">
		<tr>
			<td>글제목</td>
			<td>${boardDto.title}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${boardDto.writer}</td>
		</tr>
		<tr>
			<td>글내용</td>
			<td>
				${fn:replace(boardDto.content,replaceChar,"<br>")}
			</td>
		</tr>
		<tr>
			<td>등록일</td>
			<td><fmt:formatDate value="${boardDto.writeDate}" pattern="yyyy년 MM월 dd일"/></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${boardDto.hit}</td>
		</tr>
	</table>
</body>
</html>
