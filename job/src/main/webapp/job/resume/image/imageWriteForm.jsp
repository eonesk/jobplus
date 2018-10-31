<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
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
// $(function() {
// 	$("#photoSave").click(function() {
// 		if(!$("#a").val()) {
// 			alert("제목을 입력하세요");
// 			$("#a").focus();
// 		} else if(!$("#b").val()) {
// 			alert("사진을 등록하세요.");
// 			$("#b").focus();
// 		} else {
//몰라..ㅇ;거 			var photo = $("#a").val("img/storage/"+('#a').val());
// 			$(opener.document).find("#aaa").attr("src",photo);
// 			$("#imageWriteForm").submit();
// 		}		
// 	});
// });


	
</script>
</head>
<body>
<h4>사진 올리기</h4>
<div>
<form action="imageWrite.do" id='imageWriteForm' name="imageWriteForm" id="" enctype="multipart/form-data" method="post">
	<div>
		<input type="text" id="a" name="Rsim_Usertitle" placeholder="목록에 등록할 title을 입력하세요" style="height:40px; width:380px;">
	</div>
	<div>
		<input type="file" name="img" id="b" placeholder="선택된 이미지가 없습니다">
		<ul>
			<li>*사진 파일은 10MB 미만의 JPG,GIF 파일만 업로드 가능합니다</li>
			<li>*사진 크기는 100*140 픽셀이 가장 적합합니다</li>
		</ul>
	</div>
</form>		
	<div class="bottom_btn">
		<input type="button" value="등록" onclick="checkImageInsert()" id="photoSave">
		<input type="button" value="취소" onclick="window.close();">
	</div>
</div>

</body>
</html>