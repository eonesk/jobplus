<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
	body{
		background: aqua; 
		margin: 0; padding: 0;
	}
	#header{
		background: lightgray; 
		width: 100%; height: 50px;
	}
	#section{
		background: orange; 
		margin:50px auto; width: 1000px; text-align: left;
	}
	#nav{
		background: lightblue;
		position: fixed; top: 100px; right : 80px;
		width: 300px; float: right;
	}
	#section tr, td{
		padding: 5px;
	}
	#writeBtn{
		width: 100%; height: 50px; bottom: 0px;
	}
	#test{
		background-color: white; width: 180px;
	}
	#section > div{
		background:	pink;
	}
	#section input{
		height: 50px;
	}
	#section select{
		height: 56px;
	}
	#rs_title{
		width: 100%;
	}
	#nav_menu tr td{
		height: 36px;
	}
	#working_conditions .header{
		width: 1000px;
	}
	#working_conditions .aside{
		width: 120px;
	}
	#working_conditions .header .left{
		width: 320px;
	}
	#working_conditions .header .right{
		width: 100px;
		background: white;
	}
	#rs_workspace_select1, #rs_workspace_select2, #rs_job_select1, #rs_job_select2, #rs_job_select3{
		display: none;
		position: absolute;
	}
	#rs_workspace_select1 select, #rs_workspace_select2 select, #rs_job_select1 select, #rs_job_select2 select, #rs_job_select3 select{
		width: 150px;
		height: 200px;
		position: relative;
	}
	#rs_workspace_select2 select, #rs_job_select2 select{
		left: 150px;
	}
	#rs_job_select3 select{
		left:300px;
	}
</style>
<script type="text/javascript">
/* rs_workspace */
var rs_workspace_btn_ck = false;
var rs_workspace_cnt = 1;
	$(function() {
		$(".rs_workspace_cnt").html(rs_workspace_cnt-1);
		$("#rs_workspace1").hide();
		$("#rs_workspace2").hide();
		$("#rs_workspace3").hide();
		$("#rs_workspace_result").children().on("click",function() {
			$(this).hide();
			rs_workspace_cnt--;
			$(".rs_workspace_cnt").html(rs_workspace_cnt-1);
		});
		
		$(function reset_rs_workspace() {
			$("#rs_workspace_select1").load("text/category_hopework.html #category1-1", function() {
				$(this).hide();
			});	
			$(document).on("change", "#rs_workspace_select1 > select", function() {
				$("#rs_workspace_select2").empty().hide();
				var target = $(this).find("option:selected").attr("data-target");
			    	var selector = "text/category_hopework.html " + target;
			    	// 다음 항목 로드
			    	$("#rs_workspace_select2").load(selector, function() {
			    		$(this).show();
			    	});
			});
			$(document).on("change", "#rs_workspace_select2 > select", function() {
				if($(this).find("option:selected").index() != null){
					var data1 = $("#rs_workspace_select1 > select > option:selected").val();
					var data2 = $("#rs_workspace_select2 > select > option:selected").val();
					var result = data1 + " > "+ data2;
					$("#rs_workspace"+rs_workspace_cnt).val(result);
					$("#rs_workspace"+rs_workspace_cnt).show();
					rs_workspace_cnt++;
					$(".rs_workspace_cnt").html(rs_workspace_cnt-1);
					rs_workspace_btn_ck = false;
					$("#rs_workspace_select1").empty().hide();
					$("#rs_workspace_select2").empty().hide();
					$(document).off("change", "#rs_workspace_select1 > select");
					$(document).off("change", "#rs_workspace_select2 > select");
					reset_rs_workspace();
				}
			});
		});
		$("#rs_workspace_btn").click(function() {
			if(rs_workspace_cnt > 3){
				alert("희망근무지는 3곳까지 선택 할 수 있습니다.");
				return false;
			}
			if(rs_workspace_btn_ck){
				rs_workspace_btn_ck = false;
				$("#rs_workspace_select1").hide();
				$("#rs_workspace_select2").hide();
			}else{
				rs_workspace_btn_ck = true;
				$("#rs_workspace_select1").show();
				$("#rs_workspace_select2").show();
			}
		});
		
		
		/* rs_job */
		var rs_job_btn_ck = false;
		var rs_job_cnt = 1;
		$(".rs_job_cnt").html(rs_job_cnt-1);
		$("#rs_job1").hide();
		$("#rs_job2").hide();
		$("#rs_job3").hide();
		$("#rs_job4").hide();
		$("#rs_job5").hide();
		$("#rs_job_result").children().on("click",function() {
			$(this).hide();
			rs_job_cnt--;
			$(".rs_job_cnt").html(rs_job_cnt-1);
		});
		
		$(function reset_rs_job() {
			$("#rs_job_select1").load("text/category_hopejob.html #category1-1", function() {
				$(this).hide();
			});	
			
			$(document).on("change", "#rs_job_select1 > select", function() {
				$("#rs_job_select2").empty().hide();
				$("#rs_job_select3").empty().hide();
				var target = $(this).find("option:selected").attr("data-target");
			    	var selector = "text/category_hopejob.html " + target;
			    	// 다음 항목 로드
			    	$("#rs_job_select2").load(selector, function() {
			    		$(this).show();
			    	});
			});
			$(document).on("change", "#rs_job_select2 > select", function() {
				$("#rs_job_select3").empty().hide();
				var target = $(this).find("option:selected").attr("data-target");
			    	var selector = "text/category_hopejob.html " + target;
			    	// 다음 항목 로드
			    	$("#rs_job_select3").load(selector, function() {
			    		$(this).show();
			    	});
			});
			
			$(document).on("change", "#rs_job_select3 > select", function() {
				if($(this).find("option:selected").index() != null){
					var data1 = $("#rs_job_select1 > select > option:selected").val();
					var data2 = $("#rs_job_select2 > select > option:selected").val();
					var data3 = $("#rs_job_select3 > select > option:selected").val();
					var result = data1 + " > "+ data2 + " > " + data3;
					$("#rs_job"+rs_job_cnt).val(result);
					$("#rs_job"+rs_job_cnt).show();
					rs_job_cnt++;
					$(".rs_job_cnt").html(rs_job_cnt-1);
					rs_job_btn_ck = false;
					$("#rs_job_select1").empty().hide();
					$("#rs_job_select2").empty().hide();
					$("#rs_job_select3").empty().hide();
					$(document).off("change", "#rs_job_select1 > select");
					$(document).off("change", "#rs_job_select2 > select");
					$(document).off("change", "#rs_job_select3 > select");
					reset_rs_job();
				}
			});
		});
		$("#rs_job_btn").on("click", function() {
			if(rs_job_cnt > 3){
				alert("희망직종은 3종류까지 선택 할 수 있습니다.");
				return false;
			}
			if(rs_job_btn_ck){
				rs_job_btn_ck = false;
				$("#rs_job_select1").hide();
				$("#rs_job_select2").hide();
				$("#rs_job_select3").hide();
			}else{
				rs_job_btn_ck = true;
				$("#rs_job_select1").show();
				$("#rs_job_select2").show();
				$("#rs_job_select3").show();
			}
		});
		
		$("#rs_pay_no").change(function() {
			if($(this).is(":checked")){
				$("#rs_pay").attr("placeholder", "면접 후 결정");
				$("#rs_pay").attr("disabled", true);
			}else{
				$("#rs_pay").attr("placeholder", "희망연봉");
				$("#rs_pay").attr("disabled", false);
			}
		});
		
		/* rs_studyLV */
		$("#studyLVDiv").hide();
		$("#studyLVCheck").change(function() {
			if($(this).is(":checked")){
				$("#studyLVDiv").show();
			}else{
				$("#studyLVDiv").hide();
			}
		});
		/* rs_workLV */
		$("#workLVDiv").hide();
		$("#workLVCheck").change(function() {
			if($(this).is(":checked")){
				$("#workLVDiv").show();
			}else{
				$("#workLVDiv").hide();
			}
		});
		/* rs_intern */
		$("#internDiv").hide();
		$("#internCheck").change(function() {
			if($(this).is(":checked")){
				$("#internDiv").show();
			}else{
				$("#internDiv").hide();
			}
		});
		/* rs_edu */
		$("#eduDiv").hide();
		$("#eduCheck").change(function() {
			if($(this).is(":checked")){
				$("#eduDiv").show();
			}else{
				$("#eduDiv").hide();
			}
		});
		/* rs_license */
		$("#licenseDiv").hide();
		$("#licenseCheck").change(function() {
			if($(this).is(":checked")){
				$("#licenseDiv").show();
			}else{
				$("#licenseDiv").hide();
			}
		});
		/* rs_trophy */
		$("#trophyDiv").hide();
		$("#trophyCheck").change(function() {
			if($(this).is(":checked")){
				$("#trophyDiv").show();
			}else{
				$("#trophyDiv").hide();
			}
		});
		/* rs_foreign */
		$("#foreignDiv").hide();
		$("#foreignCheck").change(function() {
			if($(this).is(":checked")){
				$("#foreignDiv").show();
			}else{
				$("#foreignDiv").hide();
			}
		});
		/* rs_language */
		$("#languageDiv").hide();
		$("#languageCheck").change(function() {
			if($(this).is(":checked")){
				$("#languageDiv").show();
			}else{
				$("#languageDiv").hide();
			}
		});
		/* rs_portfolio */
		$("#portfolioDiv").hide();
		$("#portfolioCheck").change(function() {
			if($(this).is(":checked")){
				$("#portfolioDiv").show();
			}else{
				$("#portfolioDiv").hide();
			}
		});
		/* rs_vip */
		$("#vipDiv").hide();
		$("#vipCheck").change(function() {
			if($(this).is(":checked")){
				$("#vipDiv").show();
			}else{
				$("#vipDiv").hide();
			}
		});
		/* rs_pr */
		$("#prDiv").hide();
		$("#prCheck").change(function() {
			if($(this).is(":checked")){
				$("#prDiv").show();
			}else{
				$("#prDiv").hide();
			}
		});
		
		
		$("#writeBtn").click(function() {
			if($("#rs_name").val() == ""){
				alert("이름을 입력하세요.");
				return false;
			}else if($("#rs_birth").val() == ""){
				alert("생년월일을 입력하세요.");
				return false;
			}else if($("#rs_gender option:selected").val() == "error"){
				alert("성별을 선택하세요.");
				return false;
			}else if($("#rs_email").val() == ""){
				alert("이메일을 입력하세요.");
				return false;
			}else if($("#rs_homenum").val() == ""){
				alert("집번호를 입력하세요.");
				return false;
			}else if($("#rs_phone").val() == ""){
				alert("핸드폰번호를 입력하세요.");
				return false;
			}else if($("#rs_address").val() == ""){
				alert("주소를 입력하세요");
				return false;
			}else if($("#rs_type option:selected").val() == "error"){
				alert("고용 형태를 선택하세요.");
				return false;
			}else if(!($("#rs_pay_no").is(":checked"))){
				if($("#rs_pay").val() == ""){
					alert("희망연봉을 작성하세요.");
					return false;
				}					
			}
			if($("#rs_title").val() == ""){
				alert("이력서 제목을 입력하세요.");
				return false;
			}else if($("#rs_workspace1").val() == ""){
				alert("희망 근무지를 선택하세요.");
				return false;
			}else if($("#rs_job1").val() == ""){
				alert("직무 산업 키워드를 선택하세요.");
				return false;
			}
			var rs_name = $("#rs_name").val();
			var rs_birth = $("#rs_birth").val();
			var rs_gender = $("#rs_gender").val();
			var rs_email = $("#rs_email").val();
			var rs_homenum = $("#rs_homenum").val();
			var rs_phone = $("#rs_phone").val();
			var rs_address = $("#rs_address").val();
			var rs_title = $("#rs_title").val();
			var rs_type = $("#rs_type option:selected").val();
			if($("#rs_pay_no").is(":checked")){
				var rs_pay = "면접 후 결정";
			}else{
				var rs_pay = $("#rs_pay").val() + "만원이상";
			}
			var rs_workspace1 = $("#rs_workspace1").val();
			var rs_workspace2 = $("#rs_workspace2").val();
			var rs_workspace3 = $("#rs_workspace3").val();
			var rs_job1 = $("#rs_job1").val();
			var rs_job2 = $("#rs_job2").val();
			var rs_job3 = $("#rs_job3").val();
			var RSIM_seq = null;
			var RSS_seq = null;
			var RSW_seq = null;
			var RSIT_seq = null;
			var RSE_seq = null;
			var RSLS_seq = null;
			var RST_seq = null;
			var RSF_seq = null;
			var RSLG_seq = null;
			var RSPF_seq = null;
			var RSV_seq = null;
			var RSPR_seq = null;
			$.ajax({
				url: 'resumeWrite.do',
				type: 'post',
				data: {
					"rs_name" : rs_name,
					"rs_birth": rs_birth,
					"rs_gender": rs_gender,
					"rs_email": rs_email,
					"rs_homenum": rs_homenum,
					"rs_phone": rs_phone,
					"rs_address": rs_address,
					"rs_title": rs_title,
					"rs_type": rs_type,
					"rs_pay": rs_pay,
					"rs_workspace1": rs_workspace1,
					"rs_workspace2": rs_workspace2,
					"rs_workspace3": rs_workspace3,
					"rs_job1": rs_job1,
					"rs_job2": rs_job2,
					"rs_job3": rs_job3,
					"RSIM_seq": RSIM_seq,
					"RSS_seq": RSS_seq,
					"RSW_seq": RSW_seq,
					"RSIT_seq": RSIT_seq,
					"RSE_seq": RSE_seq,
					"RSLS_seq": RSLS_seq,
					"RST_seq": RST_seq,
					"RSF_seq": RSF_seq,
					"RSLG_seq": RSLG_seq,
					"RSPF_seq": RSPF_seq,
					"RSV_seq": RSV_seq,
					"RSPR_seq": RSPR_seq
				},
				dataType: 'text',
				timeout: 30000,
				cache: false,
				success: function() {
					alert("입력성공");
				},
				error: function() {
					alert("입력실패");
				}
			});
		});
	});
</script>
</head>
<body>
<form action="resumeWrite.do" method="post" name="resumeWriteForm">
<div id="header">
	<a href="#">JOBPLUS</a>
	<a href="#">이력서 관리</a>
</div>
<div id="section">
	<input type="text" name="rs_title" id="rs_title" placeholder="이력서 제목" width="99%"><br>
	<div id="member_info">
	<h2>인적사항</h2>
		<table>
			<tr>
				<td><input type="text" name="rs_name" id="rs_name" value="${memberDTO.m_name }" placeholder="이름"></td>
				<td><input type="date" name="rs_birth" id="rs_birth" value="${memberDTO.m_birth }" placeholder="생년월일"></td>
				<td>
					<select name="rs_gender" id="rs_gender">
						<option value="error">---성별---</option>
					<c:if test="${memberDTO.m_gender == '남자' }">
						<option value="남자" selected="selected">남자</option>
						<option value="여자">여자</option>
					</c:if>
					<c:if test="${memberDTO.m_gender == '여자' }">
						<option value="남자">남자</option>
						<option value="여자" selected="selected">여자</option>
					</c:if>
					</select>
				</td>
				<td><input type="text" name="rs_email" id="rs_email" value="${memberDTO.m_email }" placeholder="이메일"></td>
				<td rowspan="2"><img src="./img/IDphoto_103x132.jpg" onclick="alert('오')"></td>
			</tr>
			<tr>
				<td><input type="text" name="rs_homenum" id="rs_homenum" value="${memberDTO.m_homenum }" placeholder="전화번호"></td>
				<td><input type="text" name="rs_phone" id="rs_phone" value="${memberDTO.m_phone }" placeholder="휴대폰번호"></td>
				<td colspan="2"><input type="text" name="rs_address" id="rs_address" value="${memberDTO.m_address }" placeholder="주소"></td>
			</tr>
		</table>
	</div>
	<div id="working_conditions">
	<h2>희망근무조건</h2>
		<table>
			<tr>
				<td width="50%">
					<select id="rs_type" name="rs_type">
						<option value="error">---고용형태---</option>
						<option value="정규직">정규직</option>
						<option value="계약직">계약직</option>
						<option value="병역특례">병역특례</option>
						<option value="프리랜서">프리랜서</option>
						<option value="파견대행">파견대행</option>
						<option value="인턴직">인턴직</option>
					</select>
				</td>
				<td>
					<input type="number" placeholder="희망연봉" id="rs_pay" name="rs_pay"><font>만원이상</font> 
					<input type="checkbox" value="면접 후 결정" id="rs_pay_no" name="rs_pay_no"><font>면접 후 결정</font>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="header">
						<div class="left"><font>희망근무지</font><span class="rs_workspace_cnt"></span>/3</div>
						<div class="right"><input type="button" id="rs_workspace_btn" value="추가하기"></div>
						<span id="rs_workspace_select1"></span>
						<span id="rs_workspace_select2"></span>
					</div>
					<div class="section" id="rs_workspace_result">
						<input type="button" id="rs_workspace1">
						<input type="button" id="rs_workspace2">
						<input type="button" id="rs_workspace3">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="header">
						<div class="left"><font>직무 산업 키워드</font><span class="rs_job_cnt"></span>/3</div>
						<div class="right"><input type="button" id="rs_job_btn" value="추가하기"></div>
						<div id="rs_job_select1"></div>
						<div id="rs_job_select2"></div>
						<div id="rs_job_select3"></div>
					</div>
					<div class="section" id="rs_job_result">
						<input type="button" id="rs_job1">
						<input type="button" id="rs_job2">
						<input type="button" id="rs_job3">
					</div>                          
				</td>
			</tr>
		</table>
	</div>
	<div id="studyLVDiv">
		<h2>학력</h2>
	</div>
	<div id="workLVDiv">
		<h2>경력</h2>
	</div>
	<div id="internDiv">
		<h2>인턴 대외활동</h2>
	</div>
	<div id="eduDiv">
		<h2>교육이수</h2>
	</div>
	<div id="licenseDiv">
		<h2>자격증</h2>
	</div>
	<div id="trophyDiv">
		<h2>수상</h2>
	</div>
	<div id="foreignDiv">
		<h2>해외경험</h2>
	</div>
	<div id="languageDiv">
		<h2>어학</h2>
	</div>
	<div id="portfolioDiv">
		<h2>포트폴리오</h2>
	</div>
	<div id="vipDiv">
		<h2>취업우대</h2>
	</div>
	<div id="prDiv">
		<h2>자기소개서</h2>
	</div>
</div>
<div id="nav">
		<p>이력서 항목</p>
		<table id="nav_menu">
			<tr>
				<td id="test">학력</td>
				<td><input type="checkbox" id="studyLVCheck"></td>
			</tr>
			<tr>
				<td>경력</td>
				<td><input type="checkbox" id="workLVCheck"></td>
			</tr>
			<tr>
				<td>인턴,대외활동</td>
				<td><input type="checkbox" id="internCheck"></td>
			</tr>
			<tr>
				<td>교육이수</td>
				<td><input type="checkbox" id="eduCheck"></td>
			</tr>
			<tr>
				<td>자격증</td>
				<td><input type="checkbox" id="licenseCheck"></td>
			</tr>
			<tr>
				<td>수상</td>
				<td><input type="checkbox" id="trophyCheck"></td>
			</tr>
			<tr>
				<td>해외경험</td>
				<td><input type="checkbox" id="foreignCheck"></td>
			</tr>
			<tr>
				<td>어학</td>
				<td><input type="checkbox" id="languageCheck"></td>
			</tr>
			<tr>
				<td>포트폴리오</td>
				<td><input type="checkbox" id="portfolioCheck"></td>
			</tr>
			<tr>
				<td>취업우대</td>
				<td><input type="checkbox" id="vipCheck"></td>
			</tr>
			<tr>
				<td>자기소개서</td>
				<td><input type="checkbox" id="prCheck"></td>
			</tr>
		</table>
		<input type="button" value="작성완료" id="writeBtn">
</div>
</form>
</body>
</html>




















