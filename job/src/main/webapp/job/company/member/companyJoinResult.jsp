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
		} else {
			alert("회원가입실패.");
		}
	}
</script>
</head>
<body>

</body>
</html>
