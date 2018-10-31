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
		
		/* 자기소개서의 총 개수 구함 */
		$.ajax({
			type: 'POST',
			url: 'foreignLoadCount.do',
			dataType: 'text',
			cache: false,
			success: function(data) {
				$("#numberOfForeign").append(data);
				if(data == "0") {
					alert("해외경험 등록 글 없음");
					$("<td>").addClass("rsfLoadListLabelTd").html("제목").appendTo($("<tr>")).addClass("rsfLoadListLabelTr").appendTo("#rsfLoadListTable");
					//$("<td>").addClass("foreignTable_td").html("제목").appendTo("#rsprLoadListTable");				
				} else {				
					alert("자기소개서 있을 때");
					/* Json 하는 거 어떻게 하지 ㅠㅠ */
					$.ajax({
						type: 'POST',
						url: 'foreignLoadlist.do',
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
									"id": "rsf_UsertitleA",
									"href": "#"
								}).html(item.rsf_Usertitle).bind('click', {param: dto}, add_event);
								
								td.append(a);
								tr.append(td);
								$("#rsfLoadListTable").append(tr);		
						
							});
							function add_event(event) {
								alert(event.data.param.rsf_Usertitle + " // " + event.data.param.m_Id);
				                $("#rsfLoadViewInit").hide();
				                $("#rsfLoadView").html("");
				                //미리보기 내용
				                var title = $("<h3>").html("[ " + event.data.param.rsf_Usertitle + " ]");
				                var name = $("<p>").html("국가 : " + event.data.param.rsf_Name);				      
				               	var startdate =  $("<p>").html(" " + event.data.param.rsf_Startdate);
				               	var enddate =  $("<p>").html(" " + event.data.param.rsf_Enddate);
				                var content = $("<p>").html(" " + event.data.param.rsf_Content);
				                
				                $("#rsfLoadView").append(title);
				                $("#rsfLoadView").append(name);
				                $("#rsfLoadView").append(startdate);
				                $("#rsfLoadView").append(enddate);
				                $("#rsfLoadView").append(content);
				                
				                
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
	내 해외경험목록 보관함 총&nbsp;<span id="numberOfForeign" style="color: orange;">&nbsp;</span>건
	<div style="width: 500px; height: 150px; overflow-y: scroll; overflow-x: hidden;">
		<table border="1" id="rsfLoadListTable" name="rsfLoadListTable">
			<!-- -List -->
		</table>
	</div>
	<br>
	<div style="background: #f5f7fb; padding: 10px; padding-top: 2px; height: 250px;" id="rsfLoadView">
		<div style="text-align: center;" id="rsfLoadViewInit">
			<p style="font-size: 14px; margin: 80px;">
				미리보기 영역
			</p>
		</div>
	</div>
	<p style="font-size: 10px;">[불러오기]를 클릭하시면, 선택하신 자기소개서 내용과 양식(폼)이 불러오기 됩니다.</p>
	<div align="center">
		<span style="padding: 5px 10px 5px 10px; background-color: #566feb; color: white;"><a href="#" style="font-size: 12px; text-decoration: none; color: white;" id="rsfLoadSubmit">자기소개서 불러오기</a></span>
		<span style="width: 50px; padding:5px; border: 1px solid gray;"><a href="#" style="font-size: 12px; text-decoration: none;" id="cancle">취소</a></span>
	</div>
<!-- 		<tr> -->
<!-- 			<td>check</td> -->
<!-- 			<td>foreign title</td> -->
<!-- 		</tr>   -->
<%-- 		<c:forEach var="foreignDTO" items="${list}"> --%>
<!-- 		<tr> -->
<!-- 			<td><input type="checkbox" name="ckbox" onclick=""></td> -->
<%-- 			<td id="foreignValue">${foreignDTO.rsf_Usertitle}</td> --%>
<!-- 		</tr> -->
<%-- 		</c:forEach> --%>
<!-- 		<tr> -->
<!-- 			<td colspan="2" align="center"> -->
<%-- 			<c:if test="${startPage > 3}"> --%>
<%-- 					<a href="foreignList.do?pg=${startPage-1}">◀</a> --%>
<%-- 				</c:if> --%>
<%-- 				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1"> --%>
<%-- 					<c:if test="${pg==i}"> --%>
<%-- 						<a id="" href="foreignList.do?pg=${i}">${i}</a> --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${pg !=i }"> --%>
<%-- 					<a href="foreignList.do?pg=${i}">${i}</a> --%>
<%-- 					</c:if> --%>
<%-- 				</c:forEach> --%>
<%-- 				<c:if test="${endPage<totalP}"> --%>
<%-- 					<a href="foreignList.do?pg=${endPage+1}">▶</a> --%>
<%-- 				</c:if> --%>
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
<!-- 	<input type="button" value="불러오기" onclick=""> -->
<!-- 	<input type="button" value="닫기" id="cancle"> -->
<!-- </form> -->
</body>
</html>