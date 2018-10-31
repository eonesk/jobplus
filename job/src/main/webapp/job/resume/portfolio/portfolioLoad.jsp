<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {	
		$("#cancle").click(function() {
			window.close();
		});
		
		/* 포트폴리오 총 개수 구함 */
		$.ajax({
			type: 'POST',
			url: 'portfolioCount.do',
			dataType: 'text',
			cache: false,
			success: function(data) {
				$("#numberOfportfolio").append(data);
				if(data == "0") {
					alert("등록된 첨부파일 없음");
					$("<td>").addClass("rsfLoadListLabelTd").html("제목").appendTo($("<tr>")).addClass("rsfLoadListLabelTr").appendTo("#rsfLoadListTable");
					//$("<td>").addClass("foreignTable_td").html("제목").appendTo("#rsprLoadListTable");				
				} else {				
					alert("파일 있을 때");
					/* Json 하는 거 어떻게 하지 ㅠㅠ */
					$.ajax({
						type: 'POST',
						url: 'portfolioLoad.do',
						dataType: "json",
						success: function(data) {//rsprLoadListTable  item.rspr_UserTitle
							alert("성공");

							var trTitle = $("<tr>").addClass("rsfLoadListLabelTr");
							var tdTitle = $("<td>").addClass("rsfLoadListLabelTd").html("제목");
							
							trTitle.append(tdTitle);
							$("#rsfLoadListTable").append(trTitle);
							
							$.each(data.items, function(index, item) {
								var dto = item;
								var tr = $("<tr>").addClass("rsfLoadListLabelTr");
								var td = $("<td>").addClass("rsfLoadListLabelTd");
								var a = $("<a>").attr({
									"id": "rs_pfUsertitleA",
									"href": "#"
								}).html(item.rs_pfUsertitle).bind('click', {param: dto}, add_event);
								
								td.append(a);
								tr.append(td);
								$("#rsfLoadListTable").append(tr);		
						
							});
// 							function add_event(event) {
// 								alert(event.data.param.rs_pfUsertitle + " // " + event.data.param.m_Id);
// 				                $("#rsfLoadViewInit").hide();
// 				                $("#rsfLoadView").html("");
// 				                //미리보기 내용
// 				                var title = $("<h3>").html("[ " + event.data.param.rs_pfUsertitle + " ]");
// 				                var type = $("<p>").html("국가 : " + event.data.param.rs_pfType);				      
// 				               	var rs_pfUrl =  $("<p>").html(" " + event.data.param.rs_pfUrl);
// 				               	var rs_pfFile =  $("<p>").html(" " + event.data.param.rs_pfFile);
				                
// 				                $("#rsfLoadView").append(title);
// 				                $("#rsfLoadView").append(type);
// 				                $("#rsfLoadView").append(rs_pfUrl);
// 				                $("#rsfLoadView").append(rs_pfUrl);		                
				                
				                $("#rsfLoadSubmit").click(function() {
				                	alert(event.data.param.name + "불러오기 완료");
				                	$("#rsf_Name", opener.document).val("");
				                	$("#rsf_Startdate", opener.document).val("");
				                	$("#rsf_Enddate", opener.document).val("");
				                	$("#rsf_Content", opener.document).val("");			           
				                	$("#rsf_Seq", opener.document).val("");	 
				                	
				                	$("#rsf_Name", opener.document).val(event.data.param.rsf_Name);
				                	$("#rsf_Startdate", opener.document).val(event.data.param.rsf_Startdate);
				                	$("#rsf_Enddate", opener.document).val(event.data.param.rsf_Enddate);
				                	$("#rsf_Content", opener.document).val(event.data.param.rsf_Content);
				                	$("#rsf_Seq", opener.document).val(event.data.param.rsf_Seq);
				                					                	
				                	self.close();
				                });
				                
// 							}											
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

// 	function check(cb) {
// 		for (i = 0; i < 4; i++) {
// 		if (eval("document.foreignList.ckbox[" + i + "].checked") == true) {
// 			document.foreignList.ckbox[i].checked = false;
// 		if (i == cb) {
// 			document.foreignList.ckbox[i].checked = true;
// 	         }
// 	      }
// 	   }
// 	}
</script>
</head>
<body>
<!-- <form name="foreignList"> -->

	<h4>내 저장 목록</h4>
	내 첨부파일 보관함 총&nbsp;<span id="numberOfportfolio" style="color: orange;">&nbsp;</span>건
	<div style="width: 500px; height: 150px; overflow-y: scroll; overflow-x: hidden;">
		<table border="1" id="rsfLoadListTable" name="rsfLoadListTable">
			<!-- -List -->
		</table>
	</div>
	<br>
<!-- 	<div style="background: #f5f7fb; padding: 10px; padding-top: 2px; height: 250px;" id="rsfLoadView"> -->
<!-- 		<div style="text-align: center;" id="rsfLoadViewInit"> -->
<!-- 			<p style="font-size: 14px; margin: 80px;"> -->
<!-- 				미리보기 영역 -->
<!-- 			</p> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<p style="font-size: 10px;">[불러오기]를 클릭하시면, 선택하신 자기소개서 내용과 양식(폼)이 불러오기 됩니다.</p> -->
	<div align="center">
		<span style="padding: 5px 10px 5px 10px; background-color: #566feb; color: white;"><a href="#" style="font-size: 12px; text-decoration: none; color: white;" id="rsfLoadSubmit">파일 불러오기</a></span>
		<span style="width: 50px; padding:5px; border: 1px solid gray;"><a href="#" style="font-size: 12px; text-decoration: none;" id="cancle">취소</a></span>
	</div>

</body>
</html>