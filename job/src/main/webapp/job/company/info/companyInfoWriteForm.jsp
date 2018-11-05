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
	$(function() {
		$("#map_open").on("click", function() {
			var title = "기업 위치 확인";
			var location = $("#CPI_address").val();
			var cw=720;
			var ch=600;
			var sw = screen.availWidth;
			var sh = screen.availHeight;
			var px=(sw-cw)/2;
			var	py=(sh-ch)/2;
			window.open("/job/job/company/info/daumMap.jsp?location="+location+"&title="+title, "지도", 'left='+px+',top='+py+',width='+cw+',height='+ch+',toolbar=no,menubar=no,status=no,scrollbars=no,resizable=no');
		});
	});
</script>
</head>
<body>
	<h1>기업정보 관리</h1>
	<h4 class="h4 CPM_companyName"><font class="font CPM_companyName">${companyMemberDTO.CPM_companyName }</font>님, 안녕하세요</h4>
	<div class="div companyMember">
		<p class="p companyMember">계정 정보</p>
		<table class="table companyMember">
			<tr>
				<th>&nbsp;아이디</th>
				<td>${sessionScope.comId }</td>
			</tr>
			<tr>
				<th>&nbsp;사업자등록번호</th>
				<td>${companyMemberDTO.CPM_num }</td>
			</tr>
			<tr>
				<th>&nbsp;기업인증</th>
				<td>${companyMemberDTO.CPM_confirm }</td>
			</tr>
			<tr>
				<th><font class="must">*</font>기업구분</th>
				<td>${companyMemberDTO.CPM_type }</td>
			</tr>
			<tr>
				<th>&nbsp;개인정보보유기간</th>
				<td>
					<input type="radio" value="1년" id="CPM_infoTime_1year" name="CPM_infoTime"><label for="CPM_infoTime_1year">1년</label>
					<input type="radio" value="3년" id="CPM_infoTime_3year" name="CPM_infoTime"><label for="CPM_infoTime_3year">3년</label>
					<input type="radio" value="5년" id="CPM_infoTime_5year" name="CPM_infoTime"><label for="CPM_infoTime_5year">5년</label>
					<input type="radio" value="탈퇴시 삭제" id="CPM_infoTime_out" name="CPM_infoTime"><label for="CPM_infoTime_out">탈퇴시 삭제</label>
				</td>
			</tr>
		</table>
	</div>
	<div class="div RM_personnel">
	<p class="p RM_personnel">인사담당자 정보</p>
		<table class="table RM_personnel">
			<tr>
				<th><font class="must">*</font>담당자</th>
				<td><input type="text" value="${RM_personnelDTO.RMP_name }" size="20"></td>
			</tr>
			<tr>
				<th><font class="must">*</font>휴대폰번호</th>
				<td><input type="text" value="${RM_personnelDTO.RMP_phone1 }" size="20"></td>
			</tr>
			<tr>
				<th><font class="must">*</font>이메일</th>
				<td><input type="text" value="${RM_personnelDTO.RMP_email }" size="40"></td>
			</tr>
		</table>
	</div>
	<div class="div companyInfo">
	<p class="p companyInfo">기업정보 정보</p>
		<table class="companyInfoTable">
			<tr>
				<th class="lineTh"><font class="must">*</font>기업명</th>
				<td colspan="4">${companyMemberDTO.CPM_companyName }</td>
			</tr>
			<tr>
				<th class="lineTh"><font class="must">*</font>대표자명</th>
				<td colspan="4">${companyMemberDTO.CPM_CEOName }</td>
			</tr>
			<tr>
				<th class="lineTh"><font class="must">*</font>업종</th>
				<td colspan="4"><input type="text" size="60"></td>
			</tr>
			<tr>
				<th class="lineTh">&nbsp;사업내용</th>
				<td colspan="4"><input type="text" value="${companyInfoDTO.CPI_businessContent }" size="60"></td>
			</tr> 
			<tr>
				<th class="lineTh">&nbsp;브랜드명</th>
				<td colspan="4"><input type="text" value="${companyInfoDTO.CPI_brandName }" size="60"></td>
			</tr>
			<tr>
				<th class="lineTh"><font class="must">*</font>회사주소</th>
				<td colspan="4"><input id="CPI_address" type="text" value="${companyInfoDTO.CPI_address }" size="60">
					<input type="button" value="지도보기" class="button" id="map_open">
				</td>
			</tr>
			<tr>
				<th class="lineTh">&nbsp;기업형태</th>
				<td colspan="4"><input type="text" value="${companyInfoDTO.CPI_type }" size="60"></td>
			</tr>
			<tr>
				<th class="lineTh">&nbsp;설립일</th>
				<td colspan="4"><input type="date" value="${companyInfoDTO.CPI_openDate }"></td>
			</tr>
			<tr>
				<th class="lineTh">&nbsp;홈페이지</th>
				<td colspan="4"><input type="text" value="${companyInfoDTO.CPI_homepage }" size="60"></td>
			</tr>
			<tr>
				<th class="lineTh">&nbsp;블로그</th>
				<td colspan="4"><input type="text" value="${companyInfoDTO.CPI_homepage }" size="60"></td>
			</tr>
			<tr>
				<th class="lineTh">&nbsp;기업SNS</th>
				<td colspan="4">
					<img src="./img/fb_icon.png">&nbsp;&nbsp;http://www.facebook.com/&nbsp;
					<input type="text" value="${companyInfoDTO.CPI_sns1 }" size="21"><br>
					<img src="./img/tw_icon.png">&nbsp;&nbsp;http://www.twitter.com/&nbsp;
					<input type="text" value="${companyInfoDTO.CPI_sns2 }" size="24"><br>
					<img src="./img/me_icon.png">&nbsp;
					<input type="text" value="${companyInfoDTO.CPI_sns3 }" size=50>			
				</td>
			</tr>
			<tr>
				<th class="lineTh"><font class="must">*</font>대표전화</th>
				<td colspan="4"><input type="text" value="${companyInfoDTO.CPI_phone }" size="30"></td>
			</tr>
			<tr>
				<th class="lineTh" rowspan="2">&nbsp;재무정보</th>
				<th class="innerThl">기준년도</th>
				<th class="innerThl">자본금<font class="10000">(만원)</font></th>
				<th class="innerThl">매출액<font class="10000">(만원)</font></th>
				<th class="innerTh">영업이익<font class="10000">(만원)</font></th>
			</tr>
			<tr>
				<td class="innerTd"><input type="number" class="money"></td>
				<td class="innerTd"><input type="number" class="money"></td>
				<td class="innerTd"><input type="number" class="money"></td>
				<td><input type="number" class="money"></td>
			</tr>
		</table>
	</div>
	<div class="div companyLogo">
		<p class="p companyInfo">로고</p>
		<fieldset>
			<input type="button" value="등록" class="button">
			<img src="">
		</fieldset>
	</div>
	<div class="div CPI_vision">
		<p class="p companyInfo">개요 및 비전</p>
		<fieldset>
			<textarea rows="7" cols="115"></textarea>
		</fieldset>
	</div>
	<div class="div CPI_history">
		<p class="p companyInfo">연혁 및 실적</p>
		<fieldset>
			<textarea rows="7" cols="115"></textarea>
		</fieldset>
	</div>
	<div class="div CPI_welfare">
		<p class="p companyInfo">복리후생</p>
		<fieldset>
			<textarea rows="7" cols="115"></textarea>
		</fieldset>
	</div>
	<div class="div CPI_cafe">
		<p class="p companyInfo">사내동호회</p>
		<fieldset>
			<textarea rows="7" cols="115"></textarea>
		</fieldset>
	</div>
	<div class="div CPI_etc">
		<p class="p companyInfo">기타정보</p>
		<fieldset>
			<textarea rows="7" cols="115"></textarea>
		</fieldset>
	</div>
	<div class="buttonDiv" align="center">
		<input type="button" value="수정하기" class="writeBtn">
	</div>
</body>
</html>