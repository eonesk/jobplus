<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#ap_btn_reset").on("click", function() {			
		$('input:checkbox[name="major[]"]').prop("checked", false);
	});
	
	$('input:checkbox[class="chk"]').click(function() {
		var num = $('input:checkbox[class="chk"]:checked').length;   //체크갯수 확인
		if(num>3){
			alert("최대 3개까지 선택가능합니다.");
			$('input:checkbox[class="chk"]').prop("checked", false);
		 }
	}); 
	
	$("#ap_btn_OK").on("click", function() {
		var items=[];
		$('input[class="chk"]:checkbox:checked').each(function(){
			items.push($(this).val());
		});			 
		var tmp = items.join('/');
		alert(tmp);
		$("#rma_Major", opener.document).val(tmp);
		self.close();
	});
	
	$("#ap_btn_close").click(function() {
		window.close();
	});
});
</script>
<style type="text/css">
.ap_th {
	height: 50px;
}
.tbl_typ_reg02, .down_typ, .ap_th, .ap_td {
    border-left: 1px solid #e1e1e1;
}
.tbl_typ_reg02 .ap_th {
    background-color: #f7f7f7;
    font-weight: bold;
    line-height: 18px;
    text-align: center;
}
.tbl_typ_reg02, .ap_th, .ap_td {
    border-bottom: 1px solid #e0e0e0;
    box-sizing: border-box;
}
.tbl_common {
    width: 100%;
    border-spacing: 0;
    border-collapse: collapse;
    font-size: 14px;
    letter-spacing: -1px;
    color: #101010;
    table-layout: fixed;
    background-color: white;
}
.lpop_wrap {
    position: fixed;
    z-index: 1200;
    padding: 58px 60px 60px;
    border: 1px solid #4c4c4c;
    box-sizing: border-box;
    font-family: "Malgun Gothic",gulim,dotum,sans-serif;
    background-color: #fff;
}
.ap_chk_list {
   	list-style: none;   	
   	position: relative;
    width: auto;
    display: inline-block;
    text-align: center;
    vertical-align: top;
    text-align: left;
    margin: 10 10 10 10px;
}
.lpop_major_select {
    display: none;
    left: 50%;
    top: 50px;
    margin-left: -50%;
    margin-top: -10%;
    width: 1024px;
    height: 614px;
    border: 0;
}
.ap_btn_wrap {
	margin-left: 200px;
	margin-top: 20px;
	padding: 10px;
}
.ap_btn_OK, .ap_btn_close {
	width: 180px;
	height: 60px;
	font-size: 15px;
	font-weight: bold;
}
.ap_btn_OK {
	background-color: #2E2E2E;
	color: white;
	border: 0;
}
.ap_btn_OK:hover {
	background: #000000;
}
.ap_btn_close {
	background-color: white;
	border: 1px solid #E6E6E6;
}
.ap_btn_close:hover {
	border: 1px solid #6E6E6E;
}
.ap_btn_reset {
	position: relative;
	left: 80%;
	width: 120px;
	height: 30px;
	background-color: white;
	border: 1px solid #E6E6E6;	
	margin-bottom: 10px;
}
.ap_btn_reset:hover {
	border: 1px solid #6E6E6E;	
}
</style>
</head>
<body>
<div id="lpop_major" class="lpop_wrap lpop_major_select" style="display: block;">
    <h2>필수전공 선택</h2>
    <div class="tbl_btn_area">
        <input type="button" class="ap_btn_reset" id="ap_btn_reset" value="전체선택 초기화">
    </div>
    <div class="tbl_typ_reg02 down_typ scroll">
        <table class="tbl_common">
            <colgroup>
                <col style="width:180px">
                <col style="width:180px">
                <col style="width:180px">
                <col style="width:180px">
            </colgroup>
            <tbody>
            <tr>
                <th class="ap_th">상경/계열</th>
                <th class="ap_th">어학계열</th>
                <th class="ap_th">사범계열</th>
                <th class="ap_th">공학계열</th>
            </tr>
            <tr>
                <td class="ap_td">
                    <ul class="ap_chk_list">
	                    <li class="chk_item">
	                    	<label for="major_maj1">
	                    		<input type="checkbox" name="major[]" id="major_maj1" class="chk" value="경영학"><span>경영학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                   	 	<label for="major_maj2">
	                    		<input type="checkbox" name="major[]" id="major_maj2" class="chk" value="경제학"><span>경제학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj3">
	                    		<input type="checkbox" name="major[]" id="major_maj3" class="chk" value="회계학"><span>회계학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj4">
	                   		 	<input type="checkbox" name="major[]" id="major_maj4" class="chk" value="광고홍보학"><span>광고홍보학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj5">
	                    		<input type="checkbox" name="major[]" id="major_maj5" class="chk" value="유통.무역학"><span>유통.무역학</span>
	                    	</label>
	                    </li>
	                </ul>	                
                </td>
                <td class="ap_td">
                    <ul class="ap_chk_list">
                    	<li class="chk_item">
                    		<label for="major_maj6">
                    			<input type="checkbox" name="major[]" id="major_maj6" class="chk" value="영어영문학"><span>영어영문학</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="major_maj7">
                    			<input type="checkbox" name="major[]" id="major_maj7" class="chk" value="중어중문학"><span>중어중문학</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="major_maj8">
                    			<input type="checkbox" name="major[]" id="major_maj8" class="chk" value="일어일문학"><span>일어일문학</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="major_maj9">
                    			<input type="checkbox" name="major[]" id="major_maj9" class="chk" value="국어국문학"><span>국어국문학</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="major_maj10">
                    			<input type="checkbox" name="major[]" id="major_maj10" class="chk" value="불어불문학"><span>불어불문학</span>
                    		</label>
                    	</li>
                    </ul>
                </td>
                <td class="ap_td">
                    <ul class="ap_chk_list">
	                    <li class="chk_item">
	                    	<label for="major_maj11">
	                    		<input type="checkbox" name="major[]" id="major_maj11" class="chk" value="특수교육학"><span>특수교육학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj12">
	                    		<input type="checkbox" name="major[]" id="major_maj12" class="chk" value="유아교육학"><span>유아교육학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj13">
	                    		<input type="checkbox" name="major[]" id="major_maj13" class="chk" value="교육심리학"><span>교육심리학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj14">
	                    		<input type="checkbox" name="major[]" id="major_maj14" class="chk" value="교육공학"><span>교육공학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj15">
	                    		<input type="checkbox" name="major[]" id="major_maj15" class="chk" value="초등교육"><span>초등교육</span>
	                    	</label>
	                    </li>
                    </ul>
                </td>
                <td rowspan="3" class="ap_td">
                    <ul class="ap_chk_list">
	                    <li class="chk_item">
	                    	<label for="major_maj16">
	                    		<input type="checkbox" name="major[]" id="major_maj16" class="chk" value="컴퓨터.시스템공학"><span>컴퓨터.시스템공학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj17">
	                    		<input type="checkbox" name="major[]" id="major_maj17" class="chk" value="금속.비금속공학"><span>금속.비금속공학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj18">
	                    		<input type="checkbox" name="major[]" id="major_maj18" class="chk" value="생명.환경공학"><span>생명.환경공학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj19">
	                    		<input type="checkbox" name="major[]" id="major_maj19" class="chk" value="화학공학"><span>화학공학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj20">
	                    		<input type="checkbox" name="major[]" id="major_maj20" class="chk" value="전기.전자공학"><span>전기.전자공학</span>
	                    	</label>
	                    </li>
                    </ul>
                </td>
            </tr>
            <tr>
                <th class="ap_th">인문/사회</th>
                <th class="ap_th">자연계열</th>
                <th class="ap_th">의학/예체능</th>
            </tr>
            <tr>
                <td class="ap_td">
                    <ul class="ap_chk_list">
	                    <li class="chk_item">
	                    	<label for="major_maj21">
	                    		<input type="checkbox" name="major[]" id="major_maj21" class="chk" value="인문과학계열"><span>인문과학계열</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj22">
	                    		<input type="checkbox" name="major[]" id="major_maj22" class="chk" value="사회과학계열"><span>사회과학계열</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj23">
	                    		<input type="checkbox" name="major[]" id="major_maj23" class="chk" value="법학계열"><span>법학계열</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj24">
	                    		<input type="checkbox" name="major[]" id="major_maj24" class="chk" value="심리학"><span>심리학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj25">
	                    		<input type="checkbox" name="major[]" id="major_maj25" class="chk" value="국사.세계사"><span>국사.세계사</span>
	                    	</label>
	                    </li>
                    </ul>
                </td>
                <td class="ap_td">
                    <ul class="ap_chk_list">
	                    <li class="chk_item">
	                    	<label for="major_maj26">
	                    		<input type="checkbox" name="major[]" id="major_maj26" class="chk" value="농수산.해양학"><span>농수산.해양학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj27">
	                    		<input type="checkbox" name="major[]" id="major_maj27" class="chk" value="임학.임예학"><span>임학.임예학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj28">
	                    		<input type="checkbox" name="major[]" id="major_maj28" class="chk" value="수학.통계학"><span>수학.통계학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj29">
	                    		<input type="checkbox" name="major[]" id="major_maj29" class="chk" value="물리"><span>물리</span>
	                    	</label>
	                    </li>
						<li class="chk_item">
							<label for="major_maj30">
								<input type="checkbox" name="major[]" id="major_maj30" class="chk"	value="화학"><span>화학</span>
							</label>
						</li>
					</ul>
                </td>
                <td class="ap_td">
                    <ul class="ap_chk_list">
	                    <li class="chk_item">
	                    	<label for="major_maj31">
	                    		<input type="checkbox" name="major[]" id="major_maj31" class="chk" value="의.약학"><span>의.약학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj32">
	                    		<input type="checkbox" name="major[]" id="major_maj32" class="chk" value="간호학"><span>간호학</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj33">
	                    		<input type="checkbox" name="major[]" id="major_maj33" class="chk" value="방사선과"><span>방사선과</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj34">
	                    		<input type="checkbox" name="major[]" id="major_maj34" class="chk" value="안경학과"><span>안경학과</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="major_maj35">
	                    		<input type="checkbox" name="major[]" id="major_maj35" class="chk" value="임상병리학"><span>임상병리학</span>
	                    	</label>
	                    </li>
                    </ul>
                </td>
            </tr></tbody>
        </table>
    </div>
    <div class="ap_btn_wrap">
        <input type="button" class="ap_btn_OK" id="ap_btn_OK" value="선택완료">
        <input type="button" class="ap_btn_close" id="ap_btn_close" value="닫기">
    </div>
</div>
</body>
</html>