<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자격증폼</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	var licensePlusButtonCnt = 0;

	$(function() {

		$("#licensePlus").hide();
		
		$("#licenseplusButton").click(function() {
			licensePlusButtonCnt++;
			var numbering = "_" + licensePlusButtonCnt;
			var clone = $("#licensePlus").clone().attr("id", "licensePlus" + numbering);
			
			if(licensePlusButtonCnt >=4){
				alert("항목추가는 최대 3개까지만 추가가능 합니다.")
				licensePlusButtonCnt--;
				return false;
			}
		

			// id&name 넘버링 변경 작업
			clone.find("*[id]").each(function() {
				$(this).attr("id", $(this).attr("id") + numbering);
			});
			
			clone.find("*[name]").each(function() {
				$(this).attr("name", $(this).attr("name") + numbering);
			});
			
			clone.insertAfter("#licensePlus");
			
			$("#licensePlus" + numbering).show();
			
			/** 이벤트 바인딩 */
			// 'X'표 눌렀을 때 닫기
			$("#licensePlusCancel" + numbering).on("click", function() {
				console.log("[eventBindingInit] #licensePlusCancel" + numbering + "(X표) : 닫기");
				$(this).parent("#licensePlus" + numbering).remove();
				$("#rsls__Seq"+numbering).val("");
				licensePlusButtonCnt--;
			});
	
			// 저장버튼 눌렀을 때
			$("#RSLS_saveA" + numbering).on("click", function() {
				if(!$("#rsls_Name" + numbering).val()) {
					alert("자격증명을 입력해주세요.");
					$("#rsls_Name" + numbering).focus();
				} else if(!$("#rsls_Company" + numbering).val()){
					alert("발행처를 입력해주세요.");
					$("#rsls_Company" + numbering).focus();
				} else if(!$("#rsls_Date" + numbering).val()){
					alert("취득년월을 입력해주세요.");
					$("#rsls_Date" + numbering).focus();
				} else {
					console.log("[saveButtonInit] numbering : " + numbering);
					window.open("/job/job/resume/license/licenseSavePopUp.jsp?numbering=" + numbering, "", "width=500px height=500px");
				}
			});
		
		});
		/** 내 자격증 불러오기 */
		$("#RSLS_loadA").click(function() {
			console.log("[load] licensePlusButtonCnt : " + licensePlusButtonCnt);
			window.open("/job/job/resume/license/licenseLoadPopUp.jsp?licensePlusButtonCnt=" + licensePlusButtonCnt, "", "width=500px height=500px");
		});
	});
	
	function selected(accumSeq, licensePlusButtonCnt_Delivered) {
		$(function() {
			console.log("[selected]----------부모창 시작----------");
			licensePlusButtonCnt = licensePlusButtonCnt_Delivered;
			console.log("[selected] accumSeq : " + accumSeq);
			console.log("[selected] licensePlusButtonCnt : " + licensePlusButtonCnt);
			$.ajax({
				type: 'POST',
				url: '/job/job/resume/license/rslsLoadView.do',
				dataType: 'json',
				data: {
					"accumSeq": accumSeq
				},
				success: function(data) {
					console.log("[selected] 부모창 ajax 성공");
					console.log("[selected] licensePlusButtonCnt : " + licensePlusButtonCnt);
					
					$.each(data.items, function(index, item) {
						var testDTO = item;
						
						licensePlusButtonCnt++;
						
						var numbering = "_" + licensePlusButtonCnt;
						var clone = $("#licensePlus").clone().attr("id", "licensePlus" + numbering);
						
						// id&name 넘버링 변경 작업
						clone.find("*[id]").each(function() {
							$(this).attr("id", $(this).attr("id") + numbering);
						});
						
						clone.find("*[name]").each(function() {
							$(this).attr("name", $(this).attr("name") + numbering);
						});
						
						clone.insertAfter("#licensePlus");
						
						$("#licensePlus" + numbering).show();
						
						/** 이벤트 바인딩 */
						// 'X'표 눌렀을 때 닫기
						$("#licensePlusCancel" + numbering).on("click", function() {
							console.log("[eventBindingSelected] #licensePlusCancel" + numbering + "(X표) : 닫기");
							$(this).parent("#licensePlus" + numbering).remove();
							$("#rsls__Seq"+numbering).val("");
							licensePlusButtonCnt--;
						});
						
						$("#RSLS_saveA" + numbering).on("click", function() {
							if(!$("#rsls_Name" + numbering).val()) {
								alert("자격증명을 입력해주세요.");
								$("#rsls_Name" + numbering).focus();
							} else if(!$("#rsls_Company" + numbering).val()){
								alert("발행처를 입력해주세요.");
								$("#rsls_Company" + numbering).focus();
							} else if(!$("#rsls_Date" + numbering).val()){
								alert("취득년월을 입력해주세요.");
								$("#rsls_Date" + numbering).focus();
							} else {
								console.log("[saveButtonInit] numbering : " + numbering);
								window.open("/job/job/resume/license/licenseSavePopUp.jsp?numbering=" + numbering, "", "width=500px height=500px");
							}
						});
							console.log("[selected] rsls_UserTitle : " + testDTO.rsls_UserTitle);
							$("#rsls__Seq" + numbering).val(testDTO.rsls_Seq);
							$("#rsls_Seq" + numbering).val(testDTO.rsls_Seq);
							$("#rsls_Name" + numbering).val(testDTO.rsls_Name);
							$("#rsls_Company" + numbering).val(testDTO.rsls_Company);
							$("#rsls_Date" + numbering).val(testDTO.rsls_Date);
							
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
<input id="rsls__Seq_1" type="hidden">
<input id="rsls__Seq_2" type="hidden">
<input id="rsls__Seq_3" type="hidden">
	<div id="license_div"
		style="display: inline-block; margin: 15px; width: 80%; background-color: #f5f7fb;">
		
		<!-- Title -->
		<h3 style="font-weight: bold;">자격증</h3>
		
		<!-- Load -->
		<div style="background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block; float: left;">
			<a href="#" id="RSLS_loadA" name="RSLS_loadA">내 자격증 불러오기</a>
		</div>
		<p style="clear: both; font-size: 12px; margin: 3px;">
		각 항목명은 변경할 수 있으며(최대 45자), 항목은 총 10개까지 작성 가능합니다. 고치거나 빼야함ㅎ</p>
		
		<br>
		
		<!-- input영역 1번째 줄 -->
		<div id="licensePlusField" style="padding: 10px; padding-bottom: 20px; border: 1px solid rgba(86, 111, 237, 0.3); height: auto;">
			<div id="licensePlus" class="licensePlus" style="border-bottom: 1px solid rgba(86, 111, 237, 0.3); margin: 0px;">
				<!-- SEQ값 : hidden -->				
				<input id="rsls_Seq" name="rsls_Seq" class="rsls_Seq" type="hidden">
				
				<!-- 'X'버튼 -->
				<a id="licensePlusCancel" name="licensePlusCancel" href="#" style="text-decoration: none;">
					<div id="licenseCloseButton" style="border: 1px solid rgba(86, 111, 237, 0.3); border-top:0px; border-right: 0px; background-color:white; margin: 0px; position: relative; left: 875px; width:30px; height: 30px;">X</div>
				</a>
				
				<!-- 자격증명 -->
				<input id="rsls_Name"; name="rsls_Name" 
						type="text" placeholder="자격증명" style="margin-top: 8px; margin-right: 10px; float: left; width: 250px; height: 48px; border: 1px solid lightgray;">
				
				<!-- 발생처 -->		
				<input id="rsls_Company"; name="rsls_Company" 
						type="text" placeholder="발행처" style="margin-top: 8px; margin-right: 10px; float: left; width: 250px; height: 48px; border: 1px solid lightgray;">
				
				<!-- 취득월  -->
				<fieldset style="margin-right: 0px; float: left; border: 1px solid lightgray; background-color: white; height: 42px; width: 142px;">
					<legend style="font-size: 12px;">&nbsp;&nbsp;취득날짜</legend>
					<input id="rsls_Date" name="rsls_Date" type="date" 
							style="text-align:center; float: left; background-color:white; border: 0px solid lightgray; display: inline-block; width: 135px; height: 21px;">
				</fieldset>
				
				<br style="clear:both;">
				
				<!-- Save -->
				<div style="background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block; float: left;">
					<a href="#" id="RSLS_saveA" name="RSLS_saveA">자격증관리에 저장</a>
				</div>
				<br><br>
			</div>
		</div>
		
		<!-- PlusButton -->
		<a id="licenseplusButton" href="#" style="text-decoration: none;">
			<div id="licenseplusButtonDiv" style="text-align:center; background-color: white; padding: 10px; padding-bottom: 20px; border: 1px solid rgba(86, 111, 237, 0.3); width: 95%; height: auto;">
							+ 자격증 추가
			</div>
		</a>
	</div>
</body>
</html>