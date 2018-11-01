<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자격증Load폼</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		alert("licensePlusButtonCnt : " + ${param.licensePlusButtonCnt});
		/* 자기소개서의 총 개수 구함 */
		$.ajax({
			type: 'POST',
			url: 'licenseLoadCount.do',
			dataType: 'text',
			cache: false,
			success: function(data) {
				$("#numberOfLicense").append(data);
				if(data == "0") {
					alert("자격증데이터 없음");
					$("<tr>").addClass("licenseLoadListLabelTr").appendTo("#licenseLoadListTable");
					$("<td>").addClass("licenseLoadListLabelTd").html("제목").appendTo("#licenseLoadListTable");
				} else {
					alert("자격증데이터 있음");
					/* Json 하는 거 어떻게 하지 ㅠㅠ */
					$.ajax({
						type: 'POST',
						url: 'licenseLoad.do',
						dataType: "json",
						cache: false,
						success: function(data) {
							alert("성공");
			              	//var testDTO =  data.items;
							//alert(testDTO[0].rse_UserTitle);					
							
							var trTitle = $("<tr>").addClass("licenseLoadListLabelTr");
							var tdTitle = $("<td>").addClass("licenseLoadListLabelTd").html("제목");
							
							trTitle.append(tdTitle);
							$("#licenseLoadListTable").append(trTitle);
							
							$.each(data.items, function(index, item) {
								var dto = item;
								var tr = $("<tr>").addClass("licenseLoadListLabelTr");
								var td = $("<td>").addClass("licenseLoadListLabelTd");
 								var checkbox = $("<input>").attr({
									"id": "rsls_UserTitleR",
									"type": "checkbox",
									"value": item.rsls_Seq
								}).addClass("rsls_UserTitleR");
								var a = $("<a>").attr({
									"id": "rsls_UserTitleA",
									"href": "#"
								}).html(item.rsls_UserTitle).bind('click', {param: dto}, add_event);
								
								td.append(checkbox);
								td.append(a);
								tr.append(td);
								$("#licenseLoadListTable").append(tr);																			 
							});							

							/** 부모창 입력폼의 최대값을 맞춰주기 위해서 {부모창+checkbox선택값 <=3}이 되도록 해주는... */
							// {부모창+checkbox선택값 >3}이 되면 checkbox값이 disabled됨.
							alert("licensePlusButtonCnt[eduLoadSubmit click] : " + ${param.licensePlusButtonCnt});
							var isOverflow = ${param.licensePlusButtonCnt};
							alert("var = isOverflow[eduLoadSubmit click] : " + isOverflow);
							
							if(isOverflow == 3) {
								$(".rsls_UserTitleR").attr("disabled", "true");
							} else if(isOverflow < 3 || isOverflow >= 0) {
								$(".rsls_UserTitleR").on("change", function() {
									if($(this).is(":checked")){
										isOverflow++;
										alert("isOverflow[rsls_UserTitleR change] : " + isOverflow);
										if(isOverflow == 3) {
											$(".rsls_UserTitleR").not($(".rsls_UserTitleR:checked")).attr("disabled", "true");
										}
									} else {
										isOverflow--;
										$(".rsls_UserTitleR").removeAttr("disabled");
										alert("isOverflow[rsls_UserTitleR change] : " + isOverflow);
									}
								});
							}
							
							$("#licenseLoadSubmit").click(function() {
								//var eduSeqList = new Array();
								var accumSeq = "";
								
				                $("#rsls_UserTitleR:checked").each(function() {
				                	alert($(this).val());
				                	//eduSeqList.push($(this).val());
				                	accumSeq += $(this).val() + "/";
				                });
				                
				                alert("accumSeq : " + accumSeq);
				                
				                if(accumSeq == "") {
				                	alert("체크해주셍ㅂ");
				                } else {
				                	alert("체크됨");
				                	if(confirm("불러오기를 진행하시겠습니까?")) {
				                		opener.parent.selected(accumSeq, ${param.licensePlusButtonCnt});
					                	self.close();
				                	}
				                	
				                }
							});
							
							function add_event(event) {
								alert(event.data.param.rsls_UserTitle + " // " + event.data.param.m_Id);
								$("#licenseLoadViewInit").hide();
								$("#licenseLoadView").html("");

								var userTitle = $("<h3>").html("[ " + event.data.param.rsls_UserTitle + " ]");
								var table = $("<table>").attr("border", "1");
								var indexTr = $("<tr>");
								var indexTd1 = $("<td>").html("자격증이름");
								var indexTd2 = $("<td>").html("발행처");
								var indexTd3 = $("<td>").html("취득년월");
// 								var indexTd4 = $("<td>").html("종료년월");
// 								var indexTd5 = $("<td>").html("교육내용");
								
								indexTr.append(indexTd1).append(indexTd2).append(indexTd3)/* .append(indexTd4).append(indexTd5) */;
								table.append(indexTr);
								
								var contentTr = $("<tr>");
								var contentTd1 = $("<td>").html(event.data.param.rsls_Name);
								var contentTd2 = $("<td>").html(event.data.param.rsls_Company);								
								var contentTd3 = $("<td>").html(event.data.param.rsls_Date);
// 								var contentTd4 = $("<td>").html(event.data.param.rse_Enddate);
// 								var contentTd5 = $("<td>").html(event.data.param.rse_Content);
								
								contentTr.append(contentTd1).append(contentTd2).append(contentTd3)/* .append(contentTd4).append(contentTd5) */;
								table.append(contentTr);
								
								$("#licenseLoadView").append(userTitle);
								$("#licenseLoadView").append(table);
				                
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
							
							
							alert("종료");
							
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
</head>
<body>
	<h3>자격증 불러오기</h3>
	<!-- float로 연결하든가.. 암튼 한 줄에 표현되어야 함 -->
	내 자격증 보관함 총&nbsp;<span id="numberOfLicense" style="color: orange;">&nbsp;</span>건
	<div style="width: 500px; height: 150px; overflow-y: scroll; overflow-x: hidden;">
		<table border="1" id="licenseLoadListTable" name="licenseLoadListTable">
		<!-- 자기소개서 List 들어갈 부분 -->
		</table>
	</div>
	<br>
	<div style="background: #f5f7fb; padding: 10px; padding-top: 2px; height: 250px;" id="licenseLoadView">
		<div style="text-align: center;" id="licenseLoadViewInit">
			<p style="font-size: 14px; margin: 80px;">
				위 목록에서 자기소개서를 선택하신 후,<br>
				<strong style="color: #566feb; font-weight: bold;">[자기소개서 불러오기]</strong> 버튼을 클릭하여 불러오기 하거나<br>
				또는 필요한 <strong style="color: #566feb; font-weight: bold;">부분</strong>을 복사하여<br>
				작성중인 <strong style="color: #566feb; font-weight: bold;">자기소개서에 붙여넣기</strong> 해주세요.</p>
		</div>	
	</div>
	<p style="font-size: 10px;">[자기소개서 불러오기]를 클릭하시면, 선택하신 자기소개서 내용과 양식(폼)이 불러오기 됩니다.</p>
	<div align="center">
		<span style="padding: 5px 10px 5px 10px; background-color: #566feb; color: white;"><a href="#" style="font-size: 12px; text-decoration: none; color: white;" id="licenseLoadSubmit">자격증 불러오기</a></span>
		<span style="width: 50px; padding:5px; border: 1px solid gray;"><a href="#" style="font-size: 12px; text-decoration: none;" id="licenseLoadCancel">취소</a></span>
	</div>
</body>
</html>