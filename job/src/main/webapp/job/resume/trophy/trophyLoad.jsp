<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 총 개수
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
				}
			}
		});
	});
</script>
</head>
<body>
	<h3>수상내역 불러오기</h3>
	내 수상내역 보관함 총&nbsp;<span id="number">&nbsp;</span>건
	<div>
		<table border="1" name="LoadList">
			<!-- 기본 -->
			<tr><td>제목</td></tr>			
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
</body>
</html>