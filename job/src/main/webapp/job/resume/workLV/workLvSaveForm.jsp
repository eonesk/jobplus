<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
	#saveContainer{
		width:400px;
	}
	#saveHeader,#saveSection,#saveFooter{
		
	}
	
	#saveHeader{
		height:40px;
		background-color:  #3C53AF;
		text-align: center;
		color:white;
		font-weight: bold;
		font-size:20px;
		padding-top:15px;
	}
	
	#saveSection{
		height:180px;
		text-align: center;
	}
	#saveSection p{
		color:lightgray;
	}
	
	#saveSection input{
		width:60%;
		height:40px;
	}
	
	#saveFooter{
		height:80px;
		text-align: center;
	}
	
	#saveFooter button{
		width:180px;
		height:50px;
		background-color: white;
		border:1px solid lightgray;
		border-radius:1.0em;
	}
	
	#saveOk{
		color:#607CEA;
		border:#607CEA;
	}
</style>
</head>
<body>
<div id="saveContainer">
	<div id="saveHeader">
		저장하기
	</div>
	<div id="saveSection">
		<h3>저장 하는 방법</h3>
		<p>저장 할 이름을 입력후 아래 저장 버튼을 누르세요</p>
		<input type="text" id="saveName" name="saveName">
	</div>
	<div id="saveFooter">
		<button type="button" id="saveCancle">취소</button>
		<button type="button" id="saveOk">확인</button>
	</div>
</div>
</body>
</html>