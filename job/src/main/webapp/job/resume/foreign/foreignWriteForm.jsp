<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해외경험입력</title>
<script type="text/javascript" src="script/foreignScript.js"></script>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

// 	$(function() {
// 		$("#SaveForeignList").click(function() {
// 			if(!$("#foreignTitle").val()) {
// 				alert("제목을 입력해주세요.");
// 				$("#foreignTitle").focus();
// 			} else if(!$("#foreignState").val()) {
// 				alert("국가명을 입력해주세요.");
// 				$("#foreignState").focus();
// 			} else if(!$("#foreignStart").val()) {
// 				alert("시작일을 입력해주세요.");
// 				$("#foreignStart").focus();
// 			} else if(!$("#foreignEnd").val()) {
// 				alert("종료일 입력해주세요.");
// 				$("#foreignEnd").focus();
// 			} else {
// 		}); 
		
// 		$("#loadForeignList").click(function() {
// 			window.open("./foreignList.jsp","","width=400px height=500px");
// 		});
// 	});
	function checkForeignInsert() {
		if(document.foreignWriteForm.rsf_Usertitle.value=="") {
			alert("제목을 입력해주세요.");  
			document.foreignWriteForm.rsf_Usertitle.focus();
		} else if(document.foreignWriteForm.rsf_Name.value == "") {
			alert("국가명을 입력해주세요.")    
			document.foreignWriteForm.rsf_Name.focus();
		} else if(document.foreignWriteForm.rsf_Startdate.value == "") {
			alert("시작일을 입력해주세요.")    
			document.foreignWriteForm.rsf_Startdate.focus();
		} else if(document.foreignWriteForm.rsf_Enddate.value == "") {
			alert("종료일을 입력해주세요.")    
			document.foreignWriteForm.rsf_Enddate.focus();
		} else {  
			document.foreignWriteForm.submit();	
		}
	}
	
	
	
</script>
</head>
<body>
<form action="foreignWrite.do" name="foreignWriteForm" method="post" id="aaa">
<label>타이틀: <input type="text" id="foreignTitle" name="rsf_Usertitle"></label><br>
<label>국가명: <input type="text" id="foreignState" name="rsf_Name"></label>
<label>시작년월: <input type="date" id="foreignStart" name="rsf_Startdate"></label>
<label>종료년월: <input type="date" id="foreignEnd" name="rsf_Enddate"></label>
<div>내용: <textarea rows="5" cols="80" name="rsf_Content"></textarea></div> 
<!-- <a href="#" id="loadForeignList">목록보기</a> -->
<!-- <a href="#" id="SaveForeignList">작성하기</a> -->

<input type="button" value="작성" onclick="checkForeignInsert()">
<input type="button" value="목록보기" onclick="window.open('/job/job/resume/foreign/foreignList.do','','width=430,height=500,left=400, top=100')"> 
</form>
</body>
</html>