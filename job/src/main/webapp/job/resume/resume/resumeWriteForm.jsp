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
		${memberDTO.mName }
		<input type="text" name="mName" value="${memberDTO.mName }"><br>
		생년월일
		<input type="text" name="mBirth" value="${memberDTO.mBirth }"><br>
		성별
		<input type="text" name="mGender" value="${memberDTO.mGender }"><br>
		이메일
		<input type="text" name="mEmail" value="${memberDTO.mEmail }"><br>
		전화번호
		<input type="text" name="mHomenum" value="${memberDTO.mHomenum }"><br>
		휴대폰번호
		<input type="text" name="mPhone" value="${memberDTO.mPhone }"><br>
		주소
		<input type="text" name="mAddress" value="${memberDTO.mAddress }"><br>
	</div>
</body>
</html>