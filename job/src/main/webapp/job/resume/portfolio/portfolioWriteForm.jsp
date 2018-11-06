<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(document).ready(function() {
		    $('#rspf_Url').hide(); 
		    
		    $("input[class='fileType']").change(function() {
		    	//라디오 버튼 선택에 따른 입력창 show
		    	var radioValue = $(this).val();
		    	if(radioValue == "F"){
		    		$('#rspf_Url').hide();
		    		$('#rspf_File').show(); 
		    		$('#rspf_File').val();
		    		$('#rspf_Url').val("");
		    	}  
		    	if(radioValue == "U"){
		    		$('#rspf_File').hide();
		    		$('#rspf_Url').show();
		    		$('#rspf_File').val("");
		    	}  
		    });
		    
		    $("#save").click(function() {
		    	if(!$("#rspf_Usertitle").val()) {
					alert("제목을 입력해주세요");
					$("#rspf_Usertitle").focus();
					return false; 
		    	}
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
		    	document.pf_form.submit();
			});			
			$("#cancle").click(function() {
				window.close();
			});
		});
	});	

</script>
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
#rspf_Usertitle {
	height: 40px;
	width: 440px;
}
.uploadform {
    margin-top: 10px;
    padding: 20px 0;
    height: 100px;
    box-sizing: border-box;
    background-color: #f8f8f8;
    text-align: center;
}
.uploadform > table {	
	list-style: none;
    font-size: 13px;
    color: #888;
    line-height: 18px;
    position: relative;
    bottom: 10px;
	left: 30px; 
}
#rspf_File { 
    width: 310px;
    font-size: 12px;
    border: 1px solid #ccc;
    background-color: #e6e6e6;
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
</style>
</head>
<body> 
<p class="subtitle">첨부파일 등록</p>
<form id='pf_form' name='pf_form' method="post" action='portfolioWrite.do' enctype="multipart/form-data">
<input type="text" id="rspf_Usertitle" name="rspf_Usertitle" placeholder="저장하실 포트폴리오의 이름을 입력해주세요" size="40">
<div class="uploadform">
	<table>
		<tr>
			<td height="20px">파일구분</td>
			<td>
				<select id="rspf_Type" name="rspf_Type" style="margin-right: 210px;">
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
			<td height="40px">파일찾기</td>
			<td>
				<div style="margin-right: 210px;">
					<label><input class="fileType" type="radio" name="rspf_Fileorurl" value="F" checked="checked"/> 파일</label>
					<label><input class="fileType" type="radio" name="rspf_Fileorurl" value="U"/> URL</label> 
				</div>
				<div><input type="file" id='rspf_File' name="pfFile"/></div>
				<div><input type="text" id='rspf_Url' name="rspf_Url" placeholder="http://" style="font-size: 13px; width: 303px;"/></div>
			</td>
		</tr>
	</table>
</div>
</form>
<div align="center">
	<button type="button" id="save">저장</button>
	<button type="button" id="cancle">취소</button>
</div>
<!-- <input type="button" id="save" value="작성" onclick="save_pf"> -->


</body>
</html>