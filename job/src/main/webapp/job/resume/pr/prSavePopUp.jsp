<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>psSavePopUp</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var rsprTitle = $("#rsprTitle", opener.document).val();
		var rsprContent = $("#rsprContent", opener.document).val();
		console.log(rsprTitle + " // " + rsprContent);
		
		$("#RSPR_save_submit").click(function() {
			if(!$("#rsprUserTitle").val()) {
				alert("자기소개서 제목을 입력해주세요");
				$("#rsprUserTitle").focus();
				return false;
			}
			 
			var rsprUserTitle = $("#rsprUserTitle").val();
			
			$.ajax({
				type: 'POST',
				url: 'rsprSave.do',
				dataType: 'text',
				data: {
					"rsprTitle": rsprTitle,
					"rsprContent": rsprContent,
					"rsprUserTitle": rsprUserTitle
				},
				success: function(data) {
					if(data > 0) {
						alert("성공");
						$("#rspr_Seq", opener.document).val(data);
						window.close();
					} else {
						alert("실패");
					}
				}
			});
		});
		
		$("#RSPR_save_cancle").click(function() {
			window.close();
		});
	});
</script>
<style type="text/css">
	#RSPR_save_submit {padding: 5px 10px 5px 10px; background-color: #5882FA; border: 0; color: white;}
	#RSPR_save_cancle {padding: 5px 10px 5px 10px; background-color: white; border: 1px solid lightgray;}
</style>
</head>
<body>
<div style="background: #f5f7fb; padding: 10px; padding-top: 2px;">
	<h3>자소서 관리에 저장</h3>
	<p>저장하실 자기소개서 제목을 입력해주세요</p>
	<!-- <form action="rsprSave.do" method="post" name="rsprSaveForm"> -->
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" id="rsprUserTitle" name="rsprUserTitle"></td>
		</tr>
	</table>
	<input type="button" value="완료" id="RSPR_save_submit">
	<input type="button" value="취소" id="RSPR_save_cancle">
	<!-- </form> -->
</div>
</body>
</html>