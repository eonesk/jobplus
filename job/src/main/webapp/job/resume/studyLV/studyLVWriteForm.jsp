<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학력입력폼</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("#RSS_saveA").click(function() {
			alert("진입");
			
			var is_check = $("#isHighSchoolCheck").is(":checked");
			
			if(is_check){
				alert(is_check);
				window.open("./studyLVSavePopUp.jsp?is_check="+is_check, "", "width=500px height=500px resizable=0");
			} else {
				alert(is_check);
				alert($("#rssStartDateValue").val());
				alert($("#rssTypeValue").val());
				
				if($("#rssTypeValue").val() == "") {
					alert("학교구분을 설정해주세요.");
				} else if($("#rssNameFirst").val() == "") {
					alert("학교명을 입력해주세요.");
				} else if(!$("#rssStartDateValue").val()) {
					alert("입학년월을 입력해주세요.");
				} else if($("#rssEndDateValue").val() == "") {
					alert("졸업년월을 입력해주세요.");
				} else {
					window.open("./studyLVSavePopUp.jsp?is_check="+is_check, "", "width=500px height=500px");
				}				
			}
				
		});
		
		$("#RSS_loadA").click(function() {
			window.open("./studyLVLoadPopUp.jsp", "", "width=500px height=500px");
		});
		
		$("#isHighSchoolCheck").change(function() {			// 고등학교 미만 졸업에 따른 화면 변화
			var is_check = $(this).is(":checked");
			if(is_check) {
				$("#isHighSchoolHide").hide();
				alert(is_check);
			} else {
				$("#isHighSchoolHide").show();
				alert(is_check);
			}
		});
		
		$(".hideAndShow").hide();							// 하위 list 숨기기
		$(".rssTypeClass").hide();							// 기본항목빼고 숨기기
		
		/** 학력구분 */
		$("#rssTypeFirst").click(function() { 				// 학력구분을 누르면
			$("#rssTypeSecond").slideToggle();				// 숨겨진 하위항목이 보이고(Toggle로 보였다가 안 보였다가..)
			$(".rssTypeList").hover(function() {			// 하위 list에 hover효과 줌
				$(this).css("border", "3px solid blue");	// 하위항목의  div에 border가 생기고					
			}, function() {
				$(this).css("border", "0px");				// blur되면 border 사라짐
			});
			$(".rssTypeList").click(function() {			// 하위항목을 클릭하면
				
				var rssTypeValue;							// input태그에 넣어 줄 value
				
				switch($(this).val()) {						// 하위 List에서 눌려진 항목에 따라 value값이 정해짐
				case 0 : rssTypeValue = "고등학교"; 			// 보여지는 항목이 다름
						 $(".rssTypeClass").hide();
						 $("#rssStartDateFirst").show();
						 $("#rssEndDateFirst").show();
						 $("#rssGraduateFirst").show();
						 break;
				case 1 : rssTypeValue = "대학(2,3년)"; 
						 $(".rssTypeClass").hide();
						 $("#rssStartDateFirst").show();
						 $("#rssEndDateFirst").show();
						 $("#rssGraduateFirst").show();
						 $("#rssMajorFirst").show();
						 $("#rssScoreFirst").show();
						 $("#rssTotScoreFirst").show();
						 break;
				case 2 : rssTypeValue = "대학교(4년)";  
						 $(".rssTypeClass").hide();
						 $("#rssStartDateFirst").show();
						 $("#rssEndDateFirst").show();
						 $("#rssGraduateFirst").show();
						 $("#rssMajorFirst").show();
						 $("#rssScoreFirst").show();
						 $("#rssTotScoreFirst").show();
						 break;
				case 3 : rssTypeValue = "대학원";  
						 $(".rssTypeClass").hide();
						 $("#rssStartDateFirst").show();
						 $("#rssEndDateFirst").show();
						 $("#rssGraduateFirst").show();
						 $("#rssMajorFirst").show();
						 $("#rssScoreFirst").show();
						 $("#rssTotScoreFirst").show();
						 break;
				default : break;
				}
				
				$("#rssTypeTitle").html("");	// 학력구분칸이 reset된후
				$("#rssTypeTitle").html(rssTypeValue + "&nbsp;&nbsp;&nbsp;").css("font-size", "13px");	// 학력구분칸에 하위항목의 값이 들어간다. 
				$("#rssTypeSecond").slideUp();
				$("#rssTypeValue").attr("value", rssTypeValue);	// input값에 저장
				/* alert($("#rssTypeValue").val()); */
			});
			
			
			/** 총점 */
			$("#rssTotScoreFirst").click(function() {
				$("#rssTotScoreSecond").slideToggle();
				$(".rssTotScoreList").hover(function() {
					$(this).css("border", "3px solid blue");
				}, function() {
					$(this).css("border", "0px");
				});
				
				$(".rssTotScoreList").click(function() {
					var rssTotScoreValue;

					switch($(this).val()){
						case 0: rssTotScoreValue = "4.5"; break;
						case 1: rssTotScoreValue = "4.3"; break;
						case 2: rssTotScoreValue = "4.0"; break;
						case 3: rssTotScoreValue = "100"; break;
					default: break;
					}
					
					/* alert(rssTotScoreValue);				 */	
					 
					$("#rssTotScoreTitle").html("");
					$("#rssTotScoreTitle").html(rssTotScoreValue + "&nbsp;&nbsp;&nbsp;").css("font-size", "16px");
					$("#rssTotScoreSecond").slideUp();
					$("#rssTotScoreValue").attr("value", rssTotScoreValue);
					/* alert(rssTotScoreValue); */
					
				});				
				
			});
			
		});
		/*  */
	});
</script>
</head>
<body>
	<div id="studyLV_div"
		style="display: inline-block; margin: 15px; width: 80%; background-color: #f5f7fb;">
		
		<!-- Title -->
		<h3 style="font-weight: bold;">학력</h3>
		
		<!-- Save / Load / isHighScool -->
		<div style="background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block; float: left;">
			<a href="#" id="RSS_loadA">내 학력사항 불러오기</a>
		</div>
		<div style="background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block; float: left;">
			<a href="#" id="RSS_saveA">학력관리에 저장</a>
		</div>
		<div style="padding-top: 10px;">
			<input id="isHighSchoolCheck" name="rss_Ishighschool" 
					type="checkbox" style="float: left; padding-top: 50px;" value="true">고등학교 미만 졸업
		</div>
		<p style="clear: both; font-size: 12px; margin: 3px;">
		각 항목명은 변경할 수 있으며(최대 45자), 항목은 총 10개까지 작성 가능합니다. 고치거나 빼야함ㅎ</p>
		
		<br>
		
		<!-- input영역 1번째 줄 -->
		<div style="padding: 10px; padding-bottom: 20px; border: 1px solid rgba(86, 111, 237, 0.3); height: auto;">
		<div id="isHighSchoolHide">
		
			<!-- 학력구분데이터 -->
			<span id="rssTypeFirst" style="margin-top: 8px; float: left; background-color:white; padding-left: 5px; padding-top: 13px; border: 1px solid lightgray; display: inline-block; width: 105px; height: 37px;">
				<p id="rssTypeTitle" style="display: inline;">학교구분</p><span style="text-align: right;">ㅎ</span>
				<input id="rssTypeValue" name="rss_Type" type="hidden">
			</span>
			
			<!-- 학교명데이터 -->
			<input id="rssNameFirst"; name="rss_Name" 
					type="text" placeholder="학교명" style="margin-top: 8px; margin-right: 10px; float: left; width: 250px; height: 48px; border: 1px solid lightgray;">
			
		<!---------------------------------------------------------- 여기까지 기본항목 ------------------------------------------------------------------------>	
		<!-- 
			학위데이터
			<span id="rssDegreeFirst" class="rssTypeClass" style="margin-top: 8px; float: left; background-color:white; padding-left: 5px; padding-top: 13px; border: 1px solid lightgray; display: inline-block; width: 80px; height: 37px;">
				학위&nbsp;&nbsp;&nbsp;<span>ㅎ</span>
			</span>
		-->
			<!-- 입학일데이터  -->
			<fieldset id="rssStartDateFirst" class="rssTypeClass" name="rss_Startdate" 
						style="margin-right: 0px; float: left; border: 1px solid lightgray; background-color: white; height: 42px; width: 142px;">
				<legend style="font-size: 12px;">&nbsp;&nbsp;입학년도</legend>
				<input id="rssStartDateValue" name="rssStartDateValue" type="month" style="text-align:center; float: left; background-color:white; border: 0px solid lightgray; display: inline-block; width: 135px; height: 21px;">
			</fieldset>
			
			<!-- 졸업일데이터 -->
			<fieldset id="rssEndDateFirst" class="rssTypeClass" name="rss_Enddate" 
						style="margin-left: 0px; margin-right: 0px; float: left; border: 1px solid lightgray; background-color: white; height: 42px;">
				<legend style="font-size: 12px;">&nbsp;&nbsp;졸업년도</legend>
				<input id="rssEndDateValue" name="rssEndDateValue" type="month" style="text-align:center; float: left; background-color:white; border: 0px solid lightgray; display: inline-block; width: 135px; height: 21px;">
			</fieldset>
		<!-- 	
			졸업상태데이터
			<span id="rssGraduateFirst" class="rssTypeClass" style="margin-left: 0px; margin-top: 8px; float: left; background-color:white; padding-left: 5px; padding-top: 13px; border: 1px solid lightgray; display: inline-block; width: 105px; height: 37px;">
				졸업상태&nbsp;&nbsp;&nbsp;<span>ㅎ</span>
			</span>
		 -->	
			<br style="clear:both;">
			
			<!-- input영역 두번째 줄 -->
			
			<!-- 전공명데이터 -->
			<input id="rssMajorFirst" class="rssTypeClass" name="rss_Major" 
					type="text" placeholder="전공명" style="margin-top: 10px; float: left; position: relative; left: 0px; top: 0px; border: 1px solid lightgray; height: 48px; width: 362px;">
			
			<!-- 학점데이터 -->
			<input id="rssScoreFirst" class="rssTypeClass" name="rss_Score" 
					type="number" max="4.5" placeholder="학점" style="margin-top: 10px; margin-left: 12px; float: left; position: relative; left: 0px; top: 0px; border: 1px solid lightgray; height: 48px; width: 80px;">
			
			<!-- 총점데이터 -->
			<span id="rssTotScoreFirst" class="rssTypeClass" name="rssTotScoreFirst" style="margin-top: 10px; float: left; background-color:white; padding-left: 5px; padding-top: 13px; border: 1px solid lightgray; display: inline-block; width: 80px; height: 37px;">
				<p id="rssTotScoreTitle" style="display: inline;">총점</p><span style="text-align: right;">ㅎ</span>
				<input id="rssTotScoreValue" name="rss_Totscore" type="hidden">
			</span>
			
			
			
			
			
			
			<!-- 두번째줄 : z-index: 50px; : hide&show돼야할부분 -->
			<span id="rssTypeSecond" class="hideAndShow" style="position: absolute; left: 34px; top: 235px; display: inline-block; background-color:white; padding: 0px; border: 1px solid gray; width: 110px; z-index: 50px;">
				<ul class="sub" style="padding: 0px; list-style: none;">
					<li class="rssTypeList" value="0" style="padding: 5px 0px 5px 0px; height: 25%;">고등학교</li>
					<li class="rssTypeList" value="1" style="padding: 5px 0px 5px 0px; height: 25%;">대학(2,3년)</li>
					<li class="rssTypeList" value="2" style="padding: 5px 0px 5px 0px; height: 25%;">대학교(4년)</li>
					<li class="rssTypeList" value="3" style="padding: 5px 0px 5px 0px; height: 25%;">대학원</li>
				</ul>
			</span>
			<span class="hideAndShow" style="position: absolute; left: 146px; top: 235px; display: inline-block; background-color:white; border: 1px solid lightgray; height: 164px; width:250px; z-index: 60px;">
				학교검색..? 일단 폼은 만들어 놓고 기능추가../....ㅇ..ㅇ...ㅇ아아아ㅏ// 학위도 추가되는건데 이건 시간남으면 해야지.. 일단 숨겨놓고..
			</span>
<!-- 			
			<span class="hideAndShow" style="position: absolute; left: 398px; top: 235px; display: inline-block; background-color:white; border: 1px solid lightgray; height: 140px; width:85px; z-index: 60px;">
				<ul class="sub" style="padding: 0px; list-style: none;">
					<li style="padding: 5px 0px 5px 0px; border: 1px solid gray; height: 33%;">석사</li>
					<li style="padding: 5px 0px 5px 0px; border: 1px solid gray; height: 33%;">박사</li>
					<li style="padding: 5px 0px 5px 0px;border: 1px solid gray; height: 33%;">석박사</li>
				</ul>
			</span>
			<span class="hideAndShow" style="position: absolute; left: 490px; top: 235px; margin-left: 334px; display: inline-block; background-color:white; padding: 0px; border: 1px solid gray; width: 110px; z-index: 50px;">
				<ul class="sub" style="padding: 0px; list-style: none;">
					<li style="padding: 5px 0px 5px 0px; border: 1px solid gray; height: 25%;">졸업</li>
					<li style="padding: 5px 0px 5px 0px; border: 1px solid gray; height: 25%;">수료</li>
					<li style="padding: 5px 0px 5px 0px;border: 1px solid gray; height: 25%;">졸업예정</li>
					<li style="padding: 5px 0px 5px 0px;border: 1px solid gray; height: 25%;">휴학</li>
					<li style="padding: 5px 0px 5px 0px;border: 1px solid gray; height: 25%;">중퇴</li>
				</ul>
			</span>
 -->			
			<span id="rssTotScoreSecond" class="hideAndShow" style="position: absolute; left: 492px; top: 296px; display: inline-block; background-color:white; border: 1px solid lightgray; height: 165px; width:85px; z-index: 60px;">
				<ul class="sub" style="padding: 0px; list-style: none;">
					<li class="rssTotScoreList" value="0" style="padding: 5px 0px 5px 0px; height: 33%;">4.5</li>
					<li class="rssTotScoreList" value="1" style="padding: 5px 0px 5px 0px; height: 33%;">4.3</li>
					<li class="rssTotScoreList" value="2" style="padding: 5px 0px 5px 0px; height: 33%;">4.0</li>
					<li class="rssTotScoreList" value="3" style="padding: 5px 0px 5px 0px; height: 33%;">100</li>
				</ul>
			</span>
		<br style="clear:both;">
		</div>
		</div>
	</div>
</body>
</html>