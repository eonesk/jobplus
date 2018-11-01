<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() { 
    $('#rs_pfUrl').hide(); 
    
    $("input[class='fileType']").change(function() {

    	var radioValue = $(this).val();
    	if(radioValue == "F"){
    		$('#rs_pfUrl').hide();
    		$('#rs_pfFile').show(); 
    		$('#rs_pfFile').val();
    	}  
    	if(radioValue == "U"){
    		$('#rs_pfFile').hide();
    		$('#rs_pfUrl').show();
    	}  
    });
    $("#save").click(function() {
    	if(!$("#rs_pfUsertitle").val()) {
			alert("제목을 입력해주세요");
			$("#rs_pfUsertitle").focus();
    	}
    	var radioValue = $(":input:radio[name=rs_pfFileorurl]:checked").val();
		//Validation
    	if(!$("#rs_pfFile").val() && radioValue == "F") {
			alert("추가하실 파일을 선택하세요");
			$("#rs_pfFile").focus();
			return false;
		}  
    	else if(!$("#rs_pfUrl").val()  && radioValue == "U") {
			alert("URL을 입력하세요"); 
			$("#rs_pfUrl").focus();
			return false;
		}  
 		var params = $("#form").serialize(); 
//  		alert(rs_pfUsertitle+"//"+ rs_pfType +"//"+ rs_pfFileorurl +"//"+ rs_pfUrl+"//"+ rs_pfFile);
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
	document.form.submit();
}

</script>
</head>
<body> 
<h4>첨부파일 등록</h4>
<form id='form' name='form' method="post" action='portfolioWrite.do' enctype="multipart/form-data">
<input type="text" id="rs_pfUsertitle" name="rs_pfUsertitle" placeholder="저장하실 포트폴리오의 이름을 입력해주세요" size="40">
<table>
	<tr>
		<td>파일구분</td>
		<td>
			<select id="rs_pfType" name="rs_pfType">
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
			<label><input class="fileType" type="radio" name="rs_pfFileorurl" value="F" checked="checked"/> 파일</label>
			<label><input class="fileType" type="radio" name="rs_pfFileorurl" value="U"/> URL</label> 
			<div><input type="file" id='rs_pfFile' name="pfFile"/></div>
			<div><input type="text" id='rs_pfUrl' name="rs_pfUrl" placeholder="http://"/></div>
		</td>
	</tr>
</table>
</form>
<!-- <input type="button" value="작성" onclick="aaa();"> -->
<input type="button" id="save" value="작성">
<input type="button" value="취소" id="cancle">

</body>
</html>