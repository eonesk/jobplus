<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
.resume_image {	
	border: 1px solid #d4d4d4;
	background-color: #ffffff;
	padding: 9px;
	width: 120px;
    height: 160px;
    box-sizing: border-box;
}
.resume_image .user_image {
	color: lightgray;
	display: block;
    width: 100px;
    height: 140px;
    box-sizing: border-box;
	background: #fafafa
	url(img/bg_photo_add.png)
	50% 50% no-repeat;
}
#btn_imageload {
	width:115px;
    background-color: #5882FA;
    border: none;
    color:#fff;
    padding: 7px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    margin: 3px;
    cursor: pointer;
}
</style>
<script type="text/javascript">

	function photoWrite() {
		window.open("imageWriteForm.jsp",
				"이미지불러오기", "width=460, height=300, left=100, top=50, resizable=no");
	}
	function photoList() { 
// 		if(${getImageOfId > 0}) {
			window.open("imageList.do", 
					"이미지저장목록", "width=470, height=400, left=400, top=100");

	}
</script>
</head>
<body>




	<!-- 이력서폼 사진 버튼 -->
<%-- 	 ||${imageDTO.rsim_Seq}||   --%>
<%-- 	 ||${imageDTO.rsim_Name}||  --%>
<%-- 	 ||${imageDTO.m_Id}||  --%>
<%-- 	 ||${imageDTO.rsim_Usertitle}||  --%>

	<div class="resume_image"> 
		<a href="#" class="box_image">
		<c:if test="${!empty imageDTO }">  
			<img id='aaa' alt="" src="img/storage/${imageDTO.rsim_Name}" class="user_image" border="1" width="100" height="140" onclick="photoWrite();">
		</c:if>   
		<c:if test="${empty imageDTO }">
			<img id='aaa' alt="" src="" class="user_image" border="1" width="100" height="140" onclick="photoWrite();">
		</c:if>
		</a>
<!-- 		<a class="image_delete" href="##" style="display: none;"> -->
<!-- 			<span class="blind">사진 삭제</span> -->
<!-- 		</a> -->
	</div>
	<div>
	<input type="button" value="내 사진목록" id="btn_imageload" onclick="photoList();">
	</div>
</body>
</html>