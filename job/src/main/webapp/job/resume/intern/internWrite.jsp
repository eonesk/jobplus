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
		var rsit_Type = $("#rsit_Type", opener.document).val();
		var rsit_Company = $("#rsit_Company", opener.document).val();
		var rsit_Startdate = $("#rsit_Startdate", opener.document).val();
		var rsit_Enddate = $("#rsit_Enddate", opener.document).val();
		var rsit_Content = $("#rsit_Content", opener.document).val();
		alert(rsit_Type + " // " + rsit_Company+ " // " + rsit_Startdate
				+ " // " + rsit_Enddate+ " // " + rsit_Content);
		
		$("#save").click(function() {
			if(!$("#rsit_UserTitle").val()) {
				alert("이력서 제목을 입력해주세요");
				$("#rsit_userTitle").focus();
				return false;
			} else {
				$("form[name='internWrite']").submit();
			}				
		});
		
		$("#cancle").click(function() {
			window.close();
		});
	});
</script>
</head>
<body>
<form action="Write.do" method="post" name="internWrite" id="internWrite">
	<fieldset>
		<input type="hidden" id="rsit_Type" name="rsit_Type">
		<input type="hidden" id="rsit_Company" name="rsit_Company">	
		<input type="hidden" id="rsit_Startdate" name="rsit_Startdate">	
		<input type="hidden" id="rsit_Enddate" name="rsit_Enddate">	
		<input type="hidden" id="rsit_Content" name="rsit_Content">			
		<div>			
			<input type="text" id="rsit_UserTitle" name="rsit_UserTitle" placeholder="이력서 제목" size="30">
		</div>		
		<div>			
			<input type="button" value="저장하기" id="save">
			<input type="button" value="취소" id="cancle">			
		</div>		
	</fieldset>
</form>
</body>
</html>