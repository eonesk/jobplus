<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학력입력폼</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	var studyLVPlusButtonCnt = 0;
	
	$(function() {
		$("#studyLVPlus").hide();
		
		$("#studyLVplusButton").click(function() {
			studyLVPlusButtonCnt++;
			var numbering = "_" + studyLVPlusButtonCnt;
			var clone = $("#studyLVPlus").clone().attr("id", "studyLVPlus" + numbering);
			
			if(studyLVPlusButtonCnt >= 4) {
				alert("항목추가는 최대 3개까지만 추가가능 합니다.")
				studyLVPlusButtonCnt--;
				return false;
			}			

			// id&name 넘버링 변경 작업
			clone.find("*[id]").each(function() {
				$(this).attr("id", $(this).attr("id") + numbering);
			});
			
			clone.find("*[name]").each(function() {
				$(this).attr("name", $(this).attr("name") + numbering);
			});
			
			clone.find("*[class]").each(function() {
				$(this).attr("class", $(this).attr("class") + numbering);
			});
			
			clone.insertAfter("#studyLVPlus");
			
			$("#studyLVPlus" + numbering).show();
			

			/** 이벤트 바인딩 */
			// 'X'표 눌렀을 때 닫기
			$("#studyLVPlusCancel" + numbering).on("click", function() {
				console.log("[eventBindingInit] #studyLVPlusCancel" + numbering + "(X표) : 닫기");
				$(this).parent("#studyLVPlus" + numbering).remove();
				$("#rss__Seq"+numbering).val("");
				studyLVPlusButtonCnt--;
			});
			
			$("#RSS_saveA" + numbering).on("click", function() {
				
				var is_check = $("#isHighSchoolCheck" + numbering).is(":checked");
				
				if(is_check){
					window.open("/job/job/resume/studyLV/studyLVSavePopUp.jsp?is_check="+is_check, "", "width=500px height=500px resizable=0");
				} else {
					
					if($("#rssTypeValue" + numbering).val() == "") {
						alert("학교구분을 설정해주세요.");
						$("#rssTypeValue" + numbering).focus();
					} else if($("#rssNameFirst" + numbering).val() == "") {
						alert("학교명을 입력해주세요.");
						$("#rssNameFirst" + numbering).focus();
					} else if(!$("#rssStartDateValue" + numbering).val()) {
						alert("입학년월을 입력해주세요.");
						$("#rssStartDateValue" + numbering).focus();
					} else if($("#rssEndDateValue" + numbering).val() == "") {
						alert("졸업년월을 입력해주세요.");
						$("#rssEndDateValue" + numbering).focus();
					} else {
						window.open("/job/job/resume/studyLV/studyLVSavePopUp.jsp?is_check="+is_check+"&numbering="+numbering, "", "width=500px height=500px");
					}				
				}
					
			});	// save Button을 눌렀을 때
			
			$("#isHighSchoolCheck" + numbering).on("change", function() {
				var is_check = $(this).is(":checked");
				if(is_check) {
					$("#isHighSchoolHide" + numbering).hide();
					
				} else {
					$("#isHighSchoolHide" + numbering).show();
					
				}
			});		// 고등학교미만 체크박스
		
			$(".hideAndShow" + numbering).hide();							// 하위 list 숨기기 */
			$(".rssTypeClass" + numbering).hide();							// 기본항목빼고 숨기기			
			
			/** 학력구분 */
			$("#rssTypeFirst" + numbering).on("click", function(){ 				// 학력구분을 누르면
				$("#rssTypeSecond" + numbering).slideToggle();				// 숨겨진 하위항목이 보이고(Toggle로 보였다가 안 보였다가..)
				
				$(".rssTypeList" + numbering).hover(function() {			// 하위 list에 hover효과 줌			
					$(this).css("border", "3px solid blue");	// 하위항목의  div에 border가 생기고					
				}, function() {
					$(this).css("border", "0px");				// blur되면 border 사라짐
				});
				
				$(".rssTypeList" + numbering).on("click", function(){			// 하위항목을 클릭하면
					var rssTypeValue;							// input태그에 넣어 줄 value
					
					switch($(this).val()) {						// 하위 List에서 눌려진 항목에 따라 value값이 정해짐
						case 0 : rssTypeValue = "고등학교"; 			// 보여지는 항목이 다름
								 $(".rssTypeClass" + numbering).hide();
								 $("#rssStartDateFirst" + numbering).show();
								 $("#rssEndDateFirst" + numbering).show();
								 $("#rssGraduateFirst" + numbering).show();
								 break;
						case 1 : rssTypeValue = "대학(2,3년)"; 
								 $(".rssTypeClass" + numbering).hide();
								 $("#rssStartDateFirst" + numbering).show();
								 $("#rssEndDateFirst" + numbering).show();
								 $("#rssGraduateFirst" + numbering).show();
								 $("#rssMajorFirst" + numbering).show();
								 $("#rssScoreFirst" + numbering).show();
								 $("#rssTotScoreFirst" + numbering).show();
								 break;
						case 2 : rssTypeValue = "대학교(4년)";  
								 $(".rssTypeClass" + numbering).hide();
								 $("#rssStartDateFirst" + numbering).show();
								 $("#rssEndDateFirst" + numbering).show();
								 $("#rssGraduateFirst" + numbering).show();
								 $("#rssMajorFirst" + numbering).show();
								 $("#rssScoreFirst" + numbering).show();
								 $("#rssTotScoreFirst" + numbering).show();
								 break;
						case 3 : rssTypeValue = "대학원";  
								 $(".rssTypeClass" + numbering).hide();
								 $("#rssStartDateFirst" + numbering).show();
								 $("#rssEndDateFirst" + numbering).show();
								 $("#rssGraduateFirst" + numbering).show();
								 $("#rssMajorFirst" + numbering).show();
								 $("#rssScoreFirst" + numbering).show();
								 $("#rssTotScoreFirst" + numbering).show();
								 break;
						default : break;
					}
						
					$("#rssTypeTitle" + numbering).html("");	// 학력구분칸이 reset된후
					$("#rssTypeTitle" + numbering).html(rssTypeValue + "&nbsp;&nbsp;&nbsp;").css("font-size", "13px");	// 학력구분칸에 하위항목의 값이 들어간다. 
					$("#rssTypeSecond" + numbering).slideUp();
					$("#rssTypeValue" + numbering).attr("value", rssTypeValue);	// input값에 저장
						/* alert("마짐ㄱ" + $("#rssTypeValue" + numbering).val()); */
				});		// 학교구분 list 눌렀을 때
				
				
			});		// 학력구분 눌렀을 때
			
			/** 총점 */
			$("#rssTotScoreFirst" + numbering).on("click", function() {
				$("#rssTotScoreSecond" + numbering).slideToggle();
				$(".rssTotScoreList" + numbering).hover(function() {
					$(this).css("border", "3px solid blue");
				}, function() {
					$(this).css("border", "0px");
				});
			});
			
			$(".rssTotScoreList" + numbering).on("click", function() {
				var rssTotScoreValue;
				
				switch($(this).val()){
					case 0: rssTotScoreValue = "4.5"; break;
					case 1: rssTotScoreValue = "4.3"; break;
					case 2: rssTotScoreValue = "4.0"; break;
					case 3: rssTotScoreValue = "100"; break;
					default: break;
				}
						
					/* alert(rssTotScoreValue);				 */	
						 
				$("#rssTotScoreTitle" + numbering).html("");
				$("#rssTotScoreTitle" + numbering).html(rssTotScoreValue + "&nbsp;&nbsp;&nbsp;").css("font-size", "16px");
				$("#rssTotScoreSecond" + numbering).slideUp();
				$("#rssTotScoreValue" + numbering).attr("value", rssTotScoreValue);
					/* alert(rssTotScoreValue); */
						
			});
			
			
		});	// +버튼 눌렀을 때
		
		/** 내 학력정보 불러오기 */
		$("#RSS_loadA").click(function() {
			window.open("/job/job/resume/studyLV/studyLVLoadPopUp.jsp?studyLVPlusButtonCnt="+studyLVPlusButtonCnt, "", "width=500px height=500px");
		});
		
	});	// function
	

	/** Load 함수 */
	function selected_rss(accumSeq, studyLVPlusButtonCnt_Delivered) {
		$(function() {
			console.log("[selected]----------부모창 시작----------");
			studyLVPlusButtonCnt = studyLVPlusButtonCnt_Delivered;
			console.log("[selected] accumSeq : " + accumSeq);
			console.log("[selected] studyLVPlusButtonCnt : " + studyLVPlusButtonCnt);
			$.ajax({
				type: 'POST',
				url: '/job/job/resume/studyLV/rssLoadView.do',
				dataType: 'json',
				data: {
					"accumSeq": accumSeq
				},
				success: function(data) {
					console.log("[selected] 부모창 ajax 성공");
					console.log("[selected] studyLVPlusButtonCnt : " + studyLVPlusButtonCnt);
					
					
					$.each(data.items, function(index, item) {
						var testDTO = item;
						
						studyLVPlusButtonCnt++;
						var numbering = "_" + studyLVPlusButtonCnt;
						var clone = $("#studyLVPlus").clone().attr("id", "studyLVPlus" + numbering);
						
						if(studyLVPlusButtonCnt >= 4) {
							alert("항목추가는 최대 3개까지만 추가가능 합니다.")
							studyLVPlusButtonCnt--;
							return false;
						}			

						// id&name 넘버링 변경 작업
						clone.find("*[id]").each(function() {
							$(this).attr("id", $(this).attr("id") + numbering);
						});
						
						clone.find("*[name]").each(function() {
							$(this).attr("name", $(this).attr("name") + numbering);
						});
						
						clone.find("*[class]").each(function() {
							$(this).attr("class", $(this).attr("class") + numbering);
						});
						
						clone.insertAfter("#studyLVPlus");
						
						$("#studyLVPlus" + numbering).show();
						

						/** 이벤트 바인딩 */
						// 'X'표 눌렀을 때 닫기
						$("#studyLVPlusCancel" + numbering).on("click", function() {
							console.log("[eventBindingInit] #studyLVPlusCancel" + numbering + "(X표) : 닫기");
							$(this).parent("#studyLVPlus" + numbering).remove();
							$("#rss__Seq"+numbering).val("");
							studyLVPlusButtonCnt--;
						});
						
						$("#RSS_saveA" + numbering).on("click", function() {
							
							var is_check = $("#isHighSchoolCheck" + numbering).is(":checked");
							
							if(is_check){
								window.open("/job/job/resume/studyLV/studyLVSavePopUp.jsp?is_check="+is_check, "", "width=500px height=500px resizable=0");
							} else {
								
								if($("#rssTypeValue" + numbering).val() == "") {
									alert("학교구분을 설정해주세요.");
									$("#rssTypeValue" + numbering).focus();
								} else if($("#rssNameFirst" + numbering).val() == "") {
									alert("학교명을 입력해주세요.");
									$("#rssNameFirst" + numbering).focus();
								} else if(!$("#rssStartDateValue" + numbering).val()) {
									alert("입학년월을 입력해주세요.");
									$("#rssStartDateValue" + numbering).focus();
								} else if($("#rssEndDateValue" + numbering).val() == "") {
									alert("졸업년월을 입력해주세요.");
									$("#rssEndDateValue" + numbering).focus();
								} else {
									window.open("/job/job/resume/studyLV/studyLVSavePopUp.jsp?is_check="+is_check+"&numbering="+numbering, "", "width=500px height=500px");
								}				
							}
								
						});	// save Button을 눌렀을 때
						
						$("#isHighSchoolCheck" + numbering).on("change", function() {
							var is_check = $(this).is(":checked");
							if(is_check) {
								$("#isHighSchoolHide" + numbering).hide();
								
							} else {
								$("#isHighSchoolHide" + numbering).show();
								
							}
						});		// 고등학교미만 체크박스
					
						$(".hideAndShow" + numbering).hide();							// 하위 list 숨기기 */
						$(".rssTypeClass" + numbering).hide();							// 기본항목빼고 숨기기			
						
						/** 학력구분 */
						$("#rssTypeFirst" + numbering).on("click", function(){ 				// 학력구분을 누르면
							$("#rssTypeSecond" + numbering).slideToggle();				// 숨겨진 하위항목이 보이고(Toggle로 보였다가 안 보였다가..)
							
							$(".rssTypeList" + numbering).hover(function() {			// 하위 list에 hover효과 줌			
								$(this).css("border", "3px solid blue");	// 하위항목의  div에 border가 생기고					
							}, function() {
								$(this).css("border", "0px");				// blur되면 border 사라짐
							});
							
							$(".rssTypeList" + numbering).on("click", function(){			// 하위항목을 클릭하면
								var rssTypeValue;							// input태그에 넣어 줄 value
								
								switch($(this).val()) {						// 하위 List에서 눌려진 항목에 따라 value값이 정해짐
									case 0 : rssTypeValue = "고등학교"; 			// 보여지는 항목이 다름
											 $(".rssTypeClass" + numbering).hide();
											 $("#rssStartDateFirst" + numbering).show();
											 $("#rssEndDateFirst" + numbering).show();
											 $("#rssGraduateFirst" + numbering).show();
											 break;
									case 1 : rssTypeValue = "대학(2,3년)"; 
											 $(".rssTypeClass" + numbering).hide();
											 $("#rssStartDateFirst" + numbering).show();
											 $("#rssEndDateFirst" + numbering).show();
											 $("#rssGraduateFirst" + numbering).show();
											 $("#rssMajorFirst" + numbering).show();
											 $("#rssScoreFirst" + numbering).show();
											 $("#rssTotScoreFirst" + numbering).show();
											 break;
									case 2 : rssTypeValue = "대학교(4년)";  
											 $(".rssTypeClass" + numbering).hide();
											 $("#rssStartDateFirst" + numbering).show();
											 $("#rssEndDateFirst" + numbering).show();
											 $("#rssGraduateFirst" + numbering).show();
											 $("#rssMajorFirst" + numbering).show();
											 $("#rssScoreFirst" + numbering).show();
											 $("#rssTotScoreFirst" + numbering).show();
											 break;
									case 3 : rssTypeValue = "대학원";  
											 $(".rssTypeClass" + numbering).hide();
											 $("#rssStartDateFirst" + numbering).show();
											 $("#rssEndDateFirst" + numbering).show();
											 $("#rssGraduateFirst" + numbering).show();
											 $("#rssMajorFirst" + numbering).show();
											 $("#rssScoreFirst" + numbering).show();
											 $("#rssTotScoreFirst" + numbering).show();
											 break;
									default : break;
								}
									
								$("#rssTypeTitle" + numbering).html("");	// 학력구분칸이 reset된후
								$("#rssTypeTitle" + numbering).html(rssTypeValue + "&nbsp;&nbsp;&nbsp;").css("font-size", "13px");	// 학력구분칸에 하위항목의 값이 들어간다. 
								$("#rssTypeSecond" + numbering).slideUp();
								$("#rssTypeValue" + numbering).attr("value", rssTypeValue);	// input값에 저장
									/* alert("마짐ㄱ" + $("#rssTypeValue" + numbering).val()); */
							});		// 학교구분 list 눌렀을 때
							
							
						});		// 학력구분 눌렀을 때
						
						/** 총점 */
						$("#rssTotScoreFirst" + numbering).on("click", function() {
							$("#rssTotScoreSecond" + numbering).slideToggle();
							$(".rssTotScoreList" + numbering).hover(function() {
								$(this).css("border", "3px solid blue");
							}, function() {
								$(this).css("border", "0px");
							});
						});
						
						$(".rssTotScoreList" + numbering).on("click", function() {
							var rssTotScoreValue;
							
							switch($(this).val()){
								case 0: rssTotScoreValue = "4.5"; break;
								case 1: rssTotScoreValue = "4.3"; break;
								case 2: rssTotScoreValue = "4.0"; break;
								case 3: rssTotScoreValue = "100"; break;
								default: break;
							}
									
								/* alert(rssTotScoreValue);				 */	
									 
							$("#rssTotScoreTitle" + numbering).html("");
							$("#rssTotScoreTitle" + numbering).html(rssTotScoreValue + "&nbsp;&nbsp;&nbsp;").css("font-size", "16px");
							$("#rssTotScoreSecond" + numbering).slideUp();
							$("#rssTotScoreValue" + numbering).attr("value", rssTotScoreValue);
								/* alert(rssTotScoreValue); */
									
						});
						
						
						if(testDTO.rss_Ishighschool == "Y"){
							$("#rss_Seq" + numbering).attr("value", testDTO.rss_Seq);
							$("#rss__Seq" + numbering).attr("value", testDTO.rss_Seq);
							$("#isHighSchoolCheck" + numbering).attr("checked", "true");
							$("#isHighSchoolHide" + numbering).hide();
						} else {
							switch(testDTO.rss_Type) {
								case "고등학교" : $("#rssStartDateFirst" + numbering).show();
								 			   $("#rssEndDateFirst" + numbering).show();
								 			   $("#rssGraduateFirst" + numbering).show(); 
											   break;
								case "대학(2,3년)" : $("#rssStartDateFirst" + numbering).show();
								 				   $("#rssEndDateFirst" + numbering).show();
												   $("#rssGraduateFirst" + numbering).show();
												   $("#rssMajorFirst" + numbering).show();
												   $("#rssScoreFirst" + numbering).show();
												   $("#rssTotScoreFirst" + numbering).show();
												   break;
								case "대학교(4년)" : $("#rssStartDateFirst" + numbering).show();
								   				   $("#rssEndDateFirst" + numbering).show();
												   $("#rssGraduateFirst" + numbering).show();
												   $("#rssMajorFirst" + numbering).show();
												   $("#rssScoreFirst" + numbering).show();
												   $("#rssTotScoreFirst" + numbering).show();
												   break;
								case "대학원" : $("#rssStartDateFirst" + numbering).show();
								   				   $("#rssEndDateFirst" + numbering).show();
												   $("#rssGraduateFirst" + numbering).show();
												   $("#rssMajorFirst" + numbering).show();
												   $("#rssScoreFirst" + numbering).show();
												   $("#rssTotScoreFirst" + numbering).show();
												   break;
							}
							
							/* alert("testDTO.rss_Startdate : " + testDTO.rss_Startdate); */
							$("#rss_Seq" + numbering).attr("value", testDTO.rss_Seq);
							$("#rss__Seq" + numbering).attr("value", testDTO.rss_Seq);
	 						$("#rssTypeTitle" + numbering).html("");
	 						$("#rssTypeTitle" + numbering).html(testDTO.rss_Type + "&nbsp;&nbsp;&nbsp;").css("font-size", "13px");
	 						$("#rssTypeValue" + numbering).attr("value", testDTO.rss_Type);	 						
	 						$("#rssNameFirst" + numbering).val(testDTO.rss_Name);
	 						$("#rssStartDateValue" + numbering).val(testDTO.rss_Startdate);
	 						$("#rssEndDateValue" + numbering).val(testDTO.rss_Enddate);
	 						$("#rssMajorFirst" + numbering).val(testDTO.rss_Major);
	 						$("#rssScoreFirst" + numbering).val(testDTO.rss_Score);
	 						$("#rssTotScoreTitle" + numbering).html("");
							$("#rssTotScoreTitle" + numbering).html(testDTO.rss_Totscore + "&nbsp;&nbsp;&nbsp;").css("font-size", "16px");
							$("#rssTotScoreValue" + numbering).attr("value", testDTO.rss_Totscore);
							
						}							
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
	@import url('./css/studyLVWriteForm.css');
</style>
</head>
<body>
<input id="rss__Seq_1" type="hidden">
<input id="rss__Seq_2" type="hidden">
<input id="rss__Seq_3" type="hidden">				
	<div id="studyLV_div" name="studyLV_div" class="studyLV_div"><!-- 전체틀 -->
	
		<!-- Content_Top -->
		<div id="Content_top" name="Content_top" class="Content_top">
		
			<!-- Title -->
			<h1 id="studyLV_Title" name="studyLV_Title" class="studyLV_Title" style="margin-left: 26px;">학력</h1>
			
			<!-- Load -->
			<div id="studyLV_Load">
				<input type="button" id="RSS_loadA" name="RSS_loadA" class="button button_widthFree" value="내 학력 불러오기" style="margin-left: 26px;">
			</div>
			<p id="studyLV_Guide" style="margin-left: 20px;">
				각 항목명은 변경할 수 있으며(최대 45자), 항목은 총 10개까지 작성 가능합니다.
			</p>
			
			<br>
			
			<!-- borderTop -->
			<div id="studyLVTopBorder">&nbsp;</div>
		
		</div>
		
		
		<!-- Content_Middle : plus -->
		<div id="Content_middle" name="Content_middle" class="Content_middle">
		
			<div id="studyLVPlus" name="studyLVPlus" class="studyLVPlus" style="border:1px solid lightgray; width: 954px; margin: 0px 25px 0px 21px; padding-top: 0px;">
			
				<!-- SEQ : hidden -->
				<input id="rss_Seq" name="rss_Seq" class="rss_Seq" type="hidden">
				
				<!-- 'X'버튼 -->			
				<!-- isHighScool -->
				<input id="isHighSchoolCheck" name="rss_Ishighschool" class="isHighSchoolCheck" type="checkbox"value="true" style="width: 20px; height: 20px; border: 2px solid gray; vertical-align: -6px;">고등학교 미만 졸업
				<input type="button" value="X" id="studyLVPlusCancel" name="studyLVPlusCancel" style="width: 35px; height:35px; margin-left: 801px;">
				
				<!-- 고등학교미만졸업일 때 숨겨지는 부분 -->
				<div id="isHighSchoolHide" name="isHighSchoolHide" class="isHighSchoolHide">
					
					<!-- 기본데이터 -->
					<div id="rssBasic" name="rssBasic" class="rssBasic">
					
						<!-- 학력구분데이터 -->
						<div style="float: left; z-index: 50px;">
							<a href="#">
								<div id="rssTypeFirst" style="float: left; background-color: white; margin-top: 8px; padding-left: 5px; padding-top: 15px; border: 1px solid lightgray; width: 130px; height: 37px;">
									<span id="rssTypeTitle" style="display: inline;">학교구분</span><span style="position: absolute; left: 540px;">&nbsp;&nbsp;&nbsp;&nbsp;&#9660;</span>
								<input id="rssTypeValue" name="rss_Type" type="hidden">
								</div>
							</a>						
							<!-- 학교명데이터 -->
							<div style="float: left;">
								<input id="rssNameFirst" name="rss_Name" class="rssNameFirst" type="text" placeholder="학교명" style="margin-top: 8px; margin-right: 10px; float: left; width: 250px; height: 50px; border: 1px solid lightgray;">
							</div><br><br><br>
							<!-- 학력구분하위 -->	
							<div id="rssTypeSecond" class="hideAndShow" style="position: absolute; clear: both; background-color:white; padding: 0px; border: 1px solid gray; width: 135px; z-index: 50px;">
								<ul class="sub" style="padding: 0px; list-style: none;">
									<li id="rssTypeList[1]" class="rssTypeList" value="0" style="padding: 5px 0px 5px 0px; height: 25%;">고등학교</li>
									<li id="rssTypeList[2]" class="rssTypeList" value="1" style="padding: 5px 0px 5px 0px; height: 25%;">대학(2,3년)</li>
									<li id="rssTypeList[3]" class="rssTypeList" value="2" style="padding: 5px 0px 5px 0px; height: 25%;">대학교(4년)</li>
									<li id="rssTypeList[4]" class="rssTypeList" value="3" style="padding: 5px 0px 5px 0px; height: 25%;">대학원</li>
								</ul>
							</div>
							<br style="clear: both;">
						</div>
						
						<div style="float: left;">	
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
						</div>
						
						<br style="clear: both;">						
						
						<!-- 전공명데이터 -->
						<input id="rssMajorFirst" class="rssTypeClass" name="rss_Major" 
								type="text" placeholder="전공명" style="margin-top: 10px; float: left; border: 1px solid lightgray; height: 48px; width: 387px;">
						
						<!-- 학점데이터 -->
						<input id="rssScoreFirst" class="rssTypeClass" name="rss_Score" 
								type="number" max="4.5" placeholder="학점" style="margin-top: 10px; margin-left: 12px; float: left; position: relative; left: 0px; top: 0px; border: 1px solid lightgray; height: 48px; width: 80px;">
						
						<!-- 총점데이터 -->
						<div style="float: left;">
							<div id="rssTotScoreFirst" class="rssTypeClass" name="rssTotScoreFirst" style="cursor: pointer; margin-top: 10px; float: left; background-color:white; padding-left: 5px; padding-top: 13px; border: 1px solid lightgray; display: inline-block; width: 80px; height: 37px;">
								<p id="rssTotScoreTitle" style="display: inline;">총점</p><span style="position: absolute; left: 535px;">&nbsp;&nbsp;&nbsp;&nbsp;&#9660;</span>
								<input id="rssTotScoreValue" name="rss_Totscore" type="hidden">
							</div><br><br><br>
							<div id="rssTotScoreSecond" class="hideAndShow" style="position: absolute; clear: both; background-color:white; border: 1px solid lightgray; height: 165px; width:85px; z-index: 50px;">
								<ul class="sub" style="padding: 0px; list-style: none;">
									<li id="rssTotScoreList[1]" class="rssTotScoreList" value="0" style="padding: 5px 0px 5px 0px; height: 33%;">4.5</li>
									<li id="rssTotScoreList[2]" class="rssTotScoreList" value="1" style="padding: 5px 0px 5px 0px; height: 33%;">4.3</li>
									<li id="rssTotScoreList[3]" class="rssTotScoreList" value="2" style="padding: 5px 0px 5px 0px; height: 33%;">4.0</li>
									<li id="rssTotScoreList[4]" class="rssTotScoreList" value="3" style="padding: 5px 0px 5px 0px; height: 33%;">100</li>
								</ul>
							</div>
						</div>						
					
						<br style="clear:both;"><br>
						
					</div>
					
				</div>
					<input type="button" class="button button_widthFree" id="RSS_saveA" value="학력관리에 저장" 
					style="width: auto; padding: 10px;">
			</div>

		</div>
		
		
		<!-- Content_Bottom : plusButton -->
		<div id="Content_bottom" name="Content_bottom" class="Content_bottom" align="center">
			
			<!-- borderBottom -->
			
			<!-- PlusButton -->
			<input type="button" value="추가하기" id="studyLVplusButton" name="studyLVplusButton" class="addButton_css" 
			style="
				width:955px;
	   			background-color: #5882FA;
			    border: none;
			    color:#fff;
			    padding: 10px 0;
			    text-align: center;
			    text-decoration: none;
			    display: inline-block;
			    font-size: 15px;
			    margin: auto auto;
			    cursor: pointer;
			">
		</div>
		
	</div><!-- 전체틀 -->


<!-- 
	<div id="studyLV_div"
		style="display: inline-block; position: relative; margin: 15px; width: 80%; background-color: #f5f7fb;">
		
		Title
		<h3 style="font-weight: bold;">학력</h3>
		
		Load
		<div style="background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block; float: left;">
			<a href="#" id="RSS_loadA">내 학력사항 불러오기</a>
		</div>
		<p style="clear: both; font-size: 12px; margin: 3px;">
		각 항목명은 변경할 수 있으며(최대 45자), 항목은 총 10개까지 작성 가능합니다. 고치거나 빼야함ㅎ</p>
		
		<br>
		
		input영역 1번째 줄
		<div style="padding: 10px; padding-bottom: 20px; border: 1px solid rgba(86, 111, 237, 0.3); height: auto;">
			<div id="studyLVPlus" class="studyLVPlus" style="border-bottom: 1px solid rgba(86, 111, 237, 0.3); margin: 0px;">
			
				SEQ : hidden
				<input id="rss_Seq" name="rss_Seq" class="rss_Seq" type="hidden">
				
				'X'버튼
				<a id="studyLVPlusCancel" name="studyLVPlusCancel" href="#" style="text-decoration: none;">
					<div id="studyLVCloseButton" style="border: 1px solid rgba(86, 111, 237, 0.3); border-top:0px; border-right: 0px; background-color:white; margin: 0px; position: relative; left: 875px; width:30px; height: 30px;">X</div>
				</a>
				
				isHighScool
				<div style="padding-top: 10px;">
					<input id="isHighSchoolCheck" name="rss_Ishighschool" 
							type="checkbox" style="float: left; padding-top: 50px;" value="true">고등학교 미만 졸업
				</div>
				
				고등학교미만졸업일 때 숨겨지는 부분
				<div id="isHighSchoolHide">
					
					기본데이터
					<div id="rssBasic" name="rssBasic" class="rssBasic">
						학력구분데이터
						<span id="rssTypeFirst" style="margin-top: 8px; float: left; background-color:white; padding-left: 5px; padding-top: 13px; border: 1px solid lightgray; display: inline-block; width: 105px; height: 37px;">
							<p id="rssTypeTitle" style="display: inline;">학교구분</p><span style="text-align: right;">&nbsp;&nbsp;&nbsp;&nbsp;&#9660;</span>
							<input id="rssTypeValue" name="rss_Type" type="hidden">
						</span>
						
						학교명데이터
						<input id="rssNameFirst"; name="rss_Name" 
								type="text" placeholder="학교명" style="margin-top: 8px; margin-right: 10px; float: left; width: 250px; height: 48px; border: 1px solid lightgray;">
						
						학력구분하위		
						<span id="rssTypeSecond" class="hideAndShow" style="position: absolute; left: 34px; top: 280px; display: inline-block; background-color:white; padding: 0px; border: 1px solid gray; width: 110px; z-index: 50px;">
						<ul class="sub" style="padding: 0px; list-style: none;">
							<li id="rssTypeList[1]" class="rssTypeList" value="0" style="padding: 5px 0px 5px 0px; height: 25%;">고등학교</li>
							<li id="rssTypeList[2]" class="rssTypeList" value="1" style="padding: 5px 0px 5px 0px; height: 25%;">대학(2,3년)</li>
							<li id="rssTypeList[3]" class="rssTypeList" value="2" style="padding: 5px 0px 5px 0px; height: 25%;">대학교(4년)</li>
							<li id="rssTypeList[4]" class="rssTypeList" value="3" style="padding: 5px 0px 5px 0px; height: 25%;">대학원</li>
						</ul>
						</span>
					</div>
				-------------------------------------------------------- 여기까지 기본항목 ----------------------------------------------------------------------	
				
					학위데이터
					<span id="rssDegreeFirst" class="rssTypeClass" style="margin-top: 8px; float: left; background-color:white; padding-left: 5px; padding-top: 13px; border: 1px solid lightgray; display: inline-block; width: 80px; height: 37px;">
						학위&nbsp;&nbsp;&nbsp;<span>ㅎ</span>
					</span>
				
					입학일데이터 
					<fieldset id="rssStartDateFirst" class="rssTypeClass" name="rss_Startdate" 
								style="margin-right: 0px; float: left; border: 1px solid lightgray; background-color: white; height: 42px; width: 142px;">
						<legend style="font-size: 12px;">&nbsp;&nbsp;입학년도</legend>
						<input id="rssStartDateValue" name="rssStartDateValue" type="month" style="text-align:center; float: left; background-color:white; border: 0px solid lightgray; display: inline-block; width: 135px; height: 21px;">
					</fieldset>
					
					졸업일데이터
					<fieldset id="rssEndDateFirst" class="rssTypeClass" name="rss_Enddate" 
								style="margin-left: 0px; margin-right: 0px; float: left; border: 1px solid lightgray; background-color: white; height: 42px;">
						<legend style="font-size: 12px;">&nbsp;&nbsp;졸업년도</legend>
						<input id="rssEndDateValue" name="rssEndDateValue" type="month" style="text-align:center; float: left; background-color:white; border: 0px solid lightgray; display: inline-block; width: 135px; height: 21px;">
					</fieldset>
 					
					졸업상태데이터
					<span id="rssGraduateFirst" class="rssTypeClass" style="margin-left: 0px; margin-top: 8px; float: left; background-color:white; padding-left: 5px; padding-top: 13px; border: 1px solid lightgray; display: inline-block; width: 105px; height: 37px;">
						졸업상태&nbsp;&nbsp;&nbsp;<span>ㅎ</span>
					</span>
					
					<br style="clear:both;">
					
					input영역 두번째 줄
					
					전공명데이터
					<input id="rssMajorFirst" class="rssTypeClass" name="rss_Major" 
							type="text" placeholder="전공명" style="margin-top: 10px; float: left; position: relative; left: 0px; top: 0px; border: 1px solid lightgray; height: 48px; width: 362px;">
					
					학점데이터
					<input id="rssScoreFirst" class="rssTypeClass" name="rss_Score" 
							type="number" max="4.5" placeholder="학점" style="margin-top: 10px; margin-left: 12px; float: left; position: relative; left: 0px; top: 0px; border: 1px solid lightgray; height: 48px; width: 80px;">
					
					총점데이터
					<span id="rssTotScoreFirst" class="rssTypeClass" name="rssTotScoreFirst" style="margin-top: 10px; float: left; background-color:white; padding-left: 5px; padding-top: 13px; border: 1px solid lightgray; display: inline-block; width: 80px; height: 37px;">
						<p id="rssTotScoreTitle" style="display: inline;">총점</p><span style="text-align: right;">ㅎ</span>
						<input id="rssTotScoreValue" name="rss_Totscore" type="hidden">
					</span>
					
					
					
					
					
					
					두번째줄 : z-index: 50px; : hide&show돼야할부분
					
				
					<span id="rssNameSecond" class="hideAndShow" style="position: absolute; left: 146px; top: 235px; display: inline-block; background-color:white; border: 1px solid lightgray; height: 164px; width:250px; z-index: 60px;">
						학교검색..? 일단 폼은 만들어 놓고 기능추가../....ㅇ..ㅇ...ㅇ아아아ㅏ// 학위도 추가되는건데 이건 시간남으면 해야지.. 일단 숨겨놓고..
					</span>
					
					
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
					
					<span id="rssTotScoreSecond" class="hideAndShow" style="position: absolute; left: 492px; top: 350px; display: inline-block; background-color:white; border: 1px solid lightgray; height: 165px; width:85px; z-index: 60px;">
						<ul class="sub" style="padding: 0px; list-style: none;">
							<li id="rssTotScoreList[1]" class="rssTotScoreList" value="0" style="padding: 5px 0px 5px 0px; height: 33%;">4.5</li>
							<li id="rssTotScoreList[2]" class="rssTotScoreList" value="1" style="padding: 5px 0px 5px 0px; height: 33%;">4.3</li>
							<li id="rssTotScoreList[3]" class="rssTotScoreList" value="2" style="padding: 5px 0px 5px 0px; height: 33%;">4.0</li>
							<li id="rssTotScoreList[4]" class="rssTotScoreList" value="3" style="padding: 5px 0px 5px 0px; height: 33%;">100</li>
						</ul>
					</span>
				<br style="clear:both;">
				
				<div style="background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block; float: left;">
					<a href="#" id="RSS_saveA">학력관리에 저장</a>
				</div>
				<br><br>
				</div>
				
			</div>
		</div>
		<a id="plusButton" href="#" style="text-decoration: none;">
			<div id="plusButtonDiv" style="text-align:center; background-color: white; padding: 10px; padding-bottom: 20px; border: 1px solid rgba(86, 111, 237, 0.3); width: 95%; height: auto;">
							+ 학력 추가
			</div>
		</a>
	</div>
 -->	
</body>
</html>