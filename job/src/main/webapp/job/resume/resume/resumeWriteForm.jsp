<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/resume.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
var newResume = true;
var modifyResume = false;
$("#rs_seq").val(null);
	$(function() {
		/* rs_workspace */
		var rs_workspace_btn_ck = false;
		var rs_workspace_cnt = $("#rs_workspace_result input[type=button]").length;
		$(".rs_workspace_cnt").html(rs_workspace_cnt-1);
		$("#rs_workspace").hide();
		
		$("#rs_workspace_btn").click(function() {
			if(rs_workspace_cnt > 3){
				alert("희망근무지는 3곳까지 선택 할 수 있습니다.");
				return false;
			}
			if(rs_workspace_btn_ck){
				rs_workspace_btn_ck = false;
				$("#rs_workspace_select1").empty().hide();
				$("#rs_workspace_select2").empty().hide();
				$(document).off("change", "#rs_workspace_select1 > select");
				$(document).off("change", "#rs_workspace_select2 > select");
			}else{
				rs_workspace_btn_ck = true;
				$("#rs_workspace_select1").load("text/category_hopework.html #category1-1", function() {
					$(this).show();
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
						rs_workspace_cnt = $("#rs_workspace_result input[type=button]").length;
						var clone_workspace = $("#rs_workspace").clone().attr('id', 'rs_workspace'+rs_workspace_cnt);
						clone_workspace.insertBefore("#rs_workspace");
						$("#rs_workspace"+(rs_workspace_cnt)).val(result);
						$("#rs_workspace"+(rs_workspace_cnt)).show();
						
						$("#rs_workspace"+rs_workspace_cnt).on("click",function() {
							var rs_workspace_number = $(this).attr('id').substring(12);
							$(this).remove();
							rs_workspace_cnt = $("#rs_workspace_result input[type=button]").length;
							$(".rs_workspace_cnt").html(rs_workspace_cnt-1);
							for(var i=rs_workspace_cnt; i>rs_workspace_number; i--){
								$("#rs_workspace"+i).attr('id','rs_workspace'+(i-1));
							}
						});
						rs_workspace_cnt = $("#rs_workspace_result input[type=button]").length;
						$(".rs_workspace_cnt").html(rs_workspace_cnt-1);
						rs_workspace_btn_ck = false;
						$("#rs_workspace_select1").empty().hide();
						$("#rs_workspace_select2").empty().hide();
						$(document).off("change", "#rs_workspace_select1 > select");
						$(document).off("change", "#rs_workspace_select2 > select");
					}
				});
			}
		});
		
		
		/* rs_job */
		var rs_job_btn_ck = false;
		var rs_job_cnt = $("#rs_job_result input[type=button]").length;
		$(".rs_job_cnt").html(rs_job_cnt-1);
		$("#rs_job").hide();
		
		$("#rs_job_btn").on("click", function() {
			if(rs_job_cnt > 3){
				alert("희망직종은 3종류까지 선택 할 수 있습니다.");
				return false;
			}
			if(rs_job_btn_ck){
				rs_job_btn_ck = false;
				$("#rs_job_select1").empty().hide();
				$("#rs_job_select2").empty().hide();
				$("#rs_job_select3").empty().hide();
				$(document).off("change", "#rs_job_select1 > select");
				$(document).off("change", "#rs_job_select2 > select");
				$(document).off("change", "#rs_job_select3 > select");
			}else{
				rs_job_btn_ck = true;
				$("#rs_job_select1").load("text/category_hopejob.html #category1-1", function() {
					$(this).show();
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
						rs_job_cnt = $("#rs_job_result input[type=button]").length;
						
						var clone_job = $("#rs_job").clone().attr('id', 'rs_job'+rs_job_cnt);
						clone_job.insertBefore("#rs_job");
						$("#rs_job"+(rs_job_cnt)).val(result);
						$("#rs_job"+(rs_job_cnt)).show();
						
						$("#rs_job"+rs_job_cnt).on("click",function() {
							var rs_job_number = $(this).attr('id').substring(6);
							$(this).remove();
							rs_job_cnt = $("#rs_job_result input[type=button]").length;
							$(".rs_job_cnt").html(rs_job_cnt-1);
							for(var i=rs_job_cnt; i>rs_job_number; i--){
								$("#rs_job"+i).attr('id','rs_job'+(i-1));
							}
						});
						
						rs_job_cnt = $("#rs_job_result input[type=button]").length;
						$(".rs_job_cnt").html(rs_job_cnt-1);
						rs_job_btn_ck = false;
						$("#rs_job_select1").empty().hide();
						$("#rs_job_select2").empty().hide();
						$("#rs_job_select3").empty().hide();
						$(document).off("change", "#rs_job_select1 > select");
						$(document).off("change", "#rs_job_select2 > select");
						$(document).off("change", "#rs_job_select3 > select");
					}
				});
			}
		});
		
		$("#rs_pay_no").change(function() {
			if($(this).is(":checked")){
				$("#rs_pay").val("");
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
		var modifyCk = ${modify};
		if(modifyCk){
			alert("수정실행");
			modifyResume = true;
			$("#rs_seq").val("${resumeDTO.rs_Seq}");
			$("#rs_name").val("${resumeDTO.rs_Name}");
			$("#rs_birth").val("${rs_Birth}");
			$("#rs_email").val("${resumeDTO.rs_Email}");
			$("#rs_homenum").val("${resumeDTO.rs_Homenum}");
			$("#rs_title").val("${resumeDTO.rs_Title}");
			$("#rs_phone").val("${resumeDTO.rs_Phone}");
			$("#rs_address").val("${resumeDTO.rs_Address}");
			$("#rs_type").val("${resumeDTO.rs_Type}");
			
			if("${resumeDTO.rs_Pay}" == "면접 후 결정"){
				$("#rs_pay_no").prop("checked", true);
				$("#rs_pay").val("");
				$("#rs_pay").attr("placeholder", "면접 후 결정");
				$("#rs_pay").attr("disabled", true);
			}else{
				$("#rs_pay").val("${resumeDTO.rs_Pay}");
			}
			
			var rs_workspace_create_cnt = 0;
			var rs_workspace_array = new Array("${resumeDTO.rs_Workspace1}", "${resumeDTO.rs_Workspace2}", "${resumeDTO.rs_Workspace3}");
			
			for(var i=0; i<3; i++){
				if(rs_workspace_array[i] != ""){
					rs_workspace_create_cnt++;
				}
			}
			for(var i=0; i<rs_workspace_create_cnt; i++){
				var result = rs_workspace_array[i];
				var clone_workspace = $("#rs_workspace").clone().attr('id', 'rs_workspace'+(i+1));
				clone_workspace.insertBefore("#rs_workspace");
				$("#rs_workspace"+(i+1)).val(result);
				$("#rs_workspace"+(i+1)).show();
				
				$("#rs_workspace"+(i+1)).on("click",function() {
					var rs_workspace_number = $(this).attr('id').substring(12);
					$(this).remove();
					rs_workspace_cnt = $("#rs_workspace_result input[type=button]").length;
					$(".rs_workspace_cnt").html(rs_workspace_cnt-1);
					for(var k=rs_workspace_cnt; k>rs_workspace_number; k--){
						$("#rs_workspace"+i).attr('id','rs_workspace'+(k-1));
					}
				});
			}
			rs_workspace_cnt = $("#rs_workspace_result input[type=button]").length;
			$(".rs_workspace_cnt").html(rs_workspace_cnt-1);
			
			var rs_job_create_cnt = 0;
			var rs_job_array = new Array("${resumeDTO.rs_Job1}", "${resumeDTO.rs_Job2}", "${resumeDTO.rs_Job3}");
			
			for(var i=0; i<3; i++){
				if(rs_job_array[i] != ""){
					rs_job_create_cnt++;
				}
			}
			for(var i=0; i<rs_job_create_cnt; i++){
				var result = rs_job_array[i];
				var clone_job = $("#rs_job").clone().attr('id', 'rs_job'+(i+1));
				clone_job.insertBefore("#rs_job");
				$("#rs_job"+(i+1)).val(result);
				$("#rs_job"+(i+1)).show();
				
				$("#rs_job"+(i+1)).on("click",function() {
					var rs_job_number = $(this).attr('id').substring(6);
					$(this).remove();
					rs_job_cnt = $("#rs_job_result input[type=button]").length;
					$(".rs_job_cnt").html(rs_job_cnt-1);
					for(var k=rs_job_cnt; k>rs_job_number; k--){
						$("#rs_job"+k).attr('id','rs_job'+(k-1));
					}
				});
			}
			rs_workspace_cnt = $("#rs_workspace_result input[type=button]").length;
			$(".rs_workspace_cnt").html(rs_workspace_cnt-1);
			 
			/* $("#RSIM_seq").val(${resumeDTO.rsim_Seq});
			$("#RSS_seq1").val(${resumeDTO.rss_Seq1});
			$("#RSS_seq2").val(${resumeDTO.rss_Seq2});
			$("#RSS_seq3").val(${resumeDTO.rss_Seq3});
			$("#RSW_seq1").val(${resumeDTO.rsw_Seq1});
			$("#RSW_seq2").val(${resumeDTO.rsw_Seq2});
			$("#RSW_seq3").val(${resumeDTO.rsw_Seq3});
			
			$("#rsit_Seq1").val("${resumeDTO.rsit_Seq1}");
			$("#rsit_Seq2").val("${resumeDTO.rsit_Seq2}");
			$("#rsit_Seq3").val("${resumeDTO.rsit_Seq3}");
		
			$("#RSE_seq1").val(${resumeDTO.rse_Seq1});
			$("#RSE_seq2").val(${resumeDTO.rse_Seq2});
			$("#RSE_seq3").val(${resumeDTO.rse_Seq3});
			$("#RSLS_seq1").val(${resumeDTO.rsls_Seq1});
			$("#RSLS_seq2").val(${resumeDTO.rsls_Seq2});
			$("#RSLS_seq3").val(${resumeDTO.rsls_Seq3});
			$("#RST_seq1").val(${resumeDTO.rst_Seq1});
			$("#RST_seq2").val(${resumeDTO.rst_Seq2});
			$("#RST_seq3").val(${resumeDTO.rst_Seq3});
			$("#RSF_seq1").val(${resumeDTO.rsf_Seq1});
			$("#RSF_seq2").val(${resumeDTO.rsf_Seq2});
			$("#RSF_seq3").val(${resumeDTO.rsf_Seq3});
			$("#RSLG_seq1").val(${resumeDTO.rslg_Seq1});
			$("#RSLG_seq2").val(${resumeDTO.rslg_Seq2});
			$("#RSLG_seq3").val(${resumeDTO.rslg_Seq3});
			$("#RSPF_seq").val(${resumeDTO.rspf_Seq});
			$("#RSV_seq").val(${resumeDTO.rsv_Seq});
			$("#RSPR_seq").val(${resumeDTO.rspr_Seq}); */
		}
		
		$("#writeBtn").on("click", function() {
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
			}else if($("#rs_workspace_result input[type=button]").length < 2){
				alert("최소 1개의 희망 근무지를 선택하세요.");
				return false;
			}else if($("#rs_job_result input[type=button]").length < 2){
				alert("최소 1개의 직무 산업 키워드를 선택하세요.");
				return false;
			}
			var rs_seq = $("#rs_seq").val();
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
				var rs_pay = $("#rs_pay").val();
			}
			var rs_workspace1 = $("#rs_workspace1").val();
			var rs_workspace2 = $("#rs_workspace2").val();
			var rs_workspace3 = $("#rs_workspace3").val();
			var rs_job1 = $("#rs_job1").val();
			var rs_job2 = $("#rs_job2").val();
			var rs_job3 = $("#rs_job3").val();
			var rsim_Seq = null;
			var rss_Seq1 = null;
			var rss_Seq2 = null;
			var rss_Seq3 = null;
			var rsw_Seq1 = null;
			var rsw_Seq2 = null;
			var rsw_Seq3 = null;
			var rsw_Seq1 = $("#rsw__Seq_1").val();
			var rsw_Seq2 = $("#rsw__Seq_2").val();
			var rsw_Seq3 = $("#rsw__Seq_3").val();
			var rsit_Seq1 = $("#rsit_Seq1").val();
			var rsit_Seq2 = $("#rsit_Seq2").val();
			var rsit_Seq3 = $("#rsit_Seq3").val();
			var rse_Seq1 = $("#rse__Seq_1").val();
			var rse_Seq2 = $("#rse__Seq_2").val();
			var rse_Seq3 = $("#rse__Seq_3").val();
			var rsls_Seq1 = $("#rsls__Seq_1").val();
			var rsls_Seq2 = $("#rsls__Seq_2").val();
			var rsls_Seq3 = $("#rsls__Seq_3").val();
			var rst_Seq1 =$("#rst__Seq1").val(); 
			var rst_Seq2 =$("#rst__Seq2").val(); 
			var rst_Seq3 =$("#rst__Seq3").val();
			var rsf_Seq1 = null;
			var rsf_Seq2 = null;
			var rsf_Seq3 = null;
			var rslg_Seq1 = $("#rslg__Seq1").val();
			var rslg_Seq2 = $("#rslg__Seq2").val();
			var rslg_Seq3 = $("#rslg__Seq3").val();
			var rspf_Seq = null;
			var rsv_Seq = null;
			/* var rsv_Seq = $("#rsv__Seq").val(); */
			var rspr_Seq = $("#rspr_Seq").val();
			
						
			var allData = {
					"rs_seq" : rs_seq,
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
					"rsim_Seq": rsim_Seq,
					"rss_Seq1": rss_Seq1,
					"rss_Seq2": rss_Seq2,
					"rss_Seq3": rss_Seq3,
					"rsw_Seq1": rsw_Seq1,
					"rsw_Seq2": rsw_Seq2,
					"rsw_Seq3": rsw_Seq3,
					"rsit_Seq1": rsit_Seq1,
					"rsit_Seq2": rsit_Seq2,
					"rsit_Seq3": rsit_Seq3,
					"rse_Seq1": rse_Seq1,
					"rse_Seq2": rse_Seq2,
					"rse_Seq3": rse_Seq3,
					"rsls_Seq1": rsls_Seq1,
					"rsls_Seq2": rsls_Seq2,
					"rsls_Seq3": rsls_Seq3,
					"rst_Seq1": rst_Seq1,
					"rst_Seq2": rst_Seq2,
					"rst_Seq3": rst_Seq3,
					"rsf_Seq1": rsf_Seq1,
					"rsf_Seq2": rsf_Seq2,
					"rsf_Seq3": rsf_Seq3,
					"rslg_Seq1": rslg_Seq1,
					"rslg_Seq2": rslg_Seq2,
					"rslg_Seq3": rslg_Seq3,
					"rspf_Seq": rspf_Seq,
					"rsv_Seq": rsv_Seq,
					"rspr_Seq": rspr_Seq
			};
			var ajaxUrl;
			if(newResume && (!modifyResume)){
				ajaxUrl = "resumeWrite.do";
			}else{
				ajaxUrl = "resumeModify.do";
			}
			$.ajax({
				url: ajaxUrl,
				type: 'post',
				data: allData,
				dataType: 'text',
				timeout: 30000,
				cache: false,
				success: function(data) {
					alert("이력서가 저장되었습니다.");
					newResume = false;
					$("#writeBtn").off("click", this);
					$("#rs_seq").val(data);
				},
				error: function() {
					alert("통신 중 장애가 발생했습니다! 잠시 후 다시 시도해주세요.");
					$("#writeBtn").off("click", this);
				}
			});
		});
	});
</script>
</head>
<body>
<form action="resumeWrite.do" method="post" name="resumeWriteForm">
<input type="hidden" id="rs_seq">
<div id="header">
	<a href="#">JOBPLUS</a>
	<a href="#">이력서 관리</a>
</div>
<div id="section">
	<input type="text" name="rs_title" id="rs_title" placeholder="이력서 제목"><br>
	<div id="member_info">
	<h2>인적사항</h2>
		<table>
			<tr>
				<td><input type="text" name="rs_name" id="rs_name" value="${memberDTO.m_name }" placeholder="이름"></td>
				<td><input type="date" name="rs_birth" id="rs_birth" class="rs_birth" value="${m_birth }" placeholder="생년월일"></td>
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
					<c:if test="${resumeDTO.rs_Gender == '남자' }">
						<option value="남자" selected="selected">남자</option>
						<option value="여자">여자</option>
					</c:if>
					<c:if test="${resumeDTO.rs_Gender == '여자' }">
						<option value="남자">남자</option>
						<option value="여자" selected="selected">여자</option>
					</c:if>
					</select>
				</td>
				<td><input type="text" name="rs_email" id="rs_email" class="rs_email" value="${memberDTO.m_email }" placeholder="이메일"></td>
				<td rowspan="2"><img src="./img/IDphoto_103x132.jpg" onclick="alert('오')"></td>
			</tr>
			<tr>
				<td><input type="text" name="rs_homenum" id="rs_homenum" value="${memberDTO.m_homenum }" placeholder="전화번호"></td>
				<td><input type="text" name="rs_phone" id="rs_phone" value="${memberDTO.m_phone }" placeholder="휴대폰번호"></td>
				<td colspan="2"><input type="text" name="rs_address" id="rs_address" class="rs_address" value="${memberDTO.m_address }" placeholder="주소"></td>
			</tr>
		</table>
	</div>
	<hr>
	<div id="working_conditions">
	<h2>희망근무조건</h2>
		<div class="working_conditions_item1">
			<select id="rs_type" name="rs_type" class="rs_type">
				<option value="error">---고용형태---</option>
				<option value="정규직">정규직</option>
				<option value="계약직">계약직</option>
				<option value="병역특례">병역특례</option>
				<option value="프리랜서">프리랜서</option>
				<option value="파견대행">파견대행</option>
				<option value="인턴직">인턴직</option>
			</select>
			<span class="rs_pay">	
				<input type="number" placeholder="희망연봉" id="rs_pay" name="rs_pay"><font>만원이상&nbsp;&nbsp;&nbsp;&nbsp;</font> 
				<input type="checkbox" value="면접 후 결정" id="rs_pay_no" name="rs_pay_no" class="checkbox rs_pay_no"><label for="rs_pay_no">면접 후 결정</label>
			</span>
		</div>		
		<table>
			<tr>
				<td colspan="2">
					<div class="header">
						<div class="left"><font>희망근무지</font><span class="rs_workspace_cnt"></span>/3</div>
						<div class="right">
							<input type="button" id="rs_workspace_btn" class="button rs_workspace_btn" value="추가하기">
							<span id="rs_workspace_select1"></span>
							<span id="rs_workspace_select2"></span>
						</div>		
					</div>
					<div class="section" id="rs_workspace_result">
						<input type="button" id="rs_workspace" class="button button_widthFree">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="header">
						<div class="left"><font>직무 산업 키워드</font><span class="rs_job_cnt"></span>/3</div>
						<div class="right">
							<input type="button" id="rs_job_btn" class="button" value="추가하기">
							<span id="rs_job_select1"></span>
							<span id="rs_job_select2"></span>
							<span id="rs_job_select3"></span>
						</div>
					</div>
					<div class="section" id="rs_job_result">
						<input type="button" id="rs_job" class="button button_widthFree">
					</div>                          
				</td>
			</tr>
		</table>
	</div>
	<div id="studyLVDiv">
		<h2>학력</h2>
	</div>
	<div id="workLVDiv">
		<%-- <jsp:include page="../workLV/workLvForm.jsp"></jsp:include> --%>
	</div>
	<div id="internDiv">
		<%-- <jsp:include page="../intern/internWriteForm.jsp"></jsp:include> --%>
	</div>
	<div id="eduDiv">
		<jsp:include page="../edu/eduWriteForm.jsp"></jsp:include>
	</div>
	<div id="licenseDiv">
		<%-- <jsp:include page="../license/licenseWriteForm.jsp"></jsp:include> --%>
	</div>
	<div id="trophyDiv">
		<%-- <jsp:include page="../trophy/trophyWriteForm.jsp"></jsp:include> --%>
	</div>
	<div id="foreignDiv">
		<h2>해외경험</h2>
	</div>
	<div id="languageDiv">
		<%-- <jsp:include page="../language/languageWriteForm.jsp"></jsp:include> --%>
	</div>
	<div id="portfolioDiv">
		<h2>포트폴리오</h2>
	</div>
	<div id="vipDiv">
		<jsp:include page="../vip/vipForm.jsp"></jsp:include>
	</div>
	<div id="prDiv">
		<jsp:include page="../pr/prWriteForm.jsp"></jsp:include>
	</div>
</div>
<div id="nav">
		<h2>이력서 항목</h2>
		<table id="nav_menu">
			<tr>
				<td id="test"><label for="studyLVCheck">학력</label></td>
				<td><input type="checkbox" id="studyLVCheck" class="checkbox"></td>
			</tr>
			<tr>
				<td><label for="workLVCheck">경력</label></td>
				<td><input type="checkbox" id="workLVCheck" class="checkbox"></td>
			</tr>
			<tr>
				<td><label for="internCheck">인턴, 대외활동</label></td>
				<td><input type="checkbox" id="internCheck" class="checkbox"></td>
			</tr>
			<tr>
				<td><label for="eduCheck">교육이수</label></td>
				<td><input type="checkbox" id="eduCheck" class="checkbox"></td>
			</tr>
			<tr>
				<td><label for="licenseCheck">자격증</label></td>
				<td><input type="checkbox" id="licenseCheck" class="checkbox"></td>
			</tr>
			<tr>
				<td><label for="trophyCheck">수상</label></td>
				<td><input type="checkbox" id="trophyCheck" class="checkbox"></td>
			</tr>
			<tr>
				<td><label for="foreignCheck">해외경험</label></td>
				<td><input type="checkbox" id="foreignCheck" class="checkbox"></td>
			</tr>
			<tr>
				<td><label for="languageCheck">어학</label></td>
				<td><input type="checkbox" id="languageCheck" class="checkbox"></td>
			</tr>
			<tr>
				<td><label for="portfolioCheck">포트폴리오</label></td>
				<td><input type="checkbox" id="portfolioCheck" class="checkbox"></td>
			</tr>
			<tr>
				<td><label for="vipCheck">취업우대</label></td>
				<td><input type="checkbox" id="vipCheck" class="checkbox"></td>
			</tr>
			<tr>
				<td><label for="prCheck">자기소개서</label></td>
				<td><input type="checkbox" id="prCheck" class="checkbox"></td>
			</tr>
		</table>
		<input type="button" value="작성완료" id="writeBtn" class="button button_resumeWrite">
</div>
</form>
</body>
</html>




















