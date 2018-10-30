<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학력정보불러오기폼</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("#studyLVLoadCancel").click(function() {
			window.close();
		});
		
		/* 학력정보의 총 개수 구함 */
		$.ajax({
			type: 'POST',
			url: 'studyLVLoadCount.do',
			dataType: 'text',
			cache: false,
			success: function(data) {
				$("#numberOfstudyLV").append(data);
				if(data == "0") {
					alert("학력정보 없음");
					$("<td>").addClass("studyLVLoadListLabelTd").html("제목").appendTo($("<tr>")).addClass("studyLVLoadListLabelTr").appendTo("#studyLVLoadListTable");
					
					//$("<tr>").addClass("studyLVLoadListLabelTr").appendTo("#studyLVLoadListTable");
					//$("<td>").addClass("studyLVLoadListLabelTd").html("제목").appendTo("#studyLVLoadListTable");
				} else {
					alert("학력정보 있음");
					/* Json 하는 거 어떻게 하지 ㅠㅠ */
					$.ajax({
						type: 'POST',
						url: 'studyLVLoad.do',
						dataType: "json",
						cache: false,
						success: function(data) {
							alert("성공");
							
							var trTitle = $("<tr>").addClass("studyLVLoadListLabelTr");
							var tdTitle = $("<td>").addClass("studyLVLoadListLabelTd").html("제목");
							
							trTitle.append(tdTitle);
							$("#studyLVLoadListTable").append(trTitle);
							
							$.each(data.items, function(index, item) {
								var dto = item;
								var tr = $("<tr>").addClass("studyLVLoadListLabelTr");
								var td = $("<td>").addClass("studyLVLoadListLabelTd");
/* 								var radio = $("<input>").attr({
									"id": "rss_UserTitleR",
									"type": "checkbox",
									"value": item.rss_Seq
								}); */
								var a = $("<a>").attr({
									"id": "rss_UserTitleA",
									"href": "#"
								}).html(item.rss_UserTitle).bind('click', {param: dto}, add_event);
								
								//td.append(radio);
								td.append(a);
								tr.append(td);
								$("#studyLVLoadListTable").append(tr);	
								 
								$("#studyLVLoadSubmit").click(function() {
									var studyLVSeqList = new Array();
					                $("#rss_UserTitleR:checked").each(function() {
					                	alert($(this).val());
					                	studyLVSeqList.push($(this).val());
					                });
					                alert(studyLVSeqList);
								});											 
							});
							
							function add_event(event) {
							/* 	alert(event.data.param.rss_UserTitle + " // " + event.data.param.m_Id);
				                $("#studyLVLoadViewInit").hide();
				                var title = $("<h3>").html("[ " + event.data.param.rss_Title + " ]");
				                var content = $("<p>").html(" " + event.data.param.rss_Content);
				                
				                $("#rsprLoadView").append(title);
				                $("#rsprLoadView").append(content);
				                
				                $("#rsprLoadSubmit").click(function() {
				                	alert(event.data.param.rspr_Title);
				                	$("#rsprTitle", opener.document).val("");
				                	$("#rsprContent", opener.document).val("");
				                	$("#rsprSeq", opener.document).val("");
				                	$("#rsprTitle", opener.document).val(event.data.param.rspr_Title);
				                	$("#rsprContent", opener.document).val(event.data.param.rspr_Content);
				                	$("#rsprSeq", opener.document).val(event.data.param.rspr_Seq);
				                	self.close();
				                }); */
				                
				                
				                
							}
							
							
							alert("종료");
							
						},
						error : function(e) {
			                alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.: ' + e.status);
			         	}
					});
					
					
					/** json으로 넘어 온 데이터를 $.each();를 통해 table에 구현해 줘야 함 : 위 ajax문 success에 들어가야 함 */
					// 임의로 rsprDTO값을 정해서 table에 구현..
	/* 					
					var rsprUserTitleList = [{ 
						    "rspr_Seq": 5,
						    "rspr_Title": "제목입니다1",
						    "rspr_Content": "내용입니다",
						    "m_Id": "num1",
						    "rspr_UserTitle": "usertitle입니다."
					},
					{
						    "rspr_Seq": 6,
						    "rspr_Title": "제목",
						    "rspr_Content": "내용",
						    "m_Id": "num1",
						    "rspr_UserTitle": "usertitle"
					}];
					
					// Table 첫번째 행
					$("<tr>").addClass("rsprLoadListLabelTr").appendTo("#rsprLoadListTable");
					$("<td>").addClass("rsprLoadListLabelTd").html("제목").appendTo("#rsprLoadListTable");
					
					// List Content
					
					$.each(rsprUserTitleList, function(index, item) {
						
						var listTr = $("<tr>");
						listTr.addClass("rsprLoadListContentTr");
						var listTd = $("<td>");
						listTd.addClass("rsprLoadListContentTd");
						var listA = $("<a>");
						listA.addClass("rsprLoadListContentA");
						listA.attr("href", "#");
						listA.html(rsprUserTitleList.rspr_UserTitle);
						
						listTd.append(listA);
						listTr.append(listTd);
						
						$("#rsprLoadListTable").append(listTr);
					});
					
					/* 
					
					// ex
					var listTr1 = $("<tr>");
					listTr.addClass("rsprLoadListContentTr");
					var listTd1 = $("<td>");
					listTd.addClass("rsprLoadListContentTd");
					var listA1 = $("<a>");
					listA1.addClass("rsprLoadListContentA");
					listA1.attr("href", "#");
					listA1.html(rsprUserTitleList1.rspr_UserTitle);
					
					listTd1.append(listA1);
					listTr1.append(listTd1);
					
					$("#rsprLoadListTable").append(listTr1);
					 */
					/** usertitle을 클릭했을 때  *//*
					$(".rsprLoadListContentA").click(function() {
						alert($(this).text());
					});
			 */		
					/* 
					
						$.each(data.memberlist, function(index, memberlist) { // 이치를 써서 모든 데이터들을 배열에 넣음					
	
						var items = [];
	
						items.push("<td>" + memberlist.id + "</td>"); // 여기에 id pw addr tel의 값을 배열에 넣은뒤
	
						items.push("<td>" + memberlist.pw + "</td>");
	
						items.push("<td>" + memberlist.addr + "</td>");
	
						items.push("<td>" + memberlist.tel + "</td>");
	
						$("<tr/>", {
	
							html : items // 티알에 붙임,
	
						}).appendTo("table"); // 그리고 그 tr을 테이블에 붙임
	
					});	 */				
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
	<h3>학력정보 불러오기</h3>
	<!-- float로 연결하든가.. 암튼 한 줄에 표현되어야 함 -->
	내 학력정보 보관함 총&nbsp;<span id="numberOfstudyLV" style="color: orange;">&nbsp;</span>건
	<div style="width: 500px; height: 150px; overflow-y: scroll; overflow-x: hidden;">
		<table border="1" id="studyLVLoadListTable" name="studyLVLoadListTable">
		<!-- 자기소개서 List 들어갈 부분 -->
		</table>
	</div>
	<br>
	<div style="background: #f5f7fb; padding: 10px; padding-top: 2px; height: 250px;" id="studyLVLoadView">
		<div style="text-align: center;" id="studyLVLoadViewInit">
			<p style="font-size: 14px; margin: 80px;">
				위 목록에서 자기소개서를 선택하신 후,<br>
				<strong style="color: #566feb; font-weight: bold;">[자기소개서 불러오기]</strong> 버튼을 클릭하여 불러오기 하거나<br>
				또는 필요한 <strong style="color: #566feb; font-weight: bold;">부분</strong>을 복사하여<br>
				작성중인 <strong style="color: #566feb; font-weight: bold;">자기소개서에 붙여넣기</strong> 해주세요.</p>
		</div>	
	</div>
	<p style="font-size: 10px;">[자기소개서 불러오기]를 클릭하시면, 선택하신 자기소개서 내용과 양식(폼)이 불러오기 됩니다.</p>
	<div align="center">
		<span style="padding: 5px 10px 5px 10px; background-color: #566feb; color: white;"><a href="#" style="font-size: 12px; text-decoration: none; color: white;" id="studyLVLoadSubmit">학력정보 불러오기</a></span>
		<span style="width: 50px; padding:5px; border: 1px solid gray;"><a href="#" style="font-size: 12px; text-decoration: none;" id="studyLVLoadCancel">취소</a></span>
	</div>
</body>
</html>