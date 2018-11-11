<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function logoList() { 
		window.open("/job/job/company/logo/logoList.do", 
				"이미지저장목록", "width=470, height=400, left=400, top=100");
}
</script>
<style type="text/css">
img#cpl_Seq {
    display: block;
    width: 140px;
    height: 70px;
    box-sizing: border-box;
    border: 1px solid lightgray;
} 
 	#logo_btn{float: left;     margin-left: 10px;}  
 	#cpl_Seq{float: left;} 
	
input#btn_imageload {
	float: left;
    position: relative;
    left: 10px;
}
</style>
</head>
<body>
<input type="hidden" id="cpl__Seq">
<c:if test="${!empty logoDTO }">  
	<img id='cpl_Seq' alt="" src="/job/job/company/logo/img/storage/${logoDTO.cpl_Name}">
</c:if>  
<c:if test="${empty logoDTO }">
	<img alt="cpl_Seq" src="" name="cpl_Seq" id="cpl_Seq">
</c:if>
<input type="button" value="등록" class="button" id="logo_btn" 
		onclick="window.open('/job/job/company/logo/logoWriteForm.jsp','','width=460, height=300, left=100, top=50')">
<input type="button" value="로고 목록" id="btn_imageload" class="button" onclick="logoList();">	
</body>
</html>