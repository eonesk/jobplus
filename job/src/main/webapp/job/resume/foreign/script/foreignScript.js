function checkForeignInsert() {
	if(document.foreignWriteForm.rsfName.value=="") {
		alert("나라 입력");
		document.foreignWriteForm.rsfName.focus();
	} else {
		document.foreignWriteForm.submit();
	}
}