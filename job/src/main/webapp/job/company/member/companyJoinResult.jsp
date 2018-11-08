<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		if(${resultCount > 0}) {
			alert("회원가입성공.");
			location.href = "../../../main/main.jsp";
		} else {
			alert("회원가입실패.");
			location.href = "../../../main/main.jsp";
		}
	}
</script>
</head>
<body>

</body>
</html>
