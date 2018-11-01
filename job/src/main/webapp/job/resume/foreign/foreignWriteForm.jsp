<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해외경험입력</title>
<script type="text/javascript" src="script/foreignScript.js"></script>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#save").click(function() {
			if(!$("#rsf_Name").val()) {
				alert("국가명을 입력해주세요.");
				$("#rsf_Name").focus();
			} else if(!$("#rsf_Startdate").val()) {
				alert("시작일을 입력해주세요.");
				$("#rsf_Startdate").focus();
			} else if(!$("#rsf_Enddate").val()) {
				alert("종료일 입력해주세요.");
				$("#rsf_Enddate").focus();
			} else if(!$("#rsf_Content").val()) {
				alert("내용을 입력해주세요.");
				$("#rsf_Content").focus();
			} else {
				window.open("foreignWrite.jsp","","width=500px height=500px");
			}
		}); 
		$("#load").click(function() {
			window.open("foreignList.jsp", "", "width=570px height=600px");
		});
	});
	$(function() {
		var count = 0;
		$("#plus_tap").click(function() {
			count++;
			alert("탭추가"+count);
			if(count >=3) {
				alert("항목은 최대 3개까지만 추가가능합니다.");
				return false;
			}
			var clone = $("#foreign_section").clone();
			clone.find('*[id]').each(function() {
				$(this).attr("id",$(this).attr("id")+count);
			});
			clone.insertAfter("#foreign_section");
		});
		$(function() {
			$("#delete_tap").on("click", function() {
				$("delete_tap").remove();
				alert("삭제되었습니다 + count);
			}
			if(count ==1) {
				alert("더 이상 삭제할 수 없습니다.");
				return false;
			}
		});
	});
	
// 		$("#loadForeignList").click(function() {
// 			window.open("./foreignList.jsp","","width=400px height=500px");
// 		});
// 	});
//////////////////
// 	function checkForeignInsert() {
// 		if(document.foreignWriteForm.rsf_Usertitle.value=="") {
// 			alert("제목을 입력해주세요.");  
// 			document.foreignWriteForm.rsf_Usertitle.focus();
// 		} else if(document.foreignWriteForm.rsf_Name.value == "") {
// 			alert("국가명을 입력해주세요.")    
// 			document.foreignWriteForm.rsf_Name.focus();
// 		} else if(document.foreignWriteForm.rsf_Startdate.value == "") {
// 			alert("시작일을 입력해주세요.")    
// 			document.foreignWriteForm.rsf_Startdate.focus();
// 		} else if(document.foreignWriteForm.rsf_Enddate.value == "") {
// 			alert("종료일을 입력해주세요.")    
// 			document.foreignWriteForm.rsf_Enddate.focus();
// 		} else {  
// 			document.foreignWriteForm.submit();	
// 		}
// 	}
</script>
<style type="text/css">
.subtitle {
	font: 20px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: bold;
	color: #2A120A;
	letter-spacing: -1px;
}
.foreign_1 {
		width: 130px;
		height: 40px;
		margin: 0px 10px 10px 0px;
}
.foreign_2 {
		width: 180px;
		height: 40px;
		margin: 0px 10px 10px 5px;	
}
#foreign_area {
    position: relative;
    margin-bottom: 40px;
    min-height: 80px;
    background: #fff;
    box-sizing: border-box;
    box-shadow: 1px 1px 2px 1px rgba(0,0,0,0.1);
    font-size: 0;
}
.button {
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
.button:hover {
    background-color: #2E9AFE;
}
#plus_tap {
	width: 100%;
	height: 50px;
	background-color: #fff;
    border: 1px solid #5882FA;
    color: #5882FA;
    text-align: center;
    text-decoration: none;
    font-size: 15px;
    display: inline-block;
    cursor: pointer;
}
#foreign_section {
	border: 1px solid #e6e6e6;
	padding: 15px;
}
</style>
</head>
<body>
	<!-- jQuery -->
<div id="foreign_area">
	<p class="subtitle">해외경험</p>
	<div id="foreign_section">
		<div>
			<input type="text" id="rsf_Name" name="rsf_Name" class="foreign_1" placeholder="국가명">
			<input type="date" id="rsf_Startdate" name="rsf_Startdate" class="foreign_2">
			<input type="date" id="rsf_Enddate" name="rsf_Enddate" class="foreign_2">
		</div>
		<div>
			<textarea rows="6" cols="73" id="rsf_Content" name="rsf_Content" class="foreign_3"></textarea> 
		</div>
	</div>
	<div align="center">
		<input type="button" value="저장하기" class="button" id="save">	
		<input type="button" value="불러오기" class="button" id="load">	
		<input type="button" value="삭제" id="delete_tap" class="delete_tap">	
	</div>	
	<input type="button" value="추가" id="plus_tap" class="plus_tap">	
</div>
</body>
</html>