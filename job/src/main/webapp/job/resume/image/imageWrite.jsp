<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(${su > 0}) {
		alert("사진이 저장되었습니다.");
		self.close();
	} else {
		alert("등록실패.");
		location.href="imageForm.jsp";
	}
</script>
</head>
<body>

</body>
</html>