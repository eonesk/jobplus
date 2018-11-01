<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>교육이수작성폼</title>

<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	$(function() {

		function test() {

			alert("부모창 할롱");

		}

		var eduPlusButtonCnt = 2;

		// 		$("#internplus").click(function() {

		// 			count++;

		// 			alert("추가다 시발놈아"+count);

		// 			if(count >= 3){

		// 				alert("항목추가는 최대 3개까지만 추가가능합니다.")

		// 				return false;

		// 			}

		// 			var clone = $("#t").clone();

		// 			clone.find('*[id]').each(function () {					

		// 				$(this).attr("id",$(this).attr("id") + count);

		// 			});

		// 			clone.insertAfter("#t");

		// 		});

		/** div clone */

		$("#plusButton").click(function() {

			if (eduPlusButtonCnt <= 3) {

				alert(eduPlusButtonCnt);

				var clone = $("#eduPlus1").clone(true, true);

				clone.find("*[id]").each(function() {

					//var $id = $(this).attr("id");

					$(this).attr("id", $(this).attr("id") + eduPlusButtonCnt);

				});

				//				clone.attr("id", "eduPlus" + eduPlusButtonCnt);

				clone.appendTo($("#eduPlusField"));

				// 			    var selector1 = "#eduPlus" + eduPlusButtonCnt;

				// 			    alert(selector1);

				// 			    $(selector1 + " #rse_Name").val("");

				// 			    $(selector1 + " #rse_Company").val("");

				// 			    $(selector1 + " #rse_Startdate").val("");

				// 			    $(selector1 + " #rse_Enddate").val("");

				// 			    $(selector1 + " #rse_Content").val("");

				//$(selector1 + " #RSE_saveA1")attr("id", "RSE_saveA2");

				//$("#eduPlus2 #RSE_saveA1")attr("id", "RSE_saveA2");

				eduPlusButtonCnt++;

			} else if (eduPlusButtonCnt > 3 || eduPlusButtonCnt < 1) {

				alert("더이상 추가할 수 없습니다.");

			}

		});

		// 		$(function() {

		// 			$("#interndelete").on("click", function() {	

		// 				alert("삭제시발~~"+conut);

		// 				$("#t").remove();

		// 				count--;

		// 				alert("삭제됨?"+conut);

		// 			});

		// 		});	

		/** 'X'표 눌렀을 때 닫기 */

		$("#eduPlusCancel1").click(function() {

			$(this).parent("div").hide();

			eduPlusButtonCnt--;

		});

		$("#eduPlusCancel12").click(function() {

			$(this).parent("div").hide();

			eduPlusButtonCnt--;

			alert(eduPlusButtonCnt);

		});

		$("#eduPlusCancel13").click(function() {

			$(this).parent("div").hide();

			eduPlusButtonCnt--;

		});

		/** 내 교육이수사항 불러오기 */

		$("#RSE_loadA").click(function() {

			window.open("./eduLoadPopUp.jsp", "", "width=500px height=500px");

		});

		/** 교육이수관리에 저장 */

		// 		$(".RSE_saveA").click(function() {
		// 			var parent = $(this).parent("#test");
		// 			parent.hide();
		// 			alert($(parent + " #rse_Name").val());

		// 			if(!$(parent + " > #rse_Name").val()) {
		// 				alert("교육명을 입력해주세요.");
		// 				$(parent + " > #rse_Name").focus();
		// 			} else if(!$("#rse_Company").val()){
		// 				alert("교육기관을 입력해주세요.");
		// 				$(parent + " > #rse_Company").focus();
		// 			} else if(!$("#rse_Startdate").val()){
		// 				alert("시작년월을 입력해주세요.");
		// 				$(parent + " > #rse_Startdate").focus();
		// 			} else if(!$("#rse_Enddate").val()){
		// 				alert("종료년월을 입력해주세요.");
		// 				$(parent + " > #rse_Enddate").focus();
		// 			} else {
		// 				window.open("./eduSavePopUp.jsp", "", "width=500px height=500px");
		// 			}

		//		});
		/* 

		$("#RSE_saveA").click(function() {

			//alert("클릭Save");

			if(!$("#rse_Name").val()) {

				alert("교육명을 입력해주세요.");

				$("#rse_Name").focus();

			} else if(!$("#rse_Company").val()){

				alert("교육기관을 입력해주세요.");

				$("#rse_Company").focus();

			} else if(!$("#rse_Startdate").val()){

				alert("시작년월을 입력해주세요.");

				$("#rse_Startdate").focus();

			} else if(!$("#rse_Enddate").val()){

				alert("종료년월을 입력해주세요.");

				$("#rse_Enddate").focus();

			} else {

				window.open("./eduSavePopUp.jsp", "", "width=500px height=500px");

			}

		});

		 */

	});

	function selected(accumSeq) {

		$(function() {

			alert("부모창 할롱");

			alert(accumSeq);

			$
					.ajax({

						type : 'POST',

						url : 'rseLoadView.do',

						dataType : 'json',

						data : {

							"accumSeq" : accumSeq

						},

						success : function(data) {

							alert("부모창 성공");

							var testDTO = data.items;

							$("#eduPlus2").hide();

							$("#eduPlus3").hide();

							var cnt = 1;

							//alert(testDTO[0].rse_UserTitle);	

							for (var i = 0; i < testDTO.length; i++) {

								if (i == 0) {

									alert(testDTO[i].rse_UserTitle);

									$("#eduPlus1  #rse_Name").val(
											testDTO[i].rse_Name);

									$("#eduPlus1  #rse_Company").val(
											testDTO[i].rse_Company);

									$("#eduPlus1  #rse_Startdate").val(
											testDTO[i].rse_Startdate);

									$("#eduPlus1  #rse_Enddate").val(
											testDTO[i].rse_Enddate);

									$("#eduPlus1  #rse_Content").val(
											testDTO[i].rse_Content);

								} else {

									cnt++;

									var selector = "#eduPlus" + cnt;

									alert(cnt);

									alert(testDTO[i].rse_UserTitle);

									$(selector).show();

									$(selector + " #rse_Name").val(
											testDTO[i].rse_Name);

									$(selector + " #rse_Company").val(
											testDTO[i].rse_Company);

									$(selector + " #rse_Startdate").val(
											testDTO[i].rse_Startdate);

									$(selector + " #rse_Enddate").val(
											testDTO[i].rse_Enddate);

									$(selector + " #rse_Content").val(
											testDTO[i].rse_Content);

								}

							}

						},

						error : function(e) {

							alert('서버 연결 도중 에러가 났습니다. 다시 시도해 주십시오.: '
									+ e.status);

						}

					});

		});

	}
</script>

</head>

<body>

	<div id="edu_div"
		style="display: inline-block; margin: 15px; width: 80%; background-color: #f5f7fb;">



		<!-- Title -->

		<h3 style="font-weight: bold;">교육</h3>



		<!-- Save / Load -->

		<div
			style="background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block; float: left;">

			<a href="#" id="RSE_loadA">내 교육이수사항 불러오기</a>

		</div>

		<p style="clear: both; font-size: 12px; margin: 3px;">각 항목명은 변경할 수
			있으며(최대 45자), 항목은 총 10개까지 작성 가능합니다. 고치거나 빼야함ㅎ</p>



		<!-- ---------------------------------------------------추가 DIV -------------------------------------------------------------------------- -->









		<!-- input영역 1번째 줄 -->





		<div id="eduPlusField"
			style="background-color: white; padding: 0px; padding-bottom: 20px; border-bottom: 0px; border: 1px solid rgba(86, 111, 237, 0.3); width: 90%; height: auto;">



			<div id="eduPlus1" class="eduPlus"
				style="border-bottom: 1px solid rgba(86, 111, 237, 0.3); margin: 0px;">

				<a id="eduPlusCancel1" href="#" style="text-decoration: none;">

					<div id="closeButton"
						style="border: 1px solid rgba(86, 111, 237, 0.3); border-top: 0px; border-right: 0px; background-color: white; margin: 0px; position: relative; left: 875px; width: 30px; height: 30px;">X</div>

				</a>



				<!-- 교육명 -->

				<input id="rse_Name" ; name="rse_Name" type="text" placeholder="교육명"
					style="margin-left: 10px; margin-top: 8px; margin-right: 10px; float: left; width: 250px; height: 48px; border: 1px solid lightgray;">



				<!-- 교육기관 -->

				<input id="rse_Company" ; name="rse_Company" type="text"
					placeholder="교육기관"
					style="margin-top: 8px; margin-right: 10px; float: left; width: 250px; height: 48px; border: 1px solid lightgray;">



				<!-- 시작일데이터  -->

				<fieldset id="" class="" name=""
					style="margin-right: 0px; float: left; border: 1px solid lightgray; background-color: white; height: 42px; width: 142px;">

					<legend style="font-size: 12px;">&nbsp;&nbsp;시작년월</legend>

					<input id="rse_Startdate" name="rse_Startdate" type="date"
						style="text-align: center; float: left; background-color: white; border: 0px solid lightgray; display: inline-block; width: 135px; height: 21px;">

				</fieldset>



				<!-- 종료일데이터 -->

				<fieldset id="" class="" name=""
					style="margin-left: 0px; margin-right: 0px; float: left; border: 1px solid lightgray; background-color: white; height: 42px;">

					<legend style="font-size: 12px;">&nbsp;&nbsp;종료년월</legend>

					<input id="rse_Enddate" name="rse_Enddate" type="date"
						style="text-align: center; float: left; background-color: white; border: 0px solid lightgray; display: inline-block; width: 135px; height: 21px;">

				</fieldset>

				<br style="clear: both;">
				<br>



				<!-- input영역 두번째 줄 -->



				<!-- 교육과정 -->

				<div
					style="margin-left: 10px; width: 855px; border: 1px solid rgba(86, 111, 237, 0.3); background-color: white;">

					<a id="" class="" name="" href="#" style="text-decoration: none;">내용</a><br>

					<textarea id="rse_Content" class="rse_Content" name="rse_Content"
						rows="3" cols="119" placeholder="이수하신 교육과정에 대해 적어주세요."
						style="resize: none; border: 0px;"></textarea>

				</div>

				<br style="clear: both;">



				<div
					style="float: right; background-color: white; border: 1px solid gray; padding: 5px; margin: 3px; display: inline-block;">

					<a href="#" id="RSE_saveA1" class="RSE_saveA">교육이수관리에 저장</a>

				</div>

				<br>
				<br>

			</div>

			<!-- ------------------------------------------------------Footer----------------------------------------------------------------------- -->

		</div>

		<a id="plusButton" href="#" style="text-decoration: none;">

			<div id="plusButtonDiv"
				style="text-align: center; background-color: white; padding: 10px; padding-bottom: 20px; border: 1px solid rgba(86, 111, 237, 0.3); width: 95%; height: auto;">

				+ 교육 추가</div>

		</a>

	</div>

</body>

</html>