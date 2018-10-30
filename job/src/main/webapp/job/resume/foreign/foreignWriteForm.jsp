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

	$(function() {
		$("#save").click(function() {
			if(!$("#rsf_Name").val()) {
				alert("국가명을 입력해주세요.");
				$("#rsf_Name").focus();
			} else if(!$("#rsf_Startdate").val()) {
				alert("시작일을 입력해주세요.");
				$("#rsf_Startdate").focus();
			} else if(!$("#rsf_Enddate").val()) {
				alert("종료일 입력해주세요.");
				$("#rsf_Enddate").focus();
			} else if(!$("#rsf_Content").val()) {
				alert("내용을 입력해주세요.");
				$("#rsf_Content").focus();
			} else {
				window.open("foreignWrite.jsp","","width=500px height=500px");
			}
		}); 
		$("#load").click(function() {
			window.open("foreignList.jsp", "", "width=570px height=600px");
		});
	});
// 		$("#loadForeignList").click(function() {
// 			window.open("./foreignList.jsp","","width=400px height=500px");
// 		});
// 	});
//////////////////
// 	function checkForeignInsert() {
// 		if(document.foreignWriteForm.rsf_Usertitle.value=="") {
// 			alert("제목을 입력해주세요.");  
// 			document.foreignWriteForm.rsf_Usertitle.focus();
// 		} else if(document.foreignWriteForm.rsf_Name.value == "") {
// 			alert("국가명을 입력해주세요.")    
// 			document.foreignWriteForm.rsf_Name.focus();
// 		} else if(document.foreignWriteForm.rsf_Startdate.value == "") {
// 			alert("시작일을 입력해주세요.")    
// 			document.foreignWriteForm.rsf_Startdate.focus();
// 		} else if(document.foreignWriteForm.rsf_Enddate.value == "") {
// 			alert("종료일을 입력해주세요.")    
// 			document.foreignWriteForm.rsf_Enddate.focus();
// 		} else {  
// 			document.foreignWriteForm.submit();	
// 		}
// 	}
	
	
	
</script>
</head>
<body>
	<!-- jQuery -->
<div>
	<h3>해외경험</h3>
	<label>국가명: <input type="text" id="rsf_Name" name="rsf_Name"></label>
	<label>시작년월: <input type="date" id="rsf_Startdate" name="rsf_Startdate"></label>
	<label>종료년월: <input type="date" id="rsf_Enddate" name="rsf_Enddate"></label>
	<div>내용: <textarea rows="5" cols="80" id="rsf_Content" name="rsf_Content"></textarea></div> 
</div>
<div>
	<input type="button" value="작성" id="save">
	<input type="button" value="목록보기" id="load"> 
</div>

</body>
</html>