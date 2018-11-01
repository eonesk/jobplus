<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
	#loadContainer{
		width:400px;
	}
	#loadHeader,#loadSection,#loadFooter{
		
	}
	
	#loadHeader{
		height:40px;
		background-color:  #3C53AF;
		text-align: center;
		color:white;
		font-weight: bold;
		font-size:20px;
		padding-top:15px;
	}
	
	#loadSection{
		margin-bottom:20px;
		text-align: center;
	}
	#loadSection p{
		color:lightgray;
	}
	
	#loadSection input{
		width:60%;
		height:40px;
	}
	
	.loadList{
		width:80%;
		height:200px;
		margin-left:25px;
		overflow: scroll;
	}
	#loadFooter{
		height:80px;
		text-align: center;
	}
	
	#loadFooter button{
		width:180px;
		height:50px;
		background-color: white;
		border:1px solid lightgray;
		border-radius:1.0em;
	}
	
	#loadOk{
		color:#607CEA;
		border:#607CEA;
	}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<div id="loadContainer">
	<div id="loadHeader">
		불러오기
	</div>
	<div id="loadSection">
		<h3>불러오기 하는 방법</h3>
		<p>불러올 아이템들을 선택후 확인버튼을 클릭하세요</p>
		<fieldset class="loadList">
			<legend>목록</legend>
			
		</fieldset>
	</div>
	<div id="loadFooter">
		<button type="button" id="loadCancle">취소</button>
		<button type="button" id="loadOk">확인</button>
	</div>
</div>
</body>
</html>