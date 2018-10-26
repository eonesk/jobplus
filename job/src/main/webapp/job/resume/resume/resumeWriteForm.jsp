<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<style type="text/css">
	body{
		padding: 0;
		margin: 0;
	}
		
</style>
<script type="text/javascript">
	/* $(function() {
		$("#header a").css("text-decoration", "none");
		
		$("#header").css("height", "30px");
		$("#header").css("width", "auto");
		$("#header").css("background", "lightgray");
		
		$("#header #fixWidth").css("background", "red");
		$("#header #fixWidth").css("width", "60%");
		$("#header #fixWidth").css("height", "30px");
		
		
	}); */
</script>
</head>
<body>
	<!-- <div id="header" align="center">
		<div id="fixWidth">
			<span id="inline-block">
				<a href="#">JOBPLUS</a>
			</span>
			<span id="inline-block" >
				<a href="#">개인회원 홈</a>
				<a href="#">이력서 관리</a>
			</span>
		</div>
	</div> -->
	<div>
		${sessionScope.memId }님의 이력서<br>
		제목
		<input type="text" name="title"><br>
		이름
		${memberDTO.m_Name }
		<input type="text" name="m_Name" value="${memberDTO.m_Name }"><br>
		생년월일
		<input type="text" name="m_Birth" value="${memberDTO.m_Birth }"><br>
		성별
		<input type="text" name="m_Gender" value="${memberDTO.m_Gender }"><br>
		이메일
		<input type="text" name="m_Email" value="${memberDTO.m_Email }"><br>
		전화번호
		<input type="text" name="m_Homenum" value="${memberDTO.m_Homenum }"><br>
		휴대폰번호
		<input type="text" name="m_Phone" value="${memberDTO.m_Phone }"><br>
		주소
		<input type="text" name="m_Address" value="${memberDTO.m_Address }"><br>
	</div>
</body>
</html>