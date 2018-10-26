<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>psLoadPopUp</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		/* 자기소개서의 총 개수 구함 */
		$.ajax({
			type: 'POST',
			url: 'rsprLoadCount.do',
			dataType: 'text',
			cache: false,
			success: function(data) {
				$("#numberOfPr").append(data);
				if(data == "0") {
					alert("자기소개서 없음");
				} else {
					alert("자기소개서 있을 때");
					/* Json 하는 거 어떻게 하지 ㅠㅠ 
					$.ajax({
						type: 'POST',
						url: 'rsprLoad.do',
						dataType: 'json',
						cache: false,
						success: function(data) {
							alert(data.rsprUserTitleList);
							
						},
						error : function(e) {

			                alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');

			         	}
					});
					*/
					
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
</script>
</head>
<body>
	<h3>자기소개서 불러오기</h3>
	<!-- float로 연결하든가.. 암튼 한 줄에 표현되어야 함 -->
	내 자소서 보관함 총&nbsp;<span id="numberOfPr" style="color: orange;">&nbsp;</span>건
	<div style="width: 400px; height: 200px; overflow-y: scroll; overflow-x: hidden;">
		<table border="1" name="rsprLoadList">
			<!-- 기본 -->
			<tr><td>제목</td></tr>
			<!--  -->
			
			<tr>
				<td>하잉아ㅇ엉ㅇ</td>
			</tr>
			<tr>
				<td>하잉</td>
			</tr>
			<tr>
				<td>하잉</td>
			</tr>
			<tr>
				<td>하잉</td>
			</tr>
			<tr>
				<td>하잉</td>
			</tr>
			<tr>
				<td>하잉</td>
			</tr>
			<tr>
				<td>하잉</td>
			</tr>
			<tr>
				<td>하잉</td>
			</tr>
			<tr>
				<td>하잉</td>
			</tr>
			<tr>
				<td>하잉</td>
			</tr>
		</table>
	</div>
</body>
</html>