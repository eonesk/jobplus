function checkForeignInsert() {
	if(document.foreignWriteForm.mId.value=="") {
		alert("아이디를 입력하세요");
	} else {
		document.foreignWriteForm.submit();
	}
}