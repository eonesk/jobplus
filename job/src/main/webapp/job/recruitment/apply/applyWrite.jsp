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
		
		window.close();		
	});
</script>
</head>
<body>

</body>
</html>