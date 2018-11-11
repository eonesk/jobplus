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
		
		$("#rsprLoadCancel").click(function() {
			window.close();
		});
		
		/* 자기소개서의 총 개수 구함 */
		$.ajax({
			type: 'POST',
			url: 'rsprLoadCount.do',
			dataType: 'text',
			cache: false,
			success: function(data) {
				$("#numberOfPr").append(data);
				if(data == "0") {
					alert("저장하신 자기소개서가 없습니다.");
// 					$("<td>").addClass("rsprLoadListLabelTd").html("제목").appendTo($("<tr>")).addClass("rsprLoadListLabelTr").appendTo("#rsprLoadListTable");
					//$("<td>").addClass("rsprLoadListLabelTd").html("제목").appendTo("#rsprLoadListTable");
				} else {				
					console.log("자기소개서 있을 때");
					$.ajax({
						type: 'POST',
						url: 'rsprLoad.do',
						dataType: "json",
						success: function(data) {//rsprLoadListTable  item.rspr_UserTitle
							console.log("성공");
							
							var trTitle = $("<tr>").addClass("rsprLoadListLabelTr");
							var tdTitle = $("<td>").addClass("rsprLoadListLabelTd").html("&nbsp;");
							
							trTitle.append(tdTitle);
							$("#rsprLoadListTable").append(trTitle);
							
							$.each(data.items, function(index, item) {
								var dto = item;
								var tr = $("<tr>").addClass("rsprLoadListLabelTr");
								var td = $("<td>").addClass("rsprLoadListLabelTd");
								var a = $("<a>").attr({
									"id": "rspr_UserTitleA",
									"href": "#"
								}).html(item.rspr_UserTitle).bind('click', {param: dto}, add_event);
								
								td.append(a);
								tr.append(td);
								$("#rsprLoadListTable").append(tr);							
																 
							});
							
							function add_event(event) {
								console.log(event.data.param.rspr_UserTitle + " // " + event.data.param.m_Id);
				                $("#rsprLoadViewInit").hide();
				                $("#rsprLoadView").html("");
				                var title = $("<h3>").html("[ " + event.data.param.rspr_Title + " ]").css({
									"background": "#5882FA",
									"color": "white"
									});
				                var content = $("<p>").html(" " + event.data.param.rspr_Content).css({
									"background": "white"
								});
				                
				                $("#rsprLoadView").append(title);
				                $("#rsprLoadView").append(content);
				                
				                $("#rsprLoadSubmit").click(function() {
				                	console.log(event.data.param.rspr_Title);
				                	$("#rsprTitle", opener.document).val("");
				                	$("#rsprContent", opener.document).val("");
				                	$("#rsprSeq", opener.document).val("");
				                	$("#rsprTitle", opener.document).val(event.data.param.rspr_Title);
				                	$("#rsprContent", opener.document).val(event.data.param.rspr_Content);
				                	$("#rsprSeq", opener.document).val(event.data.param.rspr_Seq);
				                	$("#rspr_Seq", opener.document).val(event.data.param.rspr_Seq);
				                	self.close();
				                });				                
							}
							console.log("종료");
						},
						error : function(e) {
			                alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.: ' + e.status);
			         	}
					});				
				}
			},
			error : function(e) {
                alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.: ' + e.status);
         	}
		});		
	});
</script>
<style type="text/css">
	#rspr_UserTitleA:link {color: black; text-decoration: none;}
	#rspr_UserTitleA:visited {color: black; text-decoration: none;}
	#rspr_UserTitleA:hover {color: #5882FA; text-decoration: underline;}
</style>
</head>
<body>
	<h3>자기소개서 불러오기</h3>
	<!-- float로 연결하든가.. 암튼 한 줄에 표현되어야 함 -->
	내 자소서 보관함 총&nbsp;<span id="numberOfPr" style="color: orange;">&nbsp;</span>건
	<div style="width: 500px; height: 150px; overflow-y: scroll; overflow-x: hidden;">
		<table id="rsprLoadListTable" name="rsprLoadListTable">
		<!-- 자기소개서 List 들어갈 부분 -->
		</table>
	</div>
	<br>
	<div style="background: #f5f7fb; padding: 10px; padding-top: 2px; height: 250px; overflow-y: scroll;" id="rsprLoadView">
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



