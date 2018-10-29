<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>psLoadPopUp</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		/* 자기소개서의 총 개수 구함 */
		$.ajax({
			type: 'POST',
			url: 'rsprLoadCount.do',
			dataType: 'text',
			cache: false,
			success: function(data) {
				$("#numberOfPr").append(data);
				if(data == "0") {
					alert("자기소개서 없음");
					$("<td>").addClass("rsprLoadListLabelTd").html("제목").appendTo($("<tr>")).addClass("rsprLoadListLabelTr").appendTo("#rsprLoadListTable");
					//$("<td>").addClass("rsprLoadListLabelTd").html("제목").appendTo("#rsprLoadListTable");
				} else {
				
					alert("자기소개서 있을 때");
					/* Json 하는 거 어떻게 하지 ㅠㅠ */
					$.ajax({
						type: 'POST',
						url: 'rsprLoad.do',
						dataType: "json",
						success: function(data) {//rsprLoadListTable  item.rspr_UserTitle
							alert("성공");
							
							var trTitle = $("<tr>").addClass("rsprLoadListLabelTr");
							var tdTitle = $("<td>").addClass("rsprLoadListLabelTd").html("제목");
							
							trTitle.append(tdTitle);
							$("#rsprLoadListTable").append(trTitle);
							
							$.each(data.items, function(index, item) {
								var tr = $("<tr>").addClass("rsprLoadListLabelTr");
								var td = $("<td>").addClass("rsprLoadListLabelTd");
								var a = $("<a>").attr({
									"id": "rspr_UserTitleA",
									"href": "#"
								}).html(item.rspr_UserTitle);
								
								td.append(a);
								tr.append(td);
								$("#rsprLoadListTable").append(tr);							
								
								/* 
								$("#rspr_UserTitleA").click(function() {
									alert(item.rspr_UserTitle);
								});
								 */								 
							});
							
							
							
							alert("종료");
							
							
							
						},
						error : function(e) {
			                alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.: ' + e.status);
			         	}
					});				
				}
			},
			error : function(e) {
                alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.');
         	}
		});		
	});
</script>
</head>
<body>
	<h3>자기소개서 불러오기</h3>
	<!-- float로 연결하든가.. 암튼 한 줄에 표현되어야 함 -->
	내 자소서 보관함 총&nbsp;<span id="numberOfPr" style="color: orange;">&nbsp;</span>건
	<div style="width: 500px; height: 150px; overflow-y: scroll; overflow-x: hidden;">
		<table border="1" id="rsprLoadListTable" name="rsprLoadListTable">
		<!-- 자기소개서 List 들어갈 부분 -->
		</table>
	</div>
	<br>
	<div style="background: #f5f7fb; padding: 10px; padding-top: 2px; height: 250px;" id="rsprLoadView">
		<div style="text-align: center;" id="rsprLoadViewInit">
			<p style="font-size: 14px; margin: 80px;">
				위 목록에서 자기소개서를 선택하신 후,<br>
				<strong style="color: #566feb; font-weight: bold;">[자기소개서 불러오기]</strong> 버튼을 클릭하여 불러오기 하거나<br>
				또는 필요한 <strong style="color: #566feb; font-weight: bold;">부분</strong>을 복사하여<br>
				작성중인 <strong style="color: #566feb; font-weight: bold;">자기소개서에 붙여넣기</strong> 해주세요.</p>
		</div>	
	</div>
	<p style="font-size: 10px;">[자기소개서 불러오기]를 클릭하시면, 선택하신 자기소개서 내용과 양식(폼)이 불러오기 됩니다.</p>
	<div align="center">
		<span style="padding: 5px 10px 5px 10px; background-color: #566feb; color: white;"><a href="#" style="font-size: 12px; text-decoration: none; color: white;" id="rsprLoadSubmit">자기소개서 불러오기</a></span>
		<span style="width: 50px; padding:5px; border: 1px solid gray;"><a href="#" style="font-size: 12px; text-decoration: none;" id="rsprLoadCancel">취소</a></span>
	</div>
</body>
</html>



