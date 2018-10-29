<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println(request.getRequestURI());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>internWirte</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var rsitType = $("#rsitType", opener.document).val();
		var rsitCompany = $("#rsitCompany", opener.document).val();
		var rsitStartdate = $("#rsitStartdate", opener.document).val();
		var rsitEnddate = $("#rsitEnddate", opener.document).val();
		var rsitContent = $("#rsitContent", opener.document).val();
		alert(rsitType + " // " + rsitCompany+ " // " + rsitStartdate
				+ " // " + rsitEnddate+ " // " + rsitContent);
		
		$("#save").click(function() {
			if(!$("#rsitUserTitle").val()) {
				alert("이력서 제목을 입력해주세요");
				$("#rsitUserTitle").focus();
				return false;
			} /**else {
				$("form[name='internWrite']").submit();
			}	*/		
			
			var rsitUserTitle = $("#rsitUserTitle").val();
			
			$.ajax({
				type: 'POST',
				url: 'Write.do',
				dataType: 'text',
				data: {
					"rsitType": rsitType,
					"rsitCompany": rsitCompany,
					"rsitStartdate": rsitStartdate,
					"rsitEnddate": rsitEnddate,
					"rsitContent": rsitContent,
					"rsitUserTitle": rsitUserTitle
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
		$("#cancle").click(function() {
			window.close();
		});
	});
</script>
</head>
<body>
	<fieldset>			
		<div>			
			<input type="text" id="rsitUserTitle" name="rsitUserTitle"  size="30">
		</div>		
		<div>			
			<input type="button" value="저장하기" id="save">
			<input type="button" value="취소" id="cancle">			
		</div>		
	</fieldset>
</body>
</html>