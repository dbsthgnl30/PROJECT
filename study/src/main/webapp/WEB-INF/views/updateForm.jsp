<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function check(){
		if($("#title").val()==""||$("#title").val()==null){
			alert("글제목을 입력해주세요");
			$("#writer").focus();
			return;
		}//check title 
		if($("#writer").val()==""||$("#writer").val()==null){
			alert("작성자를 입력해주세요");
			$("#writer").focus();
			return;
		}//check writer 
		if($("#content").val()==""||$("#content").val()==null){
			alert("글내용을 입력해주세요");
			$("#content").focus();
			return;
		}//check content 
		
		$("#updateForm").submit();
	}
</script>
</head>
<body>
	<h2><center>글수정</center></h2>
	<form id="updateForm" method="post" action="updatePro.do">
		<table border="1" align="center" bgcolor="ivory">
			<tr>
				<td>글제목</td>
				<td>
					<input type="hidden" name="no" id="no" value="${boardDto.no}">
					<input type="text" name="title" id="title" value="${boardDto.title}" size="40">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="writer" id="writer" value="${boardDto.writer}" size="40">
				</td>
			</tr>
			<tr>
				<td>글내용</td>
				<td>
					<textarea id="content" name="content" rows="10" cols="50">${boardDto.content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="글수정" onClick="check()">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
