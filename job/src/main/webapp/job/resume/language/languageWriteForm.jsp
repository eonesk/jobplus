<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>languageWriteForm</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">	
	var count = 0;
	$(function() {		
		$("#rslg_t").hide();
		
		$("#langplus").click(function() {		
			count++;
			var num = count;	
			var clone = $("#rslg_t").clone().attr('id', 'rslg_t' + num);
			
			if (count >= 4) {				
				alert("항목추가는 최대 3개까지 입력가능합니다.");
				count--;
				return false;
			}
			
			clone.find('*[id]').each(function() {
				$(this).attr("id", $(this).attr("id") + num);
			});
			
			clone.insertAfter("#rslg_t");
			$("#rslg_t" + num).show();
			
			$("#langdelete" + num).on("click", function() {
				/*$("#t" + count).remove();*/
				$(this).parent("#rslg_t" + num).remove();
				$("#rslg__Seq"+num).val("");
				count--;
			});
			
			$("#rslg_Category" + num).on("change", function() {
				if($("#rslg_Category" + num).val() == "공인시험"){
					document.getElementById("test" + num).style.display = "inline";
					document.getElementById("lv" + num).style.display = "none";
				}else{
					document.getElementById("test" + num).style.display = "none";
					document.getElementById("lv" + num).style.display = "inline";
				}			
			});
			
			$("#langsave" + num).on("click", function() {
				if($("#rslg_Category" + num).val() == "공인시험"){					
					if($("#rslg_Name" + num).val() == "외국어명"){
						alert("외국어명을 입력하세요.");
						$("#rslg_Name" + num).focus();	
						return false;
					}
					if(!$("#rslg_Test" + num).val()){
						alert("공인시험을 입력하세요.");
						$("#rslg_Test" + num).focus();
						return false;
					}
					if(!$("#rslg_Score" + num).val()){
						alert("급수/점수를 입력하세요.");
						$("#rslg_Score" + num).focus();
						return false;
					}
					if(!$("#rslg_Date" + num).val()){
						alert("취득년월을 입력하세요.");
						$("#rslg_Date" + num).focus();
						return false;
					}
					window.open("/job/job/resume/language/languageWrite.jsp?num=" + num, "", "width=500px height=500px");
				}
				if($("#rslg_Category" + num).val() == "회화능력"){	
					if($("#rslg_Name" + num).val() == "외국어명"){
						alert("외국어명을 입력하세요.");
						$("#rslg_Name" + num).focus();
						return false;
					}
					if($("#rslg_Lv" + num).val() == "회화능력"){
						alert("회화능력을 입력하세요.");
						$("#rslg_Lv" + num).focus();
						return false;
					}
					window.open("/job/job/resume/language/languageWrite.jsp?num=" + num, "", "width=500px height=500px");
				}
			});					
		});
		$("#langload").click(function() {
			window.open("/job/job/resume/language/languageLoad.jsp?count=" + count, "", "width=500px height=500px");
		});	
	});
	
	// load 함수
	function selected_rslg(accumSeq, num) {
		$(function() {
			alert("selected함수 실행 num값 = " + num);
			count = num;
			alert("selected함수 실행 count값 = " + count);
			$.ajax({
				type: 'POST',
				url: '/job/job/resume/language/LoadView.do',
				dataType: 'json',
				data: {
					"accumSeq": accumSeq
				},
				success: function(data) {					
					$.each(data.items, function(index, item) {
						var testDTO = item;
						
						count++;
						
						var num = count;
						var clone = $("#rslg_t").clone().attr("id", "rslg_t" + num);
						
						// id&name 넘버링 변경 작업
						clone.find("*[id]").each(function() {
							$(this).attr("id", $(this).attr("id") + num);
						});
						
						clone.find("*[name]").each(function() {
							$(this).attr("name", $(this).attr("name") + num);
						});
						
						clone.insertAfter("#rslg_t");
						
						$("#rslg_t" + num).show();
						
						/** 이벤트 바인딩 */
						// 'X'표 눌렀을 때 닫기
						$("#langdelete" + num).on("click", function() {
							$(this).parent("#rslg_t" + num).remove();
							$("#rslg__Seq"+num).val("");
							count--;
						});
						
						// 저장버튼 눌렀을 때
						$("#trophysave" + num).on("click", function() {
							if($("#rslg_Category" + num).val() == "공인시험"){					
								if($("#rslg_Name" + num).val() == "외국어명"){
									alert("외국어명을 입력하세요.");
									$("#rslg_Name" + num).focus();	
									return false;
								}
								if(!$("#rslg_Test" + num).val()){
									alert("공인시험을 입력하세요.");
									$("#rslg_Test" + num).focus();
									return false;
								}
								if(!$("#rslg_Score" + num).val()){
									alert("급수/점수를 입력하세요.");
									$("#rslg_Score" + num).focus();
									return false;
								}
								if(!$("#rslg_Date" + num).val()){
									alert("취득년월을 입력하세요.");
									$("#rslg_Date" + num).focus();
									return false;
								}
								window.open("/job/job/resume/languange/languageWrite.jsp?num=" + num, "", "width=500px height=500px");
							}
							if($("#rslg_Category" + num).val() == "회화능력"){	
								if($("#rslg_Name" + num).val() == "외국어명"){
									alert("외국어명을 입력하세요.");
									$("#rslg_Name" + num).focus();
									return false;
								}
								if($("#rslg_Lv" + num).val() == "회화능력"){
									alert("회화능력을 입력하세요.");
									$("#rslg_Lv" + num).focus();
									return false;
								}
								window.open("/job/job/resume/languange/languageWrite.jsp?num=" + num, "", "width=500px height=500px");
							}
						});
						
						$("#rslg__Seq" + num).val(testDTO.rst_Seq);
						$("#rslg_Seq" + num).val(testDTO.rst_Seq);						
						$("#rslg_Category" + num).val(testDTO.rslg_Category);
						if($("#rslg_Category" + num).val() == "공인시험"){
							alert("if진입후");
							$("#test"+num).css("display", "inline");
							$("#lv"+ num).css("display", "none");
						}else{
							$("#test"+num).css("display", "none");
							$("#lv"+num).css("display", "inline");
						}
						$("#rslg_Name" + num).val(testDTO.rslg_Name);
						$("#rslg_Test" + num).val(testDTO.rslg_Test);
						$("#rslg_Date" + num).val(testDTO.rslg_Date);
						$("#rslg_Score" + num).val(testDTO.rslg_Score);
						$("#rslg_Lv" + num).val(testDTO.rslg_Lv);
							
					});					
				},
				error: function(e) {
					 alert('(writeForm)서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.: ' + e.status);
				}
			});			
		});
	}	
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
.rslg_Category {
	width:100px;
	height:36px;
}
.rslg_Name {
	width:150px;
	height:36px;
}
.rslg_Lv {
	width: 150px;
	height: 36px;
}
.rslg_Test {
	width: 120px;
	height: 30px;
}
.rslg_Score {
	width: 120px;
	height: 30px;
}
.rslg_Date {
	width: 120px;
	height: 33px;
}
.langdiv {
	width: 100%;
	background-color: #f5f7fb;	
    margin: 0px 5px;
}
</style>
</head>
<body class="write">
<input type="hidden" id="rslg__Seq1">
<input type="hidden" id="rslg__Seq2">
<input type="hidden" id="rslg__Seq3">
<div id="langdiv" class="langdiv">			
		<p class="title">어학</p>
		<!-- Load -->		 
		<input type="button" value="불러오기" id="langload" class="langload">			 
</div>
	<fieldset>
		<div id="rslg_t" class="rslg_t">
		<br>
		<input type="hidden" id="rslg_Seq" class="rslg_Seq">
			<select name="rslg_Category" id="rslg_Category" class="rslg_Category">
				<option value="회화능력">회화능력</option>
				<option value="공인시험">공인시험</option>
			</select> 
			<select id="rslg_Name" name="rslg_Name" class="rslg_Name">
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
				<select id="rslg_Lv" name="rslg_Lv" class="rslg_Lv">
					<option value="회화능력">---회화능력---</option>
					<option value="일상회화 가능">일상회화 가능</option>
					<option value="비즈니스 회화가능">비즈니스 회화가능</option>
					<option value="원어민 수준">원어민 수준</option>
				</select>
			</div>
			<div id="test" class="test" style="display: none;">
				<input type="text" id="rslg_Test" name="rslg_Test" class="rslg_Test"  placeholder="공인시험">
				<input type="text" id="rslg_Score" name="rslg_Score" class="rslg_Score"	placeholder="급수/점수"> 
				<input type="date" id="rslg_Date" name="rslg_Date" class="rslg_Date" placeholder="취득년월">
			</div>
			<div>
				<input type="button" value="저장하기" id="langsave" class="langsave">
			</div>
			<input type="button" value="삭제" id="langdelete" class="langdelete">	
		</div>	
	</fieldset>
	<input type="button" value="추가" id="langplus" class="langplus">		
</body>
</html>