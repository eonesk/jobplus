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
    left: 360px;
    margin-top: 27px;
}

#next_btn1,#next_btn2,#next_btn3,#next_btn4,#next_btn5 {float:right; position: relative;}
/* #prev_btn2,#prev_btn3,#prev_btn4,#prev_btn5,#prev_btn6 {float: left; } */
</style>
<script type="text/javascript">

$(document).ready(function() {
	$("#rm_job").show();
	$("#rm_intro").hide();
	$("#rm_apply").hide();
	$("#rm_condition").hide();
	$("#rm_time").hide();
	$("#rm_personnel").hide();
	
	$("#next_btn1").click(function() {
		$("#rm_job").hide();
		$("#rm_intro").show();
	});
	$("#next_btn2").click(function() {
		$("#rm_intro").hide();
		$("#rm_apply").show();
	});
	$("#next_btn3").click(function() {
		$("#rm_apply").hide();
		$("#rm_condition").show();
	});
	$("#next_btn4").click(function() {
		$("#rm_condition").hide();
		$("#rm_time").show();
	});
	$("#next_btn5").click(function() {
		$("#rm_time").hide();
		$("#rm_personnel").show();
	});
	$("#prev_btn6").click(function() {
		$("#rm_personnel").hide();
		$("#rm_time").show();
	});
	$("#prev_btn5").click(function() {
		$("#rm_time").hide();
		$("#rm_condition").show();
	});
	$("#prev_btn4").click(function() {
		$("#rm_condition").hide();
		$("#rm_apply").show();
	});
	$("#prev_btn3").click(function() {
		$("#rm_apply").hide();
		$("#rm_intro").show();
	});
	$("#prev_btn2").click(function() {
		$("#rm_intro").hide();
		$("#rm_job").show();
	});
	$("#rm_insert").click(function() {
		alert("작성하시겠습니까?");
		
	})
});
</script>
<style type="text/css">

</style>
</head>
<body>
<div id="rm_container" class="rm_container">
			<!-- 1번 -->				
			<span id="rm_job">
				<a href="#" id="next_btn1" class="recruit_btn_next"><img src="/job/job/recruitment/RM/img/next_btn.png"></a>
				<jsp:include page="/job/recruitment/job/jobForm.jsp"></jsp:include>				
			</span>
	
			<!-- 2번 모집요강 -->					
			<span id="rm_intro">
				<a href="#" id="prev_btn2" class="recruit_btn_prev"><img src="/job/job/recruitment/RM/img/prev_btn.png"></a>
				<a href="#" id="next_btn2" class="recruit_btn_next"><img src="/job/job/recruitment/RM/img/next_btn.png"></a>
				<jsp:include page="/job/recruitment/introduction/introWriteForm.jsp"></jsp:include>				
			</span>

			<!-- 3번 자격요건 및 우대조건--> 
			<span id="rm_apply">
				<a href="#" id="prev_btn3" class="recruit_btn_prev"><img src="/job/job/recruitment/RM/img/prev_btn.png"></a>
				<a href="#" id="next_btn3" class="recruit_btn_next"><img src="/job/job/recruitment/RM/img/next_btn.png"></a>
				<jsp:include page="/job/recruitment/apply/applyWriteForm.jsp"></jsp:include>	
			</span>
	
	 		<!-- 4번 근무조건-->				
	  			<span id="rm_condition">
	  				<a href="#" id="prev_btn4" class="recruit_btn_prev"><img src="/job/job/recruitment/RM/img/prev_btn.png"></a>
					<a href="#" id="next_btn4" class="recruit_btn_next"><img src="/job/job/recruitment/RM/img/next_btn.png"></a>
	  				<jsp:include page="/job/recruitment/condition/conditionWriteForm.jsp"></jsp:include>  				
	  			</span>
 							
	 		<!-- 5번 접수기간 및 방법--> 
	  			<span id="rm_time">
	  				<a href="#" id="prev_btn5" class="recruit_btn_prev"><img src="/job/job/recruitment/RM/img/prev_btn.png"></a>
					<a href="#" id="next_btn5" class="recruit_btn_next"><img src="/job/job/recruitment/RM/img/next_btn.png"></a>
	  				<jsp:include page="/job/recruitment/time/timeWriteForm.jsp"></jsp:include>  				
	  			</span> 
					
	 		<!-- 6번 담당자 연락처--> 
	  			<span id="rm_personnel">
	  				<a href="#" id="prev_btn6" class="recruit_btn_prev"><img src="/job/job/recruitment/RM/img/prev_btn.png"></a>
		  				<jsp:include page="/job/recruitment/personnel/personnelForm.jsp" ></jsp:include>
	  				<a href="#" class="rm_insert" id="rm_insert"><span>공고 작성완료</span></a>  				
	  			</span>

</div>	
</body>
</html>