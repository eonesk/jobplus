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
			$('input:checkbox[name="job_grade[]"]').prop("checked", false);
			$('input:checkbox[name="job_duties[]"]').prop("checked", false);
		});
		
		$('input:checkbox[class="chk"]').click(function() {
			var num = $('input:checkbox[class="chk"]:checked').length;   //체크갯수 확인
			if(num>3){
				alert("최대 3개까지 선택가능합니다.");
				//$('input:checkbox[name="job_grade[]"]').prop("checked", false);
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
			$("#rmi_Official", opener.document).val(tmp);
			self.close();
		});
		
		$("#btn_close").click(function() {
			window.close();
		});
	});
</script>
<style type="text/css">
.title {
	margin-top: 30px;
	margin-bottom: 0;
}
.lpop_job_select {
	margin-left: 30px;
}
.btn_reset {
	position: relative;
	left: 80%;
	width: 120px;
	height: 30px;
	background-color: white;
	border: 1px solid #E6E6E6;	
}
.btn_reset:hover {
	border: 1px solid #6E6E6E;	
}
.btn_wrap {
	margin-left: 120px;
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
</style>
</head>
<body>
<div class="lpop_job_select" id="lpop_job_select" style="display: block;">
    <h2 class="title">직급/직책 선택</h2>
    <div class="btn_area">
        <input type="button" class="btn_reset" id="btn_reset" value="전체선택 초기화">      
        <hr>  
    </div>
    <div class="intro_list">
        <table class="tbl_common">
            <colgroup>
                <col style="width:92px">
                <col style="">
            </colgroup>
            <tbody>
            <tr>
                <th bgcolor="#E6E6E6">근무직급</th>               
                <td>
                    <ul class="chk_list" id="ul_job_grade">
	                    <li class="chk_item">
	                    	<label for="job_grade_jg1">
	                   			<input type="checkbox" name="job_grade[]" id="job_grade_jg1" class="chk" value="연구원"><span>연구원</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="job_grade_jg2">
	                    		<input type="checkbox" name="job_grade[]" id="job_grade_jg2" class="chk" value="주임연구원"><span>주임연구원</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="job_grade_jg3">
	                    		<input type="checkbox" name="job_grade[]" id="job_grade_jg3" class="chk" value="선임연구원"><span>선임연구원</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="job_grade_jg4">
	                    		<input type="checkbox" name="job_grade[]" id="job_grade_jg4" class="chk" value="사원"><span>사원</span>
	                   	 	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="job_grade_jg5">
	                    		<input type="checkbox" name="job_grade[]" id="job_grade_jg5" class="chk" value="주임"><span>주임</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="job_grade_jg6">
	                    		<input type="checkbox" name="job_grade[]" id="job_grade_jg6" class="chk" value="대리"><span>대리</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="job_grade_jg7">
	                    		<input type="checkbox" name="job_grade[]" id="job_grade_jg7" class="chk" value="과장"><span>과장</span>
	                    	</label>
	                    </li>
	                    <li class="chk_item">
	                    	<label for="job_grade_jg8">
	                    		<input type="checkbox" name="job_grade[]" id="job_grade_jg8" class="chk" value="면접후 결정"><span>면접후 결정</span>
	                    	</label>
	                    </li>	                   
	                </ul> 
                </td>               
            </tr>      
            <tr>
                <th bgcolor="#E6E6E6">근무직책</th>
                <td>
                    <ul class="chk_list" id="ul_job_duties">
                    	<li class="chk_item">
                    		<label for="job_duties_jd1">
                    			<input type="checkbox" name="job_duties[]" id="job_duties_jd1" class="chk" value="팀원"><span>팀원</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="job_duties_jd2">
                    			<input type="checkbox" name="job_duties[]" id="job_duties_jd2" class="chk" value="팀장"><span>팀장</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="job_duties_jd3">
                    			<input type="checkbox" name="job_duties[]" id="job_duties_jd3" class="chk" value="실장"><span>실장</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="job_duties_jd4">
                    			<input type="checkbox" name="job_duties[]" id="job_duties_jd4" class="chk" value="파트장"><span>파트장</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="job_duties_jd5">
                    			<input type="checkbox" name="job_duties[]" id="job_duties_jd5" class="chk" value="매니저"><span>매니저</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="job_duties_jd6">
                    			<input type="checkbox" name="job_duties[]" id="job_duties_jd6" class="chk" value="센터장"><span>센터장</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="job_duties_jd7">
                    			<input type="checkbox" name="job_duties[]" id="job_duties_jd7" class="chk" value="임원"><span>임원</span>
                    		</label>
                    	</li>
                    	<li class="chk_item">
                    		<label for="job_duties_jd8">
                    			<input type="checkbox" name="job_duties[]" id="job_duties_jd8" class="chk" value="지사장"><span>지사장</span>
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