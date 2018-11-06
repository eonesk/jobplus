<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"> 
$(function() {
	$("#img_save").click(function() {
		if(!$("#thum_upload").val()) {
			alert("사진을 등록해주세요."); 
			$("#thum_upload").focus();
			return false;
		}
		function readImg(input) {
			if(input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$(opener.document).find("#corp_thumnail").val("src",e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
		document.imageWriteForm.submit();
	});
	$("#img_cancle").click(function() {
		window.close();
	});
});


</script>
<style type="text/css">
input, button {
    font-family: "Malgun Gothic", "맑은 고딕", Dotum, 돋움, AppleGothic, sans-serif;
    font-size: 16px;
    display: inline-block;
}
.subtitle {
	font: 20px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: bold;
	color: #2A120A;
	letter-spacing: -1px;
}
#user_title {
	height: 40px;
	width: 440px;
}
.uploadform {
    margin-top: 10px;
    padding: 20px 0;
    height: 100px;
    box-sizing: border-box;
    background-color: #f8f8f8;
    text-align: center;
}
.uploadform > ul {	
	list-style:none;
	margin: 6px 0px 0px 0px;
    font-size: 12px;
    color: #888;
    line-height: 18px;
    position: relative;
    right: 20px;
}
button {
	width:100px;
    background-color: #5882FA;
    border: none;
    color:#fff;
    padding: 10px 0;
    text-align: center;
    display: inline-block;
    font-size: 13px;
    margin: 20px 0px 0px 0px;
    cursor: pointer;
}
button:hover {
    background-color: #2E9AFE;
}
#thum_upload { 
    width: 350px;
    font-size: 12px;
    border: 1px solid #ccc;
    background-color: #e6e6e6;
}
</style>
</head>
<body>
<p class="subtitle">로고 등록/수정</p>
<div>
	<form action="imageWrite.do" id='imageWriteForm' name="imageWriteForm" id="" enctype="multipart/form-data" method="post">
		<div class="uploadform">
			<input type="file" name="img" id="thum_upload">
			<ul>
				<li>*파일형식은 jpg, jpeg, gif, png만 업로드 가능합니다</li>
				<li>*등록 가능한 최대 용량은 1M입니다</li>
			</ul>
		</div>
	</form>		
	<div align="center">
		<button type="button" id="img_save">등록</button>
		<button type="button" id="img_cancle">취소</button>
	</div>
</div>

</body>
</html>