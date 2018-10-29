<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=function() {
		if(${su > 0}) {
			alert("입력 성공");
			location.href="foreignWriteForm.do";
		} else {
			alert("입력 실패");
			location.href="foreignWriteForm.do";
		}
	}
</script>

</head>
<body>

</body>
</html>