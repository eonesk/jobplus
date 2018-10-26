<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		if(${su > 0}) {
			alert("저장하였습니다.");
		} else {
			alert("저장하지 못하였습니다.");
		}
	}
</script>
</head>
<body>

</body>
</html>