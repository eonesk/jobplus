<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">

div{
	
	border-collapse: collapse;
}

input{
	background-color:ghostwhite;
	border-radius: 3px;
	border:1px solid lightgray;
}
.rmp_header{
	margin-bottom :10px;
}
.rmp_content{
	border-top: 1px solid black;
	border-bottom:1px solid lightgray;
	width:860px;
	height:277px;
}

.rmp_lineOne{
	border-bottom:1px solid gray;
	width:860px;
	height:64px; /** 211 */
}

.rmp_lineOne div{
	display:inline-block;
}

.rmp_lineOne .rmp_lineOneContent{
	padding-top: 10px;
	
}

.rmp_lineOne .rmp_lineOneTitle{
	width:165px;
	height:64px;
	padding-left:10px;
	border-right: 1px solid lightgray;
}

.rmp_lineOne .rmp_name{
	width:100px;
	height:40px;
}

.rmp_lineOne .rmp_dept{
	width:180px;
	height:40px;
}

.rmp_lineTwo{
	width:860px;
	height:211px;
}

.rmp_lineTwo .rmp_lineTwoTitle

</style>
</head>
<body>
<div id="rmp_container" class="rmp_container">
	<div id="rmp_header" class="rmp_header">
		<h3><strong>담당자 연락처</strong></h3>
	</div>
	<div id="rmp_content" class="rmp_content">
		<div id="rmp_lineOne" class="rmp_lineOne">
			<div id="rmp_lineOneTitle" class="rmp_lineOneTitle">
				*담당자
			</div>
			<div id="rmp_lineOneContent" class="rmp_lineOneContent">
				<label for="rmp_name" id="rmp_nameLabel" class="rmp_nameLabel">이름</label>
				<input type="text" id="rmp_name" class="rmp_name">
				<label for="rmp_dept" id="rmp_dept" class="rmp_dept">담당부서</label>
				<input type="text" id="rmp_dept" class="rmp_dept">
			</div> 
		</div>
		<div id="rmp_lineTwo" class="rmp_lineTwo">
			<div id="rmp_lineTwoTitle" class="rmp_lineTwoTitle">ㅋ</div>
			<div id="" class="">ㅋ</div>
			<div id="" class="">ㅋ</div>
			<div id="" class="">ㅋ</div>
		</div>
	</div>
</div>
</body>
</html>