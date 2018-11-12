<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	margin: 0;
	padding: 0;
}
.rv_header{
	position: fixed;
	width:100%;
	height: 175px;
	min-width:1080px;
	background-color: whitesmoke  ;
	z-index: 100; 
}
.rv_title{
	position: relative;
	width:1030px;
	padding-left: 135px;
	margin:0 auto;
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
	top:3px;
	text-align: center;
	background-color: #fa6a71;
	color: white;
	
	border-radius: 35px;
	padding-bottom: 3px;
}
.rv_how{
	position:relative;
	width: 210px;
	height: 60px;
	letter-spacing: -1px;
	left: 50px;
	top:15px;
	background-color: white;
	outline: none;
	font-size: 20px;
	font-weight: bold;
	color:gray;
	border:1px solid lightgray;
}

/** rv_summary */
.rv_summary{
	/* border: 1px solid blue; */
	position:relative;
	margin:0 auto;
	width: 960px;
	padding-left: 90px;
	top:200px;
}

.rv_summaryView{
	padding:29px;
	box-sizing:border-box;
	/* display:inline-block; */
	float:left;
	margin-right:20px;
	width:300px;
	height:275px;
	border: 1px solid lightgray;
}

.rv_contentWrap{
	/* position:relative;
	box-sizing:border-box;
	border:1px solid red;
	width: 940px;
	height:1000px;
	top:200px;
	margin:0 auto;
	padding: 50px;
	left: 70px; */
	position:relative;
	margin:0 auto;
	width: 960px;
	padding-left: 90px;
	top:500px;
	
}
.rv_content{
	margin-right: 320px;
    padding: 39px;
    width: 940px;
    border: 1px solid #ebebeb;
    box-sizing: border-box;
}

.rv_timeView,.rv_dateView,.rv_introView,.rv_applyView{
	margin-top:-200px;
	/* border: 1px solid green; */
	display:inline-block;
}
.rv_timeView{
	/* margin-right: 16px; */
}
.rv_dateView{
	position: relative;
	top:6px;
}
.rv_wayList{
	line-height: 200%;
	text-align: left;
	list-style: circle;
}
.rv_timeContent,.rv_dateContent,.rv_introContent,.rv_applyContent{
	box-sizing:border-box;
	/* border: 1px solid yellow; */
	border: 1px solid #ebebeb;
	text-align:center;
	width: 400px;
	height:230px;
	padding: 29px;
}

.rv_timeHeader,.rv_dateHeader,.rv_introHeader,.rv_applyHeader{
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
	/* border: 1px solid purple; */
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
</style>
</head>
<body class="rv_body">
<div class="rv_header">
	<div id="rv_title" class="rv_title">	
		<span id="rv_company" class="rv_company">${companyInfoDTO.cpi_Companyname}</span>
		<span id="rv_subject" class="rv_subject">${rmDTO.rm_Title }</span>
		<span id="rv_date" class="rv_date">${rmt_Enddate_String }마감</span>
		<!-- <span id="rv_d-day" class="rv_d-day">D-6</span> -->
		<input type="button" value="홈페이지 지원" id="rv_how" class="rv_how">
	</div>
</div>
<div class="rv_summary">
	<div id="rv_summaryView1" class="rv_summaryView">
		<span>담당 업무</span>
		<ul>
			<li>${introductionDTO.rmi_Work1 }</li>
			<li>${introductionDTO.rmi_Work2 }</li>
			<li>${introductionDTO.rmi_Work3 }</li>
		</ul>
	</div>
	<div id="rv_summaryView2" class="rv_summaryView">
		<span>지원 자격</span>
		<ul>
			<li>직무 : ${jobDTO.rmj_job }</li>
			<li>경력 여부 : ${jobDTO.rmj_career }</li>
			<li>전공 : ${applyDTO.rma_Major }</li>
		</ul>
	</div>
	<div id="rv_summaryView3" class="rv_summaryView">
		<span>근무 조건</span>
		<ul>
			<li>근무 내용 : ${conditionDTO.rmc_Business1 }</li>
			<li>급여 : ${conditionDTO.rmc_Salary }</li>
			<li>근무 장소 : ${conditionDTO.rmc_Workspace }</li>
			<li>근무 요일 : ${conditionDTO.rmc_Week }</li>
			<li>근무 시간 : ${conditionDTO.rmc_Time }</li>
		</ul>
	</div>
</div>
<div class="rv_contentWrap">
	<div class="rv_content">
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
					<span id="rv_startDay" class="rv_startDay">${rmt_Startdate_String}	</span>
					<span id="rv_endText" class="rv_endText">마감일</span>
					<span id="rv_endDay" class="rv_endDay">${rmt_Enddate_String }</span>
				</div>
				<div>
					<p id="rv_notice" class="rv_notice">마감일은 기업의 사정,조기마감 등으로 변경될 수 있습니다.</p>
				</div>
			</div>
		</div>
		<div id="rv_dateView" class="rv_dateView">
			<h2 id="rv_dateHeader" class="rv_dateHeader">접수방법</h2>
			<div id="rv_dateContent" class="rv_dateContent">
				<ul class="rv_wayList">
					<li>접수 방법 : ${timeDTO.rmt_How }</li>
					<li>접수 양식 : ${timeDTO.rmt_Form }</li>
					<li>인사 담당자 이름 : ${personnelDTO.rmp_name }</li>
					<li>인사 담당자 이메일 : ${personnelDTO.rmp_email }</li>
					<li>인사 담당자 전화번호 : ${personnelDTO.rmp_phone1 }</li>
					<li>모집 인원 : ${introductionDTO.rmi_Personnel }</li>
				</ul>
			</div>
		</div>
		
		<%-- <div id="rv_introView" class="rv_introView">
			<h2 id="rv_introHeader" class="rv_introHeader">모집요강</h2>
			<div id="rv_introContent" class="rv_introContent">
				<ul class="rv_introList">
					<li>담당 업무</li>
					<li>${introductionDTO.rmi_Work1 }</li>
					<li>${introductionDTO.rmi_Work2 }</li>
					<li>${introductionDTO.rmi_Work3 }</li>
					<li>근무 부서 : ${introductionDTO.rmi_Department }</li>
					<li>직급 직책 : ${introductionDTO.rmi_Official }</li>
				</ul>
			</div>
		</div>
		
		<div id="rv_applyView" class="rv_applyView">
			<h2 id="rv_applyHeader" class="rv_applyHeader">지원자격&amp;우대조건</h2>
			<div id="rv_applyContent" class="rv_applyContent">
				<ul class="rv_applyList">
					<li>전공 학과 : ${applyDTO.rma_Major }</li>
					<li>우대 조건 : ${applyDTO.rma_Vip }</li>
					<li>외국어 : ${applyDTO.rma_Foreign }</li>
					<li>자격증 : ${applyDTO.rma_License }</li>
					<li>성별 : ${applyDTO.rma_Gender }</li>
					<li>연령 : ${applyDTO.rma_Age }</li>
				</ul>
			</div>
		</div> --%>
		
		<div id="rv_companyView" class="rv_companyView">
			<h2 id="rv_companyHeader" class="rv_companyHeader">기업정보</h2>
			<div id="rv_companyContent" class="rv_companyContent">
				<div id="rv_companyInfoTop" class="rv_companyInfoTop">
					<div id="rv_companyLogo" class=""></div>
					<div id="rv_companyName" class="rv_companyName">${companyInfoDTO.cpi_Companyname }</div>
					<div id="rv_company" class="rv_company">${companyInfoDTO.cpi_Brand }</div>
				</div>
				<div id="" class="test">
					<div class="rv_cell"><strong class="rv_tit">기업형태</strong> ${companyInfoDTO.cpi_Type }</div>
					<div class="rv_cell"><strong class="rv_tit">업종</strong> ${companyInfoDTO.cpi_Industry }</div>
					<div class="rv_cell"><strong class="rv_tit">사업내용</strong> ${companyInfoDTO.cpi_Content }</div>
					<div class="rv_cell"><strong class="rv_tit">대표전화</strong> ${companyInfoDTO.cpi_Tel }</div>
					<div class="rv_cell"><strong class="rv_tit">홈페이지</strong> ${companyInfoDTO.cpi_Homepage }</div>
					<div class="rv_cell"><strong class="rv_tit">기업주소</strong> ${companyInfoDTO.cpi_Address }</div>
				</div>
				<div id="" class="test2">
					<div class="rv_cell"><strong class="rv_tit">설립일</strong>${cpi_Birth }</div>
					<div class="rv_cell"><strong class="rv_tit">대표자명</strong>${companyInfoDTO.cpi_Firstname }</div>
					<div class="rv_cell"><strong class="rv_tit">재무정보 기준년도</strong>${companyInfoDTO.cpi_Moneyyear }년</div>
					<div class="rv_cell"><strong class="rv_tit">자본금</strong>${companyInfoDTO.cpi_Moneybase }만원</div>
					<div class="rv_cell"><strong class="rv_tit">매출액</strong>${companyInfoDTO.cpi_Moneysell }만원</div>
					<div class="rv_cell"><strong class="rv_tit">영업이익</strong>${companyInfoDTO.cpi_Moneygain }만원</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>