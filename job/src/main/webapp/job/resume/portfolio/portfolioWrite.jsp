<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 작성</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
window.onload=function() {
	if(${su > 0}) {
		alert("입력 성공");
		self.close();
	} else {
		alert("입력 실패");
		location.href="portfolioList.jsp";
	}
}
</script> 
</head>
<body>

</body>
</html>