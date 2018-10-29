<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


body{
	background-color: gainsboro;
}

#workLvContainer{
	
	margin:auto;
}
#workLvContent{
	position:relative;
	margin-top:10px;
	/* padding:20px; */
	width:955px;
	padding-bottom:20px;
	background-color: white;
	border: 1px solid lightgray;
}
#lineOne div,#lineTwo div{
	display: inline-block;
}
.contentDiv{
	margin-top:10px;
	margin-bottom:10px;
	margin-left:20px;
}
#workLvCompany input,#workLvDate input,#workLvPosition input,#workLvPay input{
	float: left;
}

#workLvCompany input,#workLvPosition input{
	width:280px; 
	height:50px;
}
#workLvPart textarea{
	width:900px; 
	height:80px;
	resize: none;
}
#workLvDate input,#workLvPay input{
	width:100px;
	height:50px;
}
#closeBtn{
	overflow: hidden;
    position: absolute;
    right: 0;
    top: 0;
    width: 35px;
    height: 35px;
}

#lineFour button{
	background-color:white;
	border:1px solid dodgerblue;
	color:dodgerblue;
	width: 80px;
	height:40px;
}
#addBtn{
	width: 100%;
	height:50px;
	background-color:white;
	border: 1px solid lightgray;
	font-size: 25px;
	font-weight: bold;
}

#lineSix textarea{
	width: 90%;
	height:auto;
	min-height: 50px;
	resize: none;
}

#addBtn span:before {
    content: '';
    display: block;
    position: absolute;
    left: 0;
    top: 14px;
    width: 20px;
    height: 20px;
    background: url('/content/images/text_user/resume/write/sprite-icon.png'') no-repeat 0 -247px;
}



</style>
</head>
<body>
<form action="workLvResult.do" id="workLvForm" name="workLvForm">
	<div id="workLvContainer">
		<div id="workLvHeader">
		<h3>경력</h3>
		</div>
		<div id="workLvContent">
			<button id="closeBtn" type="button">X</button>
			<div id="lineOne" class="contentDiv">
				<div id="workLvCompany">
					<input type="text" id="rsw_company" name="rsw_company" placeholder="회사명">
					<input type="text" id="rsw_dept" name="rsw_dept" placeholder="부서명">
				</div>
				<div id="workLvDate">
					<input type="text" id="rsw_startDate" name="rsw_startDate" placeholder="입사년월">
					<input type="text" id="rsw_endDate" name="rsw_endDate" placeholder="퇴사년월">
				</div>
				<input type="checkbox" value="y" id="rsw_isNow" name="rsw_isNow">
				<label for="rsw_isNow">재직중</label>
			</div>
			<div id="lineTwo" class="contentDiv">
				<div id="workLvPosition">
					<input type="text" id="rsw_position" name="rsw_position" placeholder="직급/직책">
					<input type="text" id="rsw_job" name="rsw_job" placeholder="직무">
				</div>
				<div id="workLvPay">
					<input type="text" id="rsw_pay" name="rsw_pay" placeholder="연봉">
				</div>
			</div>
			<div id="lineThree" class="contentDiv">
				<div id="workLvPart">
					<textarea id="rsw_part" name="rsw_part" placeholder="담당업무"></textarea>
				</div>
			</div>
			<div id="lineFour" class="contentDiv">
				<button id="payBtn" type="button">연봉 X</button>
				<button id="partBtn" type="button">담당업무 X</button>
			</div>
			<div id="lineFive">
				<button id="addBtn" type="button"><span>+추가</span></button>
			</div>
			<div id="lineSix" class="contentDiv">
				<textarea id="rsw_career" name="rsw_career" placeholder="경력기술서"></textarea>
			</div>
		</div>
	</div>
</form>
</body>
</html>