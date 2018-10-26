<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	display: block;
    width: 100px;
    height: 140px;
    box-sizing: border-box;
	background: #fafafa
	url(img/bg_photo_add.png)
	50% 50% no-repeat;
}

</style>
<script type="text/javascript">

	function photoWrite() {
		window.open("imageWriteForm.jsp",
				"나와라얍~", "width=400, height=300, left=100, top=50");
	}
	function photoList() {
		window.open("imageList.jsp",
				"목록떠라", "width=500, height=350, left=100, top=50");
	}

</script>
</head>
<body>
	<!-- 이력서폼 사진 버튼 -->
	<div class="resume_image">
		<a href="#" class="box_image">
			<img alt="" src="" class="user_image" border="1" width="100" height="140" onclick="photoWrite();">
		</a>
		<a class="image_delete" href="##" style="display: none;">
			<span class="blind">사진 삭제</span>
		</a>
	</div>
	<div>
	<input type="button" value="내 사진목록" onclick="photoList();">
	</div>
</body>
</html>