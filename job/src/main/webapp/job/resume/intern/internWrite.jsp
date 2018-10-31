<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css">
.title {
	font: 20px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: bold;
	color: #2A120A;
}
#save, #cancle {
	width:70px;
    background-color: #5882FA;
    border: none;
    color:#fff;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    margin: 4px;
    cursor: pointer;
}
#save:hover, #cancle:hover {
    background-color: #2E9AFE;
}
</style>
</head>
<body>
	<fieldset>	
		<p class="title">제목 저장하기</p>		
		<div>			
			<input type="text" id="rsitUserTitle" name="rsitUserTitle" style="width:280px;height:30px;">
			<input type="button" value="저장하기" id="save">
			<input type="button" value="취소" id="cancle">		
		</div>				
	</fieldset>
</body>
</html>