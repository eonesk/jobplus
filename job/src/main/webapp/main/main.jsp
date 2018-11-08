<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
#container		{position: relative;	padding-top: 90px;	margin-right: -90px;	 text-align: center;	background-color: #FFFFFF;}
#header			{position: fixed;		text-align: left;			top: 0;	left: 0;	z-index: 100;	width: 100%;	height: 90px;	}
#header .inner	{z-index: 20;			position: relative;			margin: 0 auto;		width: 100%;
				 height: inherit;		padding: 0px 0px 0px 0px;	background-color: #fff;}
#header 
.user_info		{font-size: 13px;		width: 1560px;				height: 17px;	margin: 0 auto 7px auto;
				 padding: 19px 0px 2px 0px;text-align: right;letter-spacing: -1px;position: relative;}
#header .area_logo {
position: absolute;
top: 10px;
left: 36%;
z-index: 20;
margin-left: -636px;
max-width: 226px;
height: inherit;
}
#header .area_logo .title_logo {
    margin: 0px 50px 0 0;
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
.
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
    width: 100%;
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
#cm_contents {
    float: left;
    position: relative;
    width: 1374px;
    text-align: center;
    background-color: #fff;
    box-sizing: border-box;
    margin-bottom: 60px;
}
.cm_contents {
    padding-top: 44px !important;
}
#cm_contents .cm_contents {
    display: inline-block;
    position: relative;
    max-width: 100%;
    min-height: 600px;
    vertical-align: top;
}
.cm_contents{
    margin-bottom: 50px !important;
    float: left;
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
    margin-top: 100%;
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
.left_wing {
    display: block;
    cursor: pointer;
    position: absolute;
    left: -16.5%;
    float: left;   
}
.main_select {
	width: 2000px;
	max-width:2000px;
	height: 300px;
	margin-top: -40px;	
	background-color: #CED8F6;
}
.main_p1 {
	position:absolute;
	left:250px;
	top:-20px;
	color: #5882FA;	
	font-size: 40px;
}
.main_p1_1 {
	font-weight: bold;
}
.main_table{
	position:absolute;
	margin-top: 0;
	margin-bottom: 10%;
	left: 350px;
	width:1200px;
	height:1200px;	
	border-spacing: 60px 60px;
	background-color: white;
}
.main_Tbutton {
	width: 250px;
	height: 50px;
	margin-top: 30%;
	margin-bottom: -30px;
	background-color: white;
	font-weight: bolder;
	font-size: 15px;
	border: 1px solid #BDBDBD;
}
.main_Tbutton:hover {
	background-color: #5882FA;
	color: white;
	border: 0;
}
.main_div {
	margin: 0;
	padding: 0;
}
.main_div:hover {
	border-top: 3px solid #EFF8FB;
}
.img {
	width: 200px;
	height: 100px;
}
.img_add {
	width: 80px;
	height: 80px;
	margin-top: 20px;
}
.main_tr {
	margin-bottom: 20px;
}
</style>   
<script type="text/javascript">
	$(function{
		/* 아이디 값 넘어와서 저장되는 곳 */
		/* 아이디값이 있을때와 없을때 유효성검사 실행 */
		var Main_CPM_id = "";
		var Main_M_id = "";
		
	});
</script>
</head>
<body id="topBar">
<input type="hidden" id="Main_CPM_id" class="Main_CPM_id">
<input type="hidden" id="Main_M_id" class="Main_M_id">
	<div id="container">
		<header id="header">
			<div class="inner">
				<div class="user_info" id="user_info">
					<a href="#user_corp_popup" id="corp_name">로그인</a>
					<a href="#user_corp_popup" id="corp_name" style="display: none;">로그아웃</a>
				</div>
				<div class="area_logo">
					<div class="title_logo">
						<a><img alt="로고" src="../img/사람인.jpg"></a>
						<a href="../main/main.jsp" class="logo_cm_service" title="기업서비스">
							<img alt="기업서비스" src="../img/logo_cm_service.png">
						</a>
					</div>
					<div class="all_menu">
						<button type="button" id="layer_all_menu_toggle_btn" class="btn_menu">메뉴 전체보기</button>
					</div>
				</div>
				<nav id="gnb" class="gnb">
					<ul class="list_gnb">
						<li><a href="../main/jobmain.jsp">공고등록</a></li>
						<li><a href="#">공고/지원자관리</a></li>
						<li><a href="http://www.saramin.co.kr/zf_user/talent/search">인재검색</a></li>
						<li><a href="https://www.saramin.co.kr/zf_user/auth?ut=c&url=%2Fzf_user%2Fmemcom%2Ftalent-manage%2Fscrap-talent">인재관리</a></li>
					</ul>
					<ul class="list_gnb pos_right">
						<li><a href="http://www.saramin.co.kr/zf_user/service/company/order">채용상품안내</a></li>
						<li><a href="http://www.saramin.co.kr/zf_user/service/company/order?part_id=talent_search">인재상품안내</a></li>
						<li><a href="https://www.saramin.co.kr/zf_user/auth?m_code=16&ut=c&url=%2Fzf_user%2Fmemcom%2Fservice-manage%2Fpayment-history">결제내역</a></li>
					</ul>
				</nav>
			</div>
			<div class="box_withshadow" style="border-bottom: 1px solid rgb(220, 220, 220);"></div>
		</header>		
		<section id="cm_contents">
		 	<div id="main_select" class="main_select">
		 		<p class="main_p1"><span class="main_p1_1">어떤 채용정보</span>를 찾고 싶으세요 ?</p>
		 		
		 		
		 	</div>
		 	<!-- 4 * 6  총 24개 위치값(표)잡기   -->
			<table class="main_table">				
				<tbody>
					<tr class="main_tr">
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업.png" class="img">
								<input type="button" id="main_Tbutton1" class="main_Tbutton" value="기업정보">
							</div>
						</td>
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업1.png" class="img">
								<input type="button" id="main_Tbutton2" class="main_Tbutton" value="기업정보">
							</div>
						</td>
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업2.png" class="img">
								<input type="button" id="main_Tbutton3" class="main_Tbutton" value="기업정보">
							</div>
						</td>
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업3.png" class="img">
								<input type="button" id="main_Tbutton4" class="main_Tbutton" value="기업정보">
							</div>
						</td>
					</tr>
					<tr class="main_tr">
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업4.png" class="img">
								<input type="button" id="main_Tbutton5" class="main_Tbutton" value="기업정보">
							</div>
						</td>
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업5.png" class="img">
								<input type="button" id="main_Tbutton6" class="main_Tbutton" value="기업정보">
							</div>
						</td>
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업6.png" class="img">
								<input type="button" id="main_Tbutton7" class="main_Tbutton" value="기업정보">
							</div>
						</td>
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업7.png" class="img">
								<input type="button" id="main_Tbutton8" class="main_Tbutton" value="기업정보">
							</div>
						</td>
					</tr>
					<tr class="main_tr">
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업8.png" class="img">
								<input type="button" id="main_Tbutton9" class="main_Tbutton" value="기업정보">
							</div>
						</td>
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업9.png" class="img">
								<input type="button" id="main_Tbutton10" class="main_Tbutton" value="기업정보">
							</div>
						</td>
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업10.png" class="img">
								<input type="button" id="main_Tbutton11" class="main_Tbutton" value="기업정보">
							</div>
						</td>
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업11.png" class="img">
								<input type="button" id="main_Tbutton12" class="main_Tbutton" value="기업정보">
							</div>
						</td>
					</tr>
					<tr class="main_tr">
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업12.png" class="img">
								<input type="button" id="main_Tbutton13" class="main_Tbutton" value="기업정보">
							</div>
						</td>
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업13.png" class="img">
								<input type="button" id="main_Tbutton14" class="main_Tbutton" value="기업정보">
							</div>
						</td>
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업14.png" class="img">
								<input type="button" id="main_Tbutton15" class="main_Tbutton" value="기업정보">
							</div>
						</td>
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업15.png" class="img">
								<input type="button" id="main_Tbutton16" class="main_Tbutton" value="기업정보">
							</div>
						</td>
					</tr>
					<tr class="main_tr">
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업16.png" class="img">
								<input type="button" id="main_Tbutton17" class="main_Tbutton" value="기업정보">
							</div>
						</td>
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업17.png" class="img">
								<input type="button" id="main_Tbutton18" class="main_Tbutton" value="기업정보">
							</div>
						</td>
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업18.png" class="img">
								<input type="button" id="main_Tbutton19" class="main_Tbutton" value="기업정보">
							</div>
						</td>
						<td>
							<div class="main_div">
								<img alt="기업" src="../img/기업19.png" class="img">
								<input type="button" id="main_Tbutton20" class="main_Tbutton" value="기업정보">
							</div>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
							<div class="main_div" id="main_div_add">
								<img alt="더하기" src="../img/더하기.png" class="img_add">							
							</div>
						</td>						
					</tr>
				</tfoot>
			</table>			
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
    				<p>(주)KGITBANK,  서울특별시 구로구 디지털로34길 43(구로동) 201호, 대표 : 똘똘이<br>
    				사업자등록 : 123-45-67890, 통신판매업 : 제 1109호, Copyright (c) (주)KG. All rights reserved.</p>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>