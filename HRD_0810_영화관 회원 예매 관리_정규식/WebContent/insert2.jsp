<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 회원 예매 관리 프로그램</title>
</head>
<script type="text/javascript">
function check() {
	if (!f.me_id.value) {
		alert("아이디를 입력해주세요!")
		return f.me_id.focus();
	} // 존재하지않는 아이디와 비밀번호 입력시 예매안되게 만들기
	if (!f.me_pass.value) {
		alert("비밀번호를 입력해주세요!")
		return f.me_pass.focus();
	} // 존재하지않는 아이디와 비밀번호 입력시 예매안되게 만들기
	if (!f.mo_name.value) {
		alert("영화제목을 선택해주세요!")
		return;
	}
	f.submit();
}
</script>
<body>
<%@ include file = "header.jsp" %>
<%
	sql = "select to_char(sysdate, 'yyyy-mm-dd') as rm_date from dual";
	rs = stmt.executeQuery(sql); // sql을 DBMS로 넘겨 컴파일됨->속도 느림
	rs.next();
	String rm_date = rs.getString("rm_date");
	
	sql = "select mo_name from movie_3";
	rs = stmt.executeQuery(sql);
	if (!rs.next()) {
%>
<script>
	alert("등록된 영화가 없습니다!");
</script>
<%
	}
%>
	<section>
		<div>
			<h2>영화예매</h2>
		</div>
		<form action = "insert2Pro.jsp" name = "f" method = "post">
			<table border = "1" width = "400" style = "margin: 0 auto;">
				<tr>
					<th width = 30%>회원아이디</th>
					<td width = 70%>
						<input type = "text" value = "" name = "me_id" size = "20" maxlength = "12"> 
					</td>
				</tr>
				<tr>
					<th>회원비밀번호</th>
					<td>
						<input type = "password" value = "" name = "me_pass" size = "20" maxlength = "15">
					</td>
				</tr>
				<tr>
					<th>영화제목</th>
					<td>
						<select name = "mo_name" multiple="multiple">
							<option disabled = "disabled">영화제목을 선택하시오.</option>
							<!-- 주의 : 반드시 do~while문만 사용가능 -->
							<%
							do {
							%>
							<option value = "<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
							<%
							} while(rs.next());
							%>
						</select>
					</td>
				</tr>
				<tr>
					<th>예매일시</th>
					<td>
						<input type = "text" value = "<%=rm_date %>" name = "rm_date" size = "20" maxlength = "15" readonly>
					</td>
				</tr>
				<tr>
					<th colspan = "2">
						<input type = "submit" value = "영화예매" onclick = "check(); return false">
						<input type = "button" value = "조회" onclick = "location = 'select.jsp'">
					</th>
				</tr>
		</table>
	</form>
	</section>
<%@ include file = "footer.jsp" %>
</body>
</html>