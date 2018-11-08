<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
*{
	margin: 0;
	padding:0;
}
.rv_container div{
	font-family: "Malgun Gothic",dotum,gulim,sans-serif;
}
.rv_container{
	
}
.rv_header{
	min-width:1080px;
	background-color: whitesmoke  ;
	position: fixed; z-index: 100; height: 175px;
	/* text-align: center; */
	
}
.rv_title{
	
	position: relative;
	height:110px;
	border:1px solid red;
	padding-left: 130px;
	padding-top:15px;
	line-height: 200%;
	letter-spacing: -1px;
}
.rv_company{
	display:block;
	font-size:20px;
}
.rv_subject{
	display: inline-block;
	font-size: 36px;
	
	/* font-weight: bold; */
}
.rv_date{
	font-size:18px;
}
.rv_d-day{
	position:relative;
	display:inline-block;
	width:45px;
	height:25px;
	background-color: #fa6a71;
	text-align: center;
	color: white;
	border-radius: 35px;
	top:3px;
	padding-bottom: 3px;
}
.rv_how{
	position:relative;
	width: 210px;
	height: 60px;
	background-color: white;
	outline: none;
	font-size: 20px;
	font-weight: bold;
	color:gray;
	letter-spacing: -1px;
	left: 50px;
	top:15px;
	border:1px solid lightgray;
}
.rv_summary{
	position:relative;
	border: 1px solid blue;
	margin: 0 auto;
	width: 1000px;
	top:200px;
	text-align: center;
}
.rv_summaryView{
	padding:30px;
	box-sizing:border-box;
	display:inline-block;
	width:320px;
	height:275px;
	border: 1px solid gray;
}
.rv_content{
	position:relative;
	border:1px solid lightgray;
	width: 880px;
	margin:auto;
	margin-top: 30px;
	padding: 50px;
	top:200px;
	margin-bottom: 50px;
}
.rv_timeView,.rv_dateView{
	
	border: 1px solid green;
	display:inline-block;
}
.rv_timeView{
	margin-right: 16px;
}
.rv_dateView{
	
}
.rv_timeContent,.rv_dateContent{
	box-sizing:border-box;
	border: 1px solid yellow;
	text-align:center;
	width: 422px;
	padding: 29px;
}




.rv_timeHeader,.rv_dateHeader{
	padding-bottom: 10px;
	font-weight: bold;
	font-size: 17px;
}
.rv_timer{
	padding: 8px;
	background-color: #f4f4f4;
}

.rv_day,.rv_time{
	color:#f66;
	font-size:36px;
}
.rv_dayText{
	color:#f66;
	font-size: 22px;
}
.rv_startEndDiv{
	text-align: center;
	padding: 13px 50px 14px;
	border-bottom: 1px solid lightgray;
}
.rv_startText,.rv_endText{
	display:inline-block;
	width: 70px;
	font-size: 13px;
	font-weight:bold;
	border:1px solid #d9d9d9;
	border-radius:22px;
	color:#999;
	padding: 3px;
}
.rv_endText{
	border:1px solid #f66;
	color:#f66;
}
.rv_startDay,.rv_endDay{
	display:inline-block;
	
	width: 150px;
}
.rv_notice{
	margin-top:3px;
	font-size:13px;
	color:#999;
}

.rv_companyView{
	margin-top: 54px;
	border: 1px solid purple;
}

.rv_companyHeader{
	padding-bottom: 13px;
	color:#444;
	font-size: 17px;
	font-weight: bold;
}

.rv_companyContent{
	padding: 29px;
	border:1px solid #ebebeb;
	box-sizing: border-box;
	color:#444;
	background-color: #fff;
}
.rv_companyInfoTop{
	margin-bottom: 20px;
}

.rv_cell{
	display: inline-block;
	width: 400px;
	/* border: 1px solid navy;  */
	
}

.rv_tit{
	display:inline-block;
	width: 84px;
	color:#999;
	font-weight: normal;
}

.test,.test2{
	line-height: 200%;
}
.test2{
	border-top: 1px solid lightgray;
	margin-top: 15px;
	padding-top: 15px;
}
.inDiv{
	border:1px solid red;
}
</style>
<title>채용 공고</title>
</head>
<body>
<div class="rv_container">
	<div id="rv_header" class="rv_header">
		<div id="rv_title" class="rv_title">	
			<span id="rv_company" class="rv_company">JW그룹</span>
			<span id="rv_subject" class="rv_subject">JW그룹 105기 신입사원 정기채용</span>
			<span id="rv_date" class="rv_date">~11/14(수)</span>
			<span id="rv_d-day" class="rv_d-day">D-6</span>
			<input type="button" value="홈페이지 지원" id="rv_how" class="rv_how">
		</div>
	</div>
	<div id="rv_summary" class="rv_summary">
		<div id="rv_summaryView1" class="rv_summaryView">
			<div class="inDiv">
				<span>담당업무</span>
				<ul>
					<li>신입</li>
					<li>대학교졸업(4년)</li>
					<li></li>
				</ul>
			</div>
		</div>
		<div id="rv_summaryView2" class="rv_summaryView">
			<div class="inDiv">
				<span>담당업무</span>
				<ul>
					<li>서울전체</li>
					<li>정규직</li>
					<li>기모띠</li>
				</ul>
			</div>
		</div>
		<div id="rv_summaryView3" class="rv_summaryView">
			<div class="inDiv">
				<span>담당업무</span>
				<ul>
					<li>기모띠</li>
					<li>기모띠</li>
					<li>기모띠</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="rv_content" class="rv_content">
		<div id="rv_timeView" class="rv_timeView">
			<h2 id="rv_timeHeader" class="rv_timeHeader">접수기간</h2>
			<div id="rv_timeContent" class="rv_timeContent">
				<div id="rv_timer" class="rv_timer"><span class="rv_timeText">남은 시간</span>
					<span id="rv_day" class="rv_day">0</span>
					<span id="rv_dayText" class="rv_dayText">일</span>
					<span id="rv_time" class="rv_time">00:00:00</span>
				</div>
				<div id="rv_startEndDiv" class="rv_startEndDiv">
					<span id="rv_startText" class="rv_startText">시작일</span>
					<span id="rv_startDay" class="rv_startDay">2018.11.01 09:00</span>
					<span id="rv_endText" class="rv_endText">마감일</span>
					<span id="rv_endDay" class="rv_endDay">2018.11.14 23:00</span>
				</div>
				<div>
					<p id="rv_notice" class="rv_notice">마감일은 기업의 사정,조기마감 등으로 변경될 수 있습니다.</p>
				</div>
			</div>
		</div>
		<div id="rv_dateView" class="rv_dateView">
			<h2 id="rv_dateHeader" class="rv_dateHeader">접수방법</h2>
			<div id="rv_dateContent" class="rv_dateContent">
				<ul class="test">
					<li>1</li>
				</ul>
			</div>
		</div>
		
		<div id="rv_companyView" class="rv_companyView">
			<h2 id="rv_companyHeader" class="rv_companyHeader">기업정보</h2>
			<div id="rv_companyContent" class="rv_companyContent">
				<div id="rv_companyInfoTop" class="rv_companyInfoTop">
					<div id="rv_companyLogo" class=""></div>
					<div id="rv_companyName" class="rv_companyName">JW홀딩스(주)</div>
					<div id="rv_company" class="rv_company">JW그룹</div>
				</div>
				<div id="" class="test">
					<div class="rv_cell"><strong class="rv_tit">기업형태</strong> 코스피,중겹기업,주식회사</div>
					<div class="rv_cell"><strong class="rv_tit">업종</strong> 지주회사</div>
					<div class="rv_cell"><strong class="rv_tit">사업내용</strong> 지주회사,경영컨설팅,의약품 수출입</div>
					<div class="rv_cell"><strong class="rv_tit">대표전화</strong> 02-840-6777</div>
					<div class="rv_cell"><strong class="rv_tit">홈페이지</strong> www.jw-holdings.co.kr</div>
					<div class="rv_cell"><strong class="rv_tit">기업주소</strong> 서울 서초구 남부순환로 2477</div>
				</div>
				<div id="" class="test2">
					<div class="rv_cell"><strong class="rv_tit">지점명</strong>JW그룹</div>
					<div class="rv_cell"><strong class="rv_tit">설립일</strong>1945년 8월 8일 (업력 73년)</div>
					<div class="rv_cell"><strong class="rv_tit">대표자명</strong>이경하/전재광</div>
					<div class="rv_cell"><strong class="rv_tit">사원수</strong>2,300명 (2017년 기준)</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>