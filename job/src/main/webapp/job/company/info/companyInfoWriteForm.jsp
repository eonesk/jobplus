<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/companyInfo.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
var modify = ${modify};
	/* 다음지도 */
	$(function() { 
		var cpm_id = $('input:hidden[class="Main_CPM_id"]').val();
		var m_id = $('input:hidden[class="Main_M_id"]').val();
		
		
		/* 로그인/로그아웃화면 처리 */ 
		if(!m_id && !cpm_id){
			document.getElementById("logout").style.display = "none";	
			document.getElementById("login").style.display = "inline";
		}else{
			document.getElementById("logout").style.display = "inline";	
			document.getElementById("login").style.display = "none";
		}
		
		/* 이력서 등록 버튼 */
		$("#job_main1").on("click", function() {
			if(!m_id){
				alert("회원로그인상태에서만 접근가능합니다.");
			}else {
				location.href = "/job/resume/resume/resumeAdminBody.jsp";
			}
		});
		
		/* 공고 등록 버튼 */
		$("#job_main2").on("click", function() {
			if(!cpm_id){
				alert("기업로그인상태에서만 접근가능합니다.");
			}else {
				location.href = "/job/main/jobmain.jsp";
			}
		});
		
		/* 로그아웃 버튼 */
		$("#logout").on("click", function() {	
			location.href = "/job/main/logout.jsp";
		});
		
		/* 메인에 있는 기업정보 클릭이벤트 (div버튼)  */
		$("#main_Tbutton1").on("click", function() {
			window.open("/job/main/rmViewForm.do", "", "width=1000px height=900px");
		});
		
		$("#map_open").on("click", function() {
			var title = "기업 위치 확인";
			var location = $("#cpi_Address").val();
			var cw=720;
			var ch=600;
			var sw = screen.availWidth;
			var sh = screen.availHeight;
			var px=(sw-cw)/2;
			var	py=(sh-ch)/2;
			window.open("/job/job/company/info/daumMap.jsp?location="+location+"&title="+title, "지도", 'left='+px+',top='+py+',width='+cw+',height='+ch+',toolbar=no,menubar=no,status=no,scrollbars=no,resizable=no');
		});
		
		$("#cpi_TypeBtn").on("click", function() {
			$("#cpi_Type_div").show();
		});
		
		$("#cpi_Type_item_x").on("click", function() {
			$("#cpi_Type_div").hide();
		});
		$("#cpi_Type_item_cancle").on("click", function() {
			$("#cpi_Type_div").hide();
		});
		
		$("#cpi_Type1cancle").on("click", function() {
			$("input:radio[name=cpi_Type1]").prop("checked", false);
		});
		
		$("#cpi_Type_item_write").on("click", function() {
			var cpi_Type = "";
			var cpi_Type_font = "";
			if($("input:radio[name=cpi_Type1]").is(':checked')){
				cpi_Type_font += $("input:radio[name='cpi_Type1']:checked").val();
				cpi_Type += $("input:radio[name='cpi_Type1']:checked").val();
				cpi_Type_font += "<br>";
				cpi_Type += ",";
			}
			for(var i=2; i<7; i++){
				if($("input:checkbox[name=cpi_Type"+ i + "]").is(':checked')){
					cpi_Type_font += $("input:checkbox[name='cpi_Type" + i +"']:checked").val();
					cpi_Type += $("input:radio[name='cpi_Type1']:checked").val();
					cpi_Type_font += "<br>";
					cpi_Type += ",";
				}
			}
			
			$("#cpi_Type").val(cpi_Type);
			$("#cpi_Type_font").html(cpi_Type_font);
			$("#cpi_Type_div").hide();
		});
		
		if($("#cpm_InfoTime").val() == "1년"){
			$("#cpm_InfoTime_1year").prop("checked", true);
		}else if($("#cpm_InfoTime").val() == "3년"){
			$("#cpm_InfoTime_3year").prop("checked", true);
		}else if($("#cpm_InfoTime").val() == "5년"){
			$("#cpm_InfoTime_5year").prop("checked", true);
		}else{
			$("#cpm_InfoTime_out").prop("checked", true);
		}
		
		$("#companyInfoWriteBtn").on("click", function() {
			if($("#cpi_Pname").val() == ""){
				alert("인사담당자 성함 입력은 필수 사항입니다.");
				$("#cpi_Pname").focus();
				return false;
			}else if($("#cpi_Pphone").val() == ""){
				alert("인사담당자 휴대폰번호 입력은 필수 사항입니다.");
				$("#cpi_Pphone").focus();
				return false;
			}else if($("#cpi_Pemail").val() == ""){
				alert("인사담당자 이메일 입력은 필수 사항입니다.");
				$("#cpi_Pemail").focus();
				return false;
			}else if($("#cpm_Companyname").val() == ""){
				alert("기업명 입력은 필수 사항입니다.");
				$("#cpm_Companyname").focus();
				return false;
			}else if($("#cpm_Firstname").val() == ""){
				alert("대표자명 입력은 필수 사항입니다.");
				$("#cpm_Firstname").focus();
				return false;
			}else if($("#cpi_Industry").val() == ""){
				alert("업종 입력은 필수 사항입니다.");
				$("#cpi_Industry").focus();
				return false;
			}else if($("#cpi_Address").val() == ""){
				alert("회사주소 입력은 필수 사항입니다.");
				$("#cpi_Address").focus();
				return false;
			}else if($("#cpi_Tel").val() == ""){
				alert("대표전화 입력은 필수 사항입니다.");
				$("#cpi_Tel").focus();
				return false;
			}else{
				var cpm_Id = $("#cpm_Id").val();
				var cpi_Pname = $("#cpi_Pname").val();
				var cpi_Pphone = $("#cpi_Pphone").val();
				var cpi_Pemail = $("#cpi_Pemail").val();
				var cpi_Companyname = $("#cpm_Companyname").val();
				var cpi_Firstname = $("#cpm_Firstname").val();
				var cpi_Industry = $("#cpi_Industry").val();
				var cpi_Content = $("#cpi_Content").val();
				var cpi_Brand = $("#cpi_Brand").val();
				var cpi_Address = $("#cpi_Address").val();
				var cpi_Type = $("#cpi_Type").val();
				var cpi_Birth = $("#cpi_Birth").val();
				var cpi_Homepage = $("#cpi_Homepage").val();
				var cpi_Blog = $("#cpi_Blog").val();
				var cpi_Sns1 = $("#cpi_Sns1").val();
				var cpi_Sns2 = $("#cpi_Sns2").val();
				var cpi_Sns3 = $("#cpi_Sns3").val();
				var cpi_Tel = $("#cpi_Tel").val();
				var cpi_Moneyyear = $("#cpi_Moneyyear").val();
				var cpi_Moneybase = $("#cpi_Moneybase").val();
				var cpi_Moneysell = $("#cpi_Moneysell").val();
				var cpi_Moneygain = $("#cpi_Moneygain").val();
				var cpl_Seq = $("#cpl__Seq").val();
				var cpi_Vision = $("#cpi_Vision").val();
				var cpi_History = $("#cpi_History").val();
				var cpi_Welfare = $("#cpi_Welfare").val();
				var cpi_Cafe = $("#cpi_Cafe").val();
				var cpi_Etc = $("#cpi_Etc").val();
				
				var allData = {
						"cpm_Id" : cpm_Id,
						"cpi_Pname" : cpi_Pname,
						"cpi_Pphone" : cpi_Pphone,
						"cpi_Pemail" : cpi_Pemail,
						"cpi_Companyname" : cpi_Companyname,
						"cpi_Firstname" : cpi_Firstname,
						"cpi_Industry" : cpi_Industry,
						"cpi_Content" : cpi_Content,
						"cpi_Brand" : cpi_Brand,
						"cpi_Address" : cpi_Address,
						"cpi_Type" : cpi_Type,
						"cpi_Birth" : cpi_Birth,
						"cpi_Homepage" : cpi_Homepage,
						"cpi_Blog" : cpi_Blog,
						"cpi_Sns1" : cpi_Sns1,
						"cpi_Sns2" : cpi_Sns2,
						"cpi_Sns3" : cpi_Sns3,
						"cpi_Tel" : cpi_Tel,
						"cpi_Moneyyear" : cpi_Moneyyear,
						"cpi_Moneybase" : cpi_Moneybase,
						"cpi_Moneysell" : cpi_Moneysell,
						"cpi_Moneygain" : cpi_Moneygain,
						"cpl_Seq" : cpl_Seq,
						"cpi_Vision" : cpi_Vision,
						"cpi_History" : cpi_History,
						"cpi_Welfare" : cpi_Welfare,
						"cpi_Cafe" : cpi_Cafe,
						"cpi_Etc" : cpi_Etc
				};
				
				if(modify){
					ajaxUrl = 'companyInfoModify.do';
				}else{
					ajaxUrl = 'companyInfoWrite.do';
				}
				
				$.ajax({
					url: ajaxUrl,
					type: 'post',
					data: allData,
					timeout: 30000,
					cache: false,
					success: function(data) {
						if(data>0){
							if(modify){
								alert("기업정보가 수정되었습니다.");	
							}else{
								alert("기업정보가 저장되었습니다.");	
								modify=true;
							}
						}else{
							alert("기업정보 저장에 실패했습니다. 다시 시도해주세요.");
						}
						
						$("#companyInfoWriteBtn").off("click", this);
					},
					error: function() {
						alert("통신 중 장애가 발생했습니다! 잠시 후 다시 시도해주세요.");
						$("#companyInfoWriteBtn").off("click", this);
					}
				});
			}
			
			
		});
	});
</script>
</head>
<body>
<input type="hidden" id="Main_CPM_id" class="Main_CPM_id" value="${sessionScope.cpm_id}">
<input type="hidden" id="Main_M_id" class="Main_M_id" value="${sessionScope.m_id}">
<header id="header">
			<div class="inner">
				<div class="user_info" id="user_info">
					<div class="login" id="login" style="display: inline;">					
						<a href="/job/main/mLoginForm.jsp" class="#user_corp_popup" id="corp_name">로그인</a>
						<!-- 
						<a href="../main/cLoginForm.jsp" class="#user_corp_popup" id="corp_name">기업로그인</a>
						 -->
						<a href="/job/job/member/joinForm.jsp" class="#user_corp_popup" id="corp_name">회원가입</a>
					</div>
					<div class="logout" id="logout" style="display: none;">	
						<input type="button" class="#user_corp_popup" id="corp_name" value="로그아웃" style="background-color: white; border: 1px solid #A9BCF5; cursor: pointer;">
					</div>
				</div>				
				<div class="area_logo">
					<div class="title_logo">
						<a href="/job/main/main.jsp" id="goMain" style="font-size: 36px; color: #5882FA; font-weight: bold; text-decoration: none; margin-left: 0px;">JOBPLUS</a>
					</div>
				</div>
				<nav id="gnb" class="gnb">
					<ul class="list_gnb"> <!-- href="../main/jobmain.jsp" -->													
						<li><input type="button" id="job_main1" class="job_main_btn" value="이력서작성"></li>																	
						<li><input type="button" id="job_main2" class="job_main_btn" value="공고등록"></li>					
						<li><a href="#">공고/지원자관리</a></li>	
						<li><a href="http://www.saramin.co.kr/zf_user/talent/search">인재검색</a></li>
						<li><a href="https://www.saramin.co.kr/zf_user/auth?ut=c&url=%2Fzf_user%2Fmemcom%2Ftalent-manage%2Fscrap-talent">인재관리</a></li>
					</ul>
					<ul class="list_gnb pos_right">
						<li><a href="http://www.saramin.co.kr/zf_user/service/company/order">채용상품안내</a></li>
						<li><a href="http://www.saramin.co.kr/zf_user/service/company/order?part_id=talent_search">인재상품안내</a></li>
						<li><a href="https://www.saramin.co.kr/zf_user/auth?m_code=16&ut=c&url=%2Fzf_user%2Fmemcom%2Fservice-manage%2Fpayment-history">결제내역</a></li>
					</ul>
				</nav>
			</div>
			<div class="box_withshadow" style="border-bottom: 1px solid rgb(220, 220, 220);"></div>
		</header>
<div id="companyContent">
<input type="hidden" id="cpm_Id" value="">
	<h1>기업정보 관리</h1>
	<h4 class="h4 CPM_companyName"><font class="font CPM_companyName">${sessionScope.cpm_id }</font>님, 안녕하세요</h4>
	<div class="div companyMember">
		<p class="p companyMember">계정 정보</p>
		<table class="table companyMember">
			<tr>
				<th>&nbsp;아이디</th>
				<td>${sessionScope.cpm_id }</td>
			</tr>
			<tr>
				<th>&nbsp;사업자등록번호</th>
				<td>${companyMemberDTO.cpm_num }</td>
			</tr>
			<tr>
				<th><font class="must">*</font>기업구분</th>
				<td>${companyMemberDTO.cpm_type }</td>
			</tr>
			<tr>
				<th>&nbsp;개인정보보유기간</th>
				<td>
					<input type="hidden" id="cpm_InfoTime" value="${companyMemberDTO.cpm_infotime }">
					<input type="radio" value="1년" id="cpm_InfoTime_1year" name="cpm_InfoTime"><label for="cpm_InfoTime_1year">1년</label>
					<input type="radio" value="3년" id="cpm_InfoTime_3year" name="cpm_InfoTime"><label for="cpm_InfoTime_3year">3년</label>
					<input type="radio" value="5년" id="cpm_InfoTime_5year" name="cpm_InfoTime"><label for="cpm_InfoTime_5year">5년</label>
					<input type="radio" value="탈퇴시 삭제" id="cpm_InfoTime_out" name="cpm_InfoTime"><label for="cpm_InfoTime_out">탈퇴시 삭제</label>
				</td>
			</tr>
		</table>
	</div>
	<div class="div RM_personnel">
	<p class="p RM_personnel">인사담당자 정보</p>
		<table class="table RM_personnel">
			<tr>
				<th><font class="must">*</font>담당자</th>
				<td><input type="text" value="${companyInfoDTO.cpi_Pname }" size="20" id="cpi_Pname" name="cpi_Pname"></td>
			</tr>
			<tr>
				<th><font class="must">*</font>휴대폰번호</th>
				<td><input type="text" value="${companyInfoDTO.cpi_Pphone }" size="20" id="cpi_Pphone" name="cpi_Pphone"></td>
			</tr>
			<tr>
				<th><font class="must">*</font>이메일</th>
				<td><input type="text" value="${companyInfoDTO.cpi_Pemail }" size="40" id="cpi_Pemail" name="cpi_Pemail"></td>
			</tr>
		</table>
	</div>
	<div class="div companyInfo">
	<p class="p companyInfo">기업정보 정보</p>
		<table class="companyInfoTable">
			<tr>
				<th class="lineTh"><font class="must">*</font>기업명</th>
				<td colspan="4"><input type="text" value="${companyInfoDTO.cpi_Companyname }" name="cpm_Companyname" id="cpm_Companyname"></td>
			</tr>
			<tr>
				<th class="lineTh"><font class="must">*</font>대표자명</th>
				<td colspan="4"><input type="text" value="${companyInfoDTO.cpi_Firstname }" name="cpm_Firstname" id="cpm_Firstname"></td>
			</tr>
			<tr>
				<th class="lineTh"><font class="must">*</font>업종</th>
				<td colspan="4"><input type="text" value="${companyInfoDTO.cpi_Industry }" name="cpi_Industry" id="cpi_Industry" size="60"></td>
			</tr>
			<tr>
				<th class="lineTh">&nbsp;사업내용</th>
				<td colspan="4"><input type="text" value="${companyInfoDTO.cpi_Content }" name="cpi_Content" id="cpi_Content" size="60"></td>
			</tr> 
			<tr>
				<th class="lineTh">&nbsp;브랜드명</th>
				<td colspan="4"><input type="text" value="${companyInfoDTO.cpi_Brand }" name="cpi_Brand" id="cpi_Brand" size="60"></td>
			</tr>
			<tr>
				<th class="lineTh"><font class="must">*</font>회사주소</th>
				<td colspan="4"><input type="text" value="${companyInfoDTO.cpi_Address }" name="cpi_Address" id="cpi_Address" size="60">
					<input type="button" value="지도보기" class="button" id="map_open">
				</td>
			</tr>
			<tr>
				<th class="lineTh">&nbsp;기업형태</th>
				<td colspan="4">
					<div class="cpi_Type_div" id="cpi_Type_div">
						<div class="cpi_Type_item">
							<div class="header">
								<font>기업형태 수정</font><input type="button" value="X" id="cpi_Type_item_x">
							</div>
							<div class="content">
								<table class="table">
									<tr>
										<th>외국계기업</th>
										<td>
											<input type="radio" value="외국인 투자기업" id="cpi_Type1-1" name="cpi_Type1"><label for="cpi_Type1-1">외국인 투자기업</label>
											<input type="radio" value="외국 법인기업" id="cpi_Type1-2" name="cpi_Type1"><label for="cpi_Type1-2">외국 법인기업</label>
											<input type="button" value="선택해제" id="cpi_Type1cancle">
										</td>
									</tr>
									<tr>
										<th>법률적 구분</th>
										<td>
											<input type="checkbox" value="주식회사" id="cpi_Type2-1" name="cpi_Type2"><label for="cpi_Type2-1">주식회사</label>
											<input type="checkbox" value="유한회사" id="cpi_Type2-2" name="cpi_Type2"><label for="cpi_Type2-2">유한회사</label>
											<input type="checkbox" value="협동조합" id="cpi_Type2-3" name="cpi_Type2"><label for="cpi_Type2-3">협동조합</label>
										</td>
									</tr>
									<tr>
										<th>법인구분</th>
										<td>
											<input type="checkbox" value="사단법인" id="cpi_Type3-1" name="cpi_Type3"><label for="cpi_Type3-1">사단법인</label>
											<input type="checkbox" value="재단법인" id="cpi_Type3-2" name="cpi_Type3"><label for="cpi_Type3-2">재단법인</label>
											<input type="checkbox" value="외부감사법인" id="cpi_Type3-3" name="cpi_Type3"><label for="cpi_Type3-3">외부감사법인</label>										
										</td>
									</tr>
									<tr>	
										<th>회사형태</th>
										<td>
											<input type="checkbox" value="공사/공기업" id="cpi_Type4-1" name="cpi_Type4"><label for="cpi_Type4-1">공사/공기업</label>
											<input type="checkbox" value="학교/교육기관" id="cpi_Type4-2" name="cpi_Type4"><label for="cpi_Type4-2">학교/교육기관</label>
											<input type="checkbox" value="금융기관" id="cpi_Type4-3" name="cpi_Type4"><label for="cpi_Type4-3">금융기관</label><br>
											<input type="checkbox" value="병원/의료기관" id="cpi_Type4-4" name="cpi_Type4"><label for="cpi_Type4-4">병원/의료기관</label>
											<input type="checkbox" value="연구소" id="cpi_Type4-5" name="cpi_Type4"><label for="cpi_Type4-5">연구소</label>
											<input type="checkbox" value="사회복지기관" id="cpi_Type4-6" name="cpi_Type4"><label for="cpi_Type4-6">사회복지기관</label><br>
											<input type="checkbox" value="비영리단체/협회" id="cpi_Type4-7" name="cpi_Type4"><label for="cpi_Type4-7">비영리단체/협회</label>
										</td>
									</tr>
									<tr>
										<th>인증업체</th>
										<td>
											<input type="checkbox" value="병역특례 인증업체" id="cpi_Type5-1" name="cpi_Type5"><label for="cpi_Type5-1">병역특례 인증업체</label>
										</td>
									</tr>
									<tr>	
										<th>수출여부</th>
										<td>
											<input type="checkbox" value="수출입 기업" id="cpi_Type6-1" name="cpi_Type6"><label for="cpi_Type6-1">수출입 기업</label>
										</td>
									</tr>
								</table>
								<div id="cpi_Type_item_underBtn">
									<input type="button" value="수정" id="cpi_Type_item_write" class="button">
									<input type="button" value="취소" id="cpi_Type_item_cancle">
								</div>
							</div>
						</div>
					</div>
				<input type="button" value="수정" class="button" id="cpi_TypeBtn"><br>
				<input type="hidden" value="${companyInfoDTO.cpi_Type }" name="cpi_Type" id="cpi_Type" size="60">
				<font id="cpi_Type_font">${companyInfoDTO.cpi_Type }</font>
				</td>
			</tr>
			<tr>
				<th class="lineTh">&nbsp;설립일</th>
				<td colspan="4"><input type="date" value="${cpi_Birth }" name="cpi_Birth" id="cpi_Birth" ></td>
			</tr>
			<tr>
				<th class="lineTh">&nbsp;홈페이지</th>
				<td colspan="4"><input type="text" value="${companyInfoDTO.cpi_Homepage }" name="cpi_Homepage" id="cpi_Homepage" size="60"></td>
			</tr>
			<tr>
				<th class="lineTh">&nbsp;블로그</th>
				<td colspan="4"><input type="text" value="${companyInfoDTO.cpi_Blog }" name="cpi_Blog" id="cpi_Blog" size="60"></td>
			</tr>
			<tr>
				<th class="lineTh">&nbsp;기업SNS</th>
				<td colspan="4">
					<img src="./img/fb_icon.png">&nbsp;&nbsp;http://www.facebook.com/&nbsp;
					<input type="text" value="${companyInfoDTO.cpi_Sns1 }" name="cpi_Sns1" id="cpi_Sns1" size="21"><br>
					<img src="./img/tw_icon.png">&nbsp;&nbsp;http://www.twitter.com/&nbsp;
					<input type="text" value="${companyInfoDTO.cpi_Sns2 }" name="cpi_Sns2" id="cpi_Sns2" size="24"><br>
					<img src="./img/me_icon.png">&nbsp;
					<input type="text" value="${companyInfoDTO.cpi_Sns3 }" name="cpi_Sns3" id="cpi_Sns3" size=50>			
				</td>
			</tr>
			<tr>
				<th class="lineTh"><font class="must">*</font>대표전화</th>
				<td colspan="4"><input type="text" value="${companyInfoDTO.cpi_Tel }" name="cpi_Tel" id="cpi_Tel" size="30"></td>
			</tr>
			<tr>
				<th class="lineTh" rowspan="2">&nbsp;재무정보</th>
				<th class="innerThl">기준년도</th>
				<th class="innerThl">자본금<font class="10000">(만원)</font></th>
				<th class="innerThl">매출액<font class="10000">(만원)</font></th>
				<th class="innerTh">영업이익<font class="10000">(만원)</font></th>
			</tr>
			<tr>
				<td class="innerTd"><input type="number" class="money" value="${companyInfoDTO.cpi_Moneyyear }" name="cpi_Moneyyear" id="cpi_Moneyyear"></td>
				<td class="innerTd"><input type="number" class="money"  value="${companyInfoDTO.cpi_Moneybase }" name="cpi_Moneybase" id="cpi_Moneybase"></td>
				<td class="innerTd"><input type="number" class="money"  value="${companyInfoDTO.cpi_Moneysell }" name="cpi_Moneysell" id="cpi_Moneysell"></td>
				<td><input type="number" class="money"  value="${companyInfoDTO.cpi_Moneygain }" name="cpi_Moneygain" id="cpi_Moneygain"></td>
			</tr>
		</table>
	</div>
	<div class="div companyLogo">
		<p class="p companyInfo">로고</p>
 		<fieldset>
<!--
			<input type="button" value="등록" class="button" id="logo_btn" onclick="window.open('/job/job/company/logo/logoWriteForm.jsp','','width=460, height=300, left=100, top=50')">
			<div><img src="/job/job/company/logo/img/storage/${logoDTO.cpl_Name}" name="cpl_Seq" id="cpl_Seq"></div>
 -->		
 			<input type="hidden" id="cpl__Seq">
 			<jsp:include page="/job/company/logo/logoForm.jsp"></jsp:include>	
		</fieldset>

	</div>
	<div class="div CPI_vision">
		<p class="p companyInfo">개요 및 비전</p>
		<fieldset>
			<textarea rows="7" cols="115" name="cpi_Vision" id="cpi_Vision">${companyInfoDTO.cpi_Vision }</textarea>
		</fieldset>
	</div>
	<div class="div CPI_history">
		<p class="p companyInfo">연혁 및 실적</p>
		<fieldset>
			<textarea rows="7" cols="115" name="cpi_History" id="cpi_History">${companyInfoDTO.cpi_History }</textarea>
		</fieldset>
	</div>
	<div class="div CPI_welfare">
		<p class="p companyInfo">복리후생</p>
		<fieldset>
			<textarea rows="7" cols="115" name="cpi_Welfare" id="cpi_Welfare">${companyInfoDTO.cpi_Welfare }</textarea>
		</fieldset>
	</div>
	<div class="div CPI_cafe">
		<p class="p companyInfo">사내동호회</p>
		<fieldset>
			<textarea rows="7" cols="115" name="cpi_Cafe" id="cpi_Cafe">${companyInfoDTO.cpi_Cafe }</textarea>
		</fieldset>
	</div>
	<div class="div CPI_etc">
		<p class="p companyInfo">기타정보</p>
		<fieldset>
			<textarea rows="7" cols="115" name="cpi_Etc" id="cpi_Etc">${companyInfoDTO.cpi_Etc }</textarea>
		</fieldset>
	</div>
	<div class="buttonDiv">
		<input type="button" value="수정하기" class="writeBtn" id="companyInfoWriteBtn" style="margin-left: 340px;">
	</div>
</div>
	<footer id="sri_footer" class="sri_footer">
    		<div class="wrap_footer">
       			<div class="links">
   					<strong class="blind">바로가기</strong>
					<ul>
						<li class="first"><a href="#" rel="noopener" title="회사소개 새창열기">회사소개</a></li>
						<li><a href="#" target="_blank" rel="noopener" title="보도기사 새창열기">보도기사</a></li>
						<li><a href="#" target="_blank" rel="noopener" title="찾아오시는길 새창열기">찾아오시는길</a></li>
						<li><a href="#">회원약관</a></li>
						<li class="bold"><a href="#" title="개인정보처리방침 바로가기">개인정보처리방침</a></li>
						<li><a href="#" onclick="" rel="noopener" title="이메일무단수집거부 바로가기">이메일무단수집거부</a></li>
						<li><a href="#" target="_blank" rel="noopener" title="오픈API 새창열기">오픈API</a></li>
						<li><a href="#" title="사이트맵 바로가기">사이트맵</a></li>
						<li><a href="#" title="고객센터 바로가기">고객센터</a></li>
					</ul>
				</div>
				<div class="copyright">
    				<p>(주)KGITBANK,  서울특별시 구로구 디지털로34길 43(구로동) 201호, 대표 : 똘똘이<br>
    				사업자등록 : 123-45-67890, 통신판매업 : 제 1109호, Copyright (c) (주)KG. All rights reserved.</p>
				</div>
			</div>
		</footer>
</body>
</html>