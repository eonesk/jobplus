<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
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
#logo_upload { 
    width: 350px;
    font-size: 12px;
    border: 1px solid #ccc;
    background-color: #e6e6e6;
}
</style>
<script type="text/javascript"> 
$(function() {
	$("#logo_save").click(function() {
		if(!$("#logo_upload").val()) {
			alert("사진을 등록해주세요."); 
			$("#logo_upload").focus();
			return false;
		}
		document.logoWriteForm.submit();
	});
	$("#logo_cancle").click(function() {
		window.close();
	});

});

// function upload() {
// 	var logo_i = documnet.getElementById("logo_upload");
// 	var file = logo_ifiles[0];
// 	console.log(file);
// 	var formData = new Data();
// 	formData.append("logo_upload",file);
// 	$.ajax({
// 		type:"POST",
// 		url:"logoWrite.do",
// 		data: formData,
// 		processData: false,
// 		contentType: false,
// 		success:function(data) {
// 			$("#cpl_Seq",opener.document).attr('src','/job/job/company/logo/img/storage/'+data);
// 		}
// 	});
// }
</script>

</head>
<body>
<p class="subtitle">로고 등록/수정</p>
<div>
	<form action="logoWrite.do" id='logoWriteForm' name="logoWriteForm" enctype="multipart/form-data" method="post">
		<div class="uploadform">
			<input type="file" name="img" id="logo_upload" onchange="upload()">
			<ul>
				<li>*파일형식은 jpg, jpeg, gif, png만 업로드 가능합니다</li>
				<li>*등록 가능한 최대 용량은 1M입니다</li>
			</ul>
		</div>
	</form>		
	<div align="center">
		<button type="button" id="logo_save">등록</button>
		<button type="button" id="logo_cancle">취소</button>
	</div>
</div>

</body>
</html>