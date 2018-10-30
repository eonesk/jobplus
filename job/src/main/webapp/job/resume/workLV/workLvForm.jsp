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

#workLvPosition{
	position:relative;
}

#rsw_position{
	
	cursor:pointer;
}

#position_list{
	position:absolute;
	left:0;
	top:56px;
	width:382px;
	height:342px;
	border:1px solid gray;
	background-color: white;
	
}

#left,#right{
	float:left;
	width:190px;
	height:85%;
}


#left{
	border-right:1px solid gray;
}

#left div,#right div,#footer{
	width:100%;
}

#headerLeft,#headerRight{
	height:10%;
	border-bottom: 1px solid gray;
}

#bodyLeft,#bodyRight{
	padding:15px;
	height:75%;
	font-size: 12px;
}

#bodyLeft div,#bodyRight div{
	width:80px;
	height:20px;
	margin-bottom: 10px;
}


#bodyLeft input,#bodyRight input{
	width:10px;
	height:10px;
}

#footer{
	width:380px;
	border-top: 1px solid gray;
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
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("#rsw_pay").hide();
		$("#rsw_part").hide();
		$("#position_list").hide();
		
		
		
		$("#workLvForm").submit(function() {
			if(!$("#rsw_company").val()){
				alert("회사명을 입력하세요.");
				$("#rsw_company").focus();
				return false;
			}
			
			if(!$("#rsw_dept").val()){
				alert("부서명을 입력하세요.");
				$("#rsw_dept").focus();
				return false;
			}
			if(!$("#rsw_startDate").val()){
				alert("입사년월을 입력하세요.");
				$("#rsw_startDate").focus();
				return false;
			}
			
			if(!$("#rsw_endDate").val()){
				alert("퇴사년월을 입력하세요.");
				$("#rsw_endDate").focus();
				return false;
			}
			
			if(!$("#rsw_position").val()){
				alert("직급/직책을 입력하세요.");
				$("#rsw_position").focus();
				return false;
			}
			
			if(!$("input[name='m_Address1']").val()){
				alert("직무를 입력하세요.");
				$("input[name='m_Address1']").focus();
				return false;
			}
		});
		
		
		
		
		$("#rsw_position").click(function() {
			$("#position_list").show();
		});
		
		$("#footer #cancle").click(function() {
			$("#position_list").hide();
			$("#position_list input[type=radio]").prop('checked', false); 
		});
		
		$(".payAdd").click(function() {
			$("#rsw_pay").show();
			$(this).removeClass("payAdd").addClass("payDelete");
			
			$(this).html("연봉-");
		});
		
		$(".partAdd").click(function() {
			$("#rsw_part").show();
			$(this).removeClass("partAdd").addClass("partDelete");
			$(this).html("담당업무-");
		});
		
		
		$(".payDelete").click(function() {
			$("#rsw_pay").hide();
			$(this).removeClass("payDelete").addClass("payAdd");
			$(this).html("연봉+");
		});
		
		$(".partDelete").click(function() {
			$("#rsw_part").hide();
			$(this).removeClass("partDelete").addClass("partAdd");
			$(this).html("담당업무+");
		});
		
		$("#ok").click(function() {
			$("#position_list").hide();
			var positionLeft = $("input:radio[name=positionLeft]:checked").val();
			var positionRight = $("input:radio[name=positionRight]:checked").val();
			$("#rsw_position").val(positionLeft + " " + positionRight);
		});
		
		$("#free").click(function() {
			$("#position_list").hide();
			$("#rsw_position").val($("#free").html());
		});
		
		
		
	});
</script>
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
					<input type="text" id="rsw_position" 
						name="rsw_position" placeholder="직급/직책"
							readonly="readonly">
					<input type="text" id="rsw_job" 
						name="rsw_job" placeholder="직무">
					<div id="position_list">
						<div id="left">
							<div id="headerLeft">직급</div> 
							<div id="bodyLeft">
								<div><input type="radio" id="leftRadio1" name="positionLeft" value="사원"><label class="postionLabel" for="leftRadio1">사원</label></div>
								<div><input type="radio" id="leftRadio2" name="positionLeft" value="연구원"><label class="postionLabel" for="leftRadio2">연구원</label></div>
								<div><input type="radio" id="leftRadio3" name="positionLeft" value="주임/계장"><label class="postionLabel" for="leftRadio3">주임/계장</label></div>
								<div><input type="radio" id="leftRadio4" name="positionLeft" value="주임연구원"><label class="postionLabel" for="leftRadio4">주임연구원</label></div>
								<div><input type="radio" id="leftRadio5" name="positionLeft" value="대리"><label class="postionLabel" for="leftRadio5">대리</label></div>
								<div><input type="radio" id="leftRadio6" name="positionLeft" value="선임연구원"><label class="postionLabel" for="leftRadio6">선임연구원</label></div>
								<div><input type="radio" id="leftRadio7" name="positionLeft" value="과장"><label class="postionLabel" for="leftRadio7">과장</label></div>
								<div><input type="radio" id="leftRadio8" name="positionLeft" value="책임연구원"><label class="postionLabel" for="leftRadio8">책임연구원</label></div>
								<div><input type="radio" id="leftRadio9" name="positionLeft" value="차장"><label class="postionLabel" for="leftRadio9">차장</label></div>
								<div><input type="radio" id="leftRadio10" name="positionLeft" value="수석연구원"><label class="postionLabel" for="leftRadio10">수석연구원</label></div>
								<div><input type="radio" id="leftRadio11" name="positionLeft" value="부장"><label class="postionLabel" for="leftRadio11">부장</label></div>
								<div><input type="radio" id="leftRadio12" name="positionLeft" value="연구소장"><label class="postionLabel" for="leftRadio12">연구소장</label></div>
								<div><input type="radio" id="leftRadio13" name="positionLeft" value="임원"><label class="postionLabel" for="leftRadio13">임원</label></div>
							</div>
						</div>
						<div id="right">
							<div id="headerRight">직책</div>
							<div id="bodyRight">
								<div><input type="radio" id="rightRadio1" name="positionRight" value="팀원"><label class="positionLabel" for="rightRadio1">팀원</label></div>
								<div><input type="radio" id="rightRadio2" name="positionRight" value="원장"><label class="positionLabel" for="rightRadio2">원장</label></div>
								<div><input type="radio" id="rightRadio3" name="positionRight" value="팀장"><label class="positionLabel" for="rightRadio3">팀장</label></div>
								<div><input type="radio" id="rightRadio4" name="positionRight" value="국장"><label class="positionLabel" for="rightRadio4">국장</label></div>
								<div><input type="radio" id="rightRadio5" name="positionRight" value="매니저"><label class="positionLabel" for="rightRadio5">매니저</label></div>
								<div><input type="radio" id="rightRadio6" name="positionRight" value="본부장"><label class="positionLabel" for="rightRadio6">본부장</label></div>
								<div><input type="radio" id="rightRadio7" name="positionRight" value="파트장"><label class="positionLabel" for="rightRadio7">파트장</label></div>
								<div><input type="radio" id="rightRadio8" name="positionRight" value="센터장"><label class="positionLabel" for="rightRadio8">센터장</label></div>
								<div><input type="radio" id="rightRadio9" name="positionRight" value="실장"><label class="positionLabel" for="rightRadio9">실장</label></div>
								<div><input type="radio" id="rightRadio10" name="positionRight" value="공장장"><label class="positionLabel" for="rightRadio10">공장장</label></div>
								<div><input type="radio" id="rightRadio11" name="positionRight" value="지점장"><label class="positionLabel" for="rightRadio11">지점장</label></div>
								<div><input type="radio" id="rightRadio12" name="positionRight" value="그룹장"><label class="positionLabel" for="rightRadio12">그룹장</label></div>
								<div><input type="radio" id="rightRadio13" name="positionRight" value="지사장"><label class="positionLabel" for="rightRadio13">지사장</label></div>
							</div>
						</div>
						<div id="footer">
							<button type="button" id="free">프리랜서</button>
							<button type="button" id="cancle">취소</button>
							<button type="button" id="ok">확인</button>
						</div>
					</div>
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
				<button id="payBtn" class="payAdd" type="button">연봉+</button>
				<button id="partBtn" class="partAdd" type="button">담당업무+</button>
			</div>
			<div id="lineFive">
				<button id="addBtn" type="button"><span>+추가</span></button>
			</div>
			<div id="lineSix" class="contentDiv">
				<textarea id="rsw_career" name="rsw_career" placeholder="경력기술서"></textarea>
			</div>
		</div>
		
		<button type="submit">저장하기</button>
		<button type="button">불러오기</button>
	</div>
</form>
</body>
</html>