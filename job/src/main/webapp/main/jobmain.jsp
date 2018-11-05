<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    list-style-type: none;
    list-style-position: initial;
    list-style-image: initial;
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
.area_logo .all_menu {
    float: left;
    position: relative;
    margin: 51px 0 0 10px;
}
#header .gnb {
    display: block;
    margin: 0 auto;
    width: 1260px;
}
#header .gnb .list_gnb {
    list-style: none;
    padding-left: 225px;
    height: 42px;
    float: left;
    /* background-color: #ece2e2; */
    position: relative;
    top: 15px;
    margin: auto;
}
#header .gnb .list_gnb.pos_right {
    float: right;
    padding-left: 0;
}
#menu .list_gnb li {
	display: inline;
	position: relative;
	padding: 0px 8px 20px 8px;
	background-color: #ffa7a7;
}
#menu .pos_right li {
	display: inline;
	position: relative;
	padding: 0px 8px 20px 8px;
	background-color: #ffa7a7;
	float: right;
}
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
</style>
<script type="text/javascript">
/*
$(document).ready(function(){
	  $("#layerPop_company").hide();
	  $("#corp_name").click(function(){
	    $("#layerPop_company").blur();
	    $("#layerPop_company").show();
	    $("#layerPop_company").focus();
	    return false;
	  });	  
	  $("#corp_name").click(function(){
	    $("#layerPop_company").hide();
	  });
	});
*/
</script>
</head>
<body id="topBar">
	<div id="container">
		<header id="header">
			<div class="inner">
				<div class="user_info">
					<p class="company_user"></p>
					<a href="#layerPop_company" id="corp_name">기업이름</a>
					<!-- 레이어 팝업 기업 정보 -->				
				</div>
				<div class="area_logo">
					<div class="title_logo">메인로고</div>
					<div class="all_menu">all</div>
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
					<li><a>전체공고</a></li>
					<li><a class="second_depth">진행중공고</a></li>
					<li><a class="second_depth">대기중공고</a></li>
					<li><a class="second_depth">마감된공고</a></li>
					<li><a class="second_depth">미완성공고</a></li>
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