<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
/* HEADER */
body			{min-width: 1600px;	margin: 0px; }
ol, ul, li		{list-style: none;}
#container		{position: relative;	padding-top: 90px;			text-align: center;	background-color: #eef2f7;}
#header			{position: fixed;		text-align: left;			top: 0;	left: 0;	z-index: 100;	width: 100%;	height: 90px;	}
#header .inner	{z-index: 20;			position: relative;			margin: 0 auto;		width: 100%;
				 height: inherit;		padding: 0px 0px 0px 0px;	background-color: #fff;}
#header 
.user_info		{font-size: 13px;		width: 1560px;				height: 17px;	margin: 0 auto 7px auto;
				 padding: 19px 0px 2px 0px;text-align: right;letter-spacing: -1px;position: relative;}
#header .area_logo {
position: absolute;
top: 10px;
left: 43%;
z-index: 20;
margin-left: -636px;
max-width: 226px;
height: inherit;
}
#header .area_logo .title_logo {
    margin: 45px 0px 0 0;
    font-size: 100%;
    font-weight: normal;
}
a.logo_cm_service {
    margin-left: 5px;
}
.area_logo .all_menu {
    position: relative;
    float: left;
    margin: -22px 0 0 151px;
}
.area_logo .btn_menu {
    display: block;
    width: 23px;
    height: 21px;
    text-indent: -9999px;
    background: url(../img/btn_menu.png) no-repeat 0 0;
    border: none;
    cursor: pointer;
}
#header .gnb {
    display: block;
    margin: 0 auto;
    width: 1600px;
}
#header .gnb .list_gnb {
    padding-left: 242px;
    float: left;
    margin: 0;
}
#header .gnb .list_gnb.pos_right {
    float: right;
    padding-left: 0;
}
ul.list_gnb li {
    float: left;
    /* border: 1px dotted red; */
    margin-left: 3px;
    bottom: -4px;
    position: relative;
}
#header .gnb .list_gnb li > a {
    display: block;
    overflow: hidden;
    position: relative;
    margin: 0 10px -2px 10px;
    padding: 10px 5px 0 3px;
    height: 42px;
    box-sizing: border-box;
    color: #0d0d0d;
    font-size: 15px;
    letter-spacing: -2px;
    word-spacing: -1px;
    line-height: 1;
    text-decoration: none;
}
#header .gnb .list_gnb li > a:hover {
    color: #5d97ff;
    text-decoration-line: underline;
}
.box_withshadow {
    position: absolute;
    top: 0;
    left: 0;
    z-index: 10;
    width: 100%;
    height: 100%;
    border-bottom: 1px solid #cacaca;
    box-shadow: 0 1px 3px rgba(0,0,0,.1);
}

/* SECTION */
#cm_contents {
    display: block;
    margin: 25px auto 58px;
    width: 1600px;
    max-width: 1600px;
    text-align: center;
    vertical-align: top;
}
#cm_contents .lnb {
    float: left;
    margin-right: 16px;
    width: 210px;
    box-sizing: border-box;
    font-family: "Malgun Gothic", gulim,dotum, sans-serif;
}
#cm_contents .btn_write_job {
    background: linear-gradient(#3a528a, #294073, #304c8a);
    display: block;
    position: relative;
    margin-bottom: 8px;
    width: 100%;
    height: 56px;
    border-radius: 3px;
    box-shadow: 0 2px 3px #dbdbdb;
    line-height: 52px;
    color: #fff;
    font-size: 17px;
    text-align: center;
    letter-spacing: -2px;
    word-spacing: -1px;
    text-decoration: none;
}
#cm_contents .btn_write_job:hover {
    text-decoration: underline;
}
#cm_contents .lnb .list_lnb {
    overflow: hidden;
    margin: 0 0 10px;
    border: solid #dedede;
    border-width: 0 0 1px;
    min-height: 164px;
    background-color: #fff;
    padding-left: 0px;
}
#cm_contents .lnb .list_lnb li {
    position: relative;
    border: solid #dedede;
    border-width: 1px 1px 0;
    border-top-color: #e6e6e6;
    text-align: left;
    letter-spacing: -1px;
}
#cm_contents .lnb .list_lnb li a {
    display: block;
    position: relative;
    padding-left: 18px;
    height: 54px;
    box-sizing: border-box;
    line-height: 50px;
    font-size: 15px;
    text-decoration: none;
    color: #1a1b1f;
}
#cm_contents .lnb .list_lnb li a:hover {
    text-decoration: underline;
}
#cm_contents .wrap_contents {
    float: left;
    position: relative;
    width: 1374px;
    border: 1px solid #dedede;
    text-align: center;
    background-color: #fff;
    box-sizing: border-box;
    margin-bottom: 60px;
}
.wrap_contents.control_margin {
    padding-top: 44px !important;
}
#cm_contents .wrap_contents .cm_inner {
    display: inline-block;
    position: relative;
    margin-left: -150px;
    max-width: 774px;
    min-height: 600px;
    vertical-align: top;
}
/*레이어 팝업 CSS*/
#user_corp_popup {
    height: 250px;
    border: 1px solid #757575;
    position: absolute;
    left: 1260px;
    top: 45px;
    background: #fff;
    z-index: 100;
    padding-top: 31px;
}
#user_corp_popup button{
  cursor:pointer;
}
.user_corp_name {
    font-size: 18px;
    margin: 0px auto 25px;
    width: 230px;
    height: 21px;
    color: #333;
    line-height: 17px;
    letter-spacing: -2px;
    font-weight: bold;
}
.area_corp_logo {
    text-align: center;
}
.area_corp_logo .corp_thum {
    padding: 17px;
    width: 130px;
    max-width: 130px;
    height: 70px;
    max-height: 70px;
    border: 1px solid #e0e0e0;
    vertical-align: middle;
    margin-left: 75px;
    display: table-cell;
    position: relative;
    left: 65px;
}
.area_corp_logo a.logo_modify {
    margin-top: 16px;
    font-size: 13px;
    line-height: 10px;
    height: 14px;
}
#user_corp_popup .area_bottom {
    position: relative;
    padding: 13px 60px;
    height: 55px;
    box-sizing: border-box;
    letter-spacing: -1px;
    text-align: right;
    background: #f1f1f1;
    top: 26px;
}
.area_bottom a {
    padding: 5px 10px 7px 10px;
    height: 100%;
    border: 1px solid #b8b8b8;
    border-radius: 2px;
    box-sizing: border-box;
    vertical-align: top;
    color: #303030;
    text-decoration: none;
    background: #fff;
    line-height: 26px;
    font-size: 14px; 
}

/* FOOTER */
.sri_footer {
    clear: both;
    display: block;
    width: 100%;
    position: relative;
    z-index: 10;
    min-width: 960px;
}
.sri_footer .wrap_footer {
    border: solid #37404e;
    border-width: 1px 0;
    background: #37404e;
}
.blind, .hidden, caption, legend {
    visibility: hidden;
/*     overflow: hidden; */
    position: absolute;
/*     margin-left: -1px; */
/*     width: 1px; */
/*     height: 1px; */
}
.sri_footer .links ul {
/*     width: 960px; */
/*     height: 60px; */
    margin: 0 auto;
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
   
<script type="text/javascript">
/*레이어 팝업*/
$(document).ready(function() {
	$("#user_corp_popup").hide();
	$("#user_info > a").click(function() {
		$("#user_info > a").blur();
		$("#user_corp_popup").show();
		$("#user_corp_popup a").focus();
	    return false;
	});
	$("#logo_modify").click(function() {
		window.open("../job/company/logo/corpImageForm.jsp","","width=460, height=250, left=700, top=100");
	});
	$(document).mouseup(function(e) {
		var container = $("#user_corp_popup");
		if(container.has(e.target).length =='0')
			container.hide();
	});	
});
</script>
</head>
<body id="topBar">
	<div id="container">
		<header id="header">
			<div class="inner">
				<div class="user_info" id="user_info">
					<a href="#user_corp_popup" id="corp_name">기업이름</a>
					
						<!-- 레이어 팝업 기업 정보 -->
						<div id="user_corp_popup" class="user_corp_popup">
					  		<div class="user_corp_name" align="center">
					  			<a>기업이름</a>
					  		</div>
					  		<div class="user_corp_info">
					  			<div class="area_corp_logo">
					  				<div class="corp_thum">
					  					<img src="" id="corp_thumnail">
					  				</div>
					  				<a class="logo_modify" id="logo_modify" href="#">
					  					<span>로고 변경</span>
					  				</a>
					  			</div>
					  		</div>
					  		<div class="area_bottom">
						  		<a href="#">기업정보관리</a>
						  		<a href="#">로그아웃</a>
					  		</div>
					  </div>		
					  						
				</div>
				<div class="area_logo">
					<div class="title_logo">
						<a>메인로고</a>
						<a href="../main/jobmain.jsp" class="logo_cm_service" title="기업서비스">
							<img alt="기업서비스" src="../img/logo_cm_service.png">
						</a>
					</div>
					<div class="all_menu">
						<button type="button" id="layer_all_menu_toggle_btn" class="btn_menu">메뉴 전체보기</button>
					</div>
				</div>
				<nav id="gnb" class="gnb">
					<ul class="list_gnb">
						<li><a href="#">공고등록</a></li>
						<li><a href="#">공고/지원자관리</a></li>
						<li><a href="#">인재검색</a></li>
						<li><a href="#">인재관리</a></li>
					</ul>
					<ul class="list_gnb pos_right">
						<li><a href="#">채용상품안내</a></li>
						<li><a href="#">인재상품안내</a></li>
						<li><a href="#">결제내역</a></li>
					</ul>
				</nav>
			</div>
			<div class="box_withshadow" style="border-bottom: 1px solid rgb(220, 220, 220);"></div>
		</header>
		
		<section id="cm_contents">
			<nav id="lnb" class="lnb">
				<a href="#" class="btn_write_job"><span>공고 등록하기</span></a>
				<ul class="list_lnb">
					<li><a href="#">전체공고</a></li>
					<li><a class="second_depth" href="#">진행중공고</a></li>
					<li><a class="second_depth" href="#">대기중공고</a></li>
					<li><a class="second_depth" href="#">마감된공고</a></li>
					<li><a class="second_depth" href="#">미완성공고</a></li>
				</ul>			
			</nav>
			<div class="wrap_contents control_margin ">
				<div id="wrap_contents_inner" class="cm_inner">
					<div id="content" class="content_typea sub-content">

					</div> 
				</div>
			</div>
		</section>
		
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
    				<p>(주)KGITBANK,  서울특별시 구로구 디지털로34길 43(구로동) 201호, 대표 : 이름~~~~~<br>
    				사업자등록 : 123-45-67890, 통신판매업 : 제 1109호, Copyright (c) (주)KG. All rights reserved.</p>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>