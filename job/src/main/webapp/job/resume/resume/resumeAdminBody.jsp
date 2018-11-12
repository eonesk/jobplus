<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 관리</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url: "resumeListJson.do",
			type: "post",
			dateType: "json",
			success: function(data) {
				if(data.total == "0"){
					var tr = $("<tr>", {align: "center"});
					var td = $("<td>").attr("colspan", "2").css("height","30px").html("등록된 이력서가 없습니다. 새롭게 이력서를 추가해보세요!");
					tr.append(td);
					$("#resumeListT").append(tr);
				}else{
					$.each(data.items, function(index, item) {
						var tr = $("<tr>")
						var td1 = $("<td>").css({
							"border-right": "1px solid gray",
							"height": "30px"
						}).append(item.rs_Title).append(
							$("<input>", {
								click: function() {
									resumeDelteCk = confirm("["+ item.rs_Title +"] 이력서를 삭제하시겠습니까?");
									if(resumeDelteCk){
										var dataSeq = {
												"rs_Seq": item.rs_Seq
										};
										$.ajax({
											url:"resumeDelete.do",
											type: 'post',
											data: dataSeq,
											dataType: 'text',
											timeout: 30000,
											cache: false,
											success: function(data) {
												if(data > 0){
													alert("삭제되었습니다.");
													location.href='resumeAdminBody.jsp';
												}else{
													alert("네트워크 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
												}
											},
											errer: function() {
												alert("네트워크 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
											}
										});
									}
								}
							}).attr("type", "button").attr("value", "삭제").attr("class", "resumeEditBtn")).append(
								$("<input>",{
									click: function() {
										alert("미구현된 기능입니다.");
									}
								}).attr("type", "button").attr("value","수정").attr("class","resumeEditBtn"));
						var td2 = $("<td>").css("text-align", "center").html(item.rs_Logdate);
						
						tr.append(td1).append(td2);
						$("#resumeListT").append(tr);
					});
				}
			},
			error: function() {
				alert("서버접속에 오류가 생겼습니다. 잠시후 다시 시도해주세요.");
			}
		});
		
		
		
		var cpm_id = $('input:hidden[class="Main_CPM_id"]').val();
		var m_id = $('input:hidden[class="Main_M_id"]').val();
		
		
		/* 로그인/로그아웃화면 처리 */ 
		if(!m_id && !cpm_id){
			document.getElementById("logout").style.display = "none";	
			document.getElementById("login").style.display = "inline";
		}else{
			document.getElementById("logout").style.display = "inline";	
			document.getElementById("login").style.display = "none";
		}
		
		/* 이력서 등록 버튼 */
		$("#job_main1").on("click", function() {
			if(!m_id){
				alert("회원로그인상태에서만 접근가능합니다.");
			}else {
				location.href = "/job/resume/resume/resumeAdminBody.jsp";
			}
		});
		
		/* 공고 등록 버튼 */
		$("#job_main2").on("click", function() {
			if(!cpm_id){
				alert("기업로그인상태에서만 접근가능합니다.");
			}else {
				location.href = "/job/main/jobmain.jsp";
			}
		});
		
		/* 로그아웃 버튼 */
		$("#logout").on("click", function() {	
			location.href = "/job/main/logout.jsp";
		});
		
		/* 메인에 있는 기업정보 클릭이벤트 (div버튼)  */
		$("#main_Tbutton1").on("click", function() {
			window.open("/job/main/rmViewForm.do", "", "width=1000px height=900px");
		});
	});
</script>
<style type="text/css">
/* HEADER */
body			{min-width: 1600px;	margin: 0px;}
ol, ul, li		{list-style: none;}
#container		{position: relative;	padding-top: 30px;			text-align: center;	background-color: #eef2f7;}
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
    margin: 30px 0px 0 0;
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
    background: url(/job/img/btn_menu.png) no-repeat 0 0;
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
     padding-left: 374px;
    float: left;
    margin: 0;
}
#header .gnb .list_gnb.pos_right {
    float: right;
    padding-left: 0;
        right: 165px;
    position: relative;
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


/* FOOTER */
.sri_footer {
    clear: both;
    display: block;
    width: 100%;
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



.resumeContent {
	margin: 150px auto;
	width: 900px;
	height: 600px;
	vertical-align: center;
	outline: 0;
}

.button{
	background-color: #5882FA;
	color: white;
	width: 100px;
	border: none;
	padding: 10px;
}
.button:hover{
	background-color: #2E9AFE;
}
.resumeEditBtn{
	background-color: #5882FA;
	color: white;
	width: 34px;
	border: none;
	padding: 2px;
	margin-left: 5px;
	float: right;
}
.resumeEditBtn:hover{
	background-color: #2E9AFE;
}
#rs_editBtn{
	background-color: #5882FA;
	color: white;
	width: 30px;
	border: none;
	padding: 10px;
}
#rs_editBtn:hover{
	background-color: #2E9AFE;
}
.status{
	color: #444;
	padding-bottom: 30px;
}
.status .statusTitle{
	font-size: 36px;
	font-weight: bold;
}

.status ul li{
	color: #222;
}

.list{
	position: relative;
	color: #444;
}

.list .header .resumeWrite{
	position: absolute;
	right: 0px;
	top: 18px;
} 
.list .content{
	position: relative;
	top: 60px;
}
.list .content .edit{
	position: absolute;
	right: 0px;
}
.resumeList{
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	border-collapse: collapse;
	margin: 20px auto 20px auto;
}
.resumeList th{
	background-color: #F2F2F2;
}
.resumeList .resumeTitleTh{
	width: 600px;
	border-right: 1px solid gray;
}
.resumeList .resumeEditTh{
	width: 200px;
}

</style>
</head>
<body>
<input type="hidden" id="Main_CPM_id" class="Main_CPM_id" value="${sessionScope.cpm_id}">
<input type="hidden" id="Main_M_id" class="Main_M_id" value="${sessionScope.m_id}">
<header id="header">
			<div class="inner">
				<div class="user_info" id="user_info">
					<div class="login" id="login" style="display: inline;">					
						<a href="/job/main/mLoginForm.jsp" class="#user_corp_popup" id="corp_name">로그인</a>
						<!-- 
						<a href="../main/cLoginForm.jsp" class="#user_corp_popup" id="corp_name">기업로그인</a>
						 -->
						<a href="/job/job/member/joinForm.jsp" class="#user_corp_popup" id="corp_name">회원가입</a>
					</div>
					<div class="logout" id="logout" style="display: none;">	
						<input type="button" class="#user_corp_popup" id="corp_name" value="로그아웃" style="background-color: white; border: 1px solid #A9BCF5; cursor: pointer;">
					</div>
				</div>				
				<div class="area_logo">
					<div class="title_logo">
						<a href="/job/main/main.jsp" id="goMain" style="font-size: 36px; color: #5882FA; font-weight: bold; text-decoration: none; margin-left: 0px;">JOBPLUS</a>
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
<div class="resumeContent">
	<div class="status">
		<p class="statusTitle">이력서 현황</p>
		<ul>
			<li>이력서는 <strong>최대 5개</strong>까지 작성하여 등록가능합니다.
			</li>
			<li>지원하고자 하는 회사마다 이력서 내용을 다르게 하여 지원 가능합니다.<br> (입사지원을 한 후
				이력서의 내용을 수정해도 이전에 지원한 이력서의 내용은 변경되지 않습니다.)
			</li>
			<li>인재정보는 <strong>1개의 이력서만 공개 가능</strong>합니다.
			</li>
			<li>컨설팅은 사람인 회원이라면 누구나 연 1회, 인재정보 공개 시 신청 가능합니다.</li>
		</ul>
	</div>
	<div class="listHeader">
		<div class="header">
			<font style="font-size: 24px; font-weight: bold; margin-left: 50px;">이력서 리스트</font>
			<input class="button resumeWrite" type="button" value="이력서 등록" style="margin-left: 544px;" onclick="location.href='resumeWriteForm.do'">
		</div>
		<div class="content">
			<table id="resumeList" class="resumeList">
				<tr>
					<th class="resumeTitleTh">이력서 제목</th>
					<th class="resumeEditTh">이력서 수정 날짜</th>
				</tr>
				<tbody id="resumeListT">
				
				</tbody>
			</table>
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