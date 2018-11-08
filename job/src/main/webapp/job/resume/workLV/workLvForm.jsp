<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-color: gainsboro;	
}


.workLvContainer {
	position : relative;
	background-color: white;
	border: 1px solid lightgray;
	width: 950px;
	left: 24px;
}

.workLvHeader{
	font-weight:bold;
	font-size: 25px;
	margin-bottom: 10px;
}



.workLvContent {
	/* position: relative;
	margin-top: 10px;
	padding:20px;
	width: 955px;
	padding-bottom: 20px; */
	position : relative;
	background-color: white;
	border: 1px solid lightgray;
	width: 955px;
}

.lineOne div, .lineTwo div {
	display: inline-block;
}

.lineOne, .lineTwo, .lineThree, .lineFour, .lineSix {
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 20px;
}

.workLvCompany input, .workLvDate input, .workLvPosition input,
	.workLvPay input {
	float: left;
}

.workLvCompany input, .workLvPosition input {
	width: 280px;
	height: 50px;
}

.workLvPosition {
	position: relative;
}

.rsw_position {
	cursor: pointer;
}

.position_list {
	z-index:10;
	position: absolute;
	left: 0;
	top: 56px;
	width: 382px;
	height: 342px;
	border: 1px solid gray;
	background-color: white;
}

.left, .right {
	float: left;
	width: 190px;
	height: 85%;
}

.left {
	border-right: 1px solid gray;
}

.left div, .right div, .footer {
	width: 100%;
}

.headerLeft, .headerRight {
	height: 10%;
	border-bottom: 1px solid gray;
}

.bodyLeft, .bodyRight {
	padding: 15px;
	height: 75%;
	font-size: 12px;
}

.bodyLeft div, .bodyRight div {
	width: 80px;
	height: 20px;
	margin-bottom: 10px;
}

.bodyLeft input, .bodyRight input {
	width: 10px;
	height: 10px;
}

.footer {
	width: 380px;
	border-top: 1px solid gray;
}

.workLvPart textarea {
	width: 900px;
	height: 80px;
	resize: none;
}

.workLvDate input, .workLvPay input {
	width: 130px;
	height: 50px;
}

.closeBtn {
	overflow: hidden;
	position: absolute;
	right: 0;
	top: 0;
	width: 35px;
	height: 35px;
}

.lineFour button,.loadBtn {
		width: auto;
		height: 50px;
	    background-color: #5882FA;
	    border: none;
	    color:#fff;
	    padding: 10px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 15px;
	    margin: 4px;
	    cursor: pointer;
}
.lineFour button:hover,.loadBtn:hover {
	background-color: #2E9AFE;
}

.addBtn {
	width: 100%;
	height: 50px;
	background-color: #5882FA;
	font-size: 15px;
	color:#fff;
	border: none;
	text-decoration: none;
	cursor: pointer;
	outline: 0;
}
.addBtn:hover{
	background-color: #2E9AFE;
}

.lineSix textarea {
	width: 90%;
	height: auto;
	min-height: 50px;
	resize: none;
}

.addBtn span:before {
	content: '';
	display: block;
	position: absolute;
	left: 0;
	top: 14px;
	width: 20px;
	height: 20px;
	background: url('/content/images/text_user/resume/write/sprite-icon.png' ')
		no-repeat 0 -247px;
}
</style>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	var addCount = 0;
	
	$(function() {
		$("#workLvContent").hide();
		
		/** 내 교육이수사항 불러오기 */
		$("#loadBtn").click(function() {
			window.open("/job/job/resume/workLV/workLvLoadForm.jsp?addCount=" + addCount, "", "width=420px height=520px");
		});
		
		$("#addBtn").click(function() {
			addCount++;
			var numberRing = "_" + addCount;
			var clone = $("#workLvContent").clone().attr('id','workLvContent'+numberRing);
			
			if(addCount >=4){
				alert("항목추가는 최대 3개까지만 추가가능 합니다.");
				addCount--;
				return false;
			}
			
			//ID&NAME 넘버링 변경 작업
			clone.find('*[id]').each(function() {
				$(this).attr("id",$(this).attr("id") + numberRing);
			});
			clone.find('*[name]').each(function () {					
				$(this).attr("name",$(this).attr("name") + numberRing);
			});
			
		
			clone.insertBefore("#workLvContent");	
			
			
				
			
			
			$("#rsw_pay"+numberRing).hide();
			$("#rsw_part"+numberRing).hide();
			$("#position_list"+numberRing).hide();
			
			$("#workLvContent"+numberRing).show();
			
			
			//이벤트 바인딩
			$("#closeBtn"+numberRing).on("click", function() {
				/* $("#workLvContent"+numberRing).remove(); */
				$(this).parent().remove();
				$("#rsw__Seq"+numberRing).val("");
				addCount--;
			});
			
			$("#saveBtn"+numberRing).on("click", function() {
				if (!$("#rsw_company"+numberRing).val()) {
					alert("회사명을 입력하세요.");
					$("#rsw_company"+numberRing).focus();
					return false;
				}

				if (!$("#rsw_dept"+numberRing).val()) {
					alert("부서명을 입력하세요.");
					$("#rsw_dept"+numberRing).focus();
					return false;
				}
				if (!$("#rsw_startDate"+numberRing).val()) {
					alert("입사년월을 입력하세요.");
					$("#rsw_startDate"+numberRing).focus();
					return false;
				}

				if (!$("#rsw_endDate"+numberRing).val()) {
					alert("퇴사년월을 입력하세요.");
					$("#rsw_endDate"+numberRing).focus();
					return false;
				}

				if (!$("#rsw_position"+numberRing).val()) {
					alert("직급/직책을 입력하세요.");
					$("#rsw_position"+numberRing).focus();
					return false;
				}

				if (!$("#rsw_job"+numberRing).val()) {
					alert("직무를 입력하세요.");
					$("#rsw_job"+numberRing).focus();
					return false;
				}
				window.open("/job/job/resume/workLV/workLvSaveForm.jsp?numberRing="+numberRing, "", "width=410px height=360px");
			});
			
			$("#rsw_position"+numberRing).on("click", function() {
				$("#position_list"+numberRing).show();
			});
			
			$("#cancle"+numberRing).on("click", function() {
				$("#position_list"+numberRing).hide();
				$("#position_list"+numberRing + " input[type=radio]").prop('checked', false);
			});
			
			$("#ok"+numberRing).on("click", function() {
				$("#position_list"+numberRing).hide();
				var positionLeft = $(
						"input:radio[name=positionLeft" + numberRing +"]:checked").val();
				var positionRight = $(
						"input:radio[name=positionRight"+ numberRing +"]:checked").val();
				
				if(positionLeft == undefined){
					positionLeft = "";
				}else if(positionRight == undefined){
					positionRight ="";
				}
				
				$("#rsw_position"+numberRing).val(positionLeft + " " + positionRight);
			});
			
			$("#free"+numberRing).on("click", function() {
				$("#position_list"+numberRing).hide();
				$("#rsw_position"+numberRing).val($("#free"+numberRing).html());
			});
			
			$("#rsw_isNow"+numberRing).on("change", function() {
				if($(this).is(":checked")){
					$(this).val("y");	
				}else{
					$(this).val("n");
				}
			});
			
			$("#payBtn"+numberRing).on("click",function() {
				if($("#rsw_pay"+numberRing).css("display") == "none" ) { 
				    $("#rsw_pay"+numberRing).show();
				    $(this).html("연봉-");
				} else { 
				    $("#rsw_pay"+numberRing).hide()  
				    $(this).html("연봉+");
				} 
			});
			
			$("#partBtn"+numberRing).on("click",function() {
				if($("#rsw_part"+numberRing).css("display") == "none" ) { 
				    $("#rsw_part"+numberRing).show();
				    $(this).html("담당업무-");
				} else { 
				    $("#rsw_part"+numberRing).hide()  
				    $(this).html("담당업무+");
				} 
			});
		});
	});
	
	
	
	/** Load 함수 */
	function selected_rsw(accumSeq, addCount_Delivered) {
		$(function() {
			
			addCount = addCount_Delivered;
			
			$.ajax({
				type: 'POST',
				url: '/job/job/resume/workLV/rswLoadView.do',
				dataType: 'json',
				data: {
					"accumSeq": accumSeq
				},
				success: function(data) {

					$.each(data.items, function(index, item) {
						var testDTO = item;
						
						addCount++;
						
						var numberRing = "_" + addCount;
						var clone = $("#workLvContent").clone().attr('id','workLvContent'+numberRing);
						
						if(addCount >=4){
							alert("항목추가는 최대 3개까지만 추가가능 합니다.")
							addCount--;
							return false;
						}
						
						//ID&NAME 넘버링 변경 작업
						clone.find('*[id]').each(function() {
							$(this).attr("id",$(this).attr("id") + numberRing);
						});
						clone.find('*[name]').each(function () {					
							$(this).attr("name",$(this).attr("name") + numberRing);
						});
						
					
						clone.insertBefore("#workLvContent");	
					
						$("#rsw_pay"+numberRing).hide();
						$("#rsw_part"+numberRing).hide();
						$("#position_list"+numberRing).hide();
						$("#workLvContent"+numberRing).show();
						
						
						if($("#rsw_pay"+numberRing).val()){
							$("#rsw_pay"+numberRing).show();
							$("#payBtn"+numberRing).html("연봉-");
						}
						
						if($("#rsw_part"+numberRing).val()){
							$("#rsw_part"+numberRing).show();
							$("#partBtn"+numberRing).html("연봉-");
						}
						
						
						
						
						//이벤트 바인딩
						$("#closeBtn"+numberRing).on("click", function() {
							/* $("#workLvContent"+numberRing).remove(); */
							$(this).parent().remove();
							$("#rsw__Seq"+numberRing).val("");
							addCount--;
						});
						
						$("#saveBtn"+numberRing).on("click", function() {
							if (!$("#rsw_company"+numberRing).val()) {
								alert("회사명을 입력하세요.");
								$("#rsw_company"+numberRing).focus();
								return false;
							}

							if (!$("#rsw_dept"+numberRing).val()) {
								alert("부서명을 입력하세요.");
								$("#rsw_dept"+numberRing).focus();
								return false;
							}
							if (!$("#rsw_startDate"+numberRing).val()) {
								alert("입사년월을 입력하세요.");
								$("#rsw_startDate"+numberRing).focus();
								return false;
							}

							if (!$("#rsw_endDate"+numberRing).val()) {
								alert("퇴사년월을 입력하세요.");
								$("#rsw_endDate"+numberRing).focus();
								return false;
							}

							if (!$("#rsw_position"+numberRing).val()) {
								alert("직급/직책을 입력하세요.");
								$("#rsw_position"+numberRing).focus();
								return false;
							}

							if (!$("#rsw_job"+numberRing).val()) {
								alert("직무를 입력하세요.");
								$("#rsw_job"+numberRing).focus();
								return false;
							}
							window.open("/job/job/resume/workLV/workLvSaveForm.jsp?numberRing="+numberRing, "", "width=410px height=360px");
						});
						
						$("#rsw_position"+numberRing).on("click", function() {
							$("#position_list"+numberRing).show();
						});
						
						$("#cancle"+numberRing).on("click", function() {
							$("#position_list"+numberRing).hide();
							$("#position_list"+numberRing + " input[type=radio]").prop('checked', false);
						});
						
						$("#ok"+numberRing).on("click", function() {
							$("#position_list"+numberRing).hide();
							var positionLeft = $(
									"input:radio[name=positionLeft" + numberRing +"]:checked").val();
							var positionRight = $(
									"input:radio[name=positionRight"+ numberRing +"]:checked").val();
							
							if(positionLeft == undefined){
								positionLeft = "";
							}else if(positionRight == undefined){
								positionRight ="";
							}
							
							$("#rsw_position"+numberRing).val(positionLeft + " " + positionRight);
						});
						
						$("#free"+numberRing).on("click", function() {
							$("#position_list"+numberRing).hide();
							$("#rsw_position"+numberRing).val($("#free"+numberRing).html());
						});
						
						$("#rsw_isNow"+numberRing).on("change", function() {
							if($(this).is(":checked")){
								$(this).val("y");	
							}else{
								$(this).val("n");
							}
						});
						
						$("#payBtn"+numberRing).on("click",function() {
							if($("#rsw_pay"+numberRing).css("display") == "none" ) { 
							    $("#rsw_pay"+numberRing).show();
							    $(this).html("연봉-");
							} else { 
							    $("#rsw_pay"+numberRing).hide()  
							    $(this).html("연봉+");
							} 
						});
						
						$("#partBtn"+numberRing).on("click",function() {
							if($("#rsw_part"+numberRing).css("display") == "none" ) { 
							    $("#rsw_part"+numberRing).show();
							    $(this).html("담당업무-");
							} else { 
							    $("#rsw_part"+numberRing).hide()  
							    $(this).html("담당업무+");
							} 
						});
						
						console.log("[selected] rsw_userTitle : " + testDTO.rsw_userTitle);
						$("#rsw__Seq" +numberRing).val(testDTO.rsw_seq);
						$("#rsw_seq" +numberRing).val(testDTO.rsw_seq);
						$("#rsw_company" +numberRing).val(testDTO.rsw_company);
						$("#rsw_dept" +numberRing).val(testDTO.rsw_dept);
						$("#rsw_startDate" +numberRing).val(testDTO.rsw_startDate);
						$("#rsw_endDate" +numberRing).val(testDTO.rsw_endDate);
						$("#rsw_isNow" +numberRing).val(testDTO.rsw_isNow);
						$("#rsw_position" +numberRing).val(testDTO.rsw_position);
						$("#rsw_job" +numberRing).val(testDTO.rsw_job);
						$("#rsw_pay" +numberRing).val(testDTO.rsw_pay);
						$("#rsw_part" +numberRing).val(testDTO.rsw_part);
						$("#rsw_career" +numberRing).val(testDTO.rsw_career);
							
					});
					
				},
				error: function(e) {
					 alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.: ' + e.status);
				}
			});
			
		});
	}
</script>
</head>
<body>
<input type="hidden" id="rsw__Seq_1">
<input type="hidden" id="rsw__Seq_2">
<input type="hidden" id="rsw__Seq_3">
	<div id="workLvHeader" class="workLvHeader">
		<p class="title" style="color: gray; margin-left: 22px;">경력</p>
		<button type="button" id="loadBtn" class="loadBtn" style="margin-left: 24px;">내 경력 불러오기</button>
	</div>
	<div id="workLvContainer" class="workLvContainer">
		<div id="workLvContent" class="workLvContent">
			
			<button id="closeBtn" type="button" class="closeBtn">X</button>
			<div id="lineOne" class="lineOne">
				<div id="workLvCompany" class="workLvCompany">
					<input type="text" id="rsw_company" name="rsw_company"
						class="rsw_company" placeholder="회사명"> <input type="text" id="rsw_dept"
						name="rsw_dept" class="rsw_dept" placeholder="부서명">
				</div>
				<div id="workLvDate" class="workLvDate">
					<input type="date" id="rsw_startDate" name="rsw_startDate"
						class="rsw_startDate" placeholder="입사년월"> <input type="date" id="rsw_endDate"
						name="rsw_endDate" placeholder="퇴사년월">
				</div>
				<input type="checkbox" value="n" id="rsw_isNow" name="rsw_isNow" class="rsw_isNow">
				<label for="rsw_isNow">재직중</label>
			</div>
			<div id="lineTwo" class="lineTwo">
				<div id="workLvPosition" class="workLvPosition">
					<input type="text" id="rsw_position" name="rsw_position"
						class="rsw_position" placeholder="직급/직책" readonly="readonly"> <input
						type="text" id="rsw_job" name="rsw_job" class="rsw_job" placeholder="직무">
					<div id="position_list" class="position_list">
						<div id="left" class="left">
							<div id="headerLeft" class="headerLeft">직급</div>
							<div id="bodyLeft" class="bodyLeft">
								<div>
									<input type="radio" id="leftRadio1" name="positionLeft"
										class="leftRadio1" value="사원"><label class="postionLabel"
										for="leftRadio1">사원</label>
								</div>
								<div>
									<input type="radio" id="leftRadio2" name="positionLeft"
										class="leftRadio2" value="연구원"><label class="postionLabel"
										for="leftRadio2">연구원</label>
								</div>
								<div>
									<input type="radio" id="leftRadio3" name="positionLeft"
										class="leftRadio3" value="주임/계장"><label class="postionLabel"
										for="leftRadio3">주임/계장</label>
								</div>
								<div>
									<input type="radio" id="leftRadio4" name="positionLeft"
										class="leftRadio4" value="주임연구원"><label class="postionLabel"
										for="leftRadio4">주임연구원</label>
								</div>
								<div>
									<input type="radio" id="leftRadio5" name="positionLeft"
										class="leftRadio5" value="대리"><label class="postionLabel"
										for="leftRadio5">대리</label>
								</div>
								<div>
									<input type="radio" id="leftRadio6" name="positionLeft"
										class="leftRadio6" value="선임연구원"><label class="postionLabel"
										for="leftRadio6">선임연구원</label>
								</div>
								<div>
									<input type="radio" id="leftRadio7" name="positionLeft"
										class="leftRadio7" value="과장"><label class="postionLabel"
										for="leftRadio7">과장</label>
								</div>
								<div>
									<input type="radio" id="leftRadio8" name="positionLeft"
										class="leftRadio8" value="책임연구원"><label class="postionLabel"
										for="leftRadio8">책임연구원</label>
								</div>
								<div>
									<input type="radio" id="leftRadio9" name="positionLeft"
										class="leftRadio9" value="차장"><label class="postionLabel"
										for="leftRadio9">차장</label>
								</div>
								<div>
									<input type="radio" id="leftRadio10" name="positionLeft"
										class="leftRadio10" value="수석연구원"><label class="postionLabel"
										for="leftRadio10">수석연구원</label>
								</div>
								<div>
									<input type="radio" id="leftRadio11" name="positionLeft"
										class="leftRadio11" value="부장"><label class="postionLabel"
										for="leftRadio11">부장</label>
								</div>
								<div>
									<input type="radio" id="leftRadio12" name="positionLeft"
										class="leftRadio12" value="연구소장"><label class="postionLabel"
										for="leftRadio12">연구소장</label>
								</div>
								<div>
									<input type="radio" id="leftRadio13" name="positionLeft"
										class="leftRadio13" value="임원"><label class="postionLabel"
										for="leftRadio13">임원</label>
								</div>
							</div>
						</div>
						<div id="right" class="right">
							<div id="headerRight" class="headerRight">직책</div>
							<div id="bodyRight" class="bodyRight">
								<div>
									<input type="radio" id="rightRadio1" name="positionRight"
										class="rightRadio1" value="팀원"><label class="positionLabel"
										for="rightRadio1">팀원</label>
								</div>
								<div>
									<input type="radio" id="rightRadio2" name="positionRight"
										class="rightRadio2" value="원장"><label class="positionLabel"
										for="rightRadio2">원장</label>
								</div>
								<div>
									<input type="radio" id="rightRadio3" name="positionRight"
										class="rightRadio3" value="팀장"><label class="positionLabel"
										for="rightRadio3">팀장</label>
								</div>
								<div>
									<input type="radio" id="rightRadio4" name="positionRight"
										class="rightRadio4" value="국장"><label class="positionLabel"
										for="rightRadio4">국장</label>
								</div>
								<div>
									<input type="radio" id="rightRadio5" name="positionRight"
										class="rightRadio5" value="매니저"><label class="positionLabel"
										for="rightRadio5">매니저</label>
								</div>
								<div>
									<input type="radio" id="rightRadio6" name="positionRight"
										class="rightRadio6" value="본부장"><label class="positionLabel"
										for="rightRadio6">본부장</label>
								</div>
								<div>
									<input type="radio" id="rightRadio7" name="positionRight"
										class="rightRadio7" value="파트장"><label class="positionLabel"
										for="rightRadio7">파트장</label>
								</div>
								<div>
									<input type="radio" id="rightRadio8" name="positionRight"
										class="rightRadio8" value="센터장"><label class="positionLabel"
										for="rightRadio8">센터장</label>
								</div>
								<div>
									<input type="radio" id="rightRadio9" name="positionRight"
										class="rightRadio9" value="실장"><label class="positionLabel"
										for="rightRadio9">실장</label>
								</div>
								<div>
									<input type="radio" id="rightRadio10" name="positionRight"
										class="rightRadio10" value="공장장"><label class="positionLabel"
										for="rightRadio10">공장장</label>
								</div>
								<div>
									<input type="radio" id="rightRadio11" name="positionRight"
										class="rightRadio11" value="지점장"><label class="positionLabel"
										for="rightRadio11">지점장</label>
								</div>
								<div>
									<input type="radio" id="rightRadio12" name="positionRight"
										class="rightRadio12" value="그룹장"><label class="positionLabel"
										for="rightRadio12">그룹장</label>
								</div>
								<div>
									<input type="radio" id="rightRadio13" name="positionRight"
										class="rightRadio13" value="지사장"><label class="positionLabel"
										for="rightRadio13">지사장</label>
								</div>
							</div>
						</div>
						<div id="footer" class="footer">
							<button type="button" id="free" class="free">프리랜서</button>
							<button type="button" id="cancle" class="cancle">취소</button>
							<button type="button" id="ok" class="ok">확인</button>
						</div>
					</div>
				</div>
				<div id="workLvPay" class="workLvPay">
					<input type="text" id="rsw_pay" name="rsw_pay" class="rsw_pay" placeholder="연봉">
				</div>
			</div>
			<div id="lineThree" class="lineThree">
				<div id="workLvPart" class="workLvPart">
					<textarea id="rsw_part" name="rsw_part" class="rsw_part" placeholder="담당업무"></textarea>
				</div>
			</div>
			<div id="lineFour" class="lineFour">
				<button id="payBtn" class="payBtn payAdd" type="button">연봉+</button>
				<button id="partBtn" class="partBtn partAdd" type="button">담당업무+</button>
				<button id="saveBtn" class="saveBtn saveAdd" type="button">저장하기</button>
			</div>
		</div>
		<div id="lineFive" class="lineFive">
			<button id="addBtn" class="addBtn" type="button">
				<span>추가하기</span>
			</button>
		</div>
		<div id="lineSix" class="lineSix">
			<textarea id="rsw_career" name="rsw_career"  class="lineSix" placeholder="경력기술서"></textarea>
		</div>
	</div>
	<br>
</body>
</html>