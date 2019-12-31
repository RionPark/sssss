<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<div class="container">
			<a class="navbar-brand" href="#"> <img
				src="http://placehold.it/150x50?text=Logo" alt="">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item " data-page="main">
						<a class="nav-link"  >
							Home<span class="sr-only"> (current)</span>
						</a>
					</li>
					<li class="nav-item" data-page="login"><a class="nav-link" >로그인</a></li>
					<li class="nav-item" data-page="join"><a class="nav-link"  >회원가입</a></li>
					<li class="nav-item" data-page="test/test-list"><a class="nav-link"  >리스트</a></li>
					<li class="nav-item" data-page="contact"><a class="nav-link"  >Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<c:if test="${empty param.page}">
			<jsp:include page="/WEB-INF/front/main.jsp"></jsp:include>
		</c:if>
		<c:if test="${not empty param.page}">
			<jsp:include page="/WEB-INF/front/${param.page}.jsp"></jsp:include>
		</c:if>
	</div>
<script>
$(document).ready(function(){
	var pPage = '${param.page}';
	if(!pPage){
		pPage = 'main';
	}
	$('li[data-page]').removeClass('active');
	$('li[data-page="' + pPage + '"]').addClass('active');
	$('li[data-page],button[data-page]').on('click',function(){
		var page = this.getAttribute('data-page');
		location.href='/?page=' + page;
	})
})
</script>
</body>
</html>