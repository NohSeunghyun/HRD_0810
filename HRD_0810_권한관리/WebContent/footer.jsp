<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 관리 프로그램</title>
</head>
<body>
	<footer>
		HRDKOREA Copyrightⓒ2021 All reserved
	</footer>
</body>
</html>
<!-- 맨 아래에 db연결 해제 구문쓰기 -->
<%
	try {
		if (conn != null) conn.close();
		if (stmt != null) stmt.close();
		if (ps != null) ps.close();
		if (rs != null) rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>