<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
.btn_typ_c3 {
    width: 130px;
    height: 31px;
    margin: -120px;
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
button.btn_typ_c3 {
    padding: 0 12px 2px;
    height: 40px;
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
button:hover {
	border: 1px solid #151515;
}
.title {
	background-color: #F2F2F2;
	height: 40px;
}
.point_color {
	color: #FF8000;
}
</style>
</head>
<body>
<div id="lpop_language" class="lpop_wrap lpop_exam" style="display: block;">
    <h3>외국어 시험 선택</h3>
    <div class="tbl_btn_area">
        <button type="button" class="btn_reset">전체선택 초기화</button>
    </div>
		<div class="tbl_typ_reg02 down_typ">
			<table class="tbl_common">
				<colgroup>
					<col style="width: 160px">
					<col style="">
				</colgroup>
				<thead>
					<tr class="title">
						<th>언어선택</th>
						<th>외국어시험선택 <span class="point_color">(최대3개)</span></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="first_item">
							<button type="button" class="btn_typ_c3 on" value="1">영어</button>
						</th>
						<td rowspan="8">
							<div class="chk_exam">
								<ul class="chk_list" style="padding: 10px 0 0 15px;">
									<li class="chk_item">
										<label for="language_7453">
											<input type="checkbox" name="language[]" id="language_7453"	value="7453"><span>TOEIC</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language_7454">
											<input type="checkbox" name="language[]" id="language_7454"	value="7454"><span>S-ETAT2급</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language_7455">
											<input type="checkbox" name="language[]" id="language_7455" value="7455"><span>TOED</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language_7456">
											<input type="checkbox" name="language[]" id="language_7456" value="7456"><span>S-TOED</span>
										</label>
									</li>
									<li class="chk_item">
										<label for="language_7457">
											<input type="checkbox" name="language[]" id="language_7457" value="7457"><span>EPQT</span>
										</label>
									</li>									
									<li class="chk_item"><label for="language_7758"><input
											type="checkbox" name="language[]" id="language_7758"
											value="7758"><span>공무원영어</span></label></li>
									<li class="chk_item"><label for="language_7759"><input
											type="checkbox" name="language[]" id="language_7759"
											value="7759"><span>관광통역안내사 영어</span></label></li>
									<li class="chk_item"><label for="language_7760"><input
											type="checkbox" name="language[]" id="language_7760"
											value="7760"><span>무역영어</span></label></li>
									<li class="chk_item"><label for="language_7761"><input
											type="checkbox" name="language[]" id="language_7761"
											value="7761"><span>영어 교원자격증</span></label></li>
									<li class="chk_item"><label for="language_7762"><input
											type="checkbox" name="language[]" id="language_7762"
											value="7762"><span>AP</span></label></li>
									<li class="chk_item"><label for="language_7763"><input
											type="checkbox" name="language[]" id="language_7763"
											value="7763"><span>Cambridge Certification CAE</span></label></li>
									<li class="chk_item"><label for="language_7764"><input
											type="checkbox" name="language[]" id="language_7764"
											value="7764"><span>Cambridge Certification CPE</span></label></li>
									<li class="chk_item"><label for="language_7765"><input
											type="checkbox" name="language[]" id="language_7765"
											value="7765"><span>Cambridge Certification FCE</span></label></li>
									<li class="chk_item"><label for="language_7766"><input
											type="checkbox" name="language[]" id="language_7766"
											value="7766"><span>EFB</span></label></li>
									<li class="chk_item"><label for="language_7767"><input
											type="checkbox" name="language[]" id="language_7767"
											value="7767"><span>ESPT</span></label></li>
									<li class="chk_item"><label for="language_7768"><input
											type="checkbox" name="language[]" id="language_7768"
											value="7768"><span>FLEX 영어</span></label></li>
									<li class="chk_item"><label for="language_7769"><input
											type="checkbox" name="language[]" id="language_7769"
											value="7769"><span>GMAT</span></label></li>
									<li class="chk_item"><label for="language_7770"><input
											type="checkbox" name="language[]" id="language_7770"
											value="7770"><span>GRE</span></label></li>
									<li class="chk_item"><label for="language_7771"><input
											type="checkbox" name="language[]" id="language_7771"
											value="7771"><span>iB-SET</span></label></li>
									<li class="chk_item"><label for="language_7772"><input
											type="checkbox" name="language[]" id="language_7772"
											value="7772"><span>IELTS</span></label></li>
									<li class="chk_item"><label for="language_7773"><input
											type="checkbox" name="language[]" id="language_7773"
											value="7773"><span>IET</span></label></li>
									<li class="chk_item"><label for="language_7774"><input
											type="checkbox" name="language[]" id="language_7774"
											value="7774"><span>JET</span></label></li>
									<li class="chk_item"><label for="language_7775"><input
											type="checkbox" name="language[]" id="language_7775"
											value="7775"><span>JET Speaking</span></label></li>
									<li class="chk_item"><label for="language_7776"><input
											type="checkbox" name="language[]" id="language_7776"
											value="7776"><span>J-TOED</span></label></li>
									<li class="chk_item"><label for="language_7777"><input
											type="checkbox" name="language[]" id="language_7777"
											value="7777"><span>LSAT</span></label></li>
									<li class="chk_item"><label for="language_7778"><input
											type="checkbox" name="language[]" id="language_7778"
											value="7778"><span>OPIC</span></label></li>
									<li class="chk_item"><label for="language_7779"><input
											type="checkbox" name="language[]" id="language_7779"
											value="7779"><span>PELT</span></label></li>
									<li class="chk_item"><label for="language_7780"><input
											type="checkbox" name="language[]" id="language_7780"
											value="7780"><span>PELT Jr</span></label></li>
									<li class="chk_item"><label for="language_7781"><input
											type="checkbox" name="language[]" id="language_7781"
											value="7781"><span>PELT kids</span></label></li>
									<li class="chk_item"><label for="language_7782"><input
											type="checkbox" name="language[]" id="language_7782"
											value="7782"><span>PELT main</span></label></li>
									<li class="chk_item"><label for="language_7783"><input
											type="checkbox" name="language[]" id="language_7783"
											value="7783"><span>PELT plus</span></label></li>
									<li class="chk_item"><label for="language_7784"><input
											type="checkbox" name="language[]" id="language_7784"
											value="7784"><span>PELT standard</span></label></li>
									<li class="chk_item"><label for="language_7785"><input
											type="checkbox" name="language[]" id="language_7785"
											value="7785"><span>PET(Preliminary English
												Test)</span></label></li>
									<li class="chk_item"><label for="language_7786"><input
											type="checkbox" name="language[]" id="language_7786"
											value="7786"><span>SAT</span></label></li>
									<li class="chk_item"><label for="language_7787"><input
											type="checkbox" name="language[]" id="language_7787"
											value="7787"><span>SEPT</span></label></li>
									<li class="chk_item"><label for="language_7788"><input
											type="checkbox" name="language[]" id="language_7788"
											value="7788"><span>SLEP</span></label></li>
									<li class="chk_item"><label for="language_7789"><input
											type="checkbox" name="language[]" id="language_7789"
											value="7789"><span>SNULT 영어</span></label></li>
									<li class="chk_item"><label for="language_7790"><input
											type="checkbox" name="language[]" id="language_7790"
											value="7790"><span>SSAT</span></label></li>
									<li class="chk_item"><label for="language_7791"><input
											type="checkbox" name="language[]" id="language_7791"
											value="7791"><span>TCT 번역능력인정시험 영어</span></label></li>
									<li class="chk_item"><label for="language_7792"><input
											type="checkbox" name="language[]" id="language_7792"
											value="7792"><span>TESOL</span></label></li>
									<li class="chk_item"><label for="language_7793"><input
											type="checkbox" name="language[]" id="language_7793"
											value="7793"><span>TOEFL(CBT)</span></label></li>
									<li class="chk_item"><label for="language_7794"><input
											type="checkbox" name="language[]" id="language_7794"
											value="7794"><span>TOEFL(iBT)</span></label></li>
									<li class="chk_item"><label for="language_7795"><input
											type="checkbox" name="language[]" id="language_7795"
											value="7795"><span>TOEFL(PBT)</span></label></li>
									<li class="chk_item"><label for="language_7796"><input
											type="checkbox" name="language[]" id="language_7796"
											value="7796"><span>TOEIC Bridge</span></label></li>
									<li class="chk_item"><label for="language_7797"><input
											type="checkbox" name="language[]" id="language_7797"
											value="7797"><span>TOEIC Speaking and Writing
												Tests</span></label></li>
									<li class="chk_item"><label for="language_7798"><input
											type="checkbox" name="language[]" id="language_7798"
											value="7798"><span>TOEIC Speaking Test</span></label></li>
									<li class="chk_item"><label for="language_7799"><input
											type="checkbox" name="language[]" id="language_7799"
											value="7799"><span>TOP</span></label></li>
									<li class="chk_item"><label for="language_7800"><input
											type="checkbox" name="language[]" id="language_7800"
											value="7800"><span>TOSEL</span></label></li>
									<li class="chk_item"><label for="language_7801"><input
											type="checkbox" name="language[]" id="language_7801"
											value="7801"><span>TSE</span></label></li>
									<li class="chk_item"><label for="language_7802"><input
											type="checkbox" name="language[]" id="language_7802"
											value="7802"><span>TWP</span></label></li>
									<li class="chk_item"><label for="language_7803"><input
											type="checkbox" name="language[]" id="language_7803"
											value="7803"><span>Y-TOED</span></label></li>
									<li class="chk_item"><label for="language_23573"><input
											type="checkbox" name="language[]" id="language_23573"
											value="23573"><span>TOEIC Writing Test</span></label></li>
									<li class="chk_item"><label for="language_26876"><input
											type="checkbox" name="language[]" id="language_26876"
											value="26876"><span>BEC Preliminary</span></label></li>
									<li class="chk_item"><label for="language_26877"><input
											type="checkbox" name="language[]" id="language_26877"
											value="26877"><span>BEC Vantage</span></label></li>
									<li class="chk_item"><label for="language_26878"><input
											type="checkbox" name="language[]" id="language_26878"
											value="26878"><span>BEC Higher</span></label></li>
									<li class="chk_item"><label for="language_28897"><input
											type="checkbox" name="language[]" id="language_28897"
											value="28897"><span>Versant</span></label></li>
									<li class="chk_item"><label for="language_30481"><input
											type="checkbox" name="language[]" id="language_30481"
											value="30481"><span>WPT(Writing Proficiency
												Test)</span></label></li>
									<li class="chk_item"><label for="language_36439"><input
											type="checkbox" name="language[]" id="language_36439"
											value="36439"><span>SPA(Speaking Proficiency
												Assessment) </span></label></li>
									<li class="chk_item"><label for="language_36441"><input
											type="checkbox" name="language[]" id="language_36441"
											value="36441"><span>NEAT</span></label></li>
									<li class="chk_item"><label for="language_36442"><input
											type="checkbox" name="language[]" id="language_36442"
											value="36442"><span>TESL</span></label></li>
									<li class="chk_item"><label for="language_36669"><input
											type="checkbox" name="language[]" id="language_36669"
											value="36669"><span>ITT 특별통역 자격증</span></label></li>
									<li class="chk_item"><label for="language_36670"><input
											type="checkbox" name="language[]" id="language_36670"
											value="36670"><span>ITT 전문통역 자격증</span></label></li>
									<li class="chk_item"><label for="language_36671"><input
											type="checkbox" name="language[]" id="language_36671"
											value="36671"><span>ITT 비즈니스통역 자격증</span></label></li>
									<li class="chk_item"><label for="language_36672"><input
											type="checkbox" name="language[]" id="language_36672"
											value="36672"><span>ITT 특별번역 자격증</span></label></li>
									<li class="chk_item"><label for="language_36673"><input
											type="checkbox" name="language[]" id="language_36673"
											value="36673"><span>ITT 전문번역 자격증</span></label></li>
									<li class="chk_item"><label for="language_36674"><input
											type="checkbox" name="language[]" id="language_36674"
											value="36674"><span>ITT 비즈니스번역 자격증</span></label></li>
									<li class="chk_item"><label for="language_39181"><input
											type="checkbox" name="language[]" id="language_39181"
											value="39181"><span>TEPS Speaking</span></label></li>
									<li class="chk_item"><label for="language_39445"><input
											type="checkbox" name="language[]" id="language_39445"
											value="39445"><span>OPI</span></label></li>
									<li class="chk_item"><label for="language_39474"><input
											type="checkbox" name="language[]" id="language_39474"
											value="39474"><span>OPic Writing</span></label></li>
									<li class="chk_item"><label for="language_39488"><input
											type="checkbox" name="language[]" id="language_39488"
											value="39488"><span>PTE Professional</span></label></li>
									<li class="chk_item"><label for="language_39515"><input
											type="checkbox" name="language[]" id="language_39515"
											value="39515"><span>NEW TEPS</span></label></li>
								</ul>
							</div>
						</td>
					</tr>
					<tr>
						<th><button type="button" class="btn_typ_c3 " value="2">일본어</button></th>
					</tr>
					<tr>
						<th><button type="button" class="btn_typ_c3 " value="3">중국어</button></th>
					</tr>
					<tr>
						<th><button type="button" class="btn_typ_c3 " value="4">독일어</button></th>
					</tr>
					<tr>
						<th><button type="button" class="btn_typ_c3 " value="5">불어</button></th>
					</tr>
					<tr>
						<th><button type="button" class="btn_typ_c3 " value="6">스페인어</button></th>
					</tr>
					<tr>
						<th><button type="button" class="btn_typ_c3 " value="7">러시아어</button></th>
					</tr>
					<tr>
						<th><button type="button" class="btn_typ_c3 " value="9">한국어/한자/기타</button></th>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn_wrap">
        <button type="button" class="btn_typ_a1">확인</button>
        <button type="button" class="btn_typ_a2">취소</button>
    </div>
    <button type="button" class="btn_close_lpop01">닫기</button>
</div>
</body>
</html>