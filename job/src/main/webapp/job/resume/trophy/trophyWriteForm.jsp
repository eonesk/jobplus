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
		$("#trophysave").click(
			function() {
				if (!$("#rstName").val()) {
					alert("수상명을 입력하세요.");
					$("#rstName").focus();
				} else if (!$("#rstCompany").val()) {
					alert("수여기관을 입력하세요.");
					$("#rstCompany").focus();
				} else if (!$("#rstDate").val()) {
					alert("수상연도을 입력하세요.");
					$("#rstDate").focus();
				} else if (!$("#rstContent").val()) {
					alert("수여내용을 입력하세요.");
					$("#rstContent").focus();
				} else {
					window.open("./trophyWrite.jsp", "",
							"width=500px height=500px");
				}
			});
		$("#trophyload").click(function() {
			window.open("trophyLoad.jsp", "", "width=500px height=500px");
		});
	});
</script>
</head>
<body class="write">
<fieldset>
	<p class="title">수상내역</p>
	<div id="t" class="t">
		<br>	
		<div>		
			<input type="text" id="rstName" name="rstName" class="rstName" placeholder="수상명" size="30">
			<input type="text" id="rstCompany" name="rstCompany" class="rstCompany" placeholder="수여기관" size="30">
			<input type="date" id="rstDate" name="rstDate" class="rstDate" placeholder="수상연도" size="7">
		</div>
		<div>			
			<textarea id="rstContent" name="rstContent" class="rstContent" placeholder="수여내용" cols="70" rows="5"></textarea>
		</div>		
		<div>
			<!-- <input type="submit" value="저장"> -->
			<input type="button" value="저장하기" id="trophysave" class="trophysave">
			<input type="button" value="불러오기" id="trophyload" class="trophyload">
			<!-- 			
			<script type="text/javascript" src="script/internScript.js"></script>
			<input type="button" value="새창" onclick="window.open('', '이력서 저장', 'width=700, height=400')">		
			<input type="button" value="저장하기" onclick="checkWrite()">
			 -->
		</div>
	</div>	
</fieldset>
</body>
</html>