<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<table id="table">
		<thead>
			<tr>
				<th data-checkbox="true" ><input type="checkbox" id="allTiNum"></th>
				<th data-field="tiNum">번호</th>
				<th data-field="tiName">이름</th>
				<th data-field="tiAddr">주소</th>
				<th data-field="tiEtc">비고</th>
			</tr>
		</thead>
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
	$(document).ready(function() {
		goPage(1);
	})

	function goPage(page) {
		$.ajax({
			url : '/tests',
			method : 'GET',
			data : 'page.page=' + page,
			success : function(res) {
				$('#table').bootstrapTable("destroy");
				$('#table').bootstrapTable({
					data : res.list
				});
				var totalPage = Math.ceil(res.page.totalCount / rowCount);
				var sPage = Math.floor((res.page.page - 1) / 10) * 10 + 1;
				var ePage = sPage + 9;
				if (ePage > totalPage) {
					ePage = totalPage;
				}
				var html = '';
				if (sPage != 1) {
					html += '<a data-page="' + (sPage - 10) + '">◀</a>';
				}
				for (var i = sPage; i <= ePage; i++) {
					if (i == res.page.page) {
						html += '<b> [ ' + i + ' ] </b>';
					} else {
						html += '<a data-page="' + i + '"> [ ' + i + ' ] </a>';
					}
				}
				html += '<a data-page="' + (sPage + 10) + '">▶</a>';
				$('#pagination').html(html);
				setEvent();
			}
		})
	}
	function setEvent() {
		$('a[data-page]').on('click', function() {
			goPage(this.getAttribute('data-page'));
		})
		$('tr[data-index]').on('click',function(){
			var tiNum = $(this).find('td')[1].innerText;
			alert(tiNum);
			location.href='/?page=test-view&tiNum='+tiNum;
		})
	}
</script>



