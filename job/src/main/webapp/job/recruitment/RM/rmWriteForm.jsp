<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
#rm_insert {
    background: linear-gradient(#3a528a, #294073, #304c8a);
    display: block;
    position: relative;
    margin-bottom: 8px;
    width: 164px;
    height: 56px;
    border-radius: 3px;
    box-shadow: 0 2px 3px #dbdbdb; 
    line-height: 51px;
    color: #fff;
    font-size: 17px;
    text-align: center;
    letter-spacing: -2px;
    word-spacing: -1px;
    text-decoration: none;
    padding-top: 3px;
/*  left: 360px; */
	left: 414px;
    margin-top: 27px;
}
div#rm_container{
	width: 1000px;
}
span.rmrmrm	{ width:900px;}
span.right	{float: right;}
span.left	{float: left;}
#next_btn1	{position: relative;	bottom: 350px;}
#prev_btn2	{position: relative;	top: 302px;}
#next_btn2	{position: relative;	bottom: 427px}
#prev_btn3	{position: relative;	top: 333px;}
#next_btn3	{position: relative;	bottom: 427px;}
#prev_btn4	{position: relative;	top: 449px;}
#next_btn4	{position: relative;	bottom: 668px;}
#prev_btn5	{position: relative;	top: 213px;}
#next_btn5	{position: relative;	bottom: 381px;}
#prev_btn6	{position: relative;	top: 150px;}

/*
#next_btn1,#next_btn2,#next_btn3,#next_btn4,#next_btn5 {float:right; position: relative;}
#prev_btn2,#prev_btn3,#prev_btn4,#prev_btn5,#prev_btn6 {float: left; } 
*/
</style>
<script type="text/javascript">

$(document).ready(function() {
	$("#rm_job").show();
	$("#rm_intro").hide();
	$("#rm_apply").hide();
	$("#rm_condition").hide();
	$("#rm_time").hide();
	$("#rm_personnel").hide();
	
	$("#rm_insert").click(function() {
		
			if(!$("#rmp_name").val()) {
				alert("이름을 입력하세요");
				$("#rmp_name").focus();
				return false;
			}
			if(!$("#rmp_dept").val()) {
				alert("부서를 입력하세요");
				$("#rmp_dept").focus();
				return false;
			}
			
			for(var i = 1; i <= 3; i++){
				if(!$("#rmp_homeTel"+i).val()) {
					alert("전화번호를 입력하세요");
					$("#rmp_homeTel"+i).focus();
					return false;
				}
		    }
			
			for(var i = 1; i <= 3; i++){
				if(!$("#rmp_tel"+i).val()) {
					alert("휴대폰번호를 입력하세요");
					$("#rmp_tel"+i).focus();
					return false;
				}
		    }
			
			if (!$("#rmp_inputEmail1").val()) {
				alert("이메일주소를 입력하세요");
				$("rmp_inputEmail1").click();
				return false;
			}
			
			if (!$("#rmp_inputEmail2").val()) {
				alert("이메일주소를 입력하세요");
				$("rmp_inputEmail2").click();
				return false;
			}
			
			//ajax
			var rmp_name   = $("#rmp_name").val();
		   	var rmp_dept   = $("#rmp_dept").val();
		   	var rmp_email  = $("#rmp_inputEmail1").val() + "@" + $("#rmp_inputEmail2").val();
		   	var rmp_phone1 = $("#rmp_homeTel1").val() + "-" + $("#rmp_homeTel2").val() + "-" + $("#rmp_homeTel3").val();
		   	var rmp_phone2 = $("#rmp_tel1").val() + "-" + $("#rmp_tel2").val() + "-" + $("#rmp_tel3").val();
		   
		   	$("#rmp_name_hidden").val(rmp_name);
		   	$("#rmp_dept_hidden").val(rmp_dept);
		   	$("#rmp_email_hidden").val(rmp_email);
		   	$("#rmp_phone1_hidden").val(rmp_phone1);
		   	$("#rmp_phone2_hidden").val(rmp_phone2);
		   	$("#personnelCk").val("ok");
		
		
		if($("#jobCk").val() != "ok"){
			alert("job 에러");
			return false;
		}else if($("#introCk").val() != "ok"){
			alert("intro 에러");
			return false;
		}else if($("#applyCk").val() != "ok"){
			alert("apply 에러");
			return false;
		}else if($("#conditionCk").val() != "ok"){
			alert("condition 에러");
			return false;
		}else if($("#timeCk").val() != "ok"){
			alert("time 에러");
			return false;
		}else if($("#personnelCk").val() != "ok"){
			alert("personnel 에러");
			return false;
		}else{
			var allData = {
				"rma_Studylv": $("#rma_Studylv").val(),
				"rma_Isfinish": $("#rma_Isfinish").val(),
				"rma_Major": $("#rma_Major").val(),
				"rma_Vip": $("#rma_Vip").val(),
				"rma_Foreign": $("#rma_Foreign").val(),
				"rma_License": $("#rma_License").val(),
				"rma_Gender": $("#rma_Gender").val(),
				"rma_Age": $("#rma_Age").val(),
				"rma_Age2": $("#rma_Age2").val(),
				"rmc_Salary1_hidden": $("#rmc_Salary1_hidden").val(),
				"rmc_Business1_hidden": $("#rmc_Business1_hidden").val(),
				"rmc_Business2_hidden": $("#rmc_Business2_hidden").val(),
				"rmc_Business3_hidden": $("#rmc_Business3_hidden").val(),
				"rmc_Workspace_hidden": $("#rmc_Workspace_hidden").val(),
				"rmc_Week_hidden": $("#rmc_Week_hidden").val(),
				"rmc_Time_hidden": $("#rmc_Time_hidden").val(),
				"rmi_Personnel": $("#rmi_Personnel").val(),
				"rmi_Type": $("#rmi_Type").val(),
				"rmi_Work1": $("#rmi_Work1").val(),
				"rmi_Work2": $("#rmi_Work2").val(),
				"rmi_Work3": $("#rmi_Work3").val(),
				"rmi_Department": $("#rmi_Department").val(),
				"rmi_Official": $("#rmi_Official").val(),
				"rmp_name_hidden": $("#rmp_name_hidden").val(),
				"rmp_dept_hidden": $("#rmp_dept_hidden").val(),
				"rmp_email_hidden": $("#rmp_email_hidden").val(),
				"rmp_phone1_hidden": $("#rmp_phone1_hidden").val(),
				"rmp_phone2_hidden": $("#rmp_phone2_hidden").val(),
				"rmt_Startdate": $("#timePeriodStartDate").val(),
				"rmt_Enddate": $("#timePeriodEndDate").val(),
				"rmt_How": $("input[name='rmt_How']").val(),
				"rmt_Form": $("input[name='rmt_Form']").val(),
				"rmj_job_hidden": $("#rmj_job_hidden").val(),
				"rmj_career_hidden": $("#rmj_career_hidden").val(),
				"rmj_careerStart_hidden": $("#rmj_careerStart_hidden").val(),
				"rmj_careerEnd_hidden": $("#rmj_careerEnd_hidden").val(),
				"rmj_type_hidden": $("#rmj_type_hidden").val()
			};
			
			$.ajax({
				url: 'rmWriteForm.do',
				type: 'post',
				data: allData,
				timeout: 30000,
				cache: false,
				success: function(data) {
					if(data>0){
						alert("채용공고가 작성되었습니다.");
					}else{
						alert("채용공고가 작성에 실패했습니다. 잠시후 다시 시도해주세요.");
					}
				},
				error: function() {
					alert("통신 중 장애가 발생했습니다! 잠시 후 다시 시도해주세요.");
				}
			});
		}
	})
});
</script>
<style type="text/css">

</style> 
</head>
<body>
<input type="hidden" id="jobCk">
<input type="hidden" id="introCk">
<input type="hidden" id="applyCk">
<input type="hidden" id="conditionCk">
<input type="hidden" id="timeCk">
<input type="hidden" id="personnelCk">
<input type="hidden" id="rma_Studylv_hidden">
<input type="hidden" id="rma_Isfinish_hidden">
<input type="hidden" id="rma_Major_hidden">
<input type="hidden" id="rma_Vip_hidden">
<input type="hidden" id="rma_Foreign_hidden">
<input type="hidden" id="rma_License_hidden">
<input type="hidden" id="rma_Gender_hidden">
<input type="hidden" id="rma_Age_hidden">
<input type="hidden" id="rma_Age2_hidden">
<div id="rm_container" class="rm_container">
			<!-- 1번 -->				
			<span id="rm_job">			
				<span class="rmrmrm"><jsp:include page="/job/recruitment/job/jobForm.jsp"></jsp:include></span>		
			</span>
	
			<!-- 2번 모집요강 -->					
			<span id="rm_intro">
				<span class="rmrmrm"><jsp:include page="/job/recruitment/introduction/introWriteForm.jsp"></jsp:include></span>		
				</span>

			<!-- 3번 자격요건 및 우대조건--> 
			<span id="rm_apply">
				<span class="rmrmrm"><jsp:include page="/job/recruitment/apply/applyWriteForm.jsp"></jsp:include></span>
			</span>
	
	 		<!-- 4번 근무조건-->				
	  		<span id="rm_condition">	  				
	  			<span class="rmrmrm"><jsp:include page="/job/recruitment/condition/conditionWriteForm.jsp"></jsp:include></span>  				
	  		</span>
 							
	 		<!-- 5번 접수기간 및 방법--> 
	  		<span id="rm_time">
	  			<span class="rmrmrm"><jsp:include page="/job/recruitment/time/timeWriteForm.jsp"></jsp:include></span>
	  		</span> 
					
	 		<!-- 6번 담당자 연락처--> 
	 		<span id="rm_personnel">
	  			<span class="rmrmrm"><jsp:include page="/job/recruitment/personnel/personnelForm.jsp" ></jsp:include></span>
	  			<a href="#" class="rm_insert" id="rm_insert"><span>공고 작성완료</span></a>  				
	  		</span>

</div>	
</body>
</html>