<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근무조건폼</title>
<style type="text/css">
	@import url('./css/conditionWriteForm.css');
</style>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=289fc6538397e54215bb3d26d1485e7e&libraries=services"></script>
<script type="text/javascript">
	$(function() {
		
		$("#conditionPopUp").hide();
		$("#conditionBA").click(function() {
			$("#conditionPopUp").toggle();
			return false;
		});
		
		$("#workspace2_0").hide();
		$("#workspace2_1").hide();
		
		$("#workspace3_0_0").hide();
		$("#workspace3_0_1").hide();
		
		$(".workspace1").click(function() {
			switch($(this).val()) {
			case 0: $("#workspace2_1").hide(); $("#workspace2_0").show(); 
					$(".workspace2_0").click(function() {
						switch($(this).val()) {
						case 0: $("#workspace3_0_1").hide(); $("#workspace3_0_0").show(); break;
						case 1: $("#workspace3_0_0").hide(); $("#workspace3_0_1").show(); break;
						}
					});
					break;
			case 1: $("#workspace2_0").hide(); $("#workspace2_1").show(); break;
			}
		});
///////////// 업종부분해야함 ㅜㅜ	
////////////////////////// 3개이상 선택 못하는 거 
		var conditionWorkspaceCnt = 0;
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
					li.addClass("conditionBusinessInputLi").css("width", "100px");
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
			alert($("#conditionBusinessInputDiv > ul > li").val());
			$("#conditionPopUp").hide();
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
		            //document.getElementById("addrSecond").value = data.buildingName;
		            //document.getElementById("sample5_address").value = fullAddr;
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
		                    marker.setPosition(coords)
		                }
		            });
		        }
		    }).open();
		});
	
//////////////////////////////////////////////map 끝///////////////

		$("#conditionNextButton").click(function() {
			alert($("input[name='workspace3']:checked"));
		});

	});
</script>
</head>
<body>
<form action="conditionWriteFormNext.do" method="POST" name="timeWriteForm">
	<div id="conditionWrap">
		<input id="rm_Seq" type="hidden">
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
						<select id="conditionPayDiv">
							<option>급여를 선택하세요</option>
							<option>1,400 만원 이하</option><option>1,400~1,600만원</option><option>1,600~1,800만원</option>
							<option>1,800~2,000만원</option><option>2,000~2,200만원</option><option>2,200~2,400만원</option>
							<option>2,400~2,600만원</option><option>2,600~2,800만원</option><option>2,800~3,000만원</option>
							<option>3,000~3,200만원</option><option>3,200~3,400만원</option><option>3,400~3,600만원</option>
							<option>3,600~3,800만원</option><option>3,800~4,000만원</option><option>4,000~5,000만원</option>
							<option>5,000~6,000만원</option><option>6,000~7,000만원</option><option>7,000~8,000만원</option>
							<option>8,000~9,000만원</option><option>9,000~1억원</option><option>1억원 이상</option><option>면접 후 결정</option>
							<option>회사 내규에 따름</option>
						</select>
					<!-- <input id="conditionPayValue" type="text"> 만원 -->
					<div id="conditionPayHidden"><p id="conditionExtraPayLabel">기타 급여/수당</p></div>
					<div id="conditionExtraPayDiv"><input id="conditionExtraPay" type="text"></div>
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
					<input id="addrFirst" type="text">
					<!-- <input id="addrSecond" type="text"> -->
					<input id="addrButton" type="button" onclick="sample5_execDaumPostcode()" value="위치확인">
					<br><br>
					<div id="conditionAddrMap">
						<h4>위치/지도 확인&nbsp;&nbsp;|&nbsp;&nbsp;</h4><span>하잉</span>
						<br>
						<div id="conditionAddrMapValue"></div>
					</div>
					<script>
					    
					</script>
					<br>
				</div>
				<div id="conditionWorkspaceOut">
					<div id="conditionWorkspaceOutSelect">
						<select>
							<option>국가선택</option>
							<option>가나</option>
							<option>가봉</option>
							<option>가이아나</option>
							<option>감비아</option>
							<option>과델루프</option>
							<option>과테말라</option>
							<option>괌</option>
							<option>그라나다</option>
							<option>그루지아</option>
							<option>그리스</option>
							<option>그린란드</option>
							<option>기니</option>
							<option>기니비소우</option>
							<option>기아나(프랑스령)</option>
							<option>나미비아</option>
							<option>나우루공화국</option>
							<option>나이지리아</option>
							<option>남미기타</option>
							<option>남아프리카공화국</option>
							<option>네덜란드</option>
							<option>네덜란드령 안틸레스제도</option>
							<option>네팔</option>
							<option>노르웨이</option>
							<option>뉴질랜드</option>
							<option>뉴칼레도니아섬</option>
							<option>니제르</option>
							<option>니카라과</option>
							<option>대만</option>
							<option>덴마크</option>
							<option>도미니카공화국</option>
							<option>도미니카연방</option>
							<option>독일</option>
							<option>동티모르</option>
							<option>라오스</option>
							<option>라이베리아</option>
							<option>라트비아</option>
							<option>러시아</option>
							<option>레뉴니용</option>
							<option>레바논</option>
							<option>루마니아</option>
							<option>룩셈부르크</option>
							<option>르완다</option>
							<option>리비아</option>
							<option>리투아니아</option>
							<option>리히텐슈타인</option>
							<option>마다가스카르</option>
							<option>마르티니크섬</option>
							<option>마샬군도</option>
							<option>마케도니아</option>
							<option>말라위</option>
							<option>말레이시아</option>
							<option>말리</option>
							<option>멕시코</option>
							<option>모나코</option>
							<option>모로코</option>
							<option>모리셔스</option>						
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
					<select id="conditionWeekSelect">
						<option>선택</option>
						<option>주 5일(월~금)</option>
						<option>토요일 격주휴무(월~토)</option>
						<option>주 6일(월~토)</option>
						<option>주 3일(격일제)</option>
						<option>탄력적근무제</option>
						<option>2교대</option>
						<option>3교대</option>
						<option>4교대</option>
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
					<select id="conditionTimeSelect">
						<option>선택</option>
						<option>오전 9시~오후 6시</option>
						<option>오전 8시 30분~오후 5시 30분</option>
						<option>오전 10시~오후 7시</option>
						<option>탄력적근무제</option>
					</select>
				</div>
			</div>
		</div>
		<div id="conditionNextButtonDiv">
			<button id="conditionNextButton" type="button">다음</button>
		</div>
		
		<br style="clear: both;">
		</div>		
		<div id="conditionPopUp">
			<div id="conditionCategoryTitle"><h3>업종 카테고리 선택</h3></div>
			<hr>
			<table>
				<tr>
					<td style="width: 200px;">업종 분류</td>
					<td style="width: 200px;">업종</td>
					<td style="width: 200px;">상세 업종</td>
				</tr>
				<tr>
					<td>
						<div style="padding: 0; height: 150px; border: 1px solid lightgray; overflow-y: scroll; overflow-x: hidden;">
							<ul style="padding: 0; margin: 0;">
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
							<ul id="workspace2_0" style="padding: 0; margin: 0;">
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
							<ul id="workspace2_1" style="padding: 0; margin: 0;">
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
						</div>
					</td>
					<td>
						<input id="RMC_business3" type="text">
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
						</div>
					</td>
				</tr>
			</table>
			<a id="workspaceDivCancel" href="#">닫기x</a>
		</div>
	</div>
</form>
</body>
</html>