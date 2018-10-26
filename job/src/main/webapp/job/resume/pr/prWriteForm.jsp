<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자기소개서폼</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#RSPR_saveA").click(function() {
			if(!$("#rsprTitle").val()) {
				alert("자기소개서의 제목을 입력해주세요.");
				$("#rsprTitle").focus();
			} else if(!$("#rsprContent").val()){
				alert("자기소개서의 내용을 입력해주세요.");
				$("#rsprContent").focus();
			} else {
				window.open("./prSavePopUp.jsp", "", "width=500px height=500px");
			}			
		});
		
		$("#RSPR_loadA").click(function() {
			window.open("./prLoadPopUp.jsp", "", "width=500px height=500px");
		});
	});
</script>
</head>
<body>
	<!-- jQuery로 생성할 부분.. 자기소개서 누르면 나타남 -->
	<div id="PR_div"
		style="display: inline-block; margin: 15px; width: 95%; background-color: #f5f7fb;">
		<h3>자기소개서</h3>
		<div style="background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block; float: left;">
			<a href="#" id="RSPR_loadA">내 자소서 불러오기</a>
		</div>
		<div style="background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block; float: left;">
			<a href="#" id="RSPR_saveA">자소서관리에 저장</a>
		</div>
		<p style="clear: both; font-size: 12px; margin: 3px;">
		각 항목명은 변경할 수 있으며(최대 45자), 항목은 총 10개까지 작성 가능합니다. ㅇ아아앙ㅇㅇㅇㅇㅇ아아ㅏ아아</p>
		<br>
		<div style="padding: 3px;">
			<input type="text" placeholder="제목을 입력하세요."
				style="float: left; width: 539px; height: 30px;" id="rsprTitle">
			<!-- <div style="text-align: center; border: 1px solid gray; width: 30px; height: 34px; float: left; font-size: 30px;">X</div> -->
			<div style="clear: both;">
				<textarea class="autosize" cols="65" style="min-height: 150px;" id="rsprContent"></textarea>
			</div>
		</div>
	</div>
</body>
</html>