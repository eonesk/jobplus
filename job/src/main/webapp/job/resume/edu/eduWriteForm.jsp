<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육이수작성폼</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		
		/** 내 교육이수사항 불러오기 */
		$("#RSE_loadA").click(function() {
			window.open("./eduLoadPopUp.jsp", "", "width=500px height=500px");
		});
		
		/** 교육이수관리에 저장 */
		$("#RSE_saveA").click(function() {
			//alert("클릭Save");
			if(!$("#rse_Name").val()) {
				alert("교육명을 입력해주세요.");
				$("#rse_Name").focus();
			} else if(!$("#rse_Company").val()){
				alert("교육기관을 입력해주세요.");
				$("#rse_Company").focus();
			} else if(!$("#rse_Startdate").val()){
				alert("시작년월을 입력해주세요.");
				$("#rse_Startdate").focus();
			} else if(!$("#rse_Enddate").val()){
				alert("종료년월을 입력해주세요.");
				$("#rse_Enddate").focus();
			} else {
				window.open("./eduSavePopUp.jsp", "", "width=500px height=500px");
			}
		});
	});
</script>
</head>
<body>
	<div id="edu_div"
		style="display: inline-block; margin: 15px; width: 80%; background-color: #f5f7fb;">
		
		<!-- Title -->
		<h3 style="font-weight: bold;">교육</h3>
		
		<!-- Save / Load -->
		<div style="background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block; float: left;">
			<a href="#" id="RSE_loadA">내 교육이수사항 불러오기</a>
		</div>
		<div style="background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block; float: left;">
			<a href="#" id="RSE_saveA">교육이수관리에 저장</a>
		</div>
		<p style="clear: both; font-size: 12px; margin: 3px;">
		각 항목명은 변경할 수 있으며(최대 45자), 항목은 총 10개까지 작성 가능합니다. 고치거나 빼야함ㅎ</p>
		
		<br>
		
		<!-- input영역 1번째 줄 -->
		<div style="padding: 10px; padding-bottom: 20px; border: 1px solid rgba(86, 111, 237, 0.3); height: auto;">
						
			<!-- 교육명 -->
			<input id="rse_Name"; name="rse_Name" 
					type="text" placeholder="교육명" style="margin-top: 8px; margin-right: 10px; float: left; width: 250px; height: 48px; border: 1px solid lightgray;">
			
			<!-- 교육기관 -->		
			<input id="rse_Company"; name="rse_Company" 
					type="text" placeholder="교육기관" style="margin-top: 8px; margin-right: 10px; float: left; width: 250px; height: 48px; border: 1px solid lightgray;">
			
			<!-- 시작일데이터  -->
			<fieldset id="" class="" name="" 
						style="margin-right: 0px; float: left; border: 1px solid lightgray; background-color: white; height: 42px; width: 142px;">
				<legend style="font-size: 12px;">&nbsp;&nbsp;시작년월</legend>
				<input id="rse_Startdate" name="rse_Startdate" type="date" 
						style="text-align:center; float: left; background-color:white; border: 0px solid lightgray; display: inline-block; width: 135px; height: 21px;">
			</fieldset>
			
			<!-- 종료일데이터 -->
			<fieldset id="" class="" name="" 
						style="margin-left: 0px; margin-right: 0px; float: left; border: 1px solid lightgray; background-color: white; height: 42px;">
				<legend style="font-size: 12px;">&nbsp;&nbsp;졸료년월</legend>
				<input id="rse_Enddate" name="rse_Enddate" type="date" 
						style="text-align:center; float: left; background-color:white; border: 0px solid lightgray; display: inline-block; width: 135px; height: 21px;">
			</fieldset>
			<br style="clear:both;"><br>
			
			<!-- input영역 두번째 줄 -->
			
			<!-- 교육과정 -->
			<div style="width: 855px; border: 1px solid rgba(86, 111, 237, 0.3); background-color: white;">
				<a id="" class="" name="" href="#" style="text-decoration: none;">내용</a><br>
				<textarea id="rse_Content" class="rse_Content" name="rse_Content" rows="3" cols="119" placeholder="이수하신 교육과정에 대해 적어주세요."
							style="resize: none; border: 0px;"></textarea>
			</div>
			<br style="clear:both;">
		
		</div>
	</div>
</body>
</html>