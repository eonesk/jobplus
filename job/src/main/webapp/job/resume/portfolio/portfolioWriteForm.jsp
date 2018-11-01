<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
// $(document).ready(function() {
// 	$('#rspf_Url').hide(); 
	
// 	$("input[class='fileType']").change(function() {

// 	 	var radioValue = $(this).val();
// 	 	if(radioValue == "F"){
// 	 		$('#rspf_Url').hide();
// 	 		$('#rspf_File').show(); 
// 	 		$('#rspf_File').val();
// 	 	}  
// 	 	if(radioValue == "U"){
// 	 		$('#rspf_File').hide();
// 	 		$('#rspf_Url').show();
// 	 	}  
// 	});
// });

// function save_pf() {
// 	if(document.pf_form.rspf_Usertitle.value=="") {
// 		alert("제목을 입력해주세요.");
// 		document.pf_form.rspf_Usertitle.focus();
// 	} else if
// 	//처리상태 체크여부
// 	if(document.getElementById("dealStcd1").checked != true && document.getElementById("dealStcd2").checked != true && document.getElementById("dealStcd3").checked != true){
// 	alert("처리상태를 체크해주십시오.");
// 	document.getElementById("dealStcd3").focus();
// 	return;
// 	}
	
// }


$(document).ready(function() { 
    $('#rspf_Url').hide(); 
    
    $("input[class='fileType']").change(function() {
    	
    	var radioValue = $(this).val();
    	if(radioValue == "F"){
    		$('#rspf_Url').hide();
    		$('#rspf_File').show(); 
    		$('#rspf_File').val();
    	}  
    	if(radioValue == "U"){
    		$('#rspf_File').hide();
    		$('#rspf_Url').show();
    	}  
    });
    $("#save").click(function() {
//     	if(!$("#rspf_Usertitle").val()) {
// 			alert("제목을 입력해주세요");
// 			$("#rspf_Usertitle").focus();
//     	}
    	var radioValue = $(":input:radio[name=rspf_Fileorurl]:checked").val();
		//Validation
    	if(!$("#rspf_File").val() && radioValue == "F") {
			alert("추가하실 파일을 선택하세요");
			$("#rspf_File").focus();
			return false;
		}  
    	if(!$("#rspf_Url").val()  && radioValue == "U") {
			alert("URL을 입력하세요"); 
			$("#rspf_Url").focus();
			return false;
		}  
 		var params = $("#form").serialize(); 
//  		alert(rspf_Usertitle+"//"+ rspf_Type +"//"+ rspf_Fileorurl +"//"+ rspf_Url+"//"+ rspf_File);
 		$.ajax({ 
			type: 'POST', 
			url: 'portfolioWrite.do',
			enctype: "multipart/form-data",
			dataType: 'json',  
			data:params,
			success: function(data) {
				if(data > 0) {
					alert("성공");
					$("#form").submit();
					window.close();
				} else {
					alert("실패");
				}
			}
		});
	});
	
	$("#cancle").click(function() {
		window.close();
	});
});

function aaa(){
	document.pf_form.submit();
}

</script>
</head>
<body> 
<h4>첨부파일 등록</h4>
<form id='pf_form' name='pf_form' method="post" action='portfolioWrite.do' enctype="multipart/form-data">
<input type="text" id="rspf_Usertitle" name="rspf_Usertitle" placeholder="저장하실 포트폴리오의 이름을 입력해주세요" size="40">
<table>
	<tr>
		<td>파일구분</td>
		<td>
			<select id="rspf_Type" name="rspf_Type">
				<option value="이력서">이력서</option>
                <option value="경력기술서">경력기술서</option>
                <option value="자격증">자격증</option>
                <option value="증명서">증명서</option>
                <option value="추천서">추천서</option>
                <option value="포트폴리오">포트폴리오</option>
                <option value="기획서">기획서</option>
                <option value="동영상">동영상</option>
                <option value="음성">음성</option>
                <option value="기타">기타</option> 
			</select>			
		</td>
	</tr>
	<tr> 
		<td>파일찾기</td>
		<td>
			<label><input class="fileType" type="radio" name="rspf_Fileorurl" value="F" checked="checked"/> 파일</label>
			<label><input class="fileType" type="radio" name="rspf_Fileorurl" value="U"/> URL</label> 
			<div><input type="file" id='rspf_File' name="pfFile"/></div>
			<div><input type="text" id='rspf_Url' name="rspf_Url" placeholder="http://"/></div>
		</td>
	</tr>
</table>
</form>
<input type="button" value="작성" onclick="aaa();">
<!-- <input type="button" id="save" value="작성" onclick="save_pf"> -->
<input type="button" value="취소" id="cancle">

</body>
</html>