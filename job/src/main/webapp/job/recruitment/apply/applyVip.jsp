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
	$("#btn_reset").on("click", function() {			
		$('input:checkbox[name="Vip[]"]').prop("checked", false);
	});
	
	$('input:checkbox[class="chk"]').click(function() {
		var num = $('input:checkbox[class="chk"]:checked').length;   //체크갯수 확인
		if(num>10){
			alert("최대 10개까지 선택가능합니다.");
			$('input:checkbox[class="chk"]').prop("checked", false);
		 }
	}); 
	
	$("#btn_OK").on("click", function() {
		var items=[];
		$('input[class="chk"]:checkbox:checked').each(function(){
			items.push($(this).val());
		});			 
		var tmp = items.join('/');
		alert(tmp);
		$("#rma_Vip", opener.document).val(tmp);
		self.close();
	});
	
	$("#btn_close").click(function() {
		window.close();
	});
});
</script>
<style type="text/css">
th {
	height: 50px;
}
.tbl_typ_reg02.down_typ th, .tbl_typ_reg02.down_typ td {
    border-left: 1px solid #e1e1e1;
}
.tbl_typ_reg02 th {
    background-color: #f7f7f7;
    font-weight: bold;
    line-height: 18px;
    text-align: center;
}
.tbl_typ_reg02 th, .tbl_typ_reg02 td {
    border-bottom: 1px solid #e0e0e0;
    box-sizing: border-box;
}
table.tbl_common {
    width: 100%;
    border-spacing: 0;
    border-collapse: collapse;
    font-size: 14px;
    letter-spacing: -1px;
    color: #101010;
    table-layout: fixed;
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
.chk_list {
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
.btn_wrap {
	margin-left: 200px;
	margin-top: 20px;
	padding: 10px;
}
.btn_OK, .btn_close {
	width: 180px;
	height: 60px;
	font-size: 15px;
	font-weight: bold;
}
.btn_OK {
	background-color: #2E2E2E;
	color: white;
	border: 0;
}
.btn_OK:hover {
	background: #000000;
}
.btn_close {
	background-color: white;
	border: 1px solid #E6E6E6;
}
.btn_close:hover {
	border: 1px solid #6E6E6E;
}
.btn_reset {
	position: relative;
	left: 80%;
	width: 120px;
	height: 30px;
	background-color: white;
	border: 1px solid #E6E6E6;	
	margin-bottom: 10px;
}
.btn_reset:hover {
	border: 1px solid #6E6E6E;	
}
</style>
</head>
<body>
<div id="lpop_major" class="lpop_wrap lpop_major_select" style="display: block;">
    <h2>우대조건 선택</h2>
    <div class="tbl_btn_area">
        <button type="button" class="btn_reset" id="btn_reset">전체선택 초기화</button>
    </div>
    <div class="tbl_typ_reg02 down_typ scroll">
        <table class="tbl_common">
            <colgroup>
                <col style="width:180px">
                <col style="width:180px">
                <col style="width:180px">
                <col style="width:180px">
                <col style="width:180px">
            </colgroup>
            <tbody>
            <tr>
                <th>기본우대</th>
                <th>외국어 능력</th>
                <th>활동/경험</th>
                <th>자격/능력</th>
                <th>근무조건</th>
            </tr>
            <tr>
                <td>
                    <ul class="chk_list">
	                    <li class="chk_item">
	                    	<label for="vip1">
	                    		<input type="checkbox" name="Vip[]" id="vip1" class="chk" value="국가유공자"><span>국가유공자</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                   	 	<label for="vip2">
	                    		<input type="checkbox" name="Vip[]" id="vip2" class="chk" value="보훈대상자"><span>보훈대상자</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="vip3">
	                    		<input type="checkbox" name="Vip[]" id="vip3" class="chk" value="장애인우대"><span>장애인우대</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="vip4">
	                   		 	<input type="checkbox" name="Vip[]" id="vip4" class="chk" value="병역특례"><span>병역특례</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="vip5">
	                    		<input type="checkbox" name="Vip[]" id="vip5" class="chk" value="취업보호대상자"><span>취업보호대상자</span>
	                    	</label>
	                    </li>
	                </ul>	                
                </td>
                <td>
                    <ul class="chk_list">
                    	<li class="chk_item">
                    		<label for="vip6">
                    			<input type="checkbox" name="Vip[]" id="vip6" class="chk" value="영어가능자"><span>영어가능자</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="vip7">
                    			<input type="checkbox" name="Vip[]" id="vip7" class="chk" value="일본어 가능자"><span>일본어 가능자</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="vip8">
                    			<input type="checkbox" name="Vip[]" id="vip8" class="chk" value="중국어 가능자"><span>중국어 가능자</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="vip9">
                    			<input type="checkbox" name="Vip[]" id="vip9" class="chk" value="독일어 가능자"><span>독일어 가능자</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="vip10">
                    			<input type="checkbox" name="Vip[]" id="vip10" class="chk" value="불어 가능자"><span>불어 가능자</span>
                    		</label>
                    	</li>
                    </ul>
                </td>
                <td>
                    <ul class="chk_list">
	                    <li class="chk_item">
	                    	<label for="vip11">
	                    		<input type="checkbox" name="Vip[]" id="vip11" class="chk" value="공모전 입상자"><span>공모전 입상자</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="vip12">
	                    		<input type="checkbox" name="Vip[]" id="vip12" class="chk" value="해당직무 인턴경력"><span>해당직무 인턴경력</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="vip13">
	                    		<input type="checkbox" name="Vip[]" id="vip13" class="chk" value="해당직무 직무경력"><span>해당직무 직무경력</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="vip14">
	                    		<input type="checkbox" name="Vip[]" id="vip14" class="chk" value="해외연수자"><span>해외연수자</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="vip15">
	                    		<input type="checkbox" name="Vip[]" id="vip15" class="chk" value="군전역간부"><span>군전역간부</span>
	                    	</label>
	                    </li>
                    </ul>
                </td>
                <td rowspan="3">
                    <ul class="chk_list">
	                    <li class="chk_item">
	                    	<label for="vip16">
	                    		<input type="checkbox" name="Vip[]" id="vip16" class="chk" value="학점4.0이상"><span>공모전 입상자</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="vip17">
	                    		<input type="checkbox" name="Vip[]" id="vip17" class="chk" value="컴퓨터활용능력 우수"><span>해당직무 인턴경력</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="vip18">
	                    		<input type="checkbox" name="Vip[]" id="vip18" class="chk" value="문서작성 우수자"><span>해당직무 직무경력</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="vip19">
	                    		<input type="checkbox" name="Vip[]" id="vip19" class="chk" value="엑셀 고급능력자"><span>해외연수자</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="vip20">
	                    		<input type="checkbox" name="Vip[]" id="vip20" class="chk" value="포토샵 능숙자"><span>군전역간부</span>
	                    	</label>
	                    </li>
                    </ul>
                </td>            
                <td>
                    <ul class="chk_list">
	                    <li class="chk_item">
	                    	<label for="vip21">
	                    		<input type="checkbox" name="Vip[]" id="vip21" class="chk" value="인근거주자"><span>인근거주자</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="vip22">
	                    		<input type="checkbox" name="Vip[]" id="vip22" class="chk" value="운전가능자"><span>운전가능자</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="vip23">
	                    		<input type="checkbox" name="Vip[]" id="vip23" class="chk" value="차량소지자"><span>차량소지자</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="vip24">
	                    		<input type="checkbox" name="Vip[]" id="vip24" class="chk" value="야간근무 가능자"><span>야간근무 가능자</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="vip25">
	                    		<input type="checkbox" name="Vip[]" id="vip25" class="chk" value="격일근무 가능자"><span>격일근무 가능자</span>
	                    	</label>
	                    </li>
                    </ul>
                </td>                
            </tr>
            </tbody>
        </table>
    </div>
    <div class="btn_wrap">
        <button type="button" class="btn_OK" id="btn_OK">선택완료</button>
        <button type="button" class="btn_close" id="btn_close">닫기</button>
    </div>
</div>
</body>
</html>