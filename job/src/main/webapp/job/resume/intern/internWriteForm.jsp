<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>internwriteForm</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">	
	var count_intern = 0;		
	$(function() {	
		$("#rsit_t").hide();
		
		$("#internplus").click(function() {		
			count_intern++;
			var num = count_intern;	
			var clone = $("#rsit_t").clone().attr('id', 'rsit_t' + count_intern);
			
			if (count_intern >= 4) {
				count_intern--;
				alert("항목추가는 최대 3개까지 입력가능합니다.");
				return false;
			}
			
			clone.find('*[id]').each(function() {
				$(this).attr("id", $(this).attr("id") + count_intern);
			});
			
			clone.insertAfter("#rsit_t");
			$("#rsit_t" + num).show();
			
			$("#interndelete" + num).on("click", function() {
				/*$("#t" + count_intern).remove();*/
				$(this).parent("#rsit_t" + num).remove();
				$("#rsit_Seq"+num).val("");
				count_intern--;
			});
			
			$("#internsave" + num).on("click", function() {
				if ($("#rsitType" + num).val() == "활동구분") {
					alert("활동구분 선택하세요.");
					$("#rsitType" + num).focus();
					return false;
				}
				if (!$("#rsitCompany" + num).val()) {
					alert("회사,기관명을 입력하세요.");
					$("#rsitCompany" + num).focus();
					return false;
				}
				if (!$("#rsitStartdate" + num).val()) {
					alert("시작년월을 입력하세요.");
					$("#rsitStartdate" + num).focus();
					return false;
				}
				if (!$("#rsitEnddate" + num).val()) {
					alert("종료년월을 입력하세요.");
					$("#rsitEnddate" + num).focus();
					return false;
				}
				if (!$("#rsitContent" + num).val()) {
					alert("활동내용을 입력하세요.");
					$("#rsitContent" + num).focus();
					return false;
				}
				window.open("/job/job/resume/intern/internWrite.jsp?num=" + num, "", "width=500px height=500px");
			});			
		});
		$("#internload").click(function() {
			window.open("/job/job/resume/intern/internLoad.jsp?count_intern=" + count_intern, "", "width=500px height=500px");
		});
	});
	
	/** Load 함수 */
	function selected_rsit(accumSeq, num) {
		$(function() {
			count_intern = num;
			$.ajax({
				type: 'POST',
				url: '/job/job/resume/intern/LoadView.do',
				dataType: 'json',
				data: {
					"accumSeq": accumSeq
				},
				success: function(data) {					
					$.each(data.items, function(index, item) {
						var testDTO = item;
						
						count_intern++;
						
						var num = count_intern;
						var clone = $("#rsit_t").clone().attr("id", "rsit_t" + num);
						
						// id&name 넘버링 변경 작업
						clone.find("*[id]").each(function() {
							$(this).attr("id", $(this).attr("id") + num);
						});
						
						clone.find("*[name]").each(function() {
							$(this).attr("name", $(this).attr("name") + num);
						});
						
						clone.insertAfter("#rsit_t");
						
						$("#rsit_t" + num).show();
						
						/** 이벤트 바인딩 */
						// 'X'표 눌렀을 때 닫기
						$("#interndelete" + num).on("click", function() {
							$(this).parent("#t" + num).remove();
							$("#rsit_Seq"+num).val("");
							count_intern--;
						});
						
						// 저장버튼 눌렀을 때
						$("#internsave" + num).on("click", function() {
							if ($("#rsitType" + num).val() == "활동구분") {
								alert("활동구분 선택하세요.");
								$("#rsitType" + num).focus();
								return false;
							}
							if (!$("#rsitCompany" + num).val()) {
								alert("회사,기관명을 입력하세요.");
								$("#rsitCompany" + num).focus();
								return false;
							}
							if (!$("#rsitStartdate" + num).val()) {
								alert("시작년월을 입력하세요.");
								$("#rsitStartdate" + num).focus();
								return false;
							}
							if (!$("#rsitEnddate" + num).val()) {
								alert("종료년월을 입력하세요.");
								$("#rsitEnddate" + num).focus();
								return false;
							}
							if (!$("#rsitContent" + num).val()) {
								alert("활동내용을 입력하세요.");
								$("#rsitContent" + num).focus();
								return false;
							}
							window.open("/job/job/resume/intern/internWrite.jsp?num=" + num, "", "width=500px height=500px");
						});	

						$("#rsit_Seq" + num).val(testDTO.rsit_Seq);
						$("#rsitSeq" + num).val(testDTO.rsit_Seq);
						$("#rsitType" + num).val(testDTO.rsit_Type);
						$("#rsitCompany" + num).val(testDTO.rsit_Company);
						$("#rsitStartdate" + num).val(testDTO.rsit_Startdate);
						$("#rsitEnddate" + num).val(testDTO.rsit_Enddate);
						$("#rsitContent" + num).val(testDTO.rsit_Content);
							
					});					
				},
				error: function(e) {
					 alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.: ' + e.status);
				}
			});			
		});
	}
</script>
<style type="text/css">
.write {
	height: 100%;
    width: 100%;
    background-color: white;
    font: 12px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
    color: #666;
    letter-spacing: -1px;
    padding: 0;
    margin: 0;
    overflow: auto;
}
.title {
	font: 24px "맑은 고딕", Malgun Gothic, "돋움", Dotum, sans-serif;
	font-weight: bold;
	color: #2A120A;
}
.fieldset_intern {
	margin: 0px auto;
	width:95%;
	background-color: #FFFFFF;
	border: 1px solid lightgray;
}
.content {
	padding-top: 5px;
}
.internsave, .internload {
	width: auto;
    background-color: #5882FA;
    border: none;
    color:#fff;
    padding: 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 5px;
    margin-left : 0;
    cursor: pointer;
}
.internsave:hover, .internload:hover {
    background-color: #2E9AFE;
}
.internplus{
	width:948px;
	height: 50px;
	background-color: #5882FA;
	border: none;
	color:#fff;
	padding: 10px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 26px;
	cursor: pointer;
}
.interndelete{
	width: 35px;
	height: 15px;
	margin-left: 348px;
}
.rsitType {
	width:100px;
	height:35px;
}
.rsitCompany {
	width:200px;
	height:28px;
}
.rsitStartdate {
	width: 120px;
	height: 30px;
}
.rsitEnddate {
	width: 120px;
	height: 30px;
}
.interndiv {
	width: 98%;
	background-color: white;	
    margin: 0px;
    padding: 10px;
}
</style>
</head>
<body class="write">
	<input type="hidden" id="rsit_Seq1">
	<input type="hidden" id="rsit_Seq2">
	<input type="hidden" id="rsit_Seq3">
<div id="interndiv" class="interndiv">	
		<p class="title" style="color: gray; margin-left: 16px;">인턴&middot;대외활동</p>
		<!-- Load -->		 
		<input type="button" value="내 인턴&middot;대외활동 불러오기" id="internload" class="internload" style="margin-left: 17px;">
</div>
	<div class="fieldset_intern" style="padding: 0; margin: 0 auto;">
		<div id="rsit_t" class="rsit_t">
			<br>
			<select name="rsitType" id="rsitType" class="rsitType" >				
				<option value="활동구분">---활동구분---</option>
				<option value="인턴">인턴</option>
				<option value="아르바이트">아르바이트</option>
				<option value="동아리">동아리</option>
				<option value="자원봉사">자원봉사</option>
			</select>
			<input type="hidden" id="count_intern" name="count_intern" class="count_intern">		
			<input type="hidden" id="rsitSeq" name="rsitSeq" class="rsitSeq">	
			<input type="text" id="rsitCompany" name="rsitCompany" class="rsitCompany" placeholder="회사/기관/단체명">
			<input type="date" id="rsitStartdate" name="rsitStartdate" class="rsitStartdate">
			<input type="date" id="rsitEnddate" name="rsitEnddate" class="rsitEnddate">
			<input type="button" value="X" id="interndelete" class="interndelete" style="height: 35px;">
			<div class="content">			
				<textarea id="rsitContent" name="rsitContent" class="rsitContent" placeholder="활동내용" cols="85" rows="7"></textarea>
			</div>		
			<div>
				<input type="button" value="저장하기" id="internsave" class="internsave">
			</div>	
		</div>
	</div>
	<input type="button" value="추가하기" id="internplus" class="internplus">	
</body>
</html>