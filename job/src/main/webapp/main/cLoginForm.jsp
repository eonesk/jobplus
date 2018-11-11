<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#loginBtn").click(function() {
		if(!$("#cpm_id").val()){
			alert("아이디를 입력하세요.");
			$("#cpm_id").focus();
			return false;
		}
		
		if(!$("#cpm_pw").val()){
			alert("비밀번호를 입력하세요.");
			$("#cpm_pw").focus();
			return false;
		}
		
		var allData ={
				"cpm_id" : $("#cpm_id").val(),
				"cpm_pw" : $("#cpm_pw").val()
		};
		
		$.ajax({
			type: 'POST',
			url: 'cLogin.do',
			data:allData,
			dataType: 'text',
			cache: false,
			success: function(data) {
				if(data == "null") {
					alert("아이디or비밀번호를 확인해 주세요");
				} else {
					location.href = "main.jsp";
				}		
			},
		
			error : function(e) {
	            alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
	     	}
		});
	});
});
</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

#loginContainer {
	/**border: 1px solid gray;*/
	width: 500px;
	margin: auto;
	margin-bottom: 100px;
	padding-top: 100px;
}

#loginContainer #header {
	text-align: center;
	margin-bottom: 100px;
	margin-right: 20px;
}

#loginCategory .loginCategory {
	overflow: auto;
	margin-bottom: 30px;
}

#loginCategory .loginCategory li {
	padding-top: 20px;
	width: 248px;
	height: 50px;
	list-style: none;
	float: left;
	border: 1px solid gray;
	text-align: center;
	line-height: 18px;
}

#loginCategory .loginCategory li .tabBtn {
	text-decoration: none;
	color: gray;
	font-size: 12px;
}

#loginCategory .loginCategory li.on {
	background-color: #6666ff;
	color: white;
}

#loginCategory .loginCategory li.on .tabBtn {
	color: white;
}

#loginCategory .loginCategory li .tabBtn strong {
	display: block;
	font-size: 22px;
}

input[type=text], input[type=password]{
	display: inline-block;
	width: 100%;
	height: 50px;
	
}
.joinDiv{
	margin-top:35px;
}
.loginBtn {
	
	display: block;
	margin: 0 auto;
	width: 220px;
	height: 60px;
	background-color: #444;
	font-size: 20px;
	color: #fff;
	letter-spacing: -1px;
	font-weight: bold;
	cursor: pointer;
	
}
.menuDiv{
	margin-top:30px;
	text-decoration: none;
	text-align: center;
}

.menuDiv a{
	display:inline-block;
	width:150px;
	text-decoration: none;
	color: black;
}

.menuDiv a:nth-child(1){
	border-right: 1px solid gray;
}
.menuDiv a:nth-child(2){
	border-right: 1px solid gray;
}
/* FOOTER */
.sri_footer {
    clear: both;
    display: block;
    width: 100%;
    margin-top:15%;
    position: relative;
    z-index: 10;
    min-width: 960px;
    text-align: center;
}
.sri_footer .wrap_footer {
    border: solid #37404e;
    border-width: 1px 0;
    background: #37404e;
}
.blind, .hidden, caption, legend {
    visibility: hidden;
    position: absolute;
}
.sri_footer .links ul {
    margin: 0;
    font-size: 12px;
    line-height: 60px;
}
.sri_footer .links ul li.first {
    margin-left: 0;
}
.sri_footer .links ul li {
    box-sizing: border-box;
    display: -moz-inline-stack;
    display: inline-block;
    zoom: 1;
    *display: inline;
    margin-left: 48px;
}
.sri_footer .links ul li a {
    text-decoration: none;
    color: #fff;
    font-family: "Malgun Gothic",dotum,gulim,sans-serif;
    letter-spacing: -1px;
}
.sri_footer .copyright {
    margin: 0 auto 30px auto;
}
.sri_footer .copyright p {
    margin: 0;
    color: #d1f6ff70;
    font-size: 12px;
    letter-spacing: -1px;
    line-height: 18px;
}
</style>
</head>
<body>
	<div id=loginContainer>
		<div id="header">
			<a href="/job/main/main.jsp" id="goMain" style="font-size: 60px; color: #5882FA; font-weight: bold; text-decoration: none; margin-left: 0px;">JOBPLUS</a>
		</div>
		<div id="loginCategory">
			<ul class="loginCategory">
				<li class="">
					<h2 class="tab01">
						<a href="mLoginForm.do" class="tabBtn"><strong>개인회원 로그인</strong>
						</a>
					</h2>
				</li>
				<li class="on">
					<h2 class="tab02">
						<a href="#" class="tabBtn"><strong>기업회원 로그인</strong></a>
					</h2>
				</li>
			</ul>
		</div>
		<div id="loginContent">
			<input name="cpm_id" id="cpm_id" type="text" placeholder="아이디">
			<input name="cpm_pw" id="cpm_pw" type="password" placeholder="비밀번호">
			<div class="joinDiv">
				<input id="loginBtn" class="loginBtn" type="button" value="로그인">
			</div>
			<div class="menuDiv">
				<a href="#">아이디 찾기</a><a href="#"> 비밀번호 찾기</a><a href="#">회원가입</a>
			</div>
		</div>
	</div>
	<footer id="sri_footer" class="sri_footer">
    		<div class="wrap_footer">
       			<div class="links">
   					<strong class="blind">바로가기</strong>
					<ul>
						<li class="first"><a href="#" rel="noopener" title="회사소개 새창열기">회사소개</a></li>
						<li><a href="#" target="_blank" rel="noopener" title="보도기사 새창열기">보도기사</a></li>
						<li><a href="#" target="_blank" rel="noopener" title="찾아오시는길 새창열기">찾아오시는길</a></li>
						<li><a href="#">회원약관</a></li>
						<li class="bold"><a href="#" title="개인정보처리방침 바로가기">개인정보처리방침</a></li>
						<li><a href="#" onclick="" rel="noopener" title="이메일무단수집거부 바로가기">이메일무단수집거부</a></li>
						<li><a href="#" target="_blank" rel="noopener" title="오픈API 새창열기">오픈API</a></li>
						<li><a href="#" title="사이트맵 바로가기">사이트맵</a></li>
						<li><a href="#" title="고객센터 바로가기">고객센터</a></li>
					</ul>
				</div>
				<div class="copyright">
    				<p>(주)KGITBANK,  서울특별시 구로구 디지털로34길 43(구로동) 201호, 대표 : 똘똘이<br>
    				사업자등록 : 123-45-67890, 통신판매업 : 제 1109호, Copyright (c) (주)KG. All rights reserved.</p>
				</div>
			</div>
		</footer>
</body>
</html>