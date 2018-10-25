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
</head>
<body>
<div class="resume_image">
	<a href="" class="box_image">
		<img alt="" src="" class="user_image" border="1" width="100" height="140">
	</a>
	<a class="image_delete" href="##" style="display: none;">
		<span class="blind">사진 삭제</span>
	</a>
</div>
<form action="../rsimage/imageWrite.do" method="post" enctype="multipart/form-data">
	<input type="file" name="img"><br>
	<label>아이디:<input type="text" name="mId"></label><br>
	<label>등록할이름:<input type="text" name="rsimUsertitle"></label><br>
	<input type="submit" value="등록" >
</form>
</body>
</html>