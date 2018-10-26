function checkImageInsert() {
	if(document.imageWriteForm.rsim_Usertitle.value=="") {
		alert("제목을 입력해주세요");
		document.imageWriteForm.rsim_Usertitle.focus();
	} else if(document.imageWriteForm.img.value == "") {
		alert("사진 파일을 등록해주세요.")
		document.imageWriteForm.img.focus();
	} else {
		document.imageWriteForm.submit();
	}
}