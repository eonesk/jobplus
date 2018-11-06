<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".rsv_list").hide();
	
	$("#rsv_startDateDiv").hide(); 
	$("#rsv_endDateDiv").hide(); 
	$("#rsv_positionDiv").hide();
	$("#rsv_positionList").hide();
	
	$(".rsv_listBtn").click(function() {
		$(".rsv_list").hide();
		$(this).next().show();
		alert("!");
	});
	
	$(".rsv_listCheckBtn").click(function() {
		$(".rsv_list").hide();
		$(this).parent().parent().find(".rsv_valueSpan").html($(this).val());
		$(this).parent().parent().find(".rsv_titleSpan").css("font-size","6px");
		if($(this).html() == "군필"){
			$("#rsv_startDateDiv").show(); 
			$("#rsv_endDateDiv").show(); 
			$("#rsv_positionDiv").show();
		}else if($(this).html() == "미필" || $(this).html() == "면제" || $(this).html() == "해당없음"){
			$("#rsv_startDateDiv").hide(); 
			$("#rsv_endDateDiv").hide(); 
			$("#rsv_positionDiv").hide();
			$("#rsv_startDateDiv input").val(""); 
			$("#rsv_endDateDiv input").val("");
			$("#rsv_position").html("");
		}
	});
	

	$("#rsv_saveBtn").click(function() {
		if(!$("#rsv_isMedal").html()){
			alert("보훈대상 여부를 체크하세요.");
			$("#rsv_isMedalList").show();
			return false;
		}
		
		if(!$("#rsv_isProtect").html()){
			alert("취업보호대상 여부를 체크하세요.");
			$("#rsv_isProtectList").show();
			return false;
		}
		
		if(!$("#rsv_isMoney").html()){
			alert("고용지원금대상 여부를 체크하세요.");
			$("#rsv_isMoneyList").show();
			return false;
		}
		
		if(!$("#rsv_isDisable").html()){
			alert("장애 여부를 체크하세요.");
			$("#rsv_isDisableList").show();
			return false;
		}
		
		if(!$("#rsv_military").html()){
			alert("병역 여부를 체크하세요.");
			$("#rsv_militaryList").show();
			return false;
		}
		window.open("/job/job/resume/vip/vipSaveForm.jsp", "", "width=410px height=360px");
		/* 
		if(!$("#rsv_position").html()){
			alert("취업보호대상 여부를 체크하세요.");
			$("#rsv_position").show();
			return false;
		} */
	});
	
	$("#rsv_posListOkBtn").click(function() {
		$("#rsv_positionList").hide();
		$(this).parent().parent().parent().find(".rsv_titleSpan").css("font-size","6px");
		var positionLeft = $(
				"input:radio[name=rsv_posRadioLeft]:checked").val();
		var positionRight = $(
				"input:radio[name=rsv_posRadioRight]:checked").val();
		
		if(positionLeft == undefined){
			positionLeft = "";
		}else if(positionRight == undefined){
			positionRight ="";
		}
		
		$("#rsv_position").html(positionLeft + " " + positionRight);
	});
	
	$("#rsv_posListCancleBtn").click(function() {
		$("#rsv_positionList").hide();
		$("#rsv_positionList input[type=radio]").prop('checked', false);
	});
	
	$("#rsv_loadBtn").click(function() {
		window.open("/job/job/resume/vip/vipLoadForm.jsp", "", "width=420px height=520px");
	});
	
	//쓰레기
	/* $("input[name='rsv_posRadioLeft'],input[name='rsv_posRadioRight']").change(function() {
		var is_check = $(this).is(":checked");
		if(is_check){
			$(this).next().addClass("rsv_labelCheckOn");
			$(this).next().removeClass("rsv_labelCheckOff");
		}else{
			$(this).next().addClass("rsv_labelCheckOff");
			$(this).next().removeClass("rsv_labelCheckOn");
		}
	}); */
});

	
	function selected_rsv(accumSeq) {
		$(function() {
			
			$.ajax({
				type: 'POST',
				url: '/job/job/resume/vip/rsvLoadView.do',
				dataType: 'json',
				data: {
					"accumSeq": accumSeq
				},
				success: function(data) {

					$.each(data.items, function(index, item) {
						var testDTO = item;
						$("#rsv__seq").val(testDTO.rsv_seq);
						$("#rsv_seq").html(testDTO.rsv_seq);
						$("#rsv_isMedal").html(testDTO.rsv_isMedal);
						$("#rsv_isProtect").html(testDTO.rsv_isProtect);
						$("#rsv_isMoney").html(testDTO.rsv_isMoney);
						$("#rsv_isDisable").html(testDTO.rsv_isDisable);
						$("#rsv_military").html(testDTO.rsv_military);
						$("#rsv_startDate").val(testDTO.rsv_startDate);
						$("#rsv_endDate").val(testDTO.rsv_endDate);
						$("#rsv_position").html(testDTO.rsv_position);
							
					});
					
				},
				error: function(e) {
					 alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.: ' + e.status);
				}
			});
			
		});
	}
</script>
<style type="text/css">
*{
	margin: 0;
	padding:0;
}

body{
	background-color: gainsboro;
}

li{
	list-style: none;
}

.rsv_header{
	font-weight:bold;
	font-size: 20px;
	margin-bottom: 15px;
}
.rsv_container{
	background-color: white;
	width:940px;
}
.rsv_content{
	padding:15px;
	width:100%;
	height:100%;
}
.rsv_lineDiv{
	margin-bottom: 10px;
}

.rsv_lineOne{
	width:100%;
}

.rsv_lineOneDiv{
	position:relative;
	display:inline-block;
	width:180px;
	height:62px;
}

.rsv_lineOneDiv button{
	padding-left:5px;
	padding-right:5px;
	width: 100%;
	height:100%;
	background-color:white;
	border:1px solid lightgray;
	text-align: left;
	cursor: pointer;
}

.rsv_titleSpan{
	font-size:15px;
	color:lightgray;
}

.rsv_list{
	z-index:1;
	position: absolute;
    left: 0;
    top: 61px;
    width: 178px;
    height:95px;
    border: 1px solid #666;
    background-color:white;
    
}

.rsv_list button{
	height:50%;
	border:0;
	font-size:15px;
}

.rsv_lineTwo{
	width:100%;
}

.rsv_lineTwoDiv{
	position:relative;
	display:inline-block;
	width:180px;
	height:62px;
}

.rsv_lineTwoDiv button{
	padding-left:5px;
	padding-right:5px;
	width: 100%;
	height:100%;
	background-color:white;
	border:1px solid lightgray;
	text-align: left;
	cursor: pointer;
}

.rsv_militaryList{
    width: 178px;
    height:190px;
}

.rsv_militaryList button{
	height:25%;
	border:0;
	font-size:15px;
}

.rsv_startDateDiv ,.rsv_endDateDiv {
	
}

.rsv_startDateDiv input,.rsv_endDateDiv input{
	
	width: 99%;
	height:100%;
	border:1px solid lightgray;
}


.rsv_positionList{
	width: 381px;
	height:371px;
}

.rsv_positionList > div {
	
}

.rsv_positionListLeft{
	float:left;
	width: 30%;
	height:85%;
	border-right:1px solid lightgray;
}

.rsv_posListLeftBody{
	padding: 12px 0 13px;
}

.rsv_posListLeftBody ul{
	width:100px;
	line-height: 30px;
	padding-left:10px;
	font-size:13px;
}

.rsv_positionList input{
	display:none;
}

.rsv_labelCheckOff{
	border:none;
	padding:5px;
}
/**조난좋은거 */
input:checked + label{
	border:1px solid dodgerblue;
	border-radius:5px;
	padding:5px;
}

.rsv_posListLeftHeader,.rsv_posListRightHeader{
	padding-left:13px;
	padding-top:8px;
	border-bottom: 1px solid lightgray;
	height:11%;
	font-size:13px;
	background-color: #f6f6f6;
}
.rsv_positionListRight{
	width:69%;
	height:85%;
	float:left;
}
.rsv_posListRightBody{
	padding: 12px 0 13px;
}

.rsv_posListRightBody ul{
	float:left;
	width:60px;
	line-height: 30px;
	font-size:13px;
	text-align: center;
}

.rsv_positionListFooter{
	float:left;
	width: 95%;
	height:14%;
	border-top:1px solid lightgray;
	padding: 10px;
}

.rsv_positionListFooter button{
	float:right;
	width:70px;
	height:35px;
	text-align: center;
	font-size:13px;
	color:gray;
	margin-left: 5px;
}

.rsv_positionListFooter button{
	float:right;
	width:70px;
	height:35px;
	text-align: center;
	font-size:13px;
	color:gray;
	margin-left: 5px;
}

.rsv_positionListFooter .rsv_posListOkBtn{
	border:0;
	background-color:#3399ff;
	color:white;
}

.rsv_titleSpan{
	display:inline-block;
	font-size:15px;
	color:lightgray;
}

.rsv_valueSpan{
	font-size:15px;
}

.rsv_lineThree{
	width:100%;
}

.rsv_lineThreeDiv{
	display:inline-block;
	width:180px;
	height:62px;
}

.rsv_lineThree button{
	padding-left:5px;
	padding-right:5px;
	width: 80px;
	height: 40px;
	background-color:white;
	border:1px solid dodgerblue;
	color: dodgerblue;
	text-align: center;
	cursor: pointer;
}

.rsv_addBtn {
	width: 100%;
	height: 50px;
	background-color: white;
	border:0;
	border-top:1px solid gainsboro;
	font-size: 25px;
	font-weight: bold;
}
</style>
</head>
<body>
<div id="rsv_wrapper" class="rsv_wrapper">
	<div id="rsv_header" class="rsv_header">
		취업우대
	</div>
	<div id="rsv_container" class="rsv_container">
		<div id="rsv_content" class="rsv_content">
			<div id="rsv_lineOne" class="rsv_lineOne rsv_lineDiv">
				<div id="rsv_isMedalDiv" class="rsv_isMedalDiv rsv_lineOneDiv">
					<button class="rsv_listBtn" id="rsv_listBtn">
						<span class="rsv_titleSpan">보훈대상</span>
						<span id="rsv_isMedal" class="rsv_valueSpan"></span>
					</button>
					<div id="rsv_isMedalList" class="rsv_list rsv_isMedalList">
						<button value="대상" class="rsv_listCheckBtn">대상</button>
						<button value="비대상" class="rsv_listCheckBtn">비대상</button>
					</div>
				</div>
				
				<div id="rsv_isProtectDiv" class="rsv_isProtectDiv rsv_lineOneDiv">
					<button class="rsv_listBtn">
						<span class="rsv_titleSpan">취업보호대상</span>
						<span id="rsv_isProtect" class="rsv_valueSpan"></span>
					</button>
					<div id="rsv_isProtectList" class="rsv_list rsv_isProtectList">
						<button value="대상" class="rsv_listCheckBtn">대상</button>
						<button value="비대상" class="rsv_listCheckBtn">비대상</button>
					</div>
				</div>
				
				<div id="rsv_isMoneyDiv" class="rsv_isMoneyDiv rsv_lineOneDiv">
					<button class="rsv_listBtn">
						<span class="rsv_titleSpan">고용지원금대상</span>
						<span id="rsv_isMoney" class="rsv_valueSpan"></span>
					</button>
					<div id="rsv_isMoneyList" class="rsv_list rsv_isMoneyList">
						<button value="대상" class="rsv_listCheckBtn">대상</button>
						<button value="비대상" class="rsv_listCheckBtn">비대상</button>
					</div>
				</div>
				
				<div id="rsv_isDisableDiv" class="rsv_isDisableDiv rsv_lineOneDiv">
					<button class="rsv_listBtn">
						<span class="rsv_titleSpan">장애여부</span>
						<span id="rsv_isDisable" class="rsv_valueSpan"></span>
					</button>
					<div id="rsv_isDisableList" class="rsv_list rsv_isDisableList">
						<button value="대상" class="rsv_listCheckBtn">대상</button>
						<button value="비대상" class="rsv_listCheckBtn">비대상</button>
					</div>
				</div>
			</div>
			
			<div id="rsv_lineTwo" class="rsv_lineTwo rsv_lineDiv">
				<div id="rsv_militaryDiv" class="rsv_militaryDiv rsv_lineTwoDiv">
					<button class="rsv_listBtn">
						<span class="rsv_titleSpan">병역</span>
						<span id="rsv_military" class="rsv_valueSpan"></span>
					</button>
					<div id="rsv_militaryList" class="rsv_list rsv_militaryList">
						<button value="군필" class="rsv_listCheckBtn">군필</button>
						<button value="미필" class="rsv_listCheckBtn">미필</button>
						<button value="면제" class="rsv_listCheckBtn">면제</button>
						<button value="해당없음" class="rsv_listCheckBtn">해당없음</button>
					</div>
				</div>
				<div id="rsv_startDateDiv" class="rsv_startDateDiv rsv_lineTwoDiv">
					<input type="date" id="rsv_startDate" name="rsv_startDate" class="rsv_startDate">
				</div>
				
				<div id="rsv_endDateDiv" class="rsv_endDateDiv rsv_lineTwoDiv">
					<input type="date" id="rsv_endDate" name="rsv_endDate" class="rsv_endDate">
				</div>
				
				<div id="rsv_positionDiv" class="rsv_positionDiv rsv_lineTwoDiv">
					<button class="rsv_listBtn">
						<span class="rsv_titleSpan">군별제대 계급</span>
						<span id="rsv_position" class="rsv_valueSpan"></span>
					</button>
					<div id="rsv_positionList" class="rsv_list rsv_positionList">
						<div id="rsv_positionListLeft" class="rsv_positionListLeft">
							<div id="rsv_posListLeftHeader" class="rsv_posListLeftHeader">
								군별
							</div>
							<div id="rsv_posListLeftBody" class="rsv_posListLeftBody">
								<ul>
									<li><input type="radio" value="육군" name="rsv_posRadioLeft" id="rsv_posRadioLeft1"><label for="rsv_posRadioLeft1" class="rsv_labelCheckOff">육군</label></li>
									<li><input type="radio" value="해군" name="rsv_posRadioLeft" id="rsv_posRadioLeft2"><label for="rsv_posRadioLeft2" class="rsv_labelCheckOff">해군</label></li>
									<li><input type="radio" value="공군" name="rsv_posRadioLeft" id="rsv_posRadioLeft3"><label for="rsv_posRadioLeft3" class="rsv_labelCheckOff">공군</label></li>
									<li><input type="radio" value="해병" name="rsv_posRadioLeft" id="rsv_posRadioLeft4"><label for="rsv_posRadioLeft4" class="rsv_labelCheckOff">해병</label></li>
									<li><input type="radio" value="전경" name="rsv_posRadioLeft" id="rsv_posRadioLeft5"><label for="rsv_posRadioLeft5" class="rsv_labelCheckOff">전경</label></li>
									<li><input type="radio" value="의경" name="rsv_posRadioLeft" id="rsv_posRadioLeft6"><label for="rsv_posRadioLeft6" class="rsv_labelCheckOff">의경</label></li>
									<li><input type="radio" value="공익" name="rsv_posRadioLeft" id="rsv_posRadioLeft7"><label for="rsv_posRadioLeft7" class="rsv_labelCheckOff">공익</label></li>
									<li><input type="radio" value="기타" name="rsv_posRadioLeft" id="rsv_posRadioLeft8"><label for="rsv_posRadioLeft8" class="rsv_labelCheckOff">기타</label></li>
								</ul>
							</div>
						</div>
						<div id="rsv_positionListRight" class="rsv_positionListRight">
							<div id="rsv_posListRightHeader" class="rsv_posListRightHeader">
								제대/계급
							</div>
							<div id="rsv_posListRightBody" class="rsv_posListRightBody">
								<ul>
									<li><input type="radio" value="이병" name="rsv_posRadioRight" id="rsv_posRadioRight1"><label for="rsv_posRadioRight1" class="rsv_labelCheckOff">이병</label></li>
									<li><input type="radio" value="일병" name="rsv_posRadioRight" id="rsv_posRadioRight2"><label for="rsv_posRadioRight2" class="rsv_labelCheckOff">일병</label></li>
									<li><input type="radio" value="상병" name="rsv_posRadioRight" id="rsv_posRadioRight3"><label for="rsv_posRadioRight3" class="rsv_labelCheckOff">상병</label></li>
									<li><input type="radio" value="병장" name="rsv_posRadioRight" id="rsv_posRadioRight4"><label for="rsv_posRadioRight4" class="rsv_labelCheckOff">병장</label></li>
									<li><input type="radio" value="하사" name="rsv_posRadioRight" id="rsv_posRadioRight5"><label for="rsv_posRadioRight5" class="rsv_labelCheckOff">하사</label></li>
									<li><input type="radio" value="중사" name="rsv_posRadioRight" id="rsv_posRadioRight6"><label for="rsv_posRadioRight6" class="rsv_labelCheckOff">중사</label></li>
									<li><input type="radio" value="상사" name="rsv_posRadioRight" id="rsv_posRadioRight7"><label for="rsv_posRadioRight7" class="rsv_labelCheckOff">상사</label></li>
								</ul>
								<ul>
									<li><input type="radio" value="원사" name="rsv_posRadioRight" id="rsv_posRadioRight8"><label for="rsv_posRadioRight8"   class="rsv_labelCheckOff">원사</label></li>
									<li><input type="radio" value="준위" name="rsv_posRadioRight" id="rsv_posRadioRight9"><label for="rsv_posRadioRight9"   class="rsv_labelCheckOff">준위</label></li>
									<li><input type="radio" value="소위" name="rsv_posRadioRight" id="rsv_posRadioRight10"><label for="rsv_posRadioRight10" class="rsv_labelCheckOff">소위</label></li>
									<li><input type="radio" value="중위" name="rsv_posRadioRight" id="rsv_posRadioRight11"><label for="rsv_posRadioRight11" class="rsv_labelCheckOff">중위</label></li>
									<li><input type="radio" value="대위" name="rsv_posRadioRight" id="rsv_posRadioRight12"><label for="rsv_posRadioRight12" class="rsv_labelCheckOff">대위</label></li>
									<li><input type="radio" value="소령" name="rsv_posRadioRight" id="rsv_posRadioRight13"><label for="rsv_posRadioRight13" class="rsv_labelCheckOff">소령</label></li>
									<li><input type="radio" value="중령" name="rsv_posRadioRight" id="rsv_posRadioRight14"><label for="rsv_posRadioRight14" class="rsv_labelCheckOff">중령</label></li>
								</ul>
								<ul>
									<li><input type="radio" value="대령" name="rsv_posRadioRight" id="rsv_posRadioRight15"><label for="rsv_posRadioRight15" class="rsv_labelCheckOff">대령</label></li>
									<li><input type="radio" value="준장" name="rsv_posRadioRight" id="rsv_posRadioRight16"><label for="rsv_posRadioRight16" class="rsv_labelCheckOff">준장</label></li>
									<li><input type="radio" value="소장" name="rsv_posRadioRight" id="rsv_posRadioRight17"><label for="rsv_posRadioRight17" class="rsv_labelCheckOff">소장</label></li>
									<li><input type="radio" value="중장" name="rsv_posRadioRight" id="rsv_posRadioRight18"><label for="rsv_posRadioRight18" class="rsv_labelCheckOff">중장</label></li>
									<li><input type="radio" value="대장" name="rsv_posRadioRight" id="rsv_posRadioRight19"><label for="rsv_posRadioRight19" class="rsv_labelCheckOff">대장</label></li>
									<li><input type="radio" value="기타" name="rsv_posRadioRight" id="rsv_posRadioRight20"><label for="rsv_posRadioRight10" class="rsv_labelCheckOff">기타</label></li>
								</ul>                                                                                                                     
							</div>
						</div>
						<div id="rsv_positionListFooter" class="rsv_positionListFooter">
							<button id="rsv_posListOkBtn" class="rsv_posListOkBtn">확인</button>
							<button id="rsv_posListCancleBtn" class="rsv_posListCancleBtn">취소</button>
						</div>
					</div>
				</div>
			</div>
			<div id="rsv_lineThree" class="rsv_lineThree rsv_lineDiv">
				<button type="button" id="rsv_saveBtn" class="rsv_saveBtn">
					<span>저장하기</span>
				</button>
				<button type="button" id="rsv_loadBtn" class="rsv_loadBtn">
					<span>불러오기</span>
				</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>