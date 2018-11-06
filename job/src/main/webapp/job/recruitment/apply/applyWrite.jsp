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
		alert("진입시작");
		var rma_Studylv = $("#rma_Studylv", opener.document).val();
		var rma_Isfinish = $("#rma_Isfinish", opener.document).val();
		var rma_Major = $("#rma_Major", opener.document).val();
		var rma_Vip = $("#rma_Vip", opener.document).val();
		var rma_Foreign = $("#rma_Foreign", opener.document).val();
		var rma_License = $("#rma_License", opener.document).val();
		var rma_Gender = $("#rma_Gender", opener.document).val();
		var rma_Age = $("#rma_Age", opener.document).val();
		var rma_Age2 = $("#rma_Age2", opener.document).val();
		
		alert("write값 확인 = " + rma_Studylv + "/"+ rma_Isfinish + "/"+ rma_Major + "/"+ rma_Vip 
				+ "/"+ rma_Foreign + "/"+ rma_License + "/"+ rma_Gender+ "/"+ rma_Age+ "/"+ rma_Age2);	
		$("#ap_save").click(function() {
			$.ajax({
				type: 'POST',
				url: 'Write.do',
				dataType: 'text',
				data: {
					"rma_Studylv": rma_Studylv,
					"rma_Isfinish": rma_Isfinish,
					"rma_Major": rma_Major,
					"rma_Vip": rma_Vip,
					"rma_Foreign": rma_Foreign,
					"rma_License": rma_License,
					"rma_Gender": rma_Gender,
					"rma_Age": rma_Age,
					"rma_Age2": rma_Age2
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
		$("#ap_cancle").click(function() {
			window.close();
		});	
	});
</script>
<style type="text/css">
.ap_title {
	font: 20px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: bold;
	color: #2A120A;
}
.ap_save, .ap_cancle {
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
.ap_save:hover, .ap_cancle:hover {
    background-color: #2E9AFE;
}
</style>
</head>
<body>
	<fieldset>	
		<p class="ap_title">저장하기</p>		
		<div>			
			<input type="button" value="저장하기" id="ap_save" class="ap_save">
			<input type="button" value="취소" id="ap_cancle" class="ap_cancle">		
		</div>				
	</fieldset>
</body>
</html>