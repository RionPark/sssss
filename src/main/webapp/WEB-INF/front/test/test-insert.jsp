<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h3>게시물 작성</h3>
<table class="table table-bordered">
	<tr>
		<th>이름</th>
		<td><input type="text" name="tiName" id="tiName" maxlength="100"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="tiAddr" id="tiAddr" maxlength="200"></td>
	</tr>
	<tr>
		<th>비고</th>
		<td><textarea name="tiEtc" id="tiEtc" cols=30 rows=10
				maxlength="1000"></textarea></td>
	</tr>
	<tr>
		<th colspan="2"><button id="tiInsert">등록</button></th>
	</tr>
</table>
<script>
 	$(document).ready(function(){
 		$('#tiInsert').on('click',function(){
 			if($('#tiName').val().trim().length<2){
 				alert('이름은 2글자 이상입니다.');
 				return false;
 			}
 			if($('#tiAddr').val().trim().length<10){
 				alert('주소는 10글자 이상입니다.');
 				return false;
 			}
 			var param = {
 					tiName : $('#tiName').val().trim(),
 					tiAddr : $('#tiAddr').val().trim(),
 					tiEtc : $('#tiEtc').val().trim()
 			}
 			$.ajax({
 				url:'/test',
 				method:'POST',
 				data:JSON.stringify(param),
				beforeSend : function(xhr){
					xhr.setRequestHeader('Content-type','application/json;charset=utf-8')
				},
 				success:function(res){
 					console.log(res);
 				}
 			})
 		})
 	})
 </script>


