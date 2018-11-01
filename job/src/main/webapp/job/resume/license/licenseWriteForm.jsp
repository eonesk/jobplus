<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자격증폼</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {

		/** 내 자격증 불러오기 */
		$("#RSLS_loadA").click(function() {
			window.open("./licenseLoadPopUp.jsp", "", "width=500px height=500px");
		});
		
		/** 자격증관리에 저장 */
		$("#RSLS_saveA").click(function() {
			//alert("클릭Save");
			if(!$("#rsls_Name").val()) {
				alert("자격증명을 입력해주세요.");
				$("#rsls_Name").focus();
			} else if(!$("#rsls_Company").val()){
				alert("발행처를 입력해주세요.");
				$("#rsls_Company").focus();
			} else if(!$("#rsls_Date").val()){
				alert("취득년월을 입력해주세요.");
				$("#rsls_Date").focus();
			} else {
				window.open("./licenseSavePopUp.jsp", "", "width=500px height=500px");
			}
		});
	});
	
	function selected(accumSeq) {
		$(function() {
			alert("부모창 할롱");
			alert(accumSeq);
			$.ajax({
				type: 'POST',
				url: 'rslsLoadView.do',
				dataType: 'json',
				data: {
					"accumSeq": accumSeq
				},
				success: function(data) {
					alert("부모창 성공");
					
					alert(testDTO[0].rsls_UserTitle);
					console.log(testDTO[0].rsls_UserTitle);
					console.log("할로");
					
// 					var testDTO =  data.items;
// 					$("#eduPlus2").hide();
// 					$("#eduPlus3").hide();
// 					var cnt = 1;
// 					//alert(testDTO[0].rse_UserTitle);	
					
// 					for(var i = 0; i < testDTO.length; i++) {
// 						if(i == 0) {
// 							alert(testDTO[i].rse_UserTitle);
// 							$("#eduPlus1  #rse_Name").val(testDTO[i].rse_Name);
// 							$("#eduPlus1  #rse_Company").val(testDTO[i].rse_Company);
// 							$("#eduPlus1  #rse_Startdate").val(testDTO[i].rse_Startdate);
// 							$("#eduPlus1  #rse_Enddate").val(testDTO[i].rse_Enddate);
// 							$("#eduPlus1  #rse_Content").val(testDTO[i].rse_Content);
// 						} else {
// 							cnt++;
// 							var selector = "#eduPlus" + cnt;
// 							alert(cnt);
// 							alert(testDTO[i].rse_UserTitle);
// 							$(selector).show();
// 							$(selector + " #rse_Name").val(testDTO[i].rse_Name);
// 							$(selector + " #rse_Company").val(testDTO[i].rse_Company);
// 							$(selector + " #rse_Startdate").val(testDTO[i].rse_Startdate);
// 							$(selector + " #rse_Enddate").val(testDTO[i].rse_Enddate);
// 							$(selector + " #rse_Content").val(testDTO[i].rse_Content);
// 						}						
// 					}				
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
	<div id="license_div"
		style="display: inline-block; margin: 15px; width: 80%; background-color: #f5f7fb;">
		
		<!-- Title -->
		<h3 style="font-weight: bold;">자격증</h3>
		
		<!-- Save / Load -->
		<div style="background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block; float: left;">
			<a href="#" id="RSLS_loadA">내 자격증 불러오기</a>
		</div>
		<div style="background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block; float: left;">
			<a href="#" id="RSLS_saveA">자격증관리에 저장</a>
		</div>
		<p style="clear: both; font-size: 12px; margin: 3px;">
		각 항목명은 변경할 수 있으며(최대 45자), 항목은 총 10개까지 작성 가능합니다. 고치거나 빼야함ㅎ</p>
		
		<br>
		
		<!-- input영역 1번째 줄 -->
		<div style="padding: 10px; padding-bottom: 20px; border: 1px solid rgba(86, 111, 237, 0.3); height: auto;">
						
			<!-- 자격증명 -->
			<input id="rsls_Name"; name="rsls_Name" 
					type="text" placeholder="자격증명" style="margin-top: 8px; margin-right: 10px; float: left; width: 250px; height: 48px; border: 1px solid lightgray;">
			
			<!-- 발생처 -->		
			<input id="rsls_Company"; name="rsls_Company" 
					type="text" placeholder="발행처" style="margin-top: 8px; margin-right: 10px; float: left; width: 250px; height: 48px; border: 1px solid lightgray;">
			
			<!-- 취득월  -->
			<fieldset id="" class="" name="" 
						style="margin-right: 0px; float: left; border: 1px solid lightgray; background-color: white; height: 42px; width: 142px;">
				<legend style="font-size: 12px;">&nbsp;&nbsp;취득날짜</legend>
				<input id="rsls_Date" name="rsls_Date" type="date" 
						style="text-align:center; float: left; background-color:white; border: 0px solid lightgray; display: inline-block; width: 135px; height: 21px;">
			</fieldset>
			<br style="clear:both;">
		</div>
	</div>
</body>
</html>