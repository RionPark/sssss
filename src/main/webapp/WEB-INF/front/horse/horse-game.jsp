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
.rain{
	width:1000px;
	height:50px;
	margin : 0 auto;
	position:relative;
	background:lightBlue;
}
.horse{
	width:50px;
	height:50px;
	padding:0;
	margin:0;
	position:absolute;
	background:brown;
	text-align:center;
	color:white;
}
</style>
</head>
<body>
<div class="init">
말 갯수 : <input type="text" id="hCnt">
<button id="startBtn">게임 시작</button>
</div>
<div class="game">
</div>
<div id="result">
</div>
<script>
var winner = 0;
function startGame(){
	var cnt = document.querySelector('#hCnt').value;
	for(let i=0;i<cnt;i++){
		let el = document.querySelector('#h' + i);
		let sum = 1;
		let si = setInterval(()=>{
			let left = Math.floor(Math.random()*10)+1;
			sum += left;
			el.style.left = sum + 'px';
			if(sum>=950){
				el.style.left = 950 + 'px';
				clearInterval(si);
				document.querySelector('#result').innerHTML += el.innerText + ' : ' + (winner++) + '등<br>'
			}
		},30);
	}
}
window.onload = function(){
	document.querySelector('#startBtn').onclick = function(){
		var cnt = document.querySelector('#hCnt').value;
		document.querySelector('.init').style.display='none';
		var html ='';
		for(var i=0;i<cnt;i++){
			html += '<div id="rain' + i + '" class="rain">';
			html += '<div id="h' + i + '" class="horse"><b>말' + (i+1) + '</b></div>';
			html += '</div>';
		}
		html +='<button onclick="startGame()">말달리자</button>';
		document.querySelector('.game').innerHTML = html;
		
	}
}
</script>
</body>
</html>


