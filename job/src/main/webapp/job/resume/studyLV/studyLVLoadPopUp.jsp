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
		studyLVPlusButtonCnt = ${param.studyLVPlusButtonCnt};
		alert("studyLVPlusButtonCnt : " + studyLVPlusButtonCnt);
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
 								var radio = $("<input>").attr({
									"id": "rss_UserTitleR",
									"type": "checkbox",
									"value": item.rss_Seq
								}).addClass("rss_UserTitleR");;
								var a = $("<a>").attr({
									"id": "rss_UserTitleA",
									"href": "#"
								}).html(item.rss_UserTitle).bind('click', {param: dto}, add_event);
								
								td.append(radio);
								td.append(a);
								tr.append(td);
								$("#studyLVLoadListTable").append(tr);												 
							});							

							/** 부모창 입력폼의 최대값을 맞춰주기 위해서 {부모창+checkbox선택값 <=3}이 되도록 해주는... */
							// {부모창+checkbox선택값 >3}이 되면 checkbox값이 disabled됨.//
							console.log("studyLVPlusButtonCnt[studyLVLoadSubmit click] : " + ${param.studyLVPlusButtonCnt});
							var isOverflow = ${param.studyLVPlusButtonCnt};
							console.log("var = isOverflow[studyLVLoadSubmit click] : " + isOverflow);
							
							if(isOverflow == 3) {
								$(".rss_UserTitleR").attr("disabled", "true");
							} else if(isOverflow < 3 || isOverflow >= 0) {
								$(".rss_UserTitleR").on("change", function() {
									if($(this).is(":checked")){
										isOverflow++;
										console.log("isOverflow[rss_UserTitleR change] : " + isOverflow);
										if(isOverflow == 3) {
											$(".rss_UserTitleR").not($(".rss_UserTitleR:checked")).attr("disabled", "true");
										}
									} else {
										isOverflow--;
										$(".rss_UserTitleR").removeAttr("disabled");
										console.log("isOverflow[rss_UserTitleR change] : " + isOverflow);
									}
								});
							} 
							$("#studyLVLoadSubmit").click(function() {								

								var accumSeq = "";
								
				                $(".rss_UserTitleR:checked").each(function() {
				                	console.log($(this).val());
				                	accumSeq += $(this).val() + "/";
				                });
				                
				                console.log("accumSeq : " + accumSeq);
				                
				                if(accumSeq == "") {
				                	alert("불러올 학력정보를 선택해 주세요.");
				                } else {
				                	console.log("체크됨");
				                	if(confirm("불러오기를 진행하시겠습니까?")) {
				                		opener.parent.selected_rss(accumSeq, ${param.studyLVPlusButtonCnt});
					                	self.close();
				                	}
				                	
				                }
							});
							
							
							
							function add_event(event) {
								console.log(event.data.param.rss_UserTitle + " // " + event.data.param.m_Id);
								$("#studyLVLoadViewInit").hide();
								$("#studyLVLoadView").html("");
								
								if(event.data.param.rss_Ishighschool == "Y"){
									var h3 = $("<h3>").html("[ " + event.data.param.rss_UserTitle + " ]");
									var p = $("<p>");
									p.html("고등학교 미만 졸업");
									$("#studyLVLoadView").append(h3).append(p);
								} else {
									var userTitle = $("<h3>").html("[ " + event.data.param.rss_UserTitle + " ]");
									var table = $("<table>").attr("border", "1");
									var indexTr = $("<tr>");
									var indexTd1 = $("<td>").html("학교구분");
									var indexTd2 = $("<td>").html("학교명");
									var indexTd3 = $("<td>").html("입학년월");
									var indexTd4 = $("<td>").html("졸업년월");
									var indexTd5 = $("<td>").html("전공명");
									var indexTd6 = $("<td>").html("학점");
									var indexTd7 = $("<td>").html("총점");
									
									indexTr.append(indexTd1).append(indexTd2).append(indexTd3).append(indexTd4).append(indexTd5).append(indexTd6).append(indexTd7);
									table.append(indexTr);									
									
									var contentTr = $("<tr>");
									var contentTd1 = $("<td>").html(event.data.param.rss_Type);
									var contentTd2 = $("<td>").html(event.data.param.rss_Name);								
									var contentTd3 = $("<td>").html(event.data.param.rss_Startdate);
									var contentTd4 = $("<td>").html(event.data.param.rss_Enddate);
									var contentTd5 = $("<td>").html(event.data.param.rss_Major);
									var contentTd6 = $("<td>").html(event.data.param.rss_Score);
									var contentTd7 = $("<td>").html(event.data.param.rss_Totscore);
									
									contentTr.append(contentTd1).append(contentTd2).append(contentTd3).append(contentTd4).append(contentTd5).append(contentTd6).append(contentTd7);
									table.append(contentTr);
									
									$("#studyLVLoadView").append(userTitle);
									$("#studyLVLoadView").append(table);
								}
								
							}	
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