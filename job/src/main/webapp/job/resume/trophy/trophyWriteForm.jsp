<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trophyWriteForm</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var count = 0;		
	$(function() {		
		$("#t").hide();
		
		$("#trophyplus").click(function() {		
			count++;
			var num = count;				
			var clone = $("#t").clone().attr('id', 't' + num);
			
			if (count >= 4) {	
				alert("항목추가는 최대 3개까지만 추가가능합니다.")
				count--;
				return false;
			}
			
			clone.find('*[id]').each(function() {
				$(this).attr("id", $(this).attr("id") + num);
			});
			
			clone.insertAfter("#t");
			$("#t" + num).show();
			
		$("#trophydelete" + num).on("click", function() {
			/*$("#t" + count).remove();*/
			$(this).parent().remove();
			count--;
		});
		
		$("#trophysave" + num).on("click", function() {
				if (!$("#rst_Name" + num).val()) {
					alert("수상명을 입력하세요.");
					$("#rst_Name" + num).focus();
					return false;
				}
				if (!$("#rst_Company" + num).val()) {
					alert("수여기관을 입력하세요.");
					$("#rst_Company" + num).focus();
					return false;
				}
				if (!$("#rst_Date" + num).val()) {
					alert("수상연도을 입력하세요.");
					$("#rst_Date" + num).focus();
					return false;
				}
				if (!$("#rst_Content" + num).val()) {
					alert("수여내용을 입력하세요.");
					$("#rst_Content" + num).focus();
					return false;
				} 
				window.open("trophyWrite.jsp?num=" + num, "","width=500px height=500px");
			});		
		});
		$("#trophyload").click(function() {
			window.open("trophyLoad.jsp?count=" + count, "", "width=500px height=500px");
		});
	});
	

	/** Load 함수 */
	function selected(accumSeq, num) {
		$(function() {
			alert("selected함수 실행 num값 = " + num);
			count = num;
			$.ajax({
				type: 'POST',
				url: 'LoadView.do',
				dataType: 'json',
				data: {
					"accumSeq": accumSeq
				},
				success: function(data) {					
					$.each(data.items, function(index, item) {
						var testDTO = item;
						
						count++;
						
						var num = count;
						var clone = $("#t").clone().attr("id", "t" + num);
						
						// id&name 넘버링 변경 작업
						clone.find("*[id]").each(function() {
							$(this).attr("id", $(this).attr("id") + num);
						});
						
						clone.find("*[name]").each(function() {
							$(this).attr("name", $(this).attr("name") + num);
						});
						
						clone.insertAfter("#t");
						
						$("#t" + num).show();
						
						/** 이벤트 바인딩 */
						// 'X'표 눌렀을 때 닫기
						$("#trophydelete" + num).on("click", function() {
							$(this).parent("#t" + num).remove();
							count--;
						});
						
						// 저장버튼 눌렀을 때
						$("#trophysave" + num).on("click", function() {
							if (!$("#rst_Name" + num).val()) {
								alert("수상명을 입력하세요.");
								$("#rst_Name" + num).focus();
								return false;
							}
							if (!$("#rst_Company" + num).val()) {
								alert("수여기관을 입력하세요.");
								$("#rst_Company" + num).focus();
								return false;
							}
							if (!$("#rst_Date" + num).val()) {
								alert("수상연도을 입력하세요.");
								$("#rst_Date" + num).focus();
								return false;
							}
							if (!$("#rst_Content" + num).val()) {
								alert("수여내용을 입력하세요.");
								$("#rst_Content" + num).focus();
								return false;
							} 
							window.open("trophyWrite.jsp?num=" + num, "","width=500px height=500px");
						});
						
						$("#rst_Seq" + num).val(testDTO.rst_Seq);
						$("#rst_Name" + num).val(testDTO.rst_Name);
						$("#rst_Company" + num).val(testDTO.rst_Company);
						$("#rst_Date" + num).val(testDTO.rst_Date);
						$("#rst_Content" + num).val(testDTO.rst_Content);
							
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
.trophysave, .trophyload {
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
.trophysave:hover, .trophyload:hover {
    background-color: #2E9AFE;
}
.trophyplus, .trophydelete {
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
.rst_Name, .rst_Company {
	width:200px;
	height:28px;
}
.rst_Date {
	width: 120px;
	height: 30px;
}
.trophydiv {
	width: 100%;
	background-color: #f5f7fb;	
    margin: 0px 5px;
}
</style>
</head>
<body class="write">
<div id="trophydiv" class="trophydiv">	
		<p class="title">수상내역</p>		
		<!-- Load -->		 
		<input type="button" value="불러오기" id="trophyload" class="trophyload">			 
</div>		
<fieldset>
	<div id="t" class="t">
		<br>	
		<div>
			<input type="hidden" id="rst_Seq" name="rst_Seq" class="rst_Seq">		
			<input type="text" id="rst_Name" name="rst_Name" class="rst_Name" placeholder="수상명" size="30">
			<input type="text" id="rst_Company" name="rst_Company" class="rst_Company" placeholder="수여기관" size="30">
			<input type="date" id="rst_Date" name="rst_Date" class="rst_Date" placeholder="수상연도" size="7">
		</div>
		<div class="content">			
			<textarea id="rst_Content" name="rst_Content" class="rst_Content" placeholder="수여내용" cols="81" rows="8"></textarea>
		</div>		
		<div>
			<input type="button" value="저장하기" id="trophysave" class="trophysave">
		</div>
		<input type="button" value="삭제" id="trophydelete" class="trophydelete">	
	</div>	
</fieldset>
<input type="button" value="추가" id="trophyplus" class="trophyplus">	
</body>
</html>