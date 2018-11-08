<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#rm_1").show();
		$("#rm_2").hide();
		$("#rm_3").hide();
		$("#rm_4").hide();
		$("#rm_5").hide();
		$("#rm_6").hide();
		
		$("#next_btn1").click(function() {
			$("#rm_1").hide();
			$("#rm_2").show();
		});
		$("#next_btn2").click(function() {
			$("#rm_2").hide();
			$("#rm_3").show();
		});
		$("#next_btn3").click(function() {
			$("#rm_3").hide();
			$("#rm_4").show();
		});
		$("#next_btn4").click(function() {
			$("#rm_4").hide();
			$("#rm_5").show();
		});
		$("#next_btn5").click(function() {
			$("#rm_5").hide();
			$("#rm_6").show();
		});
		$("#prev_btn6").click(function() {
			$("#rm_6").hide();
			$("#rm_5").show();
		});
		$("#prev_btn5").click(function() {
			$("#rm_5").hide();
			$("#rm_4").show();
		});
		$("#prev_btn4").click(function() {
			$("#rm_4").hide();
			$("#rm_3").show();
		});
		$("#prev_btn3").click(function() {
			$("#rm_3").hide();
			$("#rm_2").show();
		});
		$("#prev_btn2").click(function() {
			$("#rm_2").hide();
			$("#rm_1").show();
		});
	});
</script>
<style type="text/css">
.recruit_btn_prev {float: left;	}
.recruit_btn_next {float: right; }

</style>
</head>
<body>
<div id="rm_content">
	<div id="rm_1">
		<a href="#" id="next_btn1" class="recruit_btn_next"><img src="/job/job/recruitment/RM/img/next_btn.png"></a>
		<div id="jobDiv">
 			<hr id="hr_recruitment">
			<jsp:include page="/job/recruitment/job/jobForm.jsp"></jsp:include>
		</div>		
	</div>
	<div id="rm_2">
		<a href="#" id="prev_btn2" class="recruit_btn_prev"><img src="/job/job/recruitment/RM/img/prev_btn.png"></a>
		<a href="#" id="next_btn2" class="recruit_btn_next"><img src="/job/job/recruitment/RM/img/next_btn.png"></a>
		<div id="introductionDiv">
			<hr id="hr_recruitment">
			<jsp:include page="/job/recruitment/introduction/introWriteForm.jsp"></jsp:include>
		</div>
	</div>
	<div id="rm_3">
		<a href="#" id="prev_btn3" class="recruit_btn_prev"><img src="/job/job/recruitment/RM/img/prev_btn.png"></a>
		<a href="#" id="next_btn3" class="recruit_btn_next"><img src="/job/job/recruitment/RM/img/next_btn.png"></a>
		<div id="applyDiv">
			<hr id="hr_recruitment">
			<jsp:include page="/job/recruitment/apply/applyWriteForm.jsp"></jsp:include>
		</div>
	</div>
	<div id="rm_4">
		<a href="#" id="prev_btn4" class="recruit_btn_prev"><img src="/job/job/recruitment/RM/img/prev_btn.png"></a>
		<a href="#" id="next_btn4" class="recruit_btn_next"><img src="/job/job/recruitment/RM/img/next_btn.png"></a>
		<div id="conditionDiv">
 			<hr id="hr_recruitment">
 			<jsp:include page="/job/recruitment/condition/conditionWriteForm.jsp"></jsp:include> 
 		</div>
	</div>
	<div id="rm_5">
		<a href="#" id="prev_btn5" class="recruit_btn_prev"><img src="/job/job/recruitment/RM/img/prev_btn.png"></a>
		<a href="#" id="next_btn5" class="recruit_btn_next"><img src="/job/job/recruitment/RM/img/next_btn.png"></a>
		<div id="timeDiv">
 			<hr id="hr_recruitment">
 			<jsp:include page="/job/recruitment/time/timeWriteForm.jsp"></jsp:include>
 		</div>	
	</div>
	<div id="rm_6">
		<a href="#" id="prev_btn6" class="recruit_btn_prev"><img src="/job/job/recruitment/RM/img/prev_btn.png"></a>
		<a href="#" id="next_btn6" class="recruit_btn_next"><img src="/job/job/recruitment/RM/img/next_btn.png"></a>
		<div id="personnelDiv"> 
 			<hr id="hr_recruitment">
 			<jsp:include page="/job/recruitment/personnel/personnelForm.jsp"></jsp:include> 
 		</div>	
	</div>
</div>
</body>
</html>