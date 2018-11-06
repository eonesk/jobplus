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
		$('input:checkbox[name="language[]"]').prop("checked", false);
	});
	
	$('input:checkbox[class="chk"]').click(function() {
		var num = $('input:checkbox[class="chk"]:checked').length;   //체크갯수 확인
		if(num>3){
			alert("최대 3개까지 선택가능합니다.");
			$('input:checkbox[class="chk"]').prop("checked", false);
		 }
	}); 
	
	$("#btn_typ_1").on("click", function() {	
		$('label[class="language1"]').show();	
		$('label[class="language2"]').hide();	
		$('label[class="language3"]').hide();	
		$('label[class="language4"]').hide();	
		$('label[class="language5"]').hide();	
	});
	$("#btn_typ_2").on("click", function() {	
		$('label[class="language1"]').hide();		
		$('label[class="language2"]').show();	
		$('label[class="language3"]').hide();	
		$('label[class="language4"]').hide();	
		$('label[class="language5"]').hide();	
	});
	$("#btn_typ_3").on("click", function() {	
		$('label[class="language1"]').hide();		
		$('label[class="language2"]').hide();	
		$('label[class="language3"]').show();	
		$('label[class="language4"]').hide();	
		$('label[class="language5"]').hide();	
	});
	$("#btn_typ_4").on("click", function() {	
		$('label[class="language1"]').hide();		
		$('label[class="language2"]').hide();	
		$('label[class="language3"]').hide();	
		$('label[class="language4"]').show();	
		$('label[class="language5"]').hide();	
	});
	$("#btn_typ_5").on("click", function() {	
		$('label[class="language1"]').hide();		
		$('label[class="language2"]').hide();	
		$('label[class="language3"]').hide();	
		$('label[class="language4"]').hide();	
		$('label[class="language5"]').show();	
	});
	
	$("#ap_btn_OK").on("click", function() {
		var items=[];
		$('input[class="chk"]:checkbox:checked').each(function(){
			items.push($(this).val());
		});			 
		var tmp = items.join('/');
		alert(tmp);
		$("#rma_Foreign", opener.document).val(tmp);
		self.close();
	});
	
	$("#ap_btn_close").click(function() {
		window.close();
	});
});
</script>
<style type="text/css">
.ap_chk_list {
   	list-style: none;   	
   	position: relative;
    width: auto;
    display: inline-block;
    text-align: center;
    vertical-align: top;
    text-align: left;
    margin: 0 10 10 10px;
    padding: 0 0 0 15px;
}
.btn_typ_c3 {
    padding: 0 12px 2px;  
    margin: 2px 2px 2px 2px;  
    width: 130px;
    height: 30px;
    border: 1px solid #b8b8b8;
    border-radius: 2px;
    box-sizing: border-box;
    color: #313131;
    font-size: 14px;
    font-weight: bold;
    vertical-align: middle;
    letter-spacing: -1px;
    text-align: center;
    background-color: #fff;
}
.btn_typ_c3:hover {
	border: 1px solid #151515;	
}
.btn_typ_c3:focus {
	background-color: gray;
}
.ap_title {
	background-color: #F2F2F2;
	height: 40px;
	border-top: 1px solid black;
}
.point_color {
	color: #FF8000;
}
.ap_btn_reset {
	position: relative;
	left: 65%;
	width: 120px;
	height: 30px;
	background-color: white;
	border: 1px solid #E6E6E6;	
	margin-bottom: 10px;
}
.ap_btn_reset:hover {
	border: 1px solid #6E6E6E;	
}
.ap_btn_OK, .ap_btn_close {
	width: 150px;
	height: 50px;
	font-size: 15px;
	font-weight: bold;
	margin-left: 65px;
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
</style>
</head>
<body>
<div id="lpop_language" class="lpop_wrap lpop_exam" style="display: block;">
    <h2>외국어 시험 선택</h2>
    <div class="tbl_btn_area">
        <input type="button" class="ap_btn_reset" id="ap_btn_reset" value="전체선택 초기화">
    </div>
		<div class="tbl_typ_reg02 down_typ">
			<table class="tbl_common">
				<colgroup>
					<col style="width: 160px">
					<col style="">
				</colgroup>
				<thead>
					<tr class="ap_title">
						<th width="200">언어선택</th>
						<th width="300">외국어시험선택 <span class="point_color">(최대3개)</span></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="first_item">
							<input type="button" class="btn_typ_c3" id="btn_typ_1" value="영어">
						</th>
						<td rowspan="16">
							<div class="chk_exam" id="list1">
								<ul class="ap_chk_list" id="ap_chk_list">
									<li class="chk_item">
										<label for="language1" class="language1">
											<input type="checkbox" name="language[]" id="language_1" class="chk" value="TOEIC"><span>TOEIC</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language2" class="language1">
											<input type="checkbox" name="language[]" id="language_2" class="chk" value="S-ETAT2급"><span>S-ETAT2급</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language3" class="language1">
											<input type="checkbox" name="language[]" id="language_3" class="chk" value="TOED"><span>TOED</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language4" class="language1">
											<input type="checkbox" name="language[]" id="language_4" class="chk" value="S-TOED"><span>S-TOED</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language5" class="language1">
											<input type="checkbox" name="language[]" id="language_5" class="chk" value="EPQT"><span>EPQT</span>
										</label>
									</li>																		
									<li class="chk_item">
										<label for="language1" class="language2" style="display: none;">
											<input type="checkbox" name="language[]" id="language_6" class="chk" value="JLPT"><span>JLPT</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language2" class="language2" style="display: none;">
											<input type="checkbox" name="language[]" id="language_7" class="chk" value="JPT"><span>JPT</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language3" class="language2" style="display: none;">
											<input type="checkbox" name="language[]" id="language_8" class="chk" value="JTRA"><span>JTRA</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language4" class="language2" style="display: none;">
											<input type="checkbox" name="language[]" id="language_9" class="chk" value="일본어 교원자격증"><span>일본어 교원자격증</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language5" class="language2" style="display: none;">
											<input type="checkbox" name="language[]" id="language_10" class="chk" value="EJU"><span>EJU</span>
										</label>
									</li>
									
									<li class="chk_item">
										<label for="language1" class="language3" style="display: none;">
											<input type="checkbox" name="language[]" id="language_11" class="chk" value="HSK"><span>HSK</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language2" class="language3" style="display: none;">
											<input type="checkbox" name="language[]" id="language_12" class="chk" value="BCT"><span>BCT</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language3" class="language3" style="display: none;">
											<input type="checkbox" name="language[]" id="language_13" class="chk" value="C.TEST"><span>C.TEST</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language4" class="language3" style="display: none;">
											<input type="checkbox" name="language[]" id="language_14" class="chk" value="CPT"><span>CPT</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language5" class="language3" style="display: none;">
											<input type="checkbox" name="language[]" id="language_15" class="chk" value="FLEX중국어"><span>FLEX중국어</span>
										</label>
									</li>
									
									<li class="chk_item">
										<label for="language1" class="language4" style="display: none;">
											<input type="checkbox" name="language[]" id="language_16" class="chk" value="DSH"><span>DSH</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language2" class="language4" style="display: none;">
											<input type="checkbox" name="language[]" id="language_17" class="chk" value="FLEX독일어"><span>FLEX독일어</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language3" class="language4" style="display: none;">
											<input type="checkbox" name="language[]" id="language_18" class="chk" value="GDS"><span>GDS</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language4" class="language4" style="display: none;">
											<input type="checkbox" name="language[]" id="language_19" class="chk" value="KDS"><span>KDS</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language5" class="language4" style="display: none;">
											<input type="checkbox" name="language[]" id="language_20" class="chk" value="PWD"><span>PWD</span>
										</label>
									</li>
									
									<li class="chk_item">
										<label for="language1" class="language5" style="display: none;">
											<input type="checkbox" name="language[]" id="language_21" class="chk" value="국어능력인증시험"><span>국어능력인증시험</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language2" class="language5" style="display: none;">
											<input type="checkbox" name="language[]" id="language_22" class="chk" value="한국어 교원자격증"><span>한국어 교원자격증</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language3" class="language5" style="display: none;">
											<input type="checkbox" name="language[]" id="language_23" class="chk" value="KBS 한국어능력시험"><span>KBS 한국어능력시험</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language4" class="language5" style="display: none;">
											<input type="checkbox" name="language[]" id="language_24" class="chk" value="TOPIK"><span>TOPIK</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language5" class="language5" style="display: none;">
											<input type="checkbox" name="language[]" id="language_25" class="chk" value="한자능력검정"><span>한자능력검정</span>
										</label>
									</li>																				
								</ul>								
							</div>
						</td>
					</tr>
					<tr>
						<th><input type="button" class="btn_typ_c3" id="btn_typ_2" value="일본어"></th>
					</tr>
					<tr>
						<th><input type="button" class="btn_typ_c3" id="btn_typ_3" value="중국어"></th>
					</tr>
					<tr>
						<th><input type="button" class="btn_typ_c3" id="btn_typ_4" value="독일어"></th>
					</tr>					
					<tr>
						<th><input type="button" class="btn_typ_c3" id="btn_typ_5" value="한국어/한자/기타"></th>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<br>
		<div class="ap_btn_wrap">
        <input type="button" class="ap_btn_OK" id="ap_btn_OK" value="확인">
        <input type="button" class="ap_btn_close" id="ap_btn_close" value="취소">       
    </div>    
</div>
</body>
</html>