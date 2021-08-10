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
				<th>메뉴번호</th>
				<th>메뉴명</th>
			</tr>
			<%
				sql += "select user_no, user_name, menu_no,";
				sql += " decode(menu_no, '10', '부서관리', '11', '사원관리', '12', '기초정보관리', '13', '급여계산')";
				sql += " from user_tbl_08 natural join dept_auth_tbl_08";
				sql += " union";
				sql += " select user_no, user_name, menu_no,";
				sql += " decode(menu_no, '10', '부서관리', '11', '사원관리', '12', '기초정보관리', '13', '급여계산')";
				sql += " from user_tbl_08 natural join user_auth_tbl_08";
				
				rs = stmt.executeQuery(sql);
				
				String beforeUser_no = "";
				
				while (rs.next()) {
						
					String nowUser_no = rs.getString("user_no");
			%>
			<tr align = "center">
				<%
					if(!beforeUser_no.equals(nowUser_no)) {
						
						beforeUser_no = nowUser_no;
				%>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<%
					} else if (beforeUser_no.equals(nowUser_no)) {
				%>
				<td></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<%
						}
					}
				%>
			</tr>
		</table>
	</section>
<%@ include file = "footer.jsp"%>
</body>
</html>