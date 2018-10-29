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
    $('#urlForm').hide(); 
    
    $("input[class='fileType']").change(function() {

    	var radioValue = $(this).val();
    	if(radioValue == "1"){
    		$('#urlForm').hide();
    		$('#fileForm').show(); 
    		$('#fileForm').val();
    	}  
    	if(radioValue == "2"){
    		$('#fileForm').hide();
    		$('#urlForm').show();
    	}  
    });
    $("#savePortfolio").click(function() {
    	var radioValue = $(":input:radio[name=rs_pfFileorurl]:checked").val();
		//Validation
    	if(!$("#fileForm").val() && radioValue == "1") {
			alert("추가하실 파일을 선택하세요");
			$("#fileForm").focus();
			return false;
		}  
    	else if(!$("#urlForm").val()  && radioValue == "2") {
			alert("URL을 입력하세요"); 
			$("#urlForm").focus();
			return false;
		} else {
			alert("등록되었습니다");
			self.close();
		}  
    });
// 		$("#savePortfolio").click(function() {
// 			$("form[name='portfolioWriteForm']").submit(); 
// 		});

 });
      
//     $("#savePortfolio").click(function() {  
//     
			
//     }); 
//     	if (checkPfInsert) {
//     		location.replace("portfolioWrite.jsp");
//     	}

</script>
</head>
<body>
<h4>첨부파일 등록</h4>
<form action="portfolioWrite.do" enctype="multipart/form-data" name="portfolioWriteForm" method="post">
타이틀 입력 : <input type="text" name="rs_pfUsertitle">
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
			<label>1: <input class="fileType" type="radio" name="rs_pfFileorurl" value="1" checked="checked"/> 파일</label>
			<label>2: <input class="fileType" type="radio" name="rs_pfFileorurl" value="2"/> URL</label> 
			<div><input type="file" id='fileForm' name="pfFile"></div>
			<div><input type="text" id='urlForm' name="rs_pfUrl" id=""  placeholder="http://" value=""></div>
		</td>
	</tr>
</table>
<!-- <input type="button" value="작성" onclick="checkForeignInsert()"> -->
<input type="button" id="savePortfolio" value="작성">
<input type="button" value="취소" onclick="window.close();">
</form>
</body>
</html>