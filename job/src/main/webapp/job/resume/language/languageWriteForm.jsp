<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>languageWriteForm</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">	
	$(function() {
		var count = 0;		
		$("#t").hide();
		
		$("#langplus").click(function() {		
			count++;
			var num = count;	
			if (count >= 4) {
				count--;
				alert("항목추가는 최대 3개까지 입력가능합니다.");
				return false;
			}
			var clone = $("#t").clone().attr('id', 't' + count);
			clone.find('*[id]').each(function() {
				$(this).attr("id", $(this).attr("id") + count);
			});
			clone.insertBefore("#t");
			$("#t" + count).show();
			
			$("#langdelete" + num).on("click", function() {
				/*$("#t" + count).remove();*/
				$(this).parent().remove();
				count--;
			});
			
			$("#rslgCategory" + num).change(function() {
				if($("#rslgCategory" + num).val() == "공인시험"){
					document.getElementById("test" + num).style.display = "inline";
					document.getElementById("lv" + num).style.display = "none";
				}else{
					document.getElementById("test" + num).style.display = "none";
					document.getElementById("lv" + num).style.display = "inline";
				}			
			});
			
			$("#langsave" + num).on("click", function() {
				if($("#rslgCategory" + num).val() == "공인시험"){					
					if($("#rslgName" + num).val() == "외국어명"){
						alert("외국어명을 입력하세요.");
						$("#rslgName" + num).focus();	
						return false;
					}
					if(!$("#rslgTest" + num).val()){
						alert("공인시험을 입력하세요.");
						$("#rslgTest" + num).focus();
						return false;
					}
					if(!$("#rslgScore" + num).val()){
						alert("급수/점수를 입력하세요.");
						$("#rslgScore" + num).focus();
						return false;
					}
					if(!$("#rslgDate" + num).val()){
						alert("취득년월을 입력하세요.");
						$("#rslgDate" + num).focus();
						return false;
					}
					window.open("languageWrite.jsp?num=" + num, "", "width=500px height=500px");
				}
				if($("#rslgCategory" + num).val() == "회화능력"){	
					if($("#rslgName" + num).val() == "외국어명"){
						alert("외국어명을 입력하세요.");
						$("#rslgName" + num).focus();
						return false;
					}
					if($("#rslgLv" + num).val() == "회화능력"){
						alert("회화능력을 입력하세요.");
						$("#rslgLv" + num).focus();
						return false;
					}
					window.open("languageWrite.jsp?num=" + num, "", "width=500px height=500px");
				}
			});
			$("#langload" + num).click(function() {
				window.open("languageLoad.jsp?num=" + num, "", "width=500px height=500px");
			});			
		});
	});
</script>
<style type="text/css">
.write {
	height: 100%;
    width: 100%;
    background-color: #e8ecef;
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
fieldset {
	background-color: #FFFFFF;
}
.content {
	padding-top: 5px;
}
.langsave, .langload {
	width:80px;
    background-color: #5882FA;
    border: none;
    color:#fff;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 5px;
    margin-left : 0;
    cursor: pointer;
}
.langsave:hover, .langload:hover {
    background-color: #2E9AFE;
}
.langplus, .langdelete {
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
.rslgCategory {
	width:100px;
	height:36px;
}
.rslgName {
	width:150px;
	height:36px;
}
.rslgLv {
	width: 150px;
	height: 36px;
}
.rslgTest {
	width: 120px;
	height: 30px;
}
.rslgScore {
	width: 120px;
	height: 30px;
}
.rslgDate {
	width: 120px;
	height: 33px;
}
</style>
</head>
<body class="write">
	<fieldset>
		<p class="title">어학</p>
		<div id="t" class="t">
		<br>
		<input type="hidden" id="rslgSeq" class="rslgSeq">
			<select name="rslgCategory" id="rslgCategory" class="rslgCategory">
				<option value="회화능력">회화능력</option>
				<option value="공인시험">공인시험</option>
			</select> <select id="rslgName" name="rslgName" class="rslgName">
				<option value="외국어명">---외국어명---</option>
				<option value="영어">영어</option>
				<option value="일본어">일본어</option>
				<option value="중국어">중국어</option>
				<option value="독일어">독일어</option>
				<option value="프랑스어">프랑스어</option>
				<option value="스페인어">스페인어</option>
				<option value="러시아어">러시아어</option>
				<option value="이탈리아어">이탈리아어</option>
				<option value="아랍어">아랍어</option>
				<option value="태국어">태국어</option>
				<option value="마인어">마인어</option>
				<option value="그리스어">그리스어</option>
				<option value="포르투갈어">포르투갈어</option>
				<option value="베트남어">베트남어</option>
				<option value="네덜란드어">네덜란드어</option>
				<option value="힌디어어">힌디어어</option>
				<option value="노르웨이어">노르웨이어</option>
				<option value="유고어">유고어</option>
				<option value="히브리어">히브리어</option>
				<option value="이란">이란</option>
				<option value="터키어">터키어</option>
				<option value="체코어">체코어</option>
				<option value="루마니아어">루마니아어</option>
				<option value="몽골어">몽골어</option>
				<option value="스웨덴어">스웨덴어</option>
				<option value="헝가리어">헝가리어</option>
				<option value="폴란드어">폴란드어</option>
				<option value="미얀마어">미얀마어</option>
				<option value="슬로바키아어">슬로바키아어</option>
				<option value="세르비아어">세르비아어</option>
				<option value="한국어">한국어</option>
			</select>
			<div id="lv" class="lv" style="display: inline;">
				<select id="rslgLv" name="rslgLv" class="rslgLv">
					<option value="회화능력">---회화능력---</option>
					<option value="일상회화 가능">일상회화 가능</option>
					<option value="비즈니스 회화가능">비즈니스 회화가능</option>
					<option value="원어민 수준">원어민 수준</option>
				</select>
			</div>
			<div id="test" class="test" style="display: none;">
				<input type="text" id="rslgTest" name="rslgTest" class="rslgTest"  placeholder="공인시험">
				<input type="text" id="rslgScore" name="rslgScore" class="rslgScore"	placeholder="급수/점수"> 
				<input type="date" id="rslgDate" name="rslgDate" class="rslgDate" placeholder="취득년월">
			</div>
			<div>
				<input type="button" value="저장하기" id="langsave" class="langsave"> 
				<input type="button" value="불러오기" id="langload" class="langload">
			</div>
			<input type="button" value="삭제" id="langdelete" class="langdelete">	
		</div>	
	</fieldset>
	<input type="button" value="추가" id="langplus" class="langplus">		
</body>
</html>