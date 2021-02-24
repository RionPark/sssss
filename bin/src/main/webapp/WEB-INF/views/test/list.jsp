<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/bootstrap-table.min.js"></script>

<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/bootstrap-reboot.min.css" />
<link rel="stylesheet" href="/css/bootstrap-grid.min.css" />
<link rel="stylesheet" href="/css/bootstrap-table.min.css" />

<style>
tr[data-index]{
	cursor:pointer;
}
a[data-page]{
	color:blue !important;
}
a[data-page]:hover{
	font-weight:bold;
	color:orange;
	cursor:pointer;
}
</style>
</head>
<body>

<div class="container">
	<table id="table" class="table table-bordered">
		<thead>
			<tr>
				<th data-checkbox="true" ><input type="checkbox" id="allTiNum"></th>
				<th data-field="tiNum">번호</th>
				<th data-field="tiName">이름</th>
				<th data-field="tiAddr">주소</th>
				<th data-field="tiEtc">비고</th>
			</tr>
		</thead>
		<c:forEach items="${rMap.list}" var="test">
			<tr>
				<td><input type="checkbox"  name="tiNum" value="${test.tiNum }"></td>
				<td>${test.tiNum }</td>
				<td>${test.tiName }</td>
				<td>${test.tiAddr }</td>
				<td>${test.tiEtc }</td>
			</tr>
		</c:forEach>
	</table>
	<div id="pagination" style="text-align: center"></div>
	<button data-page="test/test-insert">게시물작성</button>
	<button onclick="deleteTestInfo()">게시물 삭제</button>
</div>
<script>
	var rowCount = 10;

	function deleteTestInfo() {
		var checkedObjs = $('input[type=checkbox][data-index]:checked');
		var tiNums = [];
		for (var i = 0; i < checkedObjs.length; i++) {
			console.log(checkedObjs[i].getAttribute('data-index'));
			tiNums.push($('tr[data-index='	+ checkedObjs[i].getAttribute('data-index')	+ ']>td')[1].innerText);
		}
		console.log(tiNums);
		$.ajax({
			url : '/tests',
			method : 'DELETE',
			data : JSON.stringify(tiNums),
			beforeSend : function(xhr) {
				xhr.setRequestHeader('Content-type','application/json;charset=utf-8');
			},
			success : function(res) {
				console.log(res);
			}
		})
	}
</script>
</body>
</html>