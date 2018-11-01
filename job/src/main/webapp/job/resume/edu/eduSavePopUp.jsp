<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육이수저장폼</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var save = "${param.numbering}";
		alert("[savePopUp] numbering : " + save);
		var rse_Name = $("#rse_Name"+save, opener.document).val();
		var rse_Company = $("#rse_Company"+save, opener.document).val();
		var rse_Startdate = $("#rse_Startdate"+save, opener.document).val();
		var rse_Enddate = $("#rse_Enddate"+save, opener.document).val();
		var rse_Content = $("#rse_Content"+save, opener.document).val();
		
		alert(rse_Name + " // " + rse_Company + " // " + rse_Startdate + " // "
				+ rse_Enddate + " // " + rse_Content);
		
		$("#RSE_save_submit").click(function() {
			if(!$("#rse_UserTitle").val()) {
				alert("자기소개서 제목을 입력해주세요");
				$("#rse_UserTitle").focus();
				return false;
			}
			
			var rse_UserTitle = $("#rse_UserTitle").val();
			
			$.ajax({
				type: 'POST',
				url: 'rseSave.do',
				dataType: 'text',
				data: {
					"rse_Name": rse_Name,
					"rse_Company": rse_Company,
					"rse_Startdate": rse_Startdate,
					"rse_Enddate": rse_Enddate,
					"rse_Content": rse_Content,
					"rse_UserTitle": rse_UserTitle
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
		
		$("#RSE_save_cancle").click(function() {
			window.close();
		});
	});
</script>
</head>
<body>
	<div style="background: #f5f7fb; padding: 10px; padding-top: 2px;">
		<h3>교육이수 관리에 저장</h3>
		<p>저장하실 제목을 입력해주세요</p>
		<!-- <form action="rseSave.do" method="post" name="rseSaveForm"> -->
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" id="rse_UserTitle" name="rse_UserTitle"></td>
			</tr>
		</table>
		<input type="button" value="완료" id="RSE_save_submit">
		<input type="button" value="취소" id="RSE_save_cancle">
		<!-- </form> -->
	</div>
</body>
</html>