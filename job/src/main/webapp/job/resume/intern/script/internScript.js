function checkWrite() {
	if(document.internWriteForm.rsitType.value == "") {
		alert("활동구분을 선택하세요.")
		document.internWriteForm.rsitType.focus();
	} else if(document.internWriteForm.rsitCompany.value == "") {
		alert("회사명을 입력하세요.")
		document.internWriteForm.rsitCompany.focus();
	} else if(document.internWriteForm.rsitStartdate.value == "") {
		alert("시작년월을 입력하세요.")
		document.internWriteForm.rsitStartdate.focus();
	} else if(document.internWriteForm.rsitEnddate.value == "") {
		alert("종료년월을 입력하세요.")
		document.internWriteForm.rsitEnddate.focus();
	} else if(document.internWriteForm.rsitContent.value == "") {
		alert("활동내역을 입력하세요.")
		document.internWriteForm.rsitContent.focus();
	} else {
		document.internWriteForm.submit();
	}
}