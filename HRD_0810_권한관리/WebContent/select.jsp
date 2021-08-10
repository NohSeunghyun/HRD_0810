<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 관리 프로그램</title>
</head>
<body>
<%@ include file = "header.jsp"%>
	<section>
		<div>
			<h2>수강생 조회/수정</h2>
		</div>
		<table border = "1" width = "600" style="margin: 0 auto;">
			<tr>
				<th>사용자번호</th>
				<th>사용자명</th>
				<th>소속부서번호</th>
				<th>사용자구분</th>
				<th>등록일자</th>
			</tr>
			<%
				sql += "select user_no, user_name,";
				sql += " nvl(decode(dept_no, 'A01', '인사', 'A02', '개발', 'B01', '총무', 'B02', '회계'), ' ') as dept_no,";
				sql += " user_gbn,";
				sql += " to_char(reg_date, 'yyyy/mm/dd') as reg_date";
				sql += " from user_tbl_08";
				
				rs = stmt.executeQuery(sql);
				
				while (rs.next()) {
			%>
			<tr align = "center">
				<td>
				<a href = "update.jsp?user_no=<%=rs.getString(1)%>" style="text-decoration: none; color: blue;">
				<%=rs.getString(1)%>
				</td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
<%@ include file = "footer.jsp"%>
</body>
</html>