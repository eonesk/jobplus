<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해외경험입력</title>
<script type="text/javascript" src="../script/foreignScript.js"></script>
</head>
<body>
<form action="../foreign/foreignWrite.do" name="foreignWriteForm" method="post">
<div>아이디: <input type="text" name="mId"></div>
<label>국가명: <input type="text" name="rsfName"></label>
<label>시작년월: <input type="date" name="rsfStartdate"></label>
<label>종료년월: <input type="date" name="rsfEnddate"></label>
<div>내용: <textarea rows="5" cols="80" name="rsfContent"></textarea></div>
<input type="button" value="작성" onclick="checkForeignInsert()">
</form>
</body>
</html>