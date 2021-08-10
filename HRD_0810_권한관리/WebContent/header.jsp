<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbconn.jsp"%> <!-- 이 위치에 db연결 불러옴 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 관리 프로그램</title>
<link rel = "stylesheet" type = "text/css" href = "style.css"> <!-- style.css파일 불러오기 -->
</head>
<body>
	<header>
		<h2>권한관리</h2>
	</header>
	<nav>
		<a href = "insert.jsp">사용자등록</a>
		<a href = "select.jsp">사용자목록조회/수정</a>
		<a href = "select2.jsp">권한조회</a>
		<a href = "index.jsp">홈으로</a>
	</nav>
</body>
</html>