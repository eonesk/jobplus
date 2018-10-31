<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 35px;
	width: 900px;
	height: 922px;
	vertical-align: center;
	outline: 0;
}

.button{
	background-color: #2E64FE;
	border-radius: 6px;
	color: white;
	width: 100px;
	height: 32px;
}

.status{
	color: #444;
	padding-bottom: 30px;
}
.status .statusTitle{
	font-size: 36px;
	font-weight: bold;
}

.status ul li{
	color: #222;
}

.list{
	position: relative;
	color: #444;
}
.list .header h3{
	position: absolute;
	left: 0px;
}
.list .header .resumeWrite{
	position: absolute;
	right: 0px;
	top: 18px;
} 
.list .content{
	position: relative;
	top: 60px;
}
.list .content .edit{
	position: absolute;
	right: 0px;
}

</style>
</head>
<body>
	<div class="status">
		<p class="statusTitle">이력서 현황</p>
		<ul>
			<li>이력서는 <strong>최대 5개</strong>까지 작성하여 등록가능합니다.
			</li>
			<li>지원하고자 하는 회사마다 이력서 내용을 다르게 하여 지원 가능합니다.<br> (입사지원을 한 후
				이력서의 내용을 수정해도 이전에 지원한 이력서의 내용은 변경되지 않습니다.)
			</li>
			<li>인재정보는 <strong>1개의 이력서만 공개 가능</strong>합니다.
			</li>
			<li>컨설팅은 사람인 회원이라면 누구나 연 1회, 인재정보 공개 시 신청 가능합니다.</li>
		</ul>
	</div>
	<div class="listHeader">
		<div class="header">
			<h3>이력서 리스트</h3>
			<input class="button resumeWrite" type="button" value="이력서 등록">
		</div>
		<div class="content">
			<hr>
			<font class="title">이력서 제목</font>
			<font class="edit">이력서 관리</font>
			<hr>
		</div>
	</div>
	<div class="listContent">
		
	</div>
</body>
</html>