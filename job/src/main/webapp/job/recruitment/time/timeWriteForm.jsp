<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>접수기간폼</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() { 
		$("#timePopUp").hide();
		$("#timeTitleButton").click(function() {
			$("#timePopUp").show();
			$("#timeDeem").show();
			$("#timeDeem").click(function() {
				$("#timePopUp").hide();
				$("#timeDeem").hide();
			});
		});
		$("#onlineNotiveDiv > p > a").click(function() {
			$("#timePopUp").show();
			$("#timeDeem").show();
			$("#timeDeem").click(function() {
				$("#timePopUp").hide();
				$("#timeDeem").hide();
			});
		});
		
		var today = new Date();
		var yyyy_today = today.getFullYear();
		var MM_today = today.getMonth() + 1;
		if(MM_today < 10) { MM_today = "0" + MM_today; }
		var dd_today = today.getDate();
		if(dd_today < 10) { dd_today = "0" + dd_today; }
		
		today = yyyy_today + "-" + MM_today + "-" + dd_today;
		
		$("#timePeriodStartDate").val(today);
		
		$("#timePeriodButton1").click(function() {
			
			$("#timePeriodButton1").css({
				"background-color": "#b0b0b0",
				"color": "white"
			});
			
			$(".timePeriodButton").not(this).css({
				"background-color": "white",
				"color": "black"
			});
			
			
			var startDate = new Date($("#timePeriodStartDate").val());
			var yyyy_startDate = startDate.getFullYear();
			var MM_startDate = startDate.getMonth() + 1;
			var dd_startDate = startDate.getDate();
			
			var dd_15 = dd_startDate + 14;
			var MM_15;
			var yyyy_15;
			if((MM_startDate == 1)||(MM_startDate == 3)||(MM_startDate == 5)||(MM_startDate == 7)
					||(MM_startDate == 8)||(MM_startDate == 10)||(MM_startDate == 12)) {
				if(dd_15 > 31) {
					dd_15 = dd_15 - 31;
					var MM_temp = MM_startDate + 1;
					if(MM_temp > 12) {
						yyyy_15 = yyyy_startDate + 1;
						MM_15 = 1;
					} else {
						yyyy_15 = yyyy_startDate;
						MM_15 = MM_temp;
					}
				} else {
					dd_15 = dd_startDate + 14;
					MM_15 = MM_startDate;
					yyyy_15 = yyyy_startDate;
				}
			} else {
				if(dd_15 > 30) {
					dd_15 = dd_15 - 30;
					var MM_temp = MM_startDate + 1;
					if(MM_temp > 12) {
						yyyy_15 = yyyy_startDate + 1;
						MM_15 = 1;
					} else {
						yyyy_15 = yyyy_startDate;
						MM_15 = MM_temp;
					}
				} else {
					dd_15 = dd_startDate + 14;
					MM_15 = MM_startDate;
					yyyy_15 = yyyy_startDate;
				}
			}			
			
			if(MM_15 < 10) { MM_15 = "0" + MM_15; }
			if(dd_15 < 10) { dd_15 = "0" + dd_15; }
			
			var date_15 = yyyy_15 + "-" + MM_15 + "-" + dd_15;
			$("#timePeriodEndDate").val(date_15);
		});
		
		$("#timePeriodButton2").click(function() {
			var startDate = new Date($("#timePeriodStartDate").val());		
			
			$("#timePeriodButton2").css({
				"background-color": "#b0b0b0",
				"color": "white"
			});
			$(".timePeriodButton").not(this).css({
				"background-color": "white",
				"color": "black"
			});
			
			var date_1 = calcEndDate(startDate, 1);
			$("#timePeriodEndDate").val(date_1);
		});
		
		$("#timePeriodButton3").click(function() {
			var startDate = new Date($("#timePeriodStartDate").val());		
			
			$("#timePeriodButton3").css({
				"background-color": "#b0b0b0",
				"color": "white"
			});
			$(".timePeriodButton").not(this).css({
				"background-color": "white",
				"color": "black"
			});
			
			var date_2 = calcEndDate(startDate, 2);
			$("#timePeriodEndDate").val(date_2);
		});
		
		$("#onlineNoticeHideAndView").hide();
		
		
		$("#onlineCheckbox").on("change", function() {
			if($("#onlineCheckbox").is(":checked")) {
				$("#onlineNoticeHideAndView").show();
			} else {
				$("#onlineNoticeHideAndView").hide();
			}
		});
		
		
 ///////////////////////// 유효성 검사		
		$("#timeNextButton").click(function() {
			alert($("input[name='rmt_How']").eq(0).is(":checked"));
			rmt_HowValidation = ($("input[name='rmt_How']").eq(0).is(":checked")) || ($("input[name='rmt_How']").eq(0).is(":checked")) 
			|| ($("input[name='rmt_How']").eq(1).is(":checked")) || ($("input[name='rmt_How']").eq(2).is(":checked") || $("input[name='rmt_How']").eq(3).is(":checked")
				||	$("input[name='rmt_How']").eq(4).is(":checked") || $("input[name='rmt_How']").eq(5).is(":checked"));
			
			if($("input[name='rmt_Startdate']").val() == "") {
				alert("접수시작일을 입력해주세요.");
				$("input[name='rmt_Startdate']").focus();
			} else if($("input[name='rmt_Enddate']").val() == "") {
				alert("접수종료일을 입력해주세요.");
				$("input[name='rmt_Enddate']").focus();
			} else {
				document.timeWriteForm.submit();
			}
		});
/////////////////////////////////////////////////////////		
	});
	
	function calcEndDate(startDate, month) {
		var yyyy_startDate = startDate.getFullYear();
		var MM_startDate = startDate.getMonth() + 1;
		var dd_startDate = startDate.getDate();
		
		var yyyy_month;
		var MM_month = MM_startDate + month;
		var dd_month = dd_startDate - 1;
		
		if(dd_month < 1) {
			if(MM_month > 13) {
				dd_month = 31;
				MM_month = 1;
				yyyy_month = yyyy_startDate + 1;
			} else if(MM_month <= 13) {
				MM_month = MM_month - 1;
				if((MM_month == 1)||(MM_month == 3)||(MM_month == 5)||(MM_month == 7)
						||(MM_month == 8)||(MM_month == 10)||(MM_month == 12)) {
					dd_month = 31;
				} else {
					dd_month = 30;
				}
				yyyy_month = yyyy_startDate;
			}
		} else {
			if(MM_month > 12) {
				MM_month = 1;
				yyyy_month = yyyy_startDate + 1;
			} else {
				yyyy_month = yyyy_startDate;
			}
		}	
		
		if(MM_month < 10) { MM_month = "0" + MM_month; }
		if(dd_month < 10) { dd_month = "0" + dd_month; }
		
		return yyyy_month + "-" + MM_month + "-" + dd_month;
	}
	////////////////// 무시해도 됨
    window.onload = function(){
        //전체주소 
        console.log("url : "+$(location).attr('href'));
 
        //http:, localhost:port번호, index.html ?test=tttt 순으로 나누어져 있습니다.
        console.log("url : "+$(location).attr('protocol')+"//"+$(location).attr('host')+""+$(location).attr('pathname')+""+$(location).attr('search'));
    }
</script>
<style type="text/css">
body {
}

#timeWrap {
	margin: 50px;
	padding: auto;
	width: 800px;
	padding-bottom: 32px;
}

h2 {
	float: left;
	margin: 0;
	margin-bottom: 5px;
	padding: 0;
}

#guide {
	float: left;
	
	padding: 0px;
	padding-left: 10px;
	padding-top: 10px;
}

#timeTitleButton {
	margin-left: 384px;
	padding: 7px;
	
	background-color: #666666;
	border: 1px solid #666666;
	color: white;
	
	border-radius: 3px;
}
#timeTitleButton:hover {background-color: #3f3f3f;}

#timePeriod {
	border-bottom: 1px solid lightgray;
}

#timePeriodLeft {
	float: left;
	padding: 10px;
	padding-left: 20px;
	
	width: 170px;
	height: 150px;
	color: #ff5a00;
	font-weight: bold;
}

#timePeriodButtons {
	padding: 10px 0 0 0;
	height: 50px;	
}

.timePeriodButton {
	float: left;
	margin: 0;
	border: 1px solid #b0b0b0; 
	padding: 8px 15px 8px 15px;
}

#timePeriodButton2 {
	border-left: 0px;
	border-right: 0px;
}

#timePeriodDate {
	background-color: white;
}

#timePeriodStartDate, #timePeriodEndDate {
	height: 40px;
	
	padding-left: 5px;
	border: 1px solid #b0b0b0;
	border-radius: 3px;
}

#timePeriodNotice {
	height: 57px;
	padding-top: 10px;
	color: #757575;	
}

.timePeriodNotice {
	padding: 0;
	margin: 0;
	font-size: 14px;
}

.textOrange {
	color: #ff5a00;
}

#timeMethod {
	border-bottom: 1px solid lightgray;
}

#timeMethodLeft {
	float: left;
	padding: 10px;
	padding-left: 20px;
	
	width: 170px;
	height: 150px;
	color: #ff5a00;
	font-weight: bold;
}

#timeMethodRight {
	float: left;
}

#onlineMethod {padding-top: 10px;}
#onlineCheckboxDiv, #onlineLabelDiv {display: inline-block;}
#onlineCheckbox {width: 25px; height: 25px; border: 2px;}
#onlineLabelDiv > p {position: relative; top: -8px; margin: 0; color: #ff5a00;}
#onlineNotiveDiv {padding-left: 10px;}
#onlineNotiveDiv > p {margin: 0; color: #757575; font-size: 14px; display: inline-block;}
#onlineNotiveDiv > p > a {color: black;}
#onlineNotiveDiv > p > a:visited {color: #757575;}
#onlineAgreeDiv {display: inline-block;}
#onlineAgreeCheckbox {float: left; display: inline-block; position: relative; top: 8px; width: 20px; margin: 0;}
#onlineAgreeDiv > p {float: left; display: inline-block; position: relative; top: 3px; margin: 0; }

#homepageMethod {padding-top: 10px;}
#homepageCheckboxDiv, #homepageLabelDiv, #homepageURLDiv {display: inline-block;}
#homepageCheckbox {width: 25px; height: 25px; border: 2px;}
#homepageURLDiv {position: relative; top: -8px; margin: 0;}
#homepageLabelDiv > p {position: relative; top: -8px; margin: 0;}
#homepageURL {width: 300px; height: 30px; border-radius: 3px; border: 1px solid #b0b0b0;}

#etcMethod {padding-top: 10px;}
#letterCheckboxDiv, #visitCheckboxDiv, #telCheckboxDiv, #faxCheckboxDiv {display: inline-block;}
#letterLabelDiv, #visitLabelDiv, #telLabelDiv, #faxLabelDiv {display: inline-block; width: 70px;}
#letterCheckbox, #visitCheckbox, #telCheckbox, #faxCheckbox {width: 25px; height: 25px; border: 2px;}
#letterLabelDiv > p, #visitLabelDiv > p, #telLabelDiv > p, #faxLabelDiv > p {position: relative; top: -8px; margin: 0;}


#timeForm {border-bottom: 1px solid lightgray;}
#timeFormLeft {
	float: left;
	padding: 8px;
	padding-left: 20px;
	
	width: 170px;
	height: 60px;
	color: #ff5a00;
	font-weight: bold;
}

#timeFormRight {padding-top: 20px; padding-bottom: 20px;}
#timeFormRight > div {display: inline-block;}
#timeFormRight > div > input {width: 25px; height: 25px; border: 2px;}
#timeFormRight > div > p {position: relative; top: -8px; margin: 0; width: 150px;}

#timeNextButtonDiv {margin-top: 5px; margin-right: 10px; float: right;}

#timeNextButton {
	margin-left: 180px;
	padding: 7px;
	width: 100px;
	
	background-color: #666666;
	border: 1px solid #666666;
	color: white;
	
	border-radius: 3px;
}
#timeNextButton:hover {background-color: #3f3f3f;}



#timePopUp{
  width: 750px; height: 600px; background:white; color:black; 
  position:absolute; top:115px; left: 20%; padding: 50px;
  border:1px solid #666666; overflow: scroll; z-index: 100px;
}

#timeDeem {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(102, 102, 102, 0.8);
	filter: alpha(opacity=50); /* For IE8 and earlier */
	z-index: 50px;
}

</style>
</head>
<body>
<form action="timeWriteFormNext.do" method="post" name="timeWriteForm">
	<div id="timeWrap">
		<div id="timeTitle">
			<h2>접수기간 및 방법</h2>
			<div id="guide">
				사람인이 채용절차법 준수를 완벽히 도와드립니다.
			</div>
			<button id="timeTitleButton" type="button">채용절차법 준수 안심보장 시스템</button>
		</div>
		
		<hr style="clear: both;">
		
		<div id="timePeriod">
			<div id="timePeriodLeft">
				<p>*접수기간</p>
			</div>
			<div id="timePeriodRight">
				<div id="timePeriodButtons">
					<div id="timePeriodButton1" class="timePeriodButton">15일</div>
					<div id="timePeriodButton2" class="timePeriodButton">1개월</div>
					<div id="timePeriodButton3" class="timePeriodButton">2개월</div>
					<br style="clear: both;">
				</div>
				<div id="timePeriodDate">
					<input id="timePeriodStartDate" type="date" name="rmt_Startdate"> ~ 
					<input id="timePeriodEndDate" type="date" name="rmt_Enddate">
				</div>
				<div id="timePeriodNotice">
					<p class="timePeriodNotice">실제 사람인에 게재되는 기간은 아래와 같습니다. <span class="textOrange">최대 기간 이후 자동 마감 처리 됩니다.</span></p>
					<p class="timePeriodNotice">-무료공고:<span class="textOrange">최대 15일</span> / 유료공고: <span class="textOrange">최대 60일</span></p>
				</div>
			</div>
		</div>
		
		<div id="timeMethod">
			<div id="timeMethodLeft">
				<p>*접수방법</p>
			</div>
			<div id="timeMethodRight">
				<div id="onlineMethod">
					<div>
						<div id="onlineCheckboxDiv"><input id="onlineCheckbox" type="checkbox" value="사람인 온라인 접수" name="rmt_How"></div>
						<div id="onlineLabelDiv"><p>사람인 온라인 접수</p></div>
					</div>
					<div id="onlineNoticeHideAndView">
						<div id="onlineNotiveDiv">
							<p>※ “<a href="#">채용절차법 준수를 위한 안심보장 시스템</a>”을 사람인이 관리하도록 위임하시겠습니까?</p>
							<div id="onlineAgreeDiv">
								<input id="onlineAgreeCheckbox" type="checkbox">
								<p>동의합니다</p>
							</div>
						</div>
					</div>
				</div>
				<div id="homepageMethod">
					<div>
						<div id="homepageCheckboxDiv"><input id="homepageCheckbox" type="checkbox" value="홈페이지 접수" name="rmt_How"></div>
						<div id="homepageLabelDiv"><p>홈페이지 접수</p></div>
						<div id="homepageURLDiv"><input id="homepageURL" type="url" placeholder=" http://"></div>
					</div>
				</div>
				<div id="etcMethod">
					<div>
						<div id="letterCheckboxDiv"><input id="letterCheckbox" type="checkbox" value="우편 접수" name="rmt_How"></div>
						<div id="letterLabelDiv"><p>우편</p></div>
						<div id="visitCheckboxDiv"><input id="visitCheckbox" type="checkbox" value="방문 접수" name="rmt_How"></div>
						<div id="visitLabelDiv"><p>방문</p></div>
						<div id="telCheckboxDiv"><input id="telCheckbox" type="checkbox" value="전화 접수" name="rmt_How"></div>
						<div id="telLabelDiv"><p>전화</p></div>
						<div id="faxCheckboxDiv"><input id="faxCheckbox" type="checkbox" value="FAX 접수" name="rmt_How"></div>
						<div id="faxLabelDiv"><p>FAX</p></div>
					</div>
				</div>
			</div>
			<br style="clear: both;">
		</div>
		
		<div id="timeForm">
			<div id="timeFormLeft">
				<p>*접수양식</p>
			</div>
			<div id="timeFormRight">
				<div id="onlineRadioDiv"><input id="onlineRadio" type="radio" value="사람인 이력서" checked name="rmt_Form"></div>
				<div id="onlineLabelDiv"><p>사람인 이력서</p></div>
				<div id="companyRadioDiv"><input id="companyRadio" type="radio" value="자사 양식" name="rmt_Form"></div>
				<div id="companyLabelDiv"><p>자사 양식</p></div>
				<div id="freeRadioDiv"><input id="freeRadio" type="radio" value="자유 양식" name="rmt_Form"></div>
				<div id="freeLabelDiv"><p>자유 양식</p></div>
			</div>
		</div>
		<div id="timeNextButtonDiv">
			<button id="timeNextButton" type="button">다음</button>
		</div>
		<div id="timeDeem"></div>
		<div id="timePopUp">
			<h1>채용절차법 준수 안심보장 시스템 안내</h1>
			<div id="popUpDiv1" style="padding: 24px 28px 28px; background-color: #f4f4f4">
				'채용절차법'에 따르면 구인자는 구직자에게 채용 서류 접수 사실을 알려야 합니다.<br>
				그 밖에도 '채용일정 및 심사 지연에 대한 고지', '지원 서류 반환 및 파기의 의무' 등<br>
				구인업체가 직접 개별적으로 처리하기에는 번거로운 준수사항이 많습니다.<br><br>
				이에 사람인에서는 인사담당자 여러분이 오직 채용에만 집중할 수 있도록,<br>
				채용절차법 준수사항을 자동 관리할 수 있는 시스템을 구축하게 되었습니다.
			</div>
			<div style="padding-top: 20px; padding-bottom: 20px;">
				<img src="./img/sri.png">
			</div>
			<br><br>
			<h4>2.한 눈에 보는 '채용절차의 공정화에 관한 법률'준수 가이드</h4>
			<p>
			시행일자<br>
			-상시 근로자 300명 이상 사업장, 공공기관, 국가 및 자치단체:'15년 1월 1일<br>
			-상시 근로자 100명 이상 300명 미만 사업장:'16년 1월 1일<br>
			-상시 근로자 30명 이상 100명 미만 사업장:'17년 1월 1일<br>
			</p>
			<div>
				<img src="./img/info1.png" style="margin:0; padding: 0;">
				<img src="./img/info2.png" style="margin:0; padding: 0;">
			</div>
			<br><br>
		</div>
	</div>
</form>
</body>
</html>