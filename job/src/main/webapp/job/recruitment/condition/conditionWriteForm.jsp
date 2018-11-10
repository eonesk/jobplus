<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근무조건폼</title>
<style type="text/css"> 
body {
} 
#conditionWrap {
	margin: 50px;
	padding: auto;
	width: 800px;
	position: relative;
    left: 4%;
}
#conditionSalary, #conditionBusiness, #conditionWorkspace, #conditionWeek, #conditionTime {
	border-bottom: 1px solid lightgray;
	width: 100%;
}
#conditionSalaryLeft {
	float: left;
	padding: 10px;
	padding-left: 20px;	
	width: 140px;
	height: 55px;
	color: #ff5a00;
	font-weight: bold;
}
#conditionSalaryRight {padding-top: 10px;}

#rmc_Salary1 , #conditionExtraPayDiv, #conditionExtraPayLabel, #conditionPayValue, #conditionPayHidden {display: inline-block;}

#rmc_Salary1 {border: 1px solid #b0b0b0; border-radius: 3px; padding: 13px; width: 180px;}
#conditionPayValue {position: relative; bottom: 2px; border: 1px solid #b0b0b0; border-radius: 3px; padding: 12px; width: 80px;}
#rmc_Salary2 {position: relative; bottom: 2px; border: 1px solid #b0b0b0; border-radius: 3px; background-color: #eaeff2; width: 180px; height: 38px;}
#conditionExtraPayLabel {font-size: 14px;}

#conditionPayNoticeDiv {padding-top: 10px;}
.conditionPayNotice {margin: 0; padding: 0; font-size: 14px; color: #757575;}

#conditionBusinessLeft {
 	float: left;
	padding: 10px;
	padding-left: 20px;
	
	width: 140px;
	height: 107px;
	color: #ff5a00;
	font-weight: bold;
}

#conditionBusinessRight {padding-top: 10px; padding-bottom: 10px;}

#conditionBusinessInputDiv {display: inline-block; border: 1px solid #b0b0b0; border-radius: 3px; /* position: relative; left: 200px;  */width: 358px; height: 80px; margin-top: 10px;}
#conditionBusinessInputUl {list-style: none; margin: 0; padding: 0;}
.conditionBusinessInputLi {margin:  0 0 0 0; padding: 0 0 0 0; border: 0; float: left;}

#conditionBusinessButton {margin-left: 50px;}
#conditionBusinessButton a:link {color: black;}
#conditionBusinessButton a:visited {color: black;}

#conditionWorkspaceLeft {
	float: left;
	padding: 10px;
	padding-left: 20px;
	
	width: 140px;
	height: 128px;
	color: #ff5a00;
	font-weight: bold;
}

#conditionWorkspaceRight {padding-top: 10px; padding-bottom: 10px;}
#workspaceDivCancel {float: right; margin-top: 10px; text-decoration: none;}
#workspaceDivCancel:link {color: black;}
#workspaceDivCancel:visited {color: black;}

#radioIn, #radioOut {width: 25px; height: 25px;}
#conditionWorkspaceRadio > label {position:relative; top:-5px}

#addrFirst, #addrSecond {width: 400px; height: 30px; border: 1px solid #b0b0b0; border-radius: 3px;}
#addrButton {
	height: 35px;
	padding: 7px;
	padding-left: 20px;
	padding-right: 20px;
	
	background-color: #666666;
	border: 1px solid #666666;
	color: white;
	
	border-radius: 3px;
}

#addrButton:hover {background-color: #3f3f3f;}

#conditionAddrMap {
	display: inline-block; border: 1px solid #b0b0b0; 
	border-radius: 3px; width: 577px; height: 480px;
	padding-left: 20px;
}

#conditionAddrMap > h4 {display: inline-block;}

#conditionAddrMapValue {position: relative; z-index: 0; width: 97%; height: 300px;}

#conditionWorkspaceOutSelect {display: inline-block; bottom: 2px; border: 1px solid #b0b0b0; border-radius: 3px; background-color: white; width: 180px; height: 28px; padding-top: 10px; padding-left: 10px;}
#conditionWorkspaceOutInput {display: inline-block; bottom: 2px; border: 1px solid #b0b0b0; border-radius: 3px; background-color: #eaeff2; width: 400px; height: 38px;}

#conditionWorkspaceOutSelect > select {border: 0; background-color: white;}
#conditionWeekLeft {
	float: left;
	padding: 10px;
	padding-top: 0;
	padding-left: 20px;
	
	width: 140px;
	height: 48px;
	color: #757575;	
}
#conditionWeekSelectDiv {margin-bottom: 6px; display: inline-block; text-align: center; padding-top: 15px; border: 1px solid #b0b0b0; border-radius: 3px; width: 250px; height: 35px; background: white;}
#rmc_Week {border: 0; font-size: 16px;}

#conditionWeekRight {padding-top: 10px;}

#conditionTimeLeft {
	float: left;
	padding: 10px;
	padding-top: 0;
	padding-left: 20px;
	
	width: 140px;
	height: 48px;
	color: #757575;	
}

#conditionTimeRight { padding-bottom: 10px;}

#conditionTimeSelectDiv {margin-bottom: 6px; display: inline-block; text-align: center; padding-top: 10px; border: 1px solid #b0b0b0; border-radius: 3px; width: 250px; height: 35px; background: white;}
#rmc_Time {border: 0; font-size: 16px; appearance: none;}

#conditionNextButtonDiv {margin-top: 5px; margin-right: 10px; float: right;}

#conditionNextButton {
	margin-left: 180px;
	padding: 7px;
	width: 100px;
	
	background-color: #666666;
	border: 1px solid #666666;
	color: white;
	border-radius: 3px;
}
#conditionNextButton:hover {background-color: #3f3f3f;}


#conditionPopUp{
  width: 620px; height: 300px; background:white; color:black; 
  position:relative; top:-833px; left:248px; padding:0px 20px 0px 20px;
  border:1px solid #666666; z-index: 500px;
}

#conditionCategoryTitle {padding: 0;}

.workspace1 {list-style: none;}

</style>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=289fc6538397e54215bb3d26d1485e7e&libraries=services"></script>
<script type="text/javascript">
	$(function() {

		var conditionWorkspaceCnt = 0;
		$("#conditionPayNoticeDiv").hide();
		$("#rmc_Salary1").on("change", function() {
			if(($("#rmc_Salary1").val() == "면접 후 결정")||($("#rmc_Salary1").val() == "회사 내규에 따름")) {
				$("#conditionPayNoticeDiv").hide();
			} else {
				$("#conditionPayNoticeDiv").show();
			}
		});
		
		$("#conditionPopUp").hide();
		$("#conditionBA").click(function() {
			$("#conditionPopUp").show();
			return false;
		});
		
		$("#workspace2_0").hide();
		$("#workspace2_1").hide();
		$("#workspace2_2").hide();
		$("#workspace2_3").hide();
		$("#workspace2_4").hide();
		$("#workspace2_5").hide();
		$("#workspace2_6").hide();
		$("#workspace2_7").hide();
		$("#workspace2_8").hide();
		$("#workspace2_9").hide();
		
		$("#workspace3_0_0").hide();
		$("#workspace3_0_1").hide();
		
		$("#workspace3_1_0").hide();
		
		$(".workspace1").click(function() {
			$(this).css({
				"color": "#ff5a00",
				"background-color": "#f7f7f7"
			});
			$(".workspace1").not($(this)).css({
				"color": "black",
				"background-color": "white"
			});
			
// 			$("input[name='workspace3']:checked").each(function() {
// 				var array = $("input[name='workspace3']").val();
// 				console.log("array : " + array);
// 			});
			
			
//  			alert($(".workspace3").prop("checked"));
			
			if($("input[name='workspace3']").is(":checked")){
				alert("업종은 1개만 선택할 수 있습니다. 체크사항을 모두 취소합니다.");
				$("input[name='workspace3']").prop("checked", false);
				conditionWorkspaceCnt = 0;
				$("#workspace2_0 > li").css({
					"color": "black",
					"background-color": "white"
				});
				$("#workspace2_1 > li").css({
					"color": "black",
					"background-color": "white"
				});
				$("#workspace2_2 > li").css({
					"color": "black",
					"background-color": "white"
				});
				$("#workspace2_3 > li").css({
					"color": "black",
					"background-color": "white"
				});
				$("#workspace2_4 > li").css({
					"color": "black",
					"background-color": "white"
				});
				$("#workspace2_5 > li").css({
					"color": "black",
					"background-color": "white"
				});
				$("#workspace2_6 > li").css({
					"color": "black",
					"background-color": "white"
				});
				$("#workspace2_7 > li").css({
					"color": "black",
					"background-color": "white"
				});
				$("#workspace2_8 > li").css({
					"color": "black",
					"background-color": "white"
				});
				$("#workspace2_9 > li").css({
					"color": "black",
					"background-color": "white"
				});
				$("#workspace3_0_0").hide();
				$("#workspace3_0_1").hide();
				
				$("#workspace3_1_0").hide();
				$("input[name='workspace3']").removeAttr("disabled");
				$("#conditionBusinessInputUl").empty();
			}
			
			switch($(this).val()) {
			case 0: $("#workspace2_1").hide(); $("#workspace2_2").hide(); $("#workspace2_3").hide(); $("#workspace2_4").hide();
					$("#workspace2_5").hide(); $("#workspace2_6").hide(); $("#workspace2_7").hide(); $("#workspace2_8").hide(); $("#workspace2_9").hide();
					$("#workspace2_0").show(); 
					
					$(".workspace2_0").click(function() {
						$(this).css({
							"color": "#ff5a00",
							"background-color": "#f7f7f7"
						});
						$(".workspace2_0").not($(this)).css({
							"color": "black",
							"background-color": "white"
						});
						
						switch($(this).val()) {
						case 0: $("#workspace3_0_1").hide(); $("#workspace3_1_0").hide(); 
								$("#workspace3_0_0").show(); 
								break;
						case 1: $("#workspace3_0_0").hide(); $("#workspace3_1_0").hide();
								$("#workspace3_0_1").show(); 
								break;
						}
					});
					break;
			case 1: $("#workspace2_0").hide(); $("#workspace2_2").hide(); $("#workspace2_3").hide(); $("#workspace2_4").hide();
					$("#workspace2_5").hide(); $("#workspace2_6").hide(); $("#workspace2_7").hide(); $("#workspace2_8").hide(); $("#workspace2_9").hide();
					$("#workspace2_1").show();
					
					$(".workspace2_1").click(function() {
						$(this).css({
							"color": "#ff5a00",
							"background-color": "#f7f7f7"
						});
						$(".workspace2_1").not($(this)).css({
							"color": "black",
							"background-color": "white"
						});
						
						switch($(this).val()) {
						case 0: $("#workspace3_0_0").hide(); $("#workspace3_0_1").hide(); 
								$("#workspace3_1_0").show(); 
								break;
						}
					});
					break;
			case 2: $("#workspace2_0").hide(); $("#workspace2_1").hide(); $("#workspace2_3").hide(); $("#workspace2_4").hide();
					$("#workspace2_5").hide(); $("#workspace2_6").hide(); $("#workspace2_7").hide(); $("#workspace2_8").hide(); $("#workspace2_9").hide();
					$("#workspace2_2").show();
					break;
			case 3: $("#workspace2_0").hide(); $("#workspace2_1").hide(); $("#workspace2_2").hide(); $("#workspace2_4").hide();
					$("#workspace2_5").hide(); $("#workspace2_6").hide(); $("#workspace2_7").hide(); $("#workspace2_8").hide(); $("#workspace2_9").hide();
					$("#workspace2_3").show(); 
					break;
			case 4: $("#workspace2_0").hide(); $("#workspace2_1").hide(); $("#workspace2_2").hide(); $("#workspace2_3").hide();
					$("#workspace2_5").hide(); $("#workspace2_6").hide(); $("#workspace2_7").hide(); $("#workspace2_8").hide(); $("#workspace2_9").hide();
					$("#workspace2_4").show(); 
					break;
			case 5: $("#workspace2_0").hide(); $("#workspace2_1").hide(); $("#workspace2_2").hide(); $("#workspace2_3").hide();
					$("#workspace2_4").hide(); $("#workspace2_6").hide(); $("#workspace2_7").hide(); $("#workspace2_8").hide(); $("#workspace2_9").hide();
					$("#workspace2_5").show(); 
					break;
			case 6: $("#workspace2_0").hide(); $("#workspace2_1").hide(); $("#workspace2_2").hide(); $("#workspace2_3").hide();
					$("#workspace2_4").hide(); $("#workspace2_5").hide(); $("#workspace2_7").hide(); $("#workspace2_8").hide(); $("#workspace2_9").hide();
					$("#workspace2_6").show(); 
					break;
			case 7: $("#workspace2_0").hide(); $("#workspace2_1").hide(); $("#workspace2_2").hide(); $("#workspace2_3").hide();
					$("#workspace2_4").hide(); $("#workspace2_5").hide(); $("#workspace2_6").hide(); $("#workspace2_8").hide(); $("#workspace2_9").hide();
					$("#workspace2_7").show(); 
					break;
			case 8: $("#workspace2_0").hide(); $("#workspace2_1").hide(); $("#workspace2_2").hide(); $("#workspace2_3").hide();
					$("#workspace2_4").hide(); $("#workspace2_5").hide(); $("#workspace2_6").hide(); $("#workspace2_7").hide(); $("#workspace2_9").hide();
					$("#workspace2_8").show(); 
					break;
			case 9: $("#workspace2_0").hide(); $("#workspace2_1").hide(); $("#workspace2_2").hide(); $("#workspace2_3").hide();
					$("#workspace2_4").hide(); $("#workspace2_5").hide(); $("#workspace2_6").hide(); $("#workspace2_7").hide(); $("#workspace2_8").hide();
					$("#workspace2_9").show(); 
					break;
			}
		});
///////////// 업종부분
////////////////////////// 3개이상 선택 못하는 거 
		var chbId;
		
		if(conditionWorkspaceCnt == 3) {
			$("input[name='workspace3']").attr("disabled", "true");
		} else if(conditionWorkspaceCnt < 3 || conditionWorkspaceCnt >= 0) {
			$("input[name='workspace3']").on("change", function() {
				if($(this).is(":checked")){
					conditionWorkspaceCnt++;
					chbId = $(this).attr("id");
					console.log("chbId : " + chbId);
					console.log("conditionWorkspaceCnt[input[name='workspace3'] change] : " + conditionWorkspaceCnt);
					var li = $("<li>");
					li.attr("id", "list" + chbId);
					console.log("list_id : " + li.attr("id"));
					li.addClass("conditionBusinessInputLi").css("width", "200px");
					li.html($(this).val());
					$("#conditionBusinessInputUl").append(li);
					if(conditionWorkspaceCnt == 3) {
						$("input[name='workspace3']").not($("input[name='workspace3']:checked")).attr("disabled", "true");
					}
				} else {
					conditionWorkspaceCnt--;
					$("input[name='workspace3']").removeAttr("disabled");
					console.log("conditionWorkspaceCnt[input[name='workspace3'] change] : " + conditionWorkspaceCnt);
					chbId = $(this).attr("id");
					var list_id = "list" + chbId;
					$("#" + list_id).remove();
				}
			});
		}
		
		$("#workspaceDivCancel").click(function() {
			console.log($("input[name='rmc_Workspace']").val());
			var conditionCnt = 0;
			$("input[name='workspace3']:checked").each(function() {
				conditionCnt++;
				console.log("conditionCnt : "+ conditionCnt);
            	console.log($(this).val());
            	$("#rmc_Business"+conditionCnt).attr("value", $(this).val());
            });
			console.log("rmc_Business1 : " + $("#rmc_Business1").val());
			console.log("rmc_Business2 : " + $("#rmc_Business2").val());
			console.log("rmc_Business3 : " + $("#rmc_Business3").val());
			$("#conditionPopUp").hide();
			return false;
		});
		
/////////////////////////////////////////////////////////// In/Out checkbox
		$("#conditionWorkspaceOut").hide();
		
		$("input[name='conditionWorkspaceR']").on("change", function() {
			if($("#radioIn").is(":checked")) {
				$("#conditionWorkspaceMap").show();
				$("#conditionWorkspaceOut").hide();
				$("#addrFirst").attr("name", "rmc_Workspace");
				$("#conditionWorkspaceOutInput").removeAttr("name");
			} else if ($("#radioOut").is(":checked")) {
				$("#conditionWorkspaceMap").hide();
				$("#conditionWorkspaceOut").show();
				$("#conditionWorkspaceOutInput").attr("name", "rmc_Workspace");
				$("#addrFirst").removeAttr("name");
				$("input[name='rmc_Workspace']").click(function() {
					if($("select[name='rmc_Workspace0']").val() == "국가선택") {
						alert("국가를 선택해주세요.");
					}
				});
			}
		});
//////////////////////////////////// map 부분


		$("#addrFirst").click(function() {
			var mapContainer = document.getElementById('conditionAddrMapValue'), // 지도를 표시할 div
		    mapOption = {
		        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };
		
			//지도를 미리 생성
			var map = new daum.maps.Map(mapContainer, mapOption);
			//주소-좌표 변환 객체를 생성
			var geocoder = new daum.maps.services.Geocoder();
			//마커를 미리 생성
			var marker = new daum.maps.Marker({
			    position: new daum.maps.LatLng(37.537187, 127.005476),
			    map: map
			});
		
		
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	console.log("daum.postcode 진입");
		            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var fullAddr = data.address; // 최종 주소 변수
		            console.log("1:" + fullAddr);
		            var extraAddr = ''; // 조합형 주소 변수
		
		            // 기본 주소가 도로명 타입일때 조합한다.
		            if(data.addressType === 'R'){
		                //법정동명이 있을 경우 추가한다.
		                if(data.bname !== ''){
		                    extraAddr += data.bname;
		                }
		                // 건물명이 있을 경우 추가한다.
		                if(data.buildingName !== ''){
		                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		            }
		            console.log("2:" + fullAddr);
		            // 주소 정보를 해당 필드에 넣는다.
		            document.getElementById("addrFirst").value = data.address;
		            $("#addrShow").html(data.address);
		            // 주소로 상세 정보를 검색
		            console.log("여기까지");
		            geocoder.addressSearch(data.address, function(results, status) {
		                // 정상적으로 검색이 완료됐으면
		                console.log("제발ㅜㅜ");
		                if (status === daum.maps.services.Status.OK) {
		
		                    var result = results[0]; //첫번째 결과의 값을 활용
		
		                    // 해당 주소에 대한 좌표를 받아서
		                    var coords = new daum.maps.LatLng(result.y, result.x);
		                    // 지도를 보여준다.
		                    mapContainer.style.display = "block";
		                    map.relayout();
		                    // 지도 중심을 변경한다.
		                    map.setCenter(coords);
		                    // 마커를 결과값으로 받은 위치로 옮긴다.
		                    marker.setPosition(coords);
		                    
		                    
		                    var iwContent = '<div style="padding:5px;"> 우리회사 </div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		                    iwPosition = coords; //인포윈도우 표시 위치입니다

			                // 인포윈도우를 생성합니다
			                var infowindow = new daum.maps.InfoWindow({
			                    position : iwPosition, 
			                    content : iwContent 
			                });
			                  
			                // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			                infowindow.open(map, marker);
		                }
		            });
		        }
		    }).open();
		});
	
//////////////////////////////////////////////map 끝///////////////

/////////////////////////////////////// 다음버튼 유효성검사 /////////////////
		$("#conditionNextButton").click(function() {
			
			// value값 console 출력
			console.log($("select[name='rmc_Salary1']").val());
			console.log($("input[name='rmc_Salary2']").val());
			console.log($("input[name='rmc_Business1']").val());
			console.log($("input[name='rmc_Business2']").val());
			console.log($("input[name='rmc_Business3']").val());
			console.log($("input[name='rmc_Workspace']").val());
			console.log($("input[name='rmc_Workspace0']").val());
			console.log($("select[name='rmc_Week']").val());
			console.log($("select[name='rmc_Time']").val());
			
			// 유효성검사
			if($("select[name='rmc_Salary1']").val() == "선택") {
				alert("급여를 선택해주세요.");
			} else if($("input[name='rmc_Business1']").val() == "") {
				alert("업종을 선택해주세요.");
			} else if($("input[name='rmc_Workspace']").val() == "") {
				alert("근무지역을 입력해주세요.");
			} else {
				$("#rmc_Salary1_hidden").val($("select[name='rmc_Salary1']").val());	
				$("#rmc_Salary2_hidden").val($("input[name='rmc_Salary2']").val());		
				$("#rmc_Business1_hidden").val($("input[name='rmc_Business1']").val());		
				$("#rmc_Business2_hidden").val($("input[name='rmc_Business2']").val());	
				$("#rmc_Business3_hidden").val($("input[name='rmc_Business3']").val());		
				$("#rmc_Workspace_hidden").val($("input[name='rmc_Workspace']").val());		
				$("#rmc_Workspace0_hidden").val($("input[name='rmc_Workspace0']").val());		
				$("#rmc_Week_hidden").val($("select[name='rmc_Week']").val());		     
				$("#rmc_Time_hidden").val($("select[name='rmc_Time']").val());		     
				
				$("#conditionCk").val("ok");
				$("#rm_condition").hide();
				$("#rm_time").show();
			}
		});

	});
</script>
</head>
<body>
<input type="hidden" id="rmc_Salary1_hidden">
<input type="hidden" id="rmc_Salary2_hidden">
<input type="hidden" id="rmc_Business1_hidden">
<input type="hidden" id="rmc_Business2_hidden">
<input type="hidden" id="rmc_Business3_hidden">
<input type="hidden" id="rmc_Workspace_hidden">
<input type="hidden" id="rmc_Workspace0_hidden">
<input type="hidden" id="rmc_Week_hidden">
<input type="hidden" id="rmc_Time_hidden">

<div id="cdtion_container" class="cdtion_container">
<form action="conditionWriteFormNext.do" method="POST" name="timeWriteForm">
	<div id="conditionWrap">
		<input id="rmc_Business1" name="rmc_Business1" type="hidden">
		<input id="rmc_Business2" name="rmc_Business2" type="hidden">
		<input id="rmc_Business3" name="rmc_Business3" type="hidden">
		<div id="conditionTitle">
			<h2>근무조건</h2>
		</div>		
		<hr style="clear: both;">
		
		<div id="conditionSalary" style="float: left;">
			<div id="conditionSalaryLeft">
				<p>*급여</p>
			</div>
			<div id="conditionSalaryRight">
				<div id="salaryLine1">
						<select id="rmc_Salary1" name="rmc_Salary1">
							<option value="선택">급여를 선택하세요</option>
							<option value="1,400 만원 이하">1,400 만원 이하</option><option value="1,400~1,600만원">1,400~1,600만원</option><option value="1,600~1,800만원">1,600~1,800만원</option>
							<option value="1,800~2,000만원">1,800~2,000만원</option><option value="2,000~2,200만원">2,000~2,200만원</option><option value="2,200~2,400만원">2,200~2,400만원</option>
							<option value="2,400~2,600만원">2,400~2,600만원</option><option value="2,600~2,800만원">2,600~2,800만원</option><option value="2,800~3,000만원">2,800~3,000만원</option>
							<option value="3,000~3,200만원">3,000~3,200만원</option><option value="3,200~3,400만원">3,200~3,400만원</option><option value="3,400~3,600만원">3,400~3,600만원</option>
							<option value="3,600~3,800만원">3,600~3,800만원</option><option value="3,800~4,000만원">3,800~4,000만원</option><option value="4,000~5,000만원">4,000~5,000만원</option>
							<option value="5,000~6,000만원">5,000~6,000만원</option><option value="6,000~7,000만원">6,000~7,000만원</option><option value="7,000~8,000만원">7,000~8,000만원</option>
							<option value="8,000~9,000만원">8,000~9,000만원</option><option value="9,000~1억원">9,000~1억원</option><option value="1억원 이상">1억원 이상</option><option value="면접 후 결정">면접 후 결정</option>
							<option value="회사 내규에 따름">회사 내규에 따름</option>
						</select>
					<!-- <input id="conditionPayValue" type="text"> 만원 -->
					<div id="conditionPayHidden"><p id="conditionExtraPayLabel">기타 급여/수당</p></div>
					<div id="conditionExtraPayDiv"><input id="rmc_Salary2" name="rmc_Salary2" type="text"></div>
				</div>
				<div id="conditionPayNoticeDiv">
					<p class="conditionPayNotice">※ 당사는 본 채용 건과 관련하여 <span style="color: orange;">‘최저임금법’</span>을 준수합니다.</p>
					<p class="conditionPayNotice">2018년도 최저임금은 시급 7,530원(전년 대비 16.4% 인상),</p>
					<p class="conditionPayNotice">주 40시간제 기준 세전 월급 157만 3,770원(유급 주휴 포함, 월 209시간 기준)이며, </p>
					<p class="conditionPayNotice">위반 시 행정처분을 받을 수 있습니다.</p>
					<hr style="clear: both; display: none;">
				</div>
			</div>
		</div>
		<br style="clear: both;">
		<div id="conditionBusiness" style="float: left;">
			<div id="conditionBusinessLeft">				
				<p>*업종</p>
			</div>
			<div id="conditionBusinessRight">
				<span id="conditionBusinessInputDiv">
					<ul id="conditionBusinessInputUl">
					</ul>
				</span>
				<span id="conditionBusinessButton"><a href="#" id="conditionBA">수정/추가</a>&#9660;</span>
			</div>
		</div>
		<br style="clear: both;">
		<div id="conditionWorkspace" style="float: left;">
			<div id="conditionWorkspaceLeft">				
				<p>*근무지역</p>
			</div>
			<div id="conditionWorkspaceRight">				
				<div id="conditionWorkspaceRadio">
					<input id="radioIn" name="conditionWorkspaceR" type="radio" checked="checked" value="in"><label for="radioIn">국내</label>
					<input id="radioOut" name="conditionWorkspaceR" type="radio" value="out"><label for="radioOut">해외</label>
				</div>
				<div id="conditionWorkspaceMap">
					<input id="addrFirst" name="rmc_Workspace" type="text">
					<!-- <input id="addrSecond" type="text"> -->
					<input id="addrButton" type="button" onclick="sample5_execDaumPostcode()" value="위치확인">
					<br><br>
					<div id="conditionAddrMap">
						<h4>위치/지도 확인&nbsp;&nbsp;|&nbsp;&nbsp;</h4><span id="addrShow">하잉</span>
						<br>
						<div id="conditionAddrMapValue"></div>
					</div>
					<br>
				</div>
				<div id="conditionWorkspaceOut">
					<div id="conditionWorkspaceOutSelect">
						<select name="rmc_Workspace0">
							<option value="국가선택">국가선택</option>
							<option value="가나">가나</option>
							<option value="가봉">가봉</option>
							<option value="가이아니">가이아나</option>
							<option value="감비아">감비아</option>
							<option value="과델루프">과델루프</option>
							<option value="과테말라">과테말라</option>
							<option value="괌">괌</option>
							<option value="그라나다">그라나다</option>
							<option value="그루지아">그루지아</option>
							<option value="그리스">그리스</option>
							<option value="그린란드">그린란드</option>
							<option value="기니">기니</option>
							<option value="기니비소우">기니비소우</option>
							<option value="기아나(프랑스령)">기아나(프랑스령)</option>
							<option value="나미비아">나미비아</option>
							<option value="나우루공화국">나우루공화국</option>
							<option value="나이지리아">나이지리아</option>
							<option value="남미기타">남미기타</option>
							<option value="남아프리카공화국">남아프리카공화국</option>
							<option value="네덜란드">네덜란드</option>
							<option value="네덜란드령 안틸레스제도">네덜란드령 안틸레스제도</option>
							<option value="네팔">네팔</option>
							<option value="노르웨이">노르웨이</option>
							<option value="뉴질랜드">뉴질랜드</option>
							<option value="뉴칼레도니아섬">뉴칼레도니아섬</option>
							<option value="니제르">니제르</option>
							<option value="니카라과">니카라과</option>
							<option value="대만">대만</option>
							<option value="덴마크">덴마크</option>
							<option value="도미니카공화국">도미니카공화국</option>
							<option value="도미니카연방">도미니카연방</option>
							<option value="독일">독일</option>
							<option value="동티모르">동티모르</option>
							<option value="라오스">라오스</option>
							<option value="라이베리아">라이베리아</option>
							<option value="라트비아">라트비아</option>
							<option value="러시아">러시아</option>
							<option value="레뉴니용">레뉴니용</option>
							<option value="레바논">레바논</option>
							<option value="루마니아">루마니아</option>
							<option value="룩셈부르크">룩셈부르크</option>
							<option value="르완다">르완다</option>
							<option value="리비아">리비아</option>
							<option value="리투아니아">리투아니아</option>
							<option value="리히텐슈타인">리히텐슈타인</option>
							<option value="마다가스카르">마다가스카르</option>
							<option value="마르티니크섬">마르티니크섬</option>
							<option value="마샬군도">마샬군도</option>
							<option value="마케도니아">마케도니아</option>
							<option value="말라위">말라위</option>
							<option value="말레이시아">말레이시아</option>
							<option value="말리">말리</option>
							<option value="멕시코">멕시코</option>
							<option value="모나코">모나코</option>
							<option value="모로코">모로코</option>
							<option value="모리셔스">모리셔스</option>	
							<option value="모리타니아">모리타니아</option>
							<option value="모잠비크">모잠비크</option>
							<option value="몬테네그로">몬테네그로</option>
							<option value="몰도바">몰도바</option>
							<option value="몰디브">몰디브</option>
							<option value="몰타">몰타</option>
							<option value="몽골">몽골</option>
							<option value="몽트세라">몽트세라</option>
							<option value="미국">미국</option>
							<option value="미얀마">미얀마</option>
							<option value="미크로네시아">미크로네시아</option>
							<option value="바누아투">바누아투</option>
							<option value="바레인">바레인</option>	
							<option value="바베이도스">바베이도스</option>
							<option value="바티칸시국">바티칸시국</option>
							<option value="바하마">바하마</option>
							<option value="방글라데시">방글라데시</option>
							<option value="버마">버마</option>
							<option value="버뮤다">버뮤다</option>
							<option value="버진제도">버진제도</option>
							<option value="베냉">베냉</option>
							<option value="베네수엘라">베네수엘라</option>
							<option value="베트남">베트남</option>
							<option value="벨기에">벨기에</option>
							<option value="벨로루시">벨로루시</option>
							<option value="벨리즈">벨리즈</option>
							<option value="보스니아헤르체고비나">보스니아헤르체고비나</option>
							<option value="보츠와나">보츠와나</option>
							<option value="볼리비아">볼리비아</option>
							<option value="부룬디">부룬디</option>
							<option value="부르키나파소">부르키나파소</option>
							<option value="부탄">부탄</option>
							<option value="북.중미기타">북.중미기타</option>
							<option value="북마리아나군도">북마리아나군도</option>
							<option value="북한">북한</option>
							<option value="불가리아">불가리아</option>
							<option value="브라질">브라질</option>
							<option value="브루나이">브루나이</option>
							<option value="사모아">사모아</option>
							<option value="사우디아라비아">사우디아라비아</option>
							<option value="사이판">사이판</option>
							<option value="산마리노">산마리노</option>
							<option value="상투메프린시페">상투메프린시페</option>
							<option value="세네갈">세네갈</option>
							<option value="세르비아">세르비아</option>
							<option value="세이젤제도">세이젤제도</option>
							<option value="세인트루시아">세인트루시아</option>
							<option value="세인트빈센트그레나딘즈">세인트빈센트그레나딘즈</option>
							<option value="세인트키츠네비스">세인트키츠네비스</option>
							<option value="세인트피에르미그온">세인트피에르미그온</option>
							<option value="세인트헬레나섬">세인트헬레나섬</option>
							<option value="소말리아">소말리아</option>
							<option value="솔로몬제도">솔로몬제도</option>
							<option value="수단">수단</option>
							<option value="수리남">수리남</option>
							<option value="스리랑카">스리랑카</option>
							<option value="스와질랜드">스와질랜드</option>
							<option value="스웨덴">스웨덴</option>
							<option value="스위스">스위스</option>
							<option value="스페인">스페인</option>
							<option value="슬로바키아">슬로바키아</option>
							<option value="슬로베니아">슬로베니아</option>
							<option value="시리아">시리아</option>
							<option value="시에라리온">시에라리온</option>
							<option value="신유고연방">신유고연방</option>
							<option value="싱가포르">싱가포르</option>
							<option value="아랍에미레이트연합국">아랍에미레이트연합국</option>
							<option value="아루바">아루바</option>
							<option value="아르메니아">아르메니아</option>
							<option value="아르헨티아">아르헨티아</option>
							<option value="아시아.중동기타">아시아.중동기타</option>
							<option value="아이슬란드">아이슬란드</option>
							<option value="아이티">아이티</option>
							<option value="아일랜드">아일랜드</option>
							<option value="아제르바이잔">아제르바이잔</option>
							<option value="아프가니스탄">아프가니스탄</option>
							<option value="아프리카기타">아프리카기타</option>
							<option value="안길라">안길라</option>
							<option value="안도라">안도라</option>
							<option value="알바니아">알바니아</option>
							<option value="알제리">알제리</option>
							<option value="앙골라">앙골라</option>
							<option value="에리트레아">에리트레아</option>
							<option value="에스토니아">에스토니아</option>
							<option value="에콰도르">에콰도르</option>
							<option value="에티오피아">에티오피아</option>
							<option value="엔티가바부다">엔티가바부다</option>
							<option value="엘살바도르">엘살바도르</option>
							<option value="영국">영국</option>
							<option value="영국령 인도양식민지">영국령 인도양식민지</option>
							<option value="오만">예멘</option>
							<option value="오만">오만</option>
							<option value="오세아니아기타">오세아니아기타</option>
							<option value="오스트리아">오스트리아</option>
							<option value="온두라스">온두라스</option>
							<option value="요르단">요르단</option>
							<option value="우간다">우간다</option>
							<option value="우루과이">우루과이</option>
							<option value="우즈베키스탄">우즈베키스탄</option>
							<option value="우크라이나">우크라이나</option>
							<option value="유럽기타">유럽기타</option>
							<option value="이라크">이라크</option>
							<option value="이란">이란</option>
							<option value="이스라엘">이스라엘</option>
							<option value="이집트">이집트</option>
							<option value="이탈리아">이탈리아</option>
							<option value="인도">인도</option>
							<option value="인도네시아">인도네시아</option>	
						</select>
					</div>
					<input id="conditionWorkspaceOutInput" type="text" placeholder="해외 근무지역의 상세주소를 입력해 주세요.">
				</div>
			</div>
		</div>
		<br style="clear: both;">
		<div id="conditionWeek">
			<div id="conditionWeekLeft">				
				<p>근무요일</p>
			</div>
			<div id="conditionWeekRight">
				<div id="conditionWeekSelectDiv">				
					<select id="rmc_Week" name="rmc_Week">
						<option value="">선택</option>
						<option value="주 5일(월~금)">주 5일(월~금)</option>
						<option value="토요일 격주휴무(월~토)">토요일 격주휴무(월~토)</option>
						<option value="주 6일(월~토)">주 6일(월~토)</option>
						<option value="주 3일(격일제)">주 3일(격일제)</option>
						<option value="탄력적근무제">탄력적근무제</option>
						<option value="2교대">2교대</option>
						<option value="3교대">3교대</option>
						<option value="4교대">4교대</option>
					</select>
				</div>
			</div>
		</div>
		<br style="clear: both;">
		<div id="conditionTime">
			<div id="conditionTimeLeft">				
				<p>근무시간</p>
			</div>
			<div id="conditionTimeRight">
				<div id="conditionTimeSelectDiv">				
					<select id="rmc_Time" name="rmc_Time">
						<option value="">선택</option>
						<option value="오전 9시~오후 6시">오전 9시~오후 6시</option>
						<option value="오전 8시 30분~오후 5시 30분">오전 8시 30분~오후 5시 30분</option>
						<option value="오전 10시~오후 7시">오전 10시~오후 7시</option>
						<option value="탄력적근무제">탄력적근무제</option>
					</select>
				</div>
			</div>
		</div>
		<div id="conditionNextButtonDiv">
			<button id="conditionNextButton" type="button">다음</button>
		</div>
		
		<br style="clear: both;">		
		<div id="conditionPopUp">
			<div id="conditionCategoryTitle"><h3>업종 카테고리 선택</h3></div>
			<hr>
			<table>
				<tr style="margin: 0;">
					<td style="width: 200px; background: #f7f7f7; height: 35px;">업종 분류</td>
					<td style="width: 200px; background: #f7f7f7;">업종</td>
					<td style="width: 200px; background: #f7f7f7;">상세 업종</td>
				</tr>
				<tr style="margin: 0;">
					<td>
						<div style="padding: 0; height: 150px; border: 1px solid lightgray; overflow-y: scroll; overflow-x: hidden;">
							<ul style="padding: 0; margin: 0; cursor: pointer;">
								<li class="workspace1" value="0">서비스업</li>
								<li class="workspace1" value="1">제조.화학</li>
								<li class="workspace1" value="2">IT.웹통신</li>
								<li class="workspace1" value="3">은행.금융업</li>
								<li class="workspace1" value="4">미디어.디자인</li>
								<li class="workspace1" value="5">교육업</li>
								<li class="workspace1" value="6">의료.제약.복지</li>
								<li class="workspace1" value="7">판매.유통</li>
								<li class="workspace1" value="8">건설업</li>
								<li class="workspace1" value="9">기관.협회</li>
							</ul>
						</div>
					</td>
					<td>
						<div style="padding: 0; height: 150px; border: 1px solid lightgray; overflow-y: scroll; overflow-x: hidden;">
							<ul id="workspace2_0" style="padding: 0; margin: 0; cursor: pointer;">
								<li class="workspace2_0" value="0">호텔.여행.항공</li>
								<li class="workspace2_0" value="1">외식업.식음료</li>
								<li class="workspace2_0" value="2">시설관리.경비.용역</li>
								<li class="workspace2_0" value="3">레저.스포츠.여가</li>
								<li class="workspace2_0" value="4">AS.카센터.주유</li>
								<li class="workspace2_0" value="5">렌탈.임대</li>
								<li class="workspace2_0" value="6">웨딩.장례</li>
								<li class="workspace2_0" value="7">기타서비스업</li>
								<li class="workspace2_0" value="8">뷰티.미용</li>
							</ul>
							<ul id="workspace2_1" style="padding: 0; margin: 0; cursor: pointer;">
								<li class="workspace2_1" value="0">전기.전자.제어</li>
								<li class="workspace2_1" value="1">기계.설비.자동차</li>
								<li class="workspace2_1" value="2">석유.화학.에너지</li>
								<li class="workspace2_1" value="3">섬유.의류.패션</li>
								<li class="workspace2_1" value="4">화장품.뷰티</li>
								<li class="workspace2_1" value="5">생활용품.소비재.사무</li>
								<li class="workspace2_1" value="6">가구.목재.제지</li>
								<li class="workspace2_1" value="7">농업.어업.광업.임업</li>
								<li class="workspace2_1" value="8">금속.재료.철강.요업</li>
								<li class="workspace2_1" value="9">조선.항공.우주</li>
								<li class="workspace2_1" value="10">기타제조업</li>
								<li class="workspace2_1" value="11">식품가공.개발</li>
								<li class="workspace2_1" value="12">반도체.광학.LCD</li>
								<li class="workspace2_1" value="13">환경</li>
							</ul>
							<ul id="workspace2_2" style="padding: 0; margin: 0; cursor: pointer;">
								<li class="workspace2_2" value="0">솔루션.SI.ERP.CRM</li>
								<li class="workspace2_2" value="1">웹에이전시</li>
								<li class="workspace2_2" value="2">쇼핑몰.오픈마켓</li>
								<li class="workspace2_2" value="3">포털.인터넷.컨텐츠</li>
								<li class="workspace2_2" value="4">네트워크.통신.모바일</li>
								<li class="workspace2_2" value="5">하드웨어.장비</li>
								<li class="workspace2_2" value="6">정보보안.백신</li>
								<li class="workspace2_2" value="7">IT컨설팅</li>
								<li class="workspace2_2" value="8">게임</li>
							</ul>
							<ul id="workspace2_3" style="padding: 0; margin: 0; cursor: pointer;">
								<li class="workspace2_3" value="0">은행.금융.저축</li>
								<li class="workspace2_3" value="1">대출.캐피탈.여신</li>
								<li class="workspace2_3" value="2">기타금융</li>
								<li class="workspace2_3" value="3">증권.보험.카드</li>
							</ul>
							<ul id="workspace2_4" style="padding: 0; margin: 0; cursor: pointer;">
								<li class="workspace2_4" value="0">신문.잡지.언론사</li>
								<li class="workspace2_4" value="1">방송사.케이블</li>
								<li class="workspace2_4" value="2">연예.엔터테인먼트</li>
								<li class="workspace2_4" value="3">광고.홍보.전시</li>
								<li class="workspace2_4" value="4">영화.배급.음악</li>
								<li class="workspace2_4" value="5">공연.예술.문화</li>
								<li class="workspace2_4" value="6">출판.인쇄.사진</li>
								<li class="workspace2_4" value="7">캐릭터.애니메이션</li>
								<li class="workspace2_4" value="8">디자인.설계</li>
							</ul>
							<ul id="workspace2_5" style="padding: 0; margin: 0; cursor: pointer;">
								<li class="workspace2_5" value="0">초증고.대학</li>
								<li class="workspace2_5" value="1">학원.어학원</li>
								<li class="workspace2_5" value="2">유아.유치원</li>
								<li class="workspace2_5" value="3">교재.학습지</li>
								<li class="workspace2_5" value="4">전문.기능학원</li>
							</ul>
							<ul id="workspace2_6" style="padding: 0; margin: 0; cursor: pointer;">
								<li class="workspace2_6" value="0">의료(진료과목별)</li>
								<li class="workspace2_6" value="1">의료(병원종류별)</li>
								<li class="workspace2_6" value="2">제약.보건.바이오</li>
								<li class="workspace2_6" value="3">사회복지</li>
							</ul>
							<ul id="workspace2_7" style="padding: 0; margin: 0; cursor: pointer;">
								<li class="workspace2_7" value="0">판매(매장종류별)</li>
								<li class="workspace2_7" value="1">판매(상품품목별)</li>
								<li class="workspace2_7" value="2">유통.무역.상사</li>
								<li class="workspace2_7" value="3">운송.운수.물류</li>
							</ul>
							<ul id="workspace2_8" style="padding: 0; margin: 0; cursor: pointer;">
								<li class="workspace2_8" value="0">건설.건축.토목.시공</li>
								<li class="workspace2_8" value="1">실내.인테리어.조경</li>
								<li class="workspace2_8" value="2">환경.설비</li>
								<li class="workspace2_8" value="3">부동산.임대.중개</li>
							</ul>
							<ul id="workspace2_9" style="padding: 0; margin: 0; cursor: pointer;">
								<li class="workspace2_9" value="0">정부.공공기관.공기업</li>
								<li class="workspace2_9" value="1">협회.단체</li>
								<li class="workspace2_9" value="2">법률.법무.특허</li>
								<li class="workspace2_9" value="3">세무.회계</li>
								<li class="workspace2_9" value="4">연구소.컨설팅.조사</li>
							</ul>
						</div>
					</td>
					<td>
						<div style="padding: 0; height: 150px; border: 1px solid lightgray; overflow-y: scroll; overflow-x: hidden;">
							<ul id="workspace3_0_0" style="padding: 0; margin: 0;">
								<li><input id="_worksapce_0" name="workspace3" type="checkbox" value="호텔">호텔</li>
								<li><input id="_worksapce_1" name="workspace3" type="checkbox" value="콘도">콘도</li>
								<li><input id="_worksapce_2" name="workspace3" type="checkbox" value="카지노">카지노</li>
								<li><input id="_worksapce_3" name="workspace3" type="checkbox" value="여행사">여행사</li>
								<li><input id="_worksapce_4" name="workspace3" type="checkbox" value="항공사">항공사</li>
								<li><input id="_worksapce_5" name="workspace3" type="checkbox" value="관광">관광</li>
								<li><input id="_worksapce_6" name="workspace3" type="checkbox" value="관광통역">관광통역</li>
								<li><input id="_worksapce_7" name="workspace3" type="checkbox" value="면세점">면세점</li>
								<li><input id="_worksapce_8" name="workspace3" type="checkbox" value="유학.이민">유학.이민</li>
							</ul>
							<ul id="workspace3_0_1" style="padding: 0; margin: 0;">
								<li><input id="_worksapce_9" name="workspace3" type="checkbox" value="음식료">음식료</li>
								<li><input id="_worksapce_10" name="workspace3" type="checkbox" value="식품.푸드">식품.푸드</li>
								<li><input id="_worksapce_11" name="workspace3" type="checkbox" value="한식당">한식당</li>
								<li><input id="_worksapce_12" name="workspace3" type="checkbox" value="일식당">일식당</li>
								<li><input id="_worksapce_13" name="workspace3" type="checkbox" value="양식당">양식당</li>
								<li><input id="_worksapce_14" name="workspace3" type="checkbox" value="중식당">중식당</li>
								<li><input id="_worksapce_15" name="workspace3" type="checkbox" value="제과제빵점">제과제빵점</li>
								<li><input id="_worksapce_16" name="workspace3" type="checkbox" value="출장요리">출장요리</li>
								<li><input id="_worksapce_17" name="workspace3" type="checkbox" value="케이터링">케이터링</li>
								<li><input id="_worksapce_18" name="workspace3" type="checkbox" value="프랜차이즈">프랜차이즈</li>
								<li><input id="_worksapce_19" name="workspace3" type="checkbox" value="횟집.초밥.스시">횟집.초밥.스시</li>
								<li><input id="_worksapce_20" name="workspace3" type="checkbox" value="뷔페">뷔페</li>
								<li><input id="_worksapce_21" name="workspace3" type="checkbox" value="퓨전푸드">퓨전푸드</li>
								<li><input id="_worksapce_22" name="workspace3" type="checkbox" value="구내식당">구내식당</li>
							</ul>
							<ul id="workspace3_1_0" style="padding: 0; margin: 0;">
								<li><input id="_worksapce_23" name="workspace3" type="checkbox" value="Micom">Micom</li>
								<li><input id="_worksapce_24" name="workspace3" type="checkbox" value="기구설계">기구설계
								<li><input id="_worksapce_25" name="workspace3" type="checkbox" value="Microprocessor">Microprocessor
								<li><input id="_worksapce_26" name="workspace3" type="checkbox" value="SMT">SMT
								<li><input id="_worksapce_27" name="workspace3" type="checkbox" value="전기">전기
								<li><input id="_worksapce_28" name="workspace3" type="checkbox" value="회로설계">회로설계
								<li><input id="_worksapce_29" name="workspace3" type="checkbox" value="전기설비">전기설비
								<li><input id="_worksapce_30" name="workspace3" type="checkbox" value="전기설계">전기설계
								<li><input id="_worksapce_31" name="workspace3" type="checkbox" value="전기기술">전기기술
								<li><input id="_worksapce_32" name="workspace3" type="checkbox" value="전기공사">전기공사
								<li><input id="_worksapce_33" name="workspace3" type="checkbox" value="자동제어">자동제어
								<li><input id="_worksapce_34" name="workspace3" type="checkbox" value="PLC">PLC
								<li><input id="_worksapce_35" name="workspace3" type="checkbox" value="전자">전자
								<li><input id="_worksapce_36" name="workspace3" type="checkbox" value="RF">RF
								<li><input id="_worksapce_37" name="workspace3" type="checkbox" value="SEM.TEM">SEM.TEM
								<li><input id="_worksapce_38" name="workspace3" type="checkbox" value="Hardware">Hardware
								<li><input id="_worksapce_39" name="workspace3" type="checkbox" value="Firmware">Firmware
								<li><input id="_worksapce_40" name="workspace3" type="checkbox" value="HMI.MMI">"HMI.MMI"
								<li><input id="_worksapce_41" name="workspace3" type="checkbox" value="가전제품">가전제품
							</ul>
						</div>
					</td>
				</tr>
			</table>
			<a id="workspaceDivCancel" href="#">닫기X</a>
			<br>
		</div>
	</div>
</form>
</div>
</body>
</html>
