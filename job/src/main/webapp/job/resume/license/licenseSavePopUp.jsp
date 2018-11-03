<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자격증저장폼</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var save = "${param.numbering}";
		console.log("[savePopUp] numbering : " + save);
		var rsls_Name = $("#rsls_Name"+save, opener.document).val();
		var rsls_Company = $("#rsls_Company"+save, opener.document).val();
		var rsls_Date = $("#rsls_Date"+save, opener.document).val();
		
		console.log(rsls_Name + " // " + rsls_Company + " // " + rsls_Date);
		
		$("#RSLS_save_submit").click(function() {
			if(!$("#rsls_UserTitle").val()) {
				alert("자기소개서 제목을 입력해주세요");
				$("#rsls_UserTitle").focus();
				return false;
			}
			
			var rsls_UserTitle = $("#rsls_UserTitle").val();
			
			$.ajax({
				type: 'POST',
				url: 'rslsSave.do',
				dataType: 'text',
				data: {
					"rsls_Name": rsls_Name,
					"rsls_Company": rsls_Company,
					"rsls_Date": rsls_Date,
					"rsls_UserTitle": rsls_UserTitle
				},
				success: function(data) {
					if(data > 0) {
						alert("성공");
						window.close();
					} else {
						alert("실패");
					}
				}
			});
		});
		
		$("#RSLS_save_cancle").click(function() {
			window.close();
		});
	});
</script>
</head>
<body>
	<div style="background: #f5f7fb; padding: 10px; padding-top: 2px;">
		<h3>자격증 관리에 저장</h3>
		<p>저장하실 제목을 입력해주세요</p>
		<!-- <form action="rseSave.do" method="post" name="rseSaveForm"> -->
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" id="rsls_UserTitle" name="rsls_UserTitle"></td>
			</tr>
		</table>
		<input type="button" value="완료" id="RSLS_save_submit">
		<input type="button" value="취소" id="RSLS_save_cancle">
		<!-- </form> -->
	</div>
</body>
</html>