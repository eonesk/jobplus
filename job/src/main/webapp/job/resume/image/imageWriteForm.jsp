<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="script/imageScript.js"></script> -->
<script type="text/javascript"> 
function checkImageInsert() {
	if(document.imageWriteForm.Rsim_Usertitle.value=="") {
		alert("제목을 입력해주세요");  
		document.imageWriteForm.Rsim_Usertitle.focus();
	} else if(document.imageWriteForm.img.value == "") {
		alert("사진 파일을 등록해주세요.")    
		document.imageWriteForm.img.focus();
	} else {  
		document.imageWriteForm.submit();
	}
}
// 	저장하면 화면 변하게 해야함
	
</script>
</head>
<body>
<h4>사진 올리기</h4>
<div>
<form action="imageWrite.do" id='imageWriteForm' name="imageWriteForm" id="" enctype="multipart/form-data" method="post">
	<div>
		<input type="text" name="Rsim_Usertitle" placeholder="목록에 등록할 title을 입력하세요" style="height:40px; width:380px;">
	</div>
	<div>
		<input type="file" name="img" placeholder="선택된 이미지가 없습니다">
		<ul>
			<li>*사진 파일은 10MB 미만의 JPG,GIF 파일만 업로드 가능합니다</li>
			<li>*사진 크기는 100*140 픽셀이 가장 적합합니다</li>
		</ul>
	</div>
</form>		
	<div class="bottom_btn">
		<input type="button" value="등록" onclick="checkImageInsert()">
		<input type="button" value="취소" onclick="window.close();">
	</div>
</div>

</body>
</html>