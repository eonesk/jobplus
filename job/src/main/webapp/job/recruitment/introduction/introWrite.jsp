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
		var rmi_Personnel = $("#rmi_Personnel", opener.document).val();
		var rmi_Type = $("#rmi_Type", opener.document).val();
		var rmi_Work1 = $("#rmi_Work1", opener.document).val();
		var rmi_Work2 = $("#rmi_Work2", opener.document).val();
		var rmi_Work3 = $("#rmi_Work3", opener.document).val();
		var rmi_Department = $("#rmi_Department", opener.document).val();
		var rmi_Official = $("#rmi_Official", opener.document).val();
		
		alert("write값 확인 = " + rmi_Personnel + "/"+ rmi_Type + "/"+ rmi_Work1 + "/"+ rmi_Work2 
				+ "/"+ rmi_Work3 + "/"+ rmi_Department + "/"+ rmi_Official);
		
		$("#in_save").click(function() {
			$.ajax({
				type: 'POST',
				url: 'Write.do',
				dataType: 'text',
				data: {
					"rmi_Personnel": rmi_Personnel,
					"rmi_Type": rmi_Type,
					"rmi_Work1": rmi_Work1,
					"rmi_Work2": rmi_Work2,
					"rmi_Work3": rmi_Work3,
					"rmi_Department": rmi_Department,
					"rmi_Official": rmi_Official
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
		$("#in_cancle").click(function() {
			window.close();
		});
	});
</script>
<style type="text/css">
.in_title {
	font: 20px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: bold;
	color: #2A120A;
}
.in_save, .in_cancle {
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
.in_save:hover, .in_cancle:hover {
    background-color: #2E9AFE;
}
</style>
</head>
<body>
	<fieldset>	
		<p class="in_title">저장하기</p>		
		<div>			
			<input type="button" value="저장하기" id="in_save" class="in_save">
			<input type="button" value="취소" id="in_cancle" class="in_cancle">		
		</div>				
	</fieldset>
</body>
</html>