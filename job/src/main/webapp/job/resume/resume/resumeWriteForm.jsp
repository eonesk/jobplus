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
	#inline-block{ display:inline-block; *zoom:1; *display:inline; text-align: left;}
	
</style>
<script type="text/javascript">
	$(function() {
		$("#header a").css("text-decoration", "none");
		
		$("#header").css("height", "30px");
		$("#header").css("width", "auto");
		$("#header").css("background", "lightgray");
		
		$("#header #fixWidth").css("background", "red");
		$("#header #fixWidth").css("width", "60%");
		$("#header #fixWidth").css("height", "30px");
		
		
	});
</script>
</head>
<body>
	<div id="header" align="center">
		<div id="fixWidth">
			<span id="inline-block">
				<a href="#">JOBPLUS</a>
			</span>
			<span id="inline-block" >
				<a href="#">개인회원 홈</a>
				<a href="#">이력서 관리</a>
			</span>
		</div>
	</div>
</body>
</html>