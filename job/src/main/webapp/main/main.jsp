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
.user_corp_popup {
    height: 250px;
    border: 1px solid #757575;
    position: absolute;
    left: 1260px;
    top: 45px;
    background: #fff;
    z-index: 100;
    padding-top: 31px;
}
.user_corp_popup input{
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
.user_corp_popup .area_bottom {
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
	left:30%;
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
	cursor:pointer;
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
.job_main_btn {
	border: 0;
	background-color: #5882FA;
	color: white;
	font-size:14px;
	font-weight:bolder;
	width: 100px;
	height: 40px;
	cursor:pointer;
}
.job_main_btn:hover {
	border: 1px solid #A9BCF5;	
}

/* ////////////////////////////////////// SEARCHPART ////////////////////////////////////////////////////////// */

#main_searchJobDiv {
	width: 1046px; 
	height: 70px; 
	background-color: #4c78ea; 
	position: absolute; 
	top: 86px; 
	left: 30%;
}

#searchTextDiv, #searchRegionDiv, #searchJobDiv {
	position: absolute; 
	top: 10px; 	 
	width: 300px; 
	height: 50px; 
	border-right: 1px solid lightgray; 
	box-sizing: border-box; 
	color: #666; 
	font-size: 15px; 
	letter-spacing: -1px; 
	text-align: left; 
	background: white;
	cursor: pointer;
}

#searchTextDiv {left: 10px; z-index: 10;}
#searchRegionDiv {left: 310px; z-index: 10;}
#searchJobDiv {left: 610px; z-index: 30;}

#searchText {
	position: relative; 
	bottom: 16px; 
	border: 0; 
	padding: 0; 
	width: 70%; 
	height: 40px; 
	color: #666; 
	font-size: 17px; 
	letter-spacing: -1px; 
	line-height: 23px; 
	background: white;
}

#regionPlaceholder, #jobPlaceholder {
	position: absolute; 
	top: 0; 
	left: 0; 
	padding: 12px 40px 15px 49px;	 
	height: 50px; 
	color: #666; 
	font-size: 17px;
}

#regionPlaceholder {width: 100%;}
#jobPlaceholder {width: 71%;}

#searchButton {
	position: absolute; 
	top: 10px; 
	left: 910px; 
	padding: 14px 0 15px; 
	width: 125px; 
	height: 50px; 
	background: black; 
	border: 0; 
	cursor: pointer;
}

#searchButtonText {
	color: white; 
	font-size: 17px; 
	font-weight: bold; 
	letter-spacing: -1px; 
	line-height: 23px;
}

#second_searchJobDiv1, #second_searchJobDiv2 {
	position: absolute; 
	top: 145px;  
	text-align: left; 	 
	height: 231px; 
	z-index: 20; 
	border-bottom: 1px solid black; 
	border-right: 1px solid black; 
	border-left: 1px solid black; 
	background: white; 	
}

#second_searchJobDiv1 {left: 721px; width: 299px; overflow-y: scroll;}
#second_searchJobDiv2 {left: 421px; width: 900px; border-top: 1px solid black;}

#second_searchJobDiv1 > ul {margin:0; padding: 0; cursor: pointer;}
#second_searchJobDiv1 > ul > li {
	margin: 0; 
	padding: 0px; 
	padding-left: 10px; 
	float: left; 
	width: 45%; 
	height: 35px;
	list-style: none;	
}

#second_searchJobDiv1 > ul > li > label {cursor: pointer;}

#jobSelectDiv1, #jobSelectDiv2, #jobSelectDiv3 {
	height: 211px;
	background: white;
	overflow-y: scroll;
	float: left;
	padding: 10px;
}

#jobSelectDiv1 {width: 165px;}
#jobSelectDiv1 > ul > li {height: 35px;}

#jobSelectDiv2 {width: 206px;}
#jobSelectDiv2 > ul > li {height: 35px;}

#jobSelectDiv3 {width: 469px;}

/* //////////////////////////////////////////////////////////////////////////////////////////////////////////// */

</style>   
<script type="text/javascript">
	$(function() {
		/*//////////////////////////////////////// SEARCHPART ////////////////////////////////////////////////////// */
		
		$("#second_searchJobDiv1").hide();
		$("#second_searchJobDiv2").hide();
		
		$("#searchRegionDiv").click(function() {
			$("#second_searchJobDiv2").slideUp();
			$("#second_searchJobDiv1").slideToggle();
		});
		
		$("#searchJobDiv").click(function() {
			$("#second_searchJobDiv1").slideUp();
			$("#second_searchJobDiv2").slideToggle();
		});
		
		$(".regionButton").click(function() {
			console.log($(this).val());
		});
		
		$(".regionButton").on("change", function() {
			if($(this).is(":checked")) {
				$("label[for='"+$(this).attr("id")+"']").css({
					"color": "#4c78ea",
					"font-weight": "bold"
				});
			} else {
				$("label[for='"+$(this).attr("id")+"']").css({
					"color": "black",
					"font-weight": "normal"
				});
			}
		});
		
		$("#jobSelect2_0").hide();
		$("#jobSelect2_1").hide();
		$("#jobSelect2_2").hide();
		$("#jobSelect2_3").hide();
		$("#jobSelect2_4").hide();
		$("#jobSelect2_5").hide();
		$("#jobSelect2_6").hide();
		$("#jobSelect2_7").hide();
		$("#jobSelect2_8").hide();
		$("#jobSelect2_9").hide();
		
		$("#jobSelect3_0_0").hide();
		$("#jobSelect3_0_1").hide();
		
		$("#jobSelect3_1_0").hide();
		
		$(".jobSelect1").click(function() {
			$(this).css({
				"color": "#4c78ea",
				"background-color": "#f7f7f7"
			});
			$(".jobSelect1").not($(this)).css({
				"color": "black",
				"background-color": "white"
			});
			$("#jobSelect2_0 > li").css({
				"color": "black",
				"background-color": "white"
			});
			$("#jobSelect2_1 > li").css({
				"color": "black",
				"background-color": "white"
			});
			$("#jobSelect2_2 > li").css({
				"color": "black",
				"background-color": "white"
			});
			$("#jobSelect2_3 > li").css({
				"color": "black",
				"background-color": "white"
			});
			$("#jobSelect2_4 > li").css({
				"color": "black",
				"background-color": "white"
			});
			$("#jobSelect2_5 > li").css({
				"color": "black",
				"background-color": "white"
			});
			$("#jobSelect2_6 > li").css({
				"color": "black",
				"background-color": "white"
			});
			$("#jobSelect2_7 > li").css({
				"color": "black",
				"background-color": "white"
			});
			$("#jobSelect2_8 > li").css({
				"color": "black",
				"background-color": "white"
			});
			$("#jobSelect2_9 > li").css({
				"color": "black",
				"background-color": "white"
			});
			$("#jobSelect3_0_0").hide();
			$("#jobSelect3_0_1").hide();
			
			$("#jobSelect3_1_0").hide();
			
			switch($(this).val()) {
			case 0: $("#jobSelect2_1").hide(); $("#jobSelect2_2").hide(); $("#jobSelect2_3").hide(); $("#jobSelect2_4").hide();
					$("#jobSelect2_5").hide(); $("#jobSelect2_6").hide(); $("#jobSelect2_7").hide(); $("#jobSelect2_8").hide(); $("#jobSelect2_9").hide();
					$("#jobSelect2_0").show(); 
					
					$(".jobSelect2_0").click(function() {
						$(this).css({
							"color": "#4c78ea",
							"background-color": "#f7f7f7"
						});
						$(".jobSelect2_0").not($(this)).css({
							"color": "black",
							"background-color": "white"
						});
						
						switch($(this).val()) {
						case 0: $("#jobSelect3_0_1").hide(); $("#jobSelect3_1_0").hide(); 
								$("#jobSelect3_0_0").show(); 
								break;
						case 1: $("#jobSelect3_0_0").hide(); $("#jobSelect3_1_0").hide();
								$("#jobSelect3_0_1").show(); 
								break;
						}
					});
					break;
			case 1: $("#jobSelect2_0").hide(); $("#jobSelect2_2").hide(); $("#jobSelect2_3").hide(); $("#jobSelect2_4").hide();
					$("#jobSelect2_5").hide(); $("#jobSelect2_6").hide(); $("#jobSelect2_7").hide(); $("#jobSelect2_8").hide(); $("#jobSelect2_9").hide();
					$("#jobSelect2_1").show();
					
					$(".jobSelect2_1").click(function() {
						$(this).css({
							"color": "#4c78ea",
							"background-color": "#f7f7f7"
						});
						$(".jobSelect2_1").not($(this)).css({
							"color": "black",
							"background-color": "white"
						});
						
						switch($(this).val()) {
						case 0: $("#jobSelect3_0_0").hide(); $("#jobSelect3_0_1").hide(); 
								$("#jobSelect3_1_0").show(); 
								break;
						}
					});
					break;
			case 2: $("#jobSelect2_0").hide(); $("#jobSelect2_1").hide(); $("#jobSelect2_3").hide(); $("#jobSelect2_4").hide();
					$("#jobSelect2_5").hide(); $("#jobSelect2_6").hide(); $("#jobSelect2_7").hide(); $("#jobSelect2_8").hide(); $("#jobSelect2_9").hide();
					$("#jobSelect2_2").show();
					break;
			case 3: $("#jobSelect2_0").hide(); $("#jobSelect2_1").hide(); $("#jobSelect2_2").hide(); $("#jobSelect2_4").hide();
					$("#jobSelect2_5").hide(); $("#jobSelect2_6").hide(); $("#jobSelect2_7").hide(); $("#jobSelect2_8").hide(); $("#jobSelect2_9").hide();
					$("#jobSelect2_3").show(); 
					break;
			case 4: $("#jobSelect2_0").hide(); $("#jobSelect2_1").hide(); $("#jobSelect2_2").hide(); $("#jobSelect2_3").hide();
					$("#jobSelect2_5").hide(); $("#jobSelect2_6").hide(); $("#jobSelect2_7").hide(); $("#jobSelect2_8").hide(); $("#jobSelect2_9").hide();
					$("#jobSelect2_4").show(); 
					break;
			case 5: $("#jobSelect2_0").hide(); $("#jobSelect2_1").hide(); $("#jobSelect2_2").hide(); $("#jobSelect2_3").hide();
					$("#jobSelect2_4").hide(); $("#jobSelect2_6").hide(); $("#jobSelect2_7").hide(); $("#jobSelect2_8").hide(); $("#jobSelect2_9").hide();
					$("#jobSelect2_5").show(); 
					break;
			case 6: $("#jobSelect2_0").hide(); $("#jobSelect2_1").hide(); $("#jobSelect2_2").hide(); $("#jobSelect2_3").hide();
					$("#jobSelect2_4").hide(); $("#jobSelect2_5").hide(); $("#jobSelect2_7").hide(); $("#jobSelect2_8").hide(); $("#jobSelect2_9").hide();
					$("#jobSelect2_6").show(); 
					break;
			case 7: $("#jobSelect2_0").hide(); $("#jobSelect2_1").hide(); $("#jobSelect2_2").hide(); $("#jobSelect2_3").hide();
					$("#jobSelect2_4").hide(); $("#jobSelect2_5").hide(); $("#jobSelect2_6").hide(); $("#jobSelect2_8").hide(); $("#jobSelect2_9").hide();
					$("#jobSelect2_7").show(); 
					break;
			case 8: $("#jobSelect2_0").hide(); $("#jobSelect2_1").hide(); $("#jobSelect2_2").hide(); $("#jobSelect2_3").hide();
					$("#jobSelect2_4").hide(); $("#jobSelect2_5").hide(); $("#jobSelect2_6").hide(); $("#jobSelect2_7").hide(); $("#jobSelect2_9").hide();
					$("#jobSelect2_8").show(); 
					break;
			case 9: $("#jobSelect2_0").hide(); $("#jobSelect2_1").hide(); $("#jobSelect2_2").hide(); $("#jobSelect2_3").hide();
					$("#jobSelect2_4").hide(); $("#jobSelect2_5").hide(); $("#jobSelect2_6").hide(); $("#jobSelect2_7").hide(); $("#jobSelect2_8").hide();
					$("#jobSelect2_9").show(); 
					break;
			}
			
		});
		
		$("#searchButton").click(function() {
			document.searchInfo.submit();
		});
		
		
		/*////////////////////////////////////////////////////////////////////////////////////////////////////////// */
	
		/*  아이디 값 넘어와서 저장되는 곳 
			아이디값이 있을때와 없을때 유효성검사 실행 	
			!m_id (빈값체크)
		var Main_CPM_id = ${sessionScope.CPM_id};		
		var Main_M_id = ${sessionScope.memId};	*/
		var cpm_id = $('input:hidden[class="Main_CPM_id"]').val();
		var memId = $('input:hidden[class="Main_M_id"]').val();
		
		alert("cpm_id값 = " + cpm_id + "//" + "memId값 = " + memId);
		
		/* 로그인/로그아웃화면 처리 */ 
		if(!memId && !cpm_id){
			document.getElementById("logout").style.display = "none";	
			document.getElementById("login").style.display = "inline";
		}else{
			document.getElementById("logout").style.display = "inline";	
			document.getElementById("login").style.display = "none";
		}
		
		/* 이력서 등록 버튼 */
		$("#job_main1").on("click", function() {
			if(!memId){
				alert("회원로그인상태에서만 접근가능합니다.");
			}else {
				location.href = "../job/resume/resume/resumeAdminBody.jsp";
			}
		});
		
		/* 공고 등록 버튼 */
		$("#job_main2").on("click", function() {
			if(!cpm_id){
				alert("기업로그인상태에서만 접근가능합니다.");
			}else {
				location.href = "../main/jobmain.jsp";
			}
		});
		
		/* 로그아웃 버튼  */
		$("#logout").on("click", function() {	
			location.href = "../main/logout.jsp";
		});
		
		/* 메인에 있는 기업정보 클릭이벤트 (div버튼)  */
		$("#main_Tbutton1").on("click", function() {
			/* 채용정보로 넘어갈때 값두개 넘겨야함 */
			window.open("../main/rmViewForm.do", "", "width=1000px height=900px");
		});
	});
</script>
</head>
<body id="topBar">
<!-- 기업회원 개인회원 아이디값 -->
<input type="hidden" id="Main_CPM_id" class="Main_CPM_id" value="${sessionScope.cpm_id}">
<input type="hidden" id="Main_M_id" class="Main_M_id" value="${sessionScope.memId}">
	<div id="container">
		<header id="header">
			<div class="inner">
				<div class="user_info" id="user_info">
					<div class="login" id="login" style="display: inline;">					
						<a href="../main/mLoginForm.jsp" class="#user_corp_popup" id="corp_name">로그인</a>
						<!-- 
						<a href="../main/cLoginForm.jsp" class="#user_corp_popup" id="corp_name">기업로그인</a>
						 -->
						<a href="../job/member/joinForm.jsp" class="#user_corp_popup" id="corp_name">회원가입</a>
					</div>
					<div class="logout" id="logout" style="display: none;">	
						<input type="button" class="#user_corp_popup" id="corp_name" value="로그아웃" style="background-color: white; border: 1px solid #A9BCF5; cursor: pointer;">
					</div>
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
					<ul class="list_gnb"> <!-- href="../main/jobmain.jsp" -->													
						<li><input type="button" id="job_main1" class="job_main_btn" value="이력서작성"></li>																	
						<li><input type="button" id="job_main2" class="job_main_btn" value="공고등록"></li>					
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
		 		<!-- ------------------------------------------ SEARCHPART ---------------------------------------------------------------------- -->
				<div id="main_searchJobWrap" class="main_searchJobWrap">
					<form action="../job/recruitment/mainSearch/searchR.do" name="searchInfo">
				 		<div id="main_searchJobDiv">
				 			<div id="searchTextDiv">
				 				<img src="../img/keyword.png">
				 				<input id="searchText" type="text" maxlength="30" placeholder="회사명 입력" name="searchCompany">
				 			</div>
				 			<div id="searchRegionDiv">
				 				<img src="../img/region.png">
				 				<span id="regionPlaceholder"
				 						style="">지역 선택</span>
				 			</div>
				 			<div id="searchJobDiv">
				 				<img src="../img/jobsearch.png" style="margin-left: 5px;">
				 				<span id="jobPlaceholder"
				 						style="">업종 선택</span>
				 			</div>
				 			<button id="searchButton" type="button">
				 				<span id="searchButtonText">검색</span>
				 			</button>
				 		</div>
				 		<div id="second_searchJobDiv1">
				 			<ul>
				 				<li>
					 				<input id="seoulButton" type="checkbox" hidden="true" value="서울" class="regionButton" name="searchRegion">
					 				<label for="seoulButton">서울</label>
				 				</li>
				 				<li><input id="ggButton" type="checkbox" hidden="true" value="경기" class="regionButton" name="searchRegion"><label for="ggButton">경기</label></li>
				 				<li><input id="icButton" type="checkbox" hidden="true" value="인천" class="regionButton" name="searchRegion"><label for="icButton">인천</label></li>
				 				<li><input id="bsButton" type="checkbox" hidden="true" value="부산" class="regionButton" name="searchRegion"><label for="bsButton">부산</label></li>
				 				<li><input id="dgButton" type="checkbox" hidden="true" value="대구" class="regionButton" name="searchRegion"><label for="dgButton">대구</label></li>
				 				<li><input id="gjButton" type="checkbox" hidden="true" value="광주" class="regionButton" name="searchRegion"><label for="gjButton">광주</label></li>
				 				<li><input id="djButton" type="checkbox" hidden="true" value="대전" class="regionButton" name="searchRegion"><label for="djButton">대전</label></li>
				 				<li><input id="usButton" type="checkbox" hidden="true" value="울산" class="regionButton" name="searchRegion"><label for="usButton">울산</label></li>
				 				<li><input id="sjButton" type="checkbox" hidden="true" value="세종" class="regionButton" name="searchRegion"><label for="sjButton">세종</label></li>
				 				<li><input id="kwButton" type="checkbox" hidden="true" value="강원" class="regionButton" name="searchRegion"><label for="kwButton">강원</label></li>
				 				<li><input id="gnButton" type="checkbox" hidden="true" value="경상남도" class="regionButton" name="searchRegion"><label for="gnButton">경남</label></li>
				 				<li><input id="gbButton" type="checkbox" hidden="true" value="경상북도" class="regionButton" name="searchRegion"><label for="gbButton">경북</label></li>
				 				<li><input id="jnButton" type="checkbox" hidden="true" value="전라남도" class="regionButton" name="searchRegion"><label for="jnButton">전남</label></li>
				 				<li><input id="jbButton" type="checkbox" hidden="true" value="전라북도" class="regionButton" name="searchRegion"><label for="jbButton">전북</label></li>
				 				<li><input id="cnButton" type="checkbox" hidden="true" value="충청남도" class="regionButton" name="searchRegion"><label for="cnButton">충남</label></li>
				 				<li><input id="cbButton" type="checkbox" hidden="true" value="충청북도" class="regionButton" name="searchRegion"><label for="cbButton">충북</label></li>
				 				<li><input id="jjButton" type="checkbox" hidden="true" value="제주" class="regionButton" name="searchRegion"><label for="jjButton">제주</label></li>
				 				<li><input id="jgButton" type="checkbox" hidden="true" value="전국" class="regionButton" name="searchRegion"><label for="jgButton">전국</label></li>
				 			</ul>
				 		</div>
				 		<div id="second_searchJobDiv2">
				 			<div id="jobSelectDiv1">
				 				<ul style="padding: 0; margin: 0; cursor: pointer;">
									<li class="jobSelect1" value="0">서비스업</li>
									<li class="jobSelect1" value="1">제조.화학</li>
									<li class="jobSelect1" value="2">IT.웹통신</li>
									<li class="jobSelect1" value="3">은행.금융업</li>
									<li class="jobSelect1" value="4">미디어.디자인</li>
									<li class="jobSelect1" value="5">교육업</li>
									<li class="jobSelect1" value="6">의료.제약.복지</li>
									<li class="jobSelect1" value="7">판매.유통</li>
									<li class="jobSelect1" value="8">건설업</li>
									<li class="jobSelect1" value="9">기관.협회</li>
								</ul>
				 			</div>
				 			<div id="jobSelectDiv2">
				 				<ul id="jobSelect2_0" style="padding: 0; margin: 0; cursor: pointer;">
									<li class="jobSelect2_0" value="0">호텔.여행.항공</li>
									<li class="jobSelect2_0" value="1">외식업.식음료</li>
									<li class="jobSelect2_0" value="2">시설관리.경비.용역</li>
									<li class="jobSelect2_0" value="3">레저.스포츠.여가</li>
									<li class="jobSelect2_0" value="4">AS.카센터.주유</li>
									<li class="jobSelect2_0" value="5">렌탈.임대</li>
									<li class="jobSelect2_0" value="6">웨딩.장례</li>
									<li class="jobSelect2_0" value="7">기타서비스업</li>
									<li class="jobSelect2_0" value="8">뷰티.미용</li>
								</ul>
								<ul id="jobSelect2_1" style="padding: 0; margin: 0; cursor: pointer;">
									<li class="jobSelect2_1" value="0">전기.전자.제어</li>
									<li class="jobSelect2_1" value="1">기계.설비.자동차</li>
									<li class="jobSelect2_1" value="2">석유.화학.에너지</li>
									<li class="jobSelect2_1" value="3">섬유.의류.패션</li>
									<li class="jobSelect2_1" value="4">화장품.뷰티</li>
									<li class="jobSelect2_1" value="5">생활용품.소비재.사무</li>
									<li class="jobSelect2_1" value="6">가구.목재.제지</li>
									<li class="jobSelect2_1" value="7">농업.어업.광업.임업</li>
									<li class="jobSelect2_1" value="8">금속.재료.철강.요업</li>
									<li class="jobSelect2_1" value="9">조선.항공.우주</li>
									<li class="jobSelect2_1" value="10">기타제조업</li>
									<li class="jobSelect2_1" value="11">식품가공.개발</li>
									<li class="jobSelect2_1" value="12">반도체.광학.LCD</li>
									<li class="jobSelect2_1" value="13">환경</li>
								</ul>
								<ul id="jobSelect2_2" style="padding: 0; margin: 0; cursor: pointer;">
									<li class="jobSelect2_2" value="0">솔루션.SI.ERP.CRM</li>
									<li class="jobSelect2_2" value="1">웹에이전시</li>
									<li class="jobSelect2_2" value="2">쇼핑몰.오픈마켓</li>
									<li class="jobSelect2_2" value="3">포털.인터넷.컨텐츠</li>
									<li class="jobSelect2_2" value="4">네트워크.통신.모바일</li>
									<li class="jobSelect2_2" value="5">하드웨어.장비</li>
									<li class="jobSelect2_2" value="6">정보보안.백신</li>
									<li class="jobSelect2_2" value="7">IT컨설팅</li>
									<li class="jobSelect2_2" value="8">게임</li>
								</ul>
								<ul id="jobSelect2_3" style="padding: 0; margin: 0; cursor: pointer;">
									<li class="jobSelect2_3" value="0">은행.금융.저축</li>
									<li class="jobSelect2_3" value="1">대출.캐피탈.여신</li>
									<li class="jobSelect2_3" value="2">기타금융</li>
									<li class="jobSelect2_3" value="3">증권.보험.카드</li>
								</ul>
								<ul id="jobSelect2_4" style="padding: 0; margin: 0; cursor: pointer;">
									<li class="jobSelect2_4" value="0">신문.잡지.언론사</li>
									<li class="jobSelect2_4" value="1">방송사.케이블</li>
									<li class="jobSelect2_4" value="2">연예.엔터테인먼트</li>
									<li class="jobSelect2_4" value="3">광고.홍보.전시</li>
									<li class="jobSelect2_4" value="4">영화.배급.음악</li>
									<li class="jobSelect2_4" value="5">공연.예술.문화</li>
									<li class="jobSelect2_4" value="6">출판.인쇄.사진</li>
									<li class="jobSelect2_4" value="7">캐릭터.애니메이션</li>
									<li class="jobSelect2_4" value="8">디자인.설계</li>
								</ul>
								<ul id="jobSelect2_5" style="padding: 0; margin: 0; cursor: pointer;">
									<li class="jobSelect2_5" value="0">초증고.대학</li>
									<li class="jobSelect2_5" value="1">학원.어학원</li>
									<li class="jobSelect2_5" value="2">유아.유치원</li>
									<li class="jobSelect2_5" value="3">교재.학습지</li>
									<li class="jobSelect2_5" value="4">전문.기능학원</li>
								</ul>
								<ul id="jobSelect2_6" style="padding: 0; margin: 0; cursor: pointer;">
									<li class="jobSelect2_6" value="0">의료(진료과목별)</li>
									<li class="jobSelect2_6" value="1">의료(병원종류별)</li>
									<li class="jobSelect2_6" value="2">제약.보건.바이오</li>
									<li class="jobSelect2_6" value="3">사회복지</li>
								</ul>
								<ul id="jobSelect2_7" style="padding: 0; margin: 0; cursor: pointer;">
									<li class="jobSelect2_7" value="0">판매(매장종류별)</li>
									<li class="jobSelect2_7" value="1">판매(상품품목별)</li>
									<li class="jobSelect2_7" value="2">유통.무역.상사</li>
									<li class="jobSelect2_7" value="3">운송.운수.물류</li>
								</ul>
								<ul id="jobSelect2_8" style="padding: 0; margin: 0; cursor: pointer;">
									<li class="jobSelect2_8" value="0">건설.건축.토목.시공</li>
									<li class="jobSelect2_8" value="1">실내.인테리어.조경</li>
									<li class="jobSelect2_8" value="2">환경.설비</li>
									<li class="jobSelect2_8" value="3">부동산.임대.중개</li>
								</ul>
								<ul id="jobSelect2_9" style="padding: 0; margin: 0; cursor: pointer;">
									<li class="jobSelect2_9" value="0">정부.공공기관.공기업</li>
									<li class="jobSelect2_9" value="1">협회.단체</li>
									<li class="jobSelect2_9" value="2">법률.법무.특허</li>
									<li class="jobSelect2_9" value="3">세무.회계</li>
									<li class="jobSelect2_9" value="4">연구소.컨설팅.조사</li>
								</ul>
				 			</div>
				 			<div id="jobSelectDiv3">
				 				<ul id="jobSelect3_0_0" style="padding: 0; margin: 0;">
									<li><input id="_jobSelect_0" name="jobSelect3" type="checkbox" value="호텔">호텔</li>
									<li><input id="_jobSelect_1" name="jobSelect3" type="checkbox" value="콘도">콘도</li>
									<li><input id="_jobSelect_2" name="jobSelect3" type="checkbox" value="카지노">카지노</li>
									<li><input id="_jobSelect_3" name="jobSelect3" type="checkbox" value="여행사">여행사</li>
									<li><input id="_jobSelect_4" name="jobSelect3" type="checkbox" value="항공사">항공사</li>
									<li><input id="_jobSelect_5" name="jobSelect3" type="checkbox" value="관광">관광</li>
									<li><input id="_jobSelect_6" name="jobSelect3" type="checkbox" value="관광통역">관광통역</li>
									<li><input id="_jobSelect_7" name="jobSelect3" type="checkbox" value="면세점">면세점</li>
									<li><input id="_jobSelect_8" name="jobSelect3" type="checkbox" value="유학.이민">유학.이민</li>
								</ul>
								<ul id="jobSelect3_0_1" style="padding: 0; margin: 0;">
									<li><input id="_jobSelect_9" name="jobSelect3" type="checkbox" value="음식료">음식료</li>
									<li><input id="_jobSelect_10" name="jobSelect3" type="checkbox" value="식품.푸드">식품.푸드</li>
									<li><input id="_jobSelect_11" name="jobSelect3" type="checkbox" value="한식당">한식당</li>
									<li><input id="_jobSelect_12" name="jobSelect3" type="checkbox" value="일식당">일식당</li>
									<li><input id="_jobSelect_13" name="jobSelect3" type="checkbox" value="양식당">양식당</li>
									<li><input id="_jobSelect_14" name="jobSelect3" type="checkbox" value="중식당">중식당</li>
									<li><input id="_jobSelect_15" name="jobSelect3" type="checkbox" value="제과제빵점">제과제빵점</li>
									<li><input id="_jobSelect_16" name="jobSelect3" type="checkbox" value="출장요리">출장요리</li>
									<li><input id="_jobSelect_17" name="jobSelect3" type="checkbox" value="케이터링">케이터링</li>
									<li><input id="_jobSelect_18" name="jobSelect3" type="checkbox" value="프랜차이즈">프랜차이즈</li>
									<li><input id="_jobSelect_19" name="jobSelect3" type="checkbox" value="횟집.초밥.스시">횟집.초밥.스시</li>
									<li><input id="_jobSelect_20" name="jobSelect3" type="checkbox" value="뷔페">뷔페</li>
									<li><input id="_jobSelect_21" name="jobSelect3" type="checkbox" value="퓨전푸드">퓨전푸드</li>
									<li><input id="_jobSelect_22" name="jobSelect3" type="checkbox" value="구내식당">구내식당</li>
								</ul>
								<ul id="jobSelect3_1_0" style="padding: 0; margin: 0;">
									<li><input id="_jobSelect_23" name="jobSelect3" type="checkbox" value="Micom">Micom</li>
									<li><input id="_jobSelect_24" name="jobSelect3" type="checkbox" value="기구설계">기구설계
									<li><input id="_jobSelect_25" name="jobSelect3" type="checkbox" value="Microprocessor">Microprocessor
									<li><input id="_jobSelect_26" name="jobSelect3" type="checkbox" value="SMT">SMT
									<li><input id="_jobSelect_27" name="jobSelect3" type="checkbox" value="전기">전기
									<li><input id="_jobSelect_28" name="jobSelect3" type="checkbox" value="회로설계">회로설계
									<li><input id="_jobSelect_29" name="jobSelect3" type="checkbox" value="전기설비">전기설비
									<li><input id="_jobSelect_30" name="jobSelect3" type="checkbox" value="전기설계">전기설계
									<li><input id="_jobSelect_31" name="jobSelect3" type="checkbox" value="전기기술">전기기술
									<li><input id="_jobSelect_32" name="jobSelect3" type="checkbox" value="전기공사">전기공사
									<li><input id="_jobSelect_33" name="jobSelect3" type="checkbox" value="자동제어">자동제어
									<li><input id="_jobSelect_34" name="jobSelect3" type="checkbox" value="PLC">PLC
									<li><input id="_jobSelect_35" name="jobSelect3" type="checkbox" value="전자">전자
									<li><input id="_jobSelect_36" name="jobSelect3" type="checkbox" value="RF">RF
									<li><input id="_jobSelect_37" name="jobSelect3" type="checkbox" value="SEM.TEM">SEM.TEM
									<li><input id="_jobSelect_38" name="jobSelect3" type="checkbox" value="Hardware">Hardware
									<li><input id="_jobSelect_39" name="jobSelect3" type="checkbox" value="Firmware">Firmware
									<li><input id="_jobSelect_40" name="jobSelect3" type="checkbox" value="HMI.MMI">"HMI.MMI"
									<li><input id="_jobSelect_41" name="jobSelect3" type="checkbox" value="가전제품">가전제품
								</ul>
				 			</div>			 			
				 		</div>
			 		</form>
		 		</div>
<!-- --------------------------------------------------------------------------------------------------------------------------------- -->		 			 		
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