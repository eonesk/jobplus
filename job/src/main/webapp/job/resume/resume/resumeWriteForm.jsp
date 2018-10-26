<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		position: static;
	}
	#fixWidth{
		width: 100%;
	}
	#left{
		float: left;
		width: 30%;
	}
	#right{
		float: right;
		width: 30%;
	}
	
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
			<div id="left">
				<a href="#">JOBPLUS</a>
			</div>
			<div id="right">
				<a href="#">이력서 관리</a>
			</div>
		</div>
	</div>
	<div id="member_info">
		${memberDTO.m_Name }님의 이력서<br>
		제목
		<input type="text" name="title"><br>
		이름<input type="text" name="m_Name" value="${memberDTO.m_Name }"><br>
		생년월일<input type="text" name="m_Birth" value="${memberDTO.m_Birth }"><br>
		성별<select name="m_Gender">
			<c:if test="${memberDTO.m_Gender == '남자' }">
				<option value="남자" selected="selected">남자</option>
				<option value="여자">여자</option>
			</c:if>
			<c:if test="${memberDTO.m_Gender == '여자' }">
				<option value="남자">남자</option>
				<option value="여자" selected="selected">여자</option>
			</c:if>
		</select>
		<br>
		이메일<input type="text" name="m_Email" value="${memberDTO.m_Email }"><br>
		전화번호<input type="text" name="m_Homenum" value="${memberDTO.m_Homenum }"><br>
		휴대폰번호<input type="text" name="m_Phone" value="${memberDTO.m_Phone }"><br>
		주소<input type="text" name="m_Address" value="${memberDTO.m_Address }"><br>
	</div>
	<div id="working_conditions">
		<select name="type">
			<option value="정규직">정규직</option>
			<option value="계약직">계약직</option>
			<option value="병역특례">병역특례</option>
			<option value="프리랜서">프리랜서</option>
			<option value="파견대행">파견대행</option>
			<option value="인턴직">인턴직</option>
		</select>
		<input type="number" >만원이상
		<input type="checkbox" value="">면접 후 결정
	</div>
</body>
</html>




















