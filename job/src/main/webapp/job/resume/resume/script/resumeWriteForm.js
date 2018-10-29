function writeCheck() {
	if(document.resumeWriteForm.m_Name.value==""){
		alert("이름을 입력하세요.");
		document.resumeWriteForm.m_Name.focus();
	}else if(document.resumeWriteForm.m_Birth.value==""){
		alert("생년월일을 입력하세요.");
		document.resumeWriteForm.m_Birth.focus();
	}else if(document.resumeWriteForm.m_Gender.value==""){
		alert("성별을 입력하세요.");
		document.resumeWriteForm.m_Gender.focus();
	}else if(document.resumeWriteForm.m_Email.value==""){
		alert("이메일을 입력하세요.");
		document.resumeWriteForm.m_Email.focus();
	}else if(document.resumeWriteForm.m_Homenum.value==""){
		alert("집번호를 입력하세요.");
		document.resumeWriteForm.m_Homenum.focus();
	}else if(document.resumeWriteForm.m_Phone.value==""){
		alert("핸드폰번호를 입력하세요.");
		document.resumeWriteForm.m_Phone.focus();
	}else if(document.resumeWriteForm.m_Address.value==""){
		alert("주소를 입력하세요.");
		document.resumeWriteForm.m_Address.focus();
	}else if(document.resumeWriteForm.rs_title.value==""){
		alert("이력서 제목을 입력하세요.");
		document.resumeWriteForm.rs_title.focus();
	}
}