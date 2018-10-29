<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./script/resumeWriteForm.js"></script>
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
					$("#rs_workspace"+rs_workspace_cnt).val(result+"   x");
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
					$("#rs_job"+rs_job_cnt).val(result+"   x");
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
			if(rs_job_cnt > 5){
				alert("희망직종은 5종류까지 선택 할 수 있습니다.");
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
			writeCheck();
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
	<input type="text" name="rs_title" placeholder="이력서 제목" width="99%" id="rs_title"><br>
	<div id="member_info">
	<h2>인적사항</h2>
		<table>
			<tr>
				<td><input type="text" name="m_Name" value="${memberDTO.m_Name }" placeholder="이름"></td>
				<td><input type="text" name="m_Birth" value="${memberDTO.m_Birth }" placeholder="생년월일"></td>
				<td>
					<select name="m_Gender">
						<option>---성별---</option>
					<c:if test="${memberDTO.m_Gender == '남자' }">
						<option value="남자" selected="selected">남자</option>
						<option value="여자">여자</option>
					</c:if>
					<c:if test="${memberDTO.m_Gender == '여자' }">
						<option value="남자">남자</option>
						<option value="여자" selected="selected">여자</option>
					</c:if>
					</select>
				</td>
				<td><input type="text" name="m_Email" value="${memberDTO.m_Email }" placeholder="이메일"></td>
				<td rowspan="2"><img src="./img/IDphoto_103x132.jpg" onclick="alert('오')"></td>
			</tr>
			<tr>
				<td><input type="text" name="m_Homenum" value="${memberDTO.m_Homenum }" placeholder="전화번호"></td>
				<td><input type="text" name="m_Phone" value="${memberDTO.m_Phone }" placeholder="휴대폰번호"></td>
				<td colspan="2"><input type="text" name="m_Address" value="${memberDTO.m_Address }" placeholder="주소"></td>
			</tr>
		</table>
	</div>
	<div id="working_conditions">
	<h2>희망근무조건</h2>
		<table>
			<tr>
				<td width="50%">
					<select name="rs_type">
						<option>---고용형태---</option>
						<option value="정규직">정규직</option>
						<option value="계약직">계약직</option>
						<option value="병역특례">병역특례</option>
						<option value="프리랜서">프리랜서</option>
						<option value="파견대행">파견대행</option>
						<option value="인턴직">인턴직</option>
					</select>
				</td>
				<td>
					<input type="number" placeholder="희망연봉" id="rs_pay"><font>만원이상</font> 
					<input type="checkbox" value="면접 후 결정" id="rs_pay_no"><font>면접 후 결정</font>
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
						<div class="left"><font>직무 산업 키워드</font><span class="rs_job_cnt"></span>/5</div>
						<div class="right"><input type="button" id="rs_job_btn" value="추가하기"></div>
						<div id="rs_job_select1"></div>
						<div id="rs_job_select2"></div>
						<div id="rs_job_select3"></div>
					</div>
					<div class="section" id="rs_job_result">
						<input type="button" id="rs_job1">
						<input type="button" id="rs_job2">
						<input type="button" id="rs_job3">
						<input type="button" id="rs_job4">
						<input type="button" id="rs_job5">
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




















