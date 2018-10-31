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
		if(rslgCategory == "공인시험"){
			var rslgName = $("#rslgName", opener.document).val();			
			var rslgTest = $("#rslgTest", opener.document).val();
			var rslgScore = $("#rslgScore", opener.document).val();
			var rslgDate = $("#rslgDate", opener.document).val();
			var rslgLv = null;
		}else{
			var rslgName = $("#rslgName", opener.document).val();
			var rslgLv = $("#rslgLv", opener.document).val();
			var rslgTest = null;
			var rslgScore = null;
			var rslgDate = null;
		}
		/**
		var rslgName = $("#rslgName", opener.document).val();
		var rslgLv = $("#rslgLv", opener.document).val();
		var rslgTest = $("#rslgTest", opener.document).val();
		var rslgScore = $("#rslgScore", opener.document).val();
		var rslgDate = $("#rslgDate", opener.document).val();
		*/
		alert(rslgCategory + " // " + rslgName + " // " + rslgLv
				+ " // " + rslgTest+ " // " + rslgScore+ " // " + rslgDate);
			
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
					"rslgTest": rslgTest,
					"rslgScore": rslgScore,
					"rslgDate": rslgDate,
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