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
	var rstName = $("#rstName", opener.document).val();
	var rstCompany = $("#rstCompany", opener.document).val();
	var rstDate = $("#rstDate", opener.document).val();
	var rstContent = $("#rstContent", opener.document).val();
	alert(rstName + " // " + rstCompany+ " // " + rstDate
			+ " // " + rstContent);
	
	$("#save").click(function() {
		if(!$("#rSTuserTitle").val()) {
			alert("수상 제목을 입력해주세요");
			$("#rSTuserTitle").focus();
			return false;
		} /**else {
			$("form[name='internWrite']").submit();
		}	*/			
		var rSTuserTitle = $("#rSTuserTitle").val();
		
		$.ajax({
			type: 'POST',
			url: 'Write.do',
			dataType: 'text',
			data: {
				"rstName": rstName,
				"rstCompany": rstCompany,
				"rstDate": rstDate,
				"rstContent": rstContent,
				"rSTuserTitle": rSTuserTitle
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
			<input type="text" id="rSTuserTitle" name="rSTuserTitle"  size="30">
		</div>		
		<div>			
			<input type="button" value="저장하기" id="save">
			<input type="button" value="취소" id="cancle">			
		</div>		
	</fieldset>
</body>
</html>