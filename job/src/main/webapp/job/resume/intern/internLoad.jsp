<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>internLoad</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {		
		/* 총 개수 구함 */
		$.ajax({
			type: 'POST',
			url: 'LoadCount.do',
			dataType: 'text',
			cache: false,
			success: function(data) {
				$("#number").append(data);
				if(data == "0") {
					alert("인턴이력 없음");
				} else {
					alert("인턴이력");
										
						$.each(data.memberlist, function(index, memberlist) { // 이치를 써서 모든 데이터들을 배열에 넣음					

						var items = [];

						items.push("<td>" + memberlist.id + "</td>"); // 여기에 id pw addr tel의 값을 배열에 넣은뒤

						items.push("<td>" + memberlist.pw + "</td>");

						items.push("<td>" + memberlist.addr + "</td>");

						items.push("<td>" + memberlist.tel + "</td>");

						$("<tr/>", {

							html : items // 티알에 붙임,

						}).appendTo("table"); // 그리고 그 tr을 테이블에 붙임

					});					
				}
			},
			error : function(e) {
                alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
         	}
		});		
	});
	$(function() {		
		$("#cancle").click(function() {
			window.close();
		});
	});
</script>
<style type="text/css">
.title {
	font: 20px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: bold;
	color: #2A120A;
}
#load, #cancle {
	width:70px;
    background-color: #5882FA;
    border: none;
    color:#fff;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    margin: 4px;
    cursor: pointer;
}
#load:hover, #cancle:hover {
    background-color: #2E9AFE;
}
</style>
</head>
<body>
	<fieldset>
		<p class="title">인턴이력 불러오기</p>
		내 인턴이력 보관함 총&nbsp;<span id="number">&nbsp;</span>건
		<div>
			<table border="1" name="LoadList">
				<!-- 기본 -->
				<tr>
					<td>제목</td>
				</tr>
				<tr>
					<td>리스트1</td>
				</tr>
				<tr>
					<td>리스트2</td>
				</tr>
				<tr>
					<td>리스트3</td>
				</tr>
				<tr>
					<td>리스트4</td>
				</tr>
				<tr>
					<td>리스트5</td>
				</tr>
			</table>			
		</div>
		<input type="button" value="불러오기" id="load">
		<input type="button" value="취소" id="cancle">	
	</fieldset>
</body>
</html>