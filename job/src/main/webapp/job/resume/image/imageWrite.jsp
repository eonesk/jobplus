<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/job/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	if(${su > 0}) {
		alert("내 사진목록에 저장되었습니다.\n목록에서 불러오기를 진행해주세요!");
		self.close();
	} else {
		alert("등록에 실패하였습니다.");
		self.close();
	}
</script>
</head>
<body>

</body>
</html>