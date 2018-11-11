<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육이수정보불러오기폼</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		console.log("eduPlusButtonCnt : " + ${param.eduPlusButtonCnt});
		/* 자기소개서의 총 개수 구함 */
		$.ajax({
			type: 'POST',
			url: 'eduLoadCount.do',
			dataType: 'text',
			cache: false,
			success: function(data) {
				$("#numberOfEdu").append(data);
				if(data == "0") {
					alert("저장하신 교육이수가 없습니다.");
// 					$("<tr>").addClass("eduLoadListLabelTr").appendTo("#eduLoadListTable");
// 					$("<td>").addClass("eduLoadListLabelTd").html("제목").appendTo("#eduLoadListTable");
				} else {
					console.log("교육이수데이터 있음");
					/* Json 하는 거 어떻게 하지 ㅠㅠ */
					$.ajax({
						type: 'POST',
						url: 'eduLoad.do',
						dataType: "json",
						cache: false,
						success: function(data) {
							console.log("성공");
			              	//var testDTO =  data.items;
							//alert(testDTO[0].rse_UserTitle);					
							
							var trTitle = $("<tr>").addClass("eduLoadListLabelTr");
							var tdTitle = $("<td>").addClass("eduLoadListLabelTd").html("&nbsp;");
							
							trTitle.append(tdTitle);
							$("#eduLoadListTable").append(trTitle);
							
							$.each(data.items, function(index, item) {
								var dto = item;
								var tr = $("<tr>").addClass("eduLoadListLabelTr");
								var td = $("<td>").addClass("eduLoadListLabelTd");								
 								var checkbox = $("<input>").attr({
									"id": "rse_UserTitleR",
									"type": "checkbox",
									"value": item.rse_Seq
								}).addClass("rse_UserTitleR");
								var a = $("<a>").attr({
									"id": "rse_UserTitleA",
									"href": "#"
								}).html(item.rse_UserTitle).bind('click', {param: dto}, add_event);
								
								td.append(checkbox);
								td.append(a);
								tr.append(td);
								$("#eduLoadListTable").append(tr);											 
							});							
							
							/** 부모창 입력폼의 최대값을 맞춰주기 위해서 {부모창+checkbox선택값 <=3}이 되도록 해주는... */
							// {부모창+checkbox선택값 >3}이 되면 checkbox값이 disabled됨.
							console.log("eduPlusButtonCnt[eduLoadSubmit click] : " + ${param.eduPlusButtonCnt});
							var isOverflow = ${param.eduPlusButtonCnt};
							console.log("var = isOverflow[eduLoadSubmit click] : " + isOverflow);
							
							if(isOverflow == 3) {
								$(".rse_UserTitleR").attr("disabled", "true");
							} else if(isOverflow < 3 || isOverflow >= 0) {
								$(".rse_UserTitleR").on("change", function() {
									if($(this).is(":checked")){
										isOverflow++;
										console.log("isOverflow[rse_UserTitleR change] : " + isOverflow);
										if(isOverflow == 3) {
											$(".rse_UserTitleR").not($(".rse_UserTitleR:checked")).attr("disabled", "true");
										}
									} else {
										isOverflow--;
										$(".rse_UserTitleR").removeAttr("disabled");
										console.log("isOverflow[rse_UserTitleR change] : " + isOverflow);
									}
								});
							}
							
							$("#eduLoadSubmit").click(function() {
								
								var accumSeq = "";
								
				                $(".rse_UserTitleR:checked").each(function() {
				                	console.log($(this).val());
				                	accumSeq += $(this).val() + "/";
				                });
				                
				                console.log("accumSeq : " + accumSeq);
				                
				                if(accumSeq == "") {
				                	alert("불러올 교육이수를 선택해 주세요.");
				                } else {
				                	console.log("체크됨");
				                	if(confirm("불러오기를 진행하시겠습니까?")) {
				                		opener.parent.selected_rse(accumSeq, ${param.eduPlusButtonCnt});
					                	self.close();
				                	}
				                	
				                }
							});
							
							function add_event(event) {
								console.log(event.data.param.rse_UserTitle + " // " + event.data.param.m_Id);
								$("#eduLoadViewInit").hide();
								$("#eduLoadView").html("");

								var userTitle = $("<h3>").html("[ " + event.data.param.rse_UserTitle + " ]");
								var table = $("<table>");
								var indexTr = $("<tr>").css({
									"background": "#5882FA",
									"color": "white"
									});
								var indexTd1 = $("<td>").html("교육명");
								var indexTd2 = $("<td>").html("교육기관");
								var indexTd3 = $("<td>").html("시작년월");
								var indexTd4 = $("<td>").html("종료년월");
								var indexTd5 = $("<td>").html("교육내용");
								
								indexTr.append(indexTd1).append(indexTd2).append(indexTd3).append(indexTd4).append(indexTd5);
								table.append(indexTr);
								
								var contentTr = $("<tr>").css({
									"background": "white"
								});
								var contentTd1 = $("<td>").html(event.data.param.rse_Name);
								var contentTd2 = $("<td>").html(event.data.param.rse_Company);								
								var contentTd3 = $("<td>").html(event.data.param.rse_Startdate);
								var contentTd4 = $("<td>").html(event.data.param.rse_Enddate);
								var contentTd5 = $("<td>").html(event.data.param.rse_Content);
								
								contentTr.append(contentTd1).append(contentTd2).append(contentTd3).append(contentTd4).append(contentTd5);
								table.append(contentTr);
								
								$("#eduLoadView").append(userTitle);
								$("#eduLoadView").append(table);
				                
// 				                $("#eduLoadSubmit").click(function() {
// 				                	alert(event.data.param.rse_Name);
// 				                	$("#rsprTitle", opener.document).val("");
// 				                	$("#rsprContent", opener.document).val("");
// 				                	$("#rsprSeq", opener.document).val("");
// 				                	$("#rsprTitle", opener.document).val(event.data.param.rspr_Title);
// 				                	$("#rsprContent", opener.document).val(event.data.param.rspr_Content);
// 				                	$("#rsprSeq", opener.document).val(event.data.param.rspr_Seq);
// 				                	self.close();
// 				                });
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
	#rse_UserTitleA:link {color: black; text-decoration: none;}
	#rse_UserTitleA:visited {color: black; text-decoration: none;}
	#rse_UserTitleA:hover {color: #5882FA; text-decoration: underline;}
</style>
</head>
<body>
	<h3>교육이수사항 불러오기</h3>
	<!-- float로 연결하든가.. 암튼 한 줄에 표현되어야 함 -->
	내 교육이수 보관함 총&nbsp;<span id="numberOfEdu" style="color: orange;">&nbsp;</span>건
	<div style="width: 500px; height: 150px; overflow-y: scroll; overflow-x: hidden;">
		<table id="eduLoadListTable" name="eduLoadListTable">
		<!-- 자기소개서 List 들어갈 부분 -->
		</table>
	</div>
	<br>
	<div style="background: #f5f7fb; padding: 10px; padding-top: 2px; height: 250px; overflow-y: scroll;" id="eduLoadView">
		<div style="text-align: center;" id="eduLoadViewInit">
			<p style="font-size: 14px; margin: 80px;">
				위 목록에서 교육이수를 선택하신 후,<br>
				<strong style="color: #566feb; font-weight: bold;">[교육이수 불러오기]</strong> 버튼을 클릭하여 불러오기 하거나<br>
				또는 필요한 <strong style="color: #566feb; font-weight: bold;">부분</strong>을 복사하여<br>
				작성중인 <strong style="color: #566feb; font-weight: bold;">교육이수에 붙여넣기</strong> 해주세요.</p>
		</div>	
	</div>
	<p style="font-size: 10px;">[교육이수 불러오기]를 클릭하시면, 선택하신 교육이수 내용과 양식(폼)이 불러오기 됩니다.</p>
	<div align="center">
		<span style="padding: 5px 10px 5px 10px; background-color: #566feb; color: white;"><a href="#" style="font-size: 12px; text-decoration: none; color: white;" id="eduLoadSubmit">교육이수 불러오기</a></span>
		<span style="width: 50px; padding:5px; border: 1px solid gray;"><a href="#" style="font-size: 12px; text-decoration: none;" id="eduLoadCancel">취소</a></span>
	</div>
</body>
</html>