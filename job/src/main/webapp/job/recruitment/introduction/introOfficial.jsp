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
		$("#in_btn_reset").on("click", function() {			
			$('input:checkbox[name="in_job_grade[]"]').prop("checked", false);
			$('input:checkbox[name="in_job_duties[]"]').prop("checked", false);
		});
		
		$('input:checkbox[class="in_chk"]').click(function() {
			var num = $('input:checkbox[class="in_chk"]:checked').length;   //체크갯수 확인
			if(num>3){
				alert("최대 3개까지 선택가능합니다.");
				//$('input:checkbox[name="job_grade[]"]').prop("checked", false);
				$('input:checkbox[class="in_chk"]').prop("checked", false);
			 }
		}); 
		
		$("#in_btn_OK").on("click", function() {
			var items=[];
			$('input[class="in_chk"]:checkbox:checked').each(function(){
				items.push($(this).val());
			});			 
			var tmp = items.join('/');
			alert(tmp);
			$("#rmi_Official", opener.document).val(tmp);
			self.close();
		});
		
		$("#in_btn_close").click(function() {
			window.close();
		});
	});
</script>
<style type="text/css">
.in_title {
	margin-top: 30px;
	margin-bottom: 0;
}
.lpop_job_select {
	margin-left: 30px;
}
.in_btn_reset {
	position: relative;
	left: 80%;
	width: 120px;
	height: 30px;
	background-color: white;
	border: 1px solid #E6E6E6;	
}
.in_btn_reset:hover {
	border: 1px solid #6E6E6E;	
}
.in_btn_wrap {
	margin-left: 120px;
	margin-top: 20px;
	padding: 10px;
}
.in_btn_OK, .in_btn_close {
	width: 180px;
	height: 60px;
	font-size: 15px;
	font-weight: bold;
}
.in_btn_OK {
	background-color: #2E2E2E;
	color: white;
	border: 0;
}
.in_btn_OK:hover {
	background: #000000;
}
.in_btn_close {
	background-color: white;
	border: 1px solid #E6E6E6;
}
.in_btn_close:hover {
	border: 1px solid #6E6E6E;
}
.in_chk_list {
   	list-style: none;   	
   	position: relative;
    width: auto;
    display: inline-block;
    text-align: center;
    vertical-align: top;
    text-align: left;
    margin: 10 10 10 10px;
}
</style>
</head>
<body>
<div class="lpop_job_select" id="lpop_job_select" style="display: block;">
    <h2 class="in_title">직급/직책 선택</h2>
    <div class="btn_area">
        <input type="button" class="in_btn_reset" id="in_btn_reset" value="전체선택 초기화">      
        <hr>  
    </div>
    <div class="in_intro_list">
        <table class="tbl_common">
            <colgroup>
                <col style="width:92px">
                <col style="">
            </colgroup>
            <tbody>
            <tr>
                <th bgcolor="#E6E6E6">근무직급</th>               
                <td>
                    <ul class="in_chk_list" id="ul_job_grade">
	                    <li class="chk_item">
	                    	<label for="job_grade_jg1">
	                   			<input type="checkbox" name="in_job_grade[]" id="job_grade_jg1" class="in_chk" value="연구원"><span>연구원</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="job_grade_jg2">
	                    		<input type="checkbox" name="in_job_grade[]" id="job_grade_jg2" class="in_chk" value="주임연구원"><span>주임연구원</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="job_grade_jg3">
	                    		<input type="checkbox" name="in_job_grade[]" id="job_grade_jg3" class="in_chk" value="선임연구원"><span>선임연구원</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="job_grade_jg4">
	                    		<input type="checkbox" name="in_job_grade[]" id="job_grade_jg4" class="in_chk" value="사원"><span>사원</span>
	                   	 	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="job_grade_jg5">
	                    		<input type="checkbox" name="in_job_grade[]" id="job_grade_jg5" class="in_chk" value="주임"><span>주임</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="job_grade_jg6">
	                    		<input type="checkbox" name="in_job_grade[]" id="job_grade_jg6" class="in_chk" value="대리"><span>대리</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="job_grade_jg7">
	                    		<input type="checkbox" name="in_job_grade[]" id="job_grade_jg7" class="in_chk" value="과장"><span>과장</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="job_grade_jg8">
	                    		<input type="checkbox" name="in_job_grade[]" id="job_grade_jg8" class="in_chk" value="면접후 결정"><span>면접후 결정</span>
	                    	</label>
	                    </li>	                   
	                </ul> 
                </td>               
            </tr>      
            <tr>
                <th bgcolor="#E6E6E6">근무직책</th>
                <td>
                    <ul class="in_chk_list" id="ul_job_duties">
                    	<li class="chk_item">
                    		<label for="job_duties_jd1">
                    			<input type="checkbox" name="in_job_duties[]" id="job_duties_jd1" class="in_chk" value="팀원"><span>팀원</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="job_duties_jd2">
                    			<input type="checkbox" name="in_job_duties[]" id="job_duties_jd2" class="in_chk" value="팀장"><span>팀장</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="job_duties_jd3">
                    			<input type="checkbox" name="in_job_duties[]" id="job_duties_jd3" class="in_chk" value="실장"><span>실장</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="job_duties_jd4">
                    			<input type="checkbox" name="in_job_duties[]" id="job_duties_jd4" class="in_chk" value="파트장"><span>파트장</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="job_duties_jd5">
                    			<input type="checkbox" name="in_job_duties[]" id="job_duties_jd5" class="in_chk" value="매니저"><span>매니저</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="job_duties_jd6">
                    			<input type="checkbox" name="in_job_duties[]" id="job_duties_jd6" class="in_chk" value="센터장"><span>센터장</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="job_duties_jd7">
                    			<input type="checkbox" name="in_job_duties[]" id="job_duties_jd7" class="in_chk" value="임원"><span>임원</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="job_duties_jd8">
                    			<input type="checkbox" name="in_job_duties[]" id="job_duties_jd8" class="in_chk" value="지사장"><span>지사장</span>
                    		</label>
                    	</li>
                    </ul>
                </td>                
            </tr>            
            </tbody>
        </table>
    </div>
    <div class="in_btn_wrap">
        <button type="button" class="in_btn_OK" id="in_btn_OK">선택완료</button>
        <button type="button" class="in_btn_close" id="in_btn_close">닫기</button>
    </div>
</div>
</body>
</html>