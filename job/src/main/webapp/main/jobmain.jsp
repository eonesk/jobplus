<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var headerOffset = $('.top_menu').offset();
	$(window).scroll(function() {
		if($(documnet).scrollTop() > headerOffset.top) {
			$('.top_menu').addClass('fixed');
		} else {
			$('top_menu').removeClass('fixed');
		}
	});
});
</script>
<style type="text/css">
body {
    min-width: 1260px;
}
ol, ul, li {
    list-style: none;
/*     list-style-type: none; 
/*     list-style-position: initial; */
/*     list-style-image: initial; */
}

#container {
    position: relative;
    padding-top: 100px;
    text-align: center;
    background-color: #ffffff;
}
#header {
	position: fixed;
	top: 0;
    left: 0;
    z-index: 100;
    width: 100%;
    height: 100px;
    text-align: left;
}
#header .inner {
    position: relative;
    z-index: 20;
    margin: 0 auto;
    width: 100%;
    height: inherit;
    background-color: #88b8ff;
    padding: 0px 0px 0px 0px;
}
#header .user_info {
    background-color: #e6c2c2;
    font-size: 13px;
    width: 1260px;
    height: 15px;
    margin: 0 auto 7px auto;
    padding: 19px 0 2px 0;
    text-align: right;
    letter-spacing: -1px;
}
#header .area_logo {
    position: absolute;
    top: 0;
    left: 50%;
    z-index: 20;
    margin-left: -630px;
    max-width: 226px;
    height: inherit;
}
#header .area_logo .title_logo {
    margin: 46px 0 0 0;
    font-size: 100%;
    font-weight: normal;
}
a.logo_cm_service {
    margin: 10px;
    position: relative;
    left: 75px;
}
.area_logo .all_menu {
    position: relative;
    left: 170px;
    bottom: 23px;
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
    width: 1260px;
}
#header .gnb .list_gnb {
    padding-left: 225px;
    height: 42px;
    /* background-color: #ece2e2; */
    position: relative;
    top: 15px;
    margin: auto;
}
#header .gnb .list_gnb.pos_right {
    float: right;
    padding-left: 0;
}
ul.list_gnb li {
    float: left;
    border: 1px dotted red;
    margin-left: 3px;
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
}

/* #menu .list_gnb li { */
/* 	display: inline; */
/* 	position: relative; */
/* 	padding: 0px 8px 20px 8px; */
/* 	background-color: #ffa7a7; */
/* } */
/* #menu .pos_right li { */
/* 	display: inline; */
/* 	position: relative; */
/* 	padding: 0px 8px 20px 8px; */
/* 	background-color: #ffa7a7; */
/* 	float: right; */
/* } */
#header .user_info {
	background-color: #e6c2c2;
	padding-right: 30px;
	position: relative;
	float: right;
	font-size: 13px;
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
/*사이드 메뉴*/
#cm_contents {
    display: block;
    margin: 25px auto 58px;
    width: 1260px;
    max-width: 1260px;
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
     background: linear-gradient(#95cadc, #86b9d2, #7fa9c3);
 } 
#cm_contents .btn_write_job {
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
}
#cm_contents .lnb .list_lnb {
    overflow: hidden;
    margin: 0 0 10px;
    border: solid #ffffff;
    border-width: 0 0 1px;
    min-height: 164px;
    background-color: #dadada;
    padding-left: 0px;
}
#cm_contents .lnb .list_lnb li {
    position: relative;
    border: solid #bdbdbd;
    border-width: 1px 1px 0;
    border-top-color: #f0f0f0;
    text-align: left;
    letter-spacing: -1px;
}
#cm_contents .lnb .list_lnb li a, #cm_contents .lnb .list_lnb li button {
    display: block;
    position: relative;
    padding-left: 18px;
    height: 54px;
    box-sizing: border-box;
    line-height: 50px;
    font-size: 15px;
}
#cm_contents .wrap_contents {
    float: left;
    position: relative;
    padding-top: 70px;
    width: 1034px;
    border: 1px solid #dedede;
    text-align: center;
    background-color: #fff;
    box-sizing: border-box;
    margin: 0 auto;
}
#cm_contents .wrap_contents .cm_inner {
    display: inline-block;
    position: relative;
    margin-left: -150px;
    max-width: 774px;
    min-height: 528px;
    vertical-align: top;
}
/*레이어 팝업 CSS*/
#user_corp_popup {
    height: 250px;
    border: 1px solid #757575;
    position: absolute;
    left: 968px;
    top: 45px;
    background: #fff;
}
#user_corp_popup button{
  cursor:pointer;
}
.user_corp_name {
    padding-top: 33px;
}
.area_corp_logo {
    margin-top: 18px;
    margin-bottom: 13px;
}
.area_corp_logo .corp_thum {
    padding: 5px;
    width: 130px;
    max-width: 130px;
    height: 70px;
    max-height: 70px;
    border: 1px solid #e0e0e0;
    vertical-align: middle;
    margin-left: 75px;
    margin-bottom: 4px;
}
.area_corp_logo a.logo_modify {
    margin-top: 13px;
    border: 1px dotted red;
    font-size: 13px;
    line-height: 10px;
    height: 14px;
    margin-left: 120px;
}
#user_corp_popup .area_bottom {
    position: relative;
    padding: 13px 60px;
    height: 58px;
    box-sizing: border-box;
    letter-spacing: -1px;
    text-align: right;
    background: #f1f1f1;
}
.area_bottom a {
    padding: 5px 10px 7px 10px;
    height: 100%;
    border: 1px solid #b8b8b8;
    border-radius: 2px;
    box-sizing: border-box;
    vertical-align: top;
    color: #303030;
    background: #fff;
    line-height: 26px;
    font-size: 14px;
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
					  				<div class="corp_thum"><img src=""></div>
					  				<a class="logo_modify" href="#"><span>로고변경</span></a>
					  			</div>
					  		</div>
					  		<div class="area_bottom">
						  		<a>기업정보관리</a>
						  		<a>로그아웃</a>
					  		</div>
					  </div>		
					  						
				</div>
				<div class="area_logo">
					<div class="title_logo">메인로고</div>
						<a></a>
						<a href="../main/jobmain.jsp" class="logo_cm_service" title="기업서비스">
							<img alt="기업서비스" src="../img/logo_cm_service.png">
						</a>
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
						내용.
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>