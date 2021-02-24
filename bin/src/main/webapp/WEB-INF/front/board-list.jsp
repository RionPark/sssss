<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#parent {position: relative;}

#child {
}
.loader {
    position: absolute;
    top: 120px;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
  border: 16px solid #f3f3f3; /* Light grey */
  border-top: 16px solid #3498db; /* Blue */
  border-radius: 50%;
  width: 120px;
  height: 120px;
  animation: spin 2s linear infinite;
  
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
</head>
<body>
<div id="enters"></div>
<div id="parent">
	<div class="loader"></div>
</div>
<script>
function load(page){
	$('.loader').css('display','');
	var data = 'page=' + page + '&pageSize=10';
	$.ajax({
		url : '/boardinfos',
		method:'GET',
		data : data,
		success : function(res){
			console.log(res);
			console.log(res.length);
			var html ='';
			for(var i=0;i<res.length;i++){
				var bi = res[i];
				html += '<h1>' + bi.biTitle + '</h1>';
				html += '<h4> 글쓴이 : ' + bi.biWriter + '</h4>';
				if(bi.biFile){
					html += '<img src="/resources/' + bi.biFile + '"><br>';
				}
				html += '<div class="content">' + bi.biContent + '</div>';
			}
			$("#enters").append(html);
			$('.loader').css('display','none');
		}
	})
}
var page = 1;
$(document).ready(function(){
	if ($("body").height() < $(window).height()) {
		load(page);
    }
});
$(window).scroll(function() {
	var reload = $(document).height() - $(window).height()-$(window).scrollTop();
    if (reload>=0 && reload<=1) {
      console.log(++page);
      load(page);
      
    }
});
</script>
</body>
</html>