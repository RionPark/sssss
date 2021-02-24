<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${! empty result}">
<script>
	alert(1);
</script>
</c:if>
<form method="post" action="">
	<input type="text" name="biName" placeholder="이름"><br>
	<input type="text" name="biTitle" placeholder="이름"><br>
	<textarea name="biContent"></textarea><br>
	<button>글쓰기</button>
</form>
</body>
</html>