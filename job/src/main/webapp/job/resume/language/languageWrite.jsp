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
		var rslgCategory = $("#rslgCategory", opener.document).val();		
		var rslgName = $("#rslgName", opener.document).val();
		var rslgLv = $("#rslgLv", opener.document).val();
		var rslgName = $("#rslgName", opener.document).val();
		var rslgtest = $("#rslgtest", opener.document).val();
		var rslgscore = $("#rslgscore", opener.document).val();
		var rslgdate = $("#rslgdate", opener.document).val();
		alert(rslgCategory + " // " + rslgName + " // " + rslgLv
				+ " // " + rslgtest+ " // " + rslgscore+ " // " + rslgdate);
			
		$("#save").click(function() {
			if(!$("#rslgUserTitle").val()) {
				alert("이력서 제목을 입력해주세요");
				$("#rslgUserTitle").focus();
				return false;
			} /**else {
				$("form[name='internWrite']").submit();
			}	*/		
			
			var rslgUserTitle = $("#rslgUserTitle").val();
					
			$.ajax({
				type: 'POST',
				url: 'Write.do',
				dataType: 'text',
				data: {
					"rslgCategory": rslgCategory,
					"rslgName": rslgName,
					"rslgLv": rslgLv,
					"rslgtest": rslgtest,
					"rslgscore": rslgscore,
					"rslgdate": rslgdate,
					"rslgUserTitle": rslgUserTitle
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
			<input type="text" id="rslgUserTitle" name="rslgUserTitle"  size="30">
		</div>		
		<div>			
			<input type="button" value="저장하기" id="save">
			<input type="button" value="취소" id="cancle">			
		</div>		
	</fieldset>
</body>
</html>