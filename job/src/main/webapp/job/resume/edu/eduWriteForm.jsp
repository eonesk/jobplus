<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육이수작성폼</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	var eduPlusButtonCnt = 0;
	
	$(function() {	
		
		$("#eduPlus").hide();
		
		$("#eduplusButton").click(function() {
			eduPlusButtonCnt++;
			var numbering = "_" + eduPlusButtonCnt;
			var clone = $("#eduPlus").clone().attr("id", "eduPlus" + numbering);
			
			if(eduPlusButtonCnt >=4){
				console.log("항목추가는 최대 3개까지만 추가가능 합니다.")
				eduPlusButtonCnt--;
				return false;
			}
			
			// id&name 넘버링 변경 작업
			clone.find("*[id]").each(function() {
				$(this).attr("id", $(this).attr("id") + numbering);
			});
			
			clone.find("*[name]").each(function() {
				$(this).attr("name", $(this).attr("name") + numbering);
			});
			
			clone.insertAfter("#eduPlus");
			
			$("#eduPlus" + numbering).show();
			
			/** 이벤트 바인딩 */
			// 'X'표 눌렀을 때 닫기
			$("#eduPlusCancel" + numbering).on("click", function() {
				console.log("[eventBindingInit] #eduPlusCancel" + numbering + "(X표) : 닫기");
				$(this).parent("#eduPlus" + numbering).remove();
				eduPlusButtonCnt--;
			});
			
			// 저장버튼 눌렀을 때
			$("#RSE_saveA" + numbering).on("click", function() {
				if(!$("#rse_Name" + numbering).val()) {
					alert("교육명을 입력해주세요.");
					$("#rse_Name" + numbering).focus();
				} else if(!$("#rse_Company" + numbering).val()){
					alert("교육기관을 입력해주세요.");
					$("#rse_Company" + numbering).focus();
				} else if(!$("#rse_Startdate" + numbering).val()){
					alert("시작년월을 입력해주세요.");
					$("#rse_Startdate" + numbering).focus();
				} else if(!$("#rse_Enddate" + numbering).val()){
					alert("종료년월을 입력해주세요.");
					$("#rse_Enddate" + numbering).focus();
				} else {
					console.log("[saveButtonInit] numbering : " + numbering);
					window.open("/job/job/resume/edu/eduSavePopUp.jsp?numbering=" + numbering, "", "width=500px height=500px");
				}
			});
			
		});			
		
		/** 내 교육이수사항 불러오기 */
		$("#RSE_loadA").click(function() {
			console.log("[load] eduPlusButtonCnt : " + eduPlusButtonCnt);
			window.open("/job/job/resume/edu/eduLoadPopUp.jsp?eduPlusButtonCnt=" + eduPlusButtonCnt, "", "width=500px height=500px");
		});
	});
	
	/** Load 함수 */
	function selected(accumSeq, eduPlusButtonCnt_Delivered) {
		$(function() {
			console.log("[selected]----------부모창 시작----------");
			eduPlusButtonCnt = eduPlusButtonCnt_Delivered;
			console.log("[selected] accumSeq : " + accumSeq);
			console.log("[selected] eduPlusButtonCnt : " + eduPlusButtonCnt);
			$.ajax({
				type: 'POST',
				url: '/job/resume/edu/rseLoadView.do',
				dataType: 'json',
				data: {
					"accumSeq": accumSeq
				},
				success: function(data) {
					console.log("[selected] 부모창 ajax 성공");
					console.log("[selected] eduPlusButtonCnt : " + eduPlusButtonCnt);
					
					
					$.each(data.items, function(index, item) {
						var testDTO = item;
						
						eduPlusButtonCnt++;
						
						var numbering = "_" + eduPlusButtonCnt;
						var clone = $("#eduPlus").clone().attr("id", "eduPlus" + numbering);
						
						// id&name 넘버링 변경 작업
						clone.find("*[id]").each(function() {
							$(this).attr("id", $(this).attr("id") + numbering);
						});
						
						clone.find("*[name]").each(function() {
							$(this).attr("name", $(this).attr("name") + numbering);
						});
						
						clone.insertAfter("#eduPlus");
						
						$("#eduPlus" + numbering).show();
						
						/** 이벤트 바인딩 */
						// 'X'표 눌렀을 때 닫기
						$("#eduPlusCancel" + numbering).on("click", function() {
							console.log("[eventBindingSelected] #eduPlusCancel" + numbering + "(X표) : 닫기");
							$(this).parent("#eduPlus" + numbering).remove();
							eduPlusButtonCnt--;
						});
						
						// 저장버튼 눌렀을 때
						$("#RSE_saveA" + numbering).on("click", function() {
							if(!$("#rse_Name" + numbering).val()) {
								alert("교육명을 입력해주세요.");
								$("#rse_Name" + numbering).focus();
							} else if(!$("#rse_Company" + numbering).val()){
								alert("교육기관을 입력해주세요.");
								$("#rse_Company" + numbering).focus();
							} else if(!$("#rse_Startdate" + numbering).val()){
								alert("시작년월을 입력해주세요.");
								$("#rse_Startdate" + numbering).focus();
							} else if(!$("#rse_Enddate" + numbering).val()){
								alert("종료년월을 입력해주세요.");
								$("#rse_Enddate" + numbering).focus();
							} else {
								console.log("[saveButtonSelected] numbering : " + numbering);
								window.open("/job/job/resume/edu/eduSavePopUp.jsp?numbering="+numbering, "", "width=500px height=500px");
							}
						});
						
						console.log("[selected] rse_UserTitle : " + testDTO.rse_UserTitle);
						$("#rse_Seq" + numbering).val(testDTO.rse_Seq);
						$("#rse_Name" + numbering).val(testDTO.rse_Name);
						$("#rse_Company" + numbering).val(testDTO.rse_Company);
						$("#rse_Startdate" + numbering).val(testDTO.rse_Startdate);
						$("#rse_Enddate" + numbering).val(testDTO.rse_Enddate);
						$("#rse_Content" + numbering).val(testDTO.rse_Content);
							
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
	<div id="edu_div"
		style="display: inline-block; margin: 15px; width: 80%; background-color: #f5f7fb;">
		
		<!-- Title -->
		<h3 style="font-weight: bold;">교육</h3>
		
		<!-- Load -->
		<div style="background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block; float: left;">
			<a href="#" id="RSE_loadA">내 교육이수사항 불러오기</a>
		</div>
		<p style="clear: both; font-size: 12px; margin: 3px;">
		각 항목명은 변경할 수 있으며(최대 45자), 항목은 총 10개까지 작성 가능합니다. 고치거나 빼야함ㅎ</p>
		
<!-- ---------------------------------------------------추가 DIV -------------------------------------------------------------------------- -->		
		
		
		
		
		<!-- input영역 1번째 줄 -->
		
		
		<div id="eduPlusField" style="background-color: white; padding: 0px; padding-bottom: 20px; border-bottom: 0px; border: 1px solid rgba(86, 111, 237, 0.3); width: 90%; height: auto;">
			<div id="eduPlus" class="eduPlus" style="border-bottom: 1px solid rgba(86, 111, 237, 0.3); margin: 0px;">
				<input id="rse_Seq" name="rse_Seq" class="rse_Seq" type="hidden">
				<a id="eduPlusCancel" name="eduPlusCancel" href="#" style="text-decoration: none;">
					<div id="eduCloseButton" style="border: 1px solid rgba(86, 111, 237, 0.3); border-top:0px; border-right: 0px; background-color:white; margin: 0px; position: relative; left: 875px; width:30px; height: 30px;">X</div>
				</a>
							
				<!-- 교육명 -->
				<input id="rse_Name"; name="rse_Name"
						type="text" placeholder="교육명" style="margin-left: 10px; margin-top: 8px; margin-right: 10px; float: left; width: 250px; height: 48px; border: 1px solid lightgray;">
				
				<!-- 교육기관 -->		
				<input id="rse_Company"; name="rse_Company" 
						type="text" placeholder="교육기관" style="margin-top: 8px; margin-right: 10px; float: left; width: 250px; height: 48px; border: 1px solid lightgray;">
				
				<!-- 시작일데이터  -->
				<fieldset style="margin-right: 0px; float: left; border: 1px solid lightgray; background-color: white; height: 42px; width: 142px;">
					<legend style="font-size: 12px;">&nbsp;&nbsp;시작년월</legend>
					<input id="rse_Startdate" name="rse_Startdate" type="date" 
							style="text-align:center; float: left; background-color:white; border: 0px solid lightgray; display: inline-block; width: 135px; height: 21px;">
				</fieldset>
				
				<!-- 종료일데이터 -->
				<fieldset style="margin-left: 0px; margin-right: 0px; float: left; border: 1px solid lightgray; background-color: white; height: 42px;">
					<legend style="font-size: 12px;">&nbsp;&nbsp;종료년월</legend>
					<input id="rse_Enddate" name="rse_Enddate" type="date" 
							style="text-align:center; float: left; background-color:white; border: 0px solid lightgray; display: inline-block; width: 135px; height: 21px;">
				</fieldset>
				<br style="clear:both;"><br>
				
				<!-- input영역 두번째 줄 -->
				
				<!-- 교육과정 -->
				<div style="margin-left: 10px;width: 855px; border: 1px solid rgba(86, 111, 237, 0.3); background-color: white;">
					<a href="#" style="text-decoration: none;">내용</a><br>
					<textarea id="rse_Content" class="rse_Content" name="rse_Content" rows="3" cols="119" placeholder="이수하신 교육과정에 대해 적어주세요."
								style="resize: none; border: 0px;"></textarea>
				</div>
				<br style="clear:both;">
				
				<div style="float: right; background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block;">
					<a id="RSE_saveA" class="RSE_saveA" name="RSE_saveA" href="#">교육이수관리에 저장</a>
				</div>
				<br><br>
			</div>
<!-- ------------------------------------------------------Footer----------------------------------------------------------------------- -->
		</div>
		<a id="eduplusButton" href="#" style="text-decoration: none;">
			<div id="eduplusButtonDiv" style="text-align:center; background-color: white; padding: 10px; padding-bottom: 20px; border: 1px solid rgba(86, 111, 237, 0.3); width: 95%; height: auto;">
							+ 교육 추가
			</div>
		</a>
	</div>
</body>
</html>


