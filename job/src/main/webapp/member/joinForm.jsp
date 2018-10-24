<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#joinContainer{
		border: 1px solid gray;
		width:550px;
		margin: auto;
	}
	
	#joinContainer #header{
		text-align: center;
	}
	
	#joinCategory .joinCategory{
		overflow: auto;
		
	}
	
	#joinCategory .joinCategory li{
		list-style: none;
		float:left;
		border: 1px solid gray;
		width:250px;
		height:80px;
		text-align: center;
		line-height: 18px;
	}
	
	
	
	#joinCategory .joinCategory li .tabBtn{
		text-decoration: none;
		color: gray;
		font-size: 12px;
	}
	#joinCategory .joinCategory li.on{
		background-color: cornflowerblue;
		color: white;
		
	}
	
	#joinCategory .joinCategory li.on .tabBtn{
		color: white;
	}
	
	#joinCategory .joinCategory li .tabBtn strong{
		display: block;
		font-size:22px;
	}
</style>
</head>
<body>
	<div id=joinContainer>
		<div id="header">
			<a href="#"><img src="../img/test.png"></a>
		</div>
		<div id="joinCategory">
			<ul class="joinCategory">
        		<li class="on">
        			<h2 class="tab01">
            			<a href="#" class="tabBtn">
            			<strong>개인회원가입</strong>만 15세 이상 가능</a></h2>
        		</li>
        		<li class="">
        			<h2 class="tab02">
            			<a href="#" class="tabBtn" >
            			<strong>기업회원가입</strong></a></h2>
        		</li>
        	</ul>
		</div>
	</div>
</body>
</html>