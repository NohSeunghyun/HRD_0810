<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 관리 프로그램</title>
</head>
<script type="text/javascript">
function check() { // 유효성 체크 메서드
	if (!f.user_name.value) {
		alert("사용자명이 입력되지 않았습니다!");
		return f.user_name.focus();
	}
	if (!f.user_pw1.value) {
		alert("암호가 입력되지 않았습니다!");
		return f.user_pw1.focus();
	}
	if (!f.user_pw2.value) {
		alert("암호확인이 입력되지 않았습니다!");
		return f.user_pw2.focus();
	} else if (f.user_pw2.value != f.user_pw1.value) { // 암호와 암호확인 일치 체크 
		alert("암호가 일치하지 않습니다!");
		f.user_pw2.value = "";
		return f.user_pw2.focus();
	}
	if (!f.dept_no.value) {
		alert("소속부서번호가 입력되지 않았습니다!");
		return f.dept_no.focus();
	}
	if (!f.user_gbn.value) {
		alert("사용자구분이 입력되지 않았습니다!");
		return f.user_gbn.focus();
	}
	f.action = "updatePro.jsp";
	f.submit();
}

function dlt() {
	if (confirm("정말 삭제 하시겠습니까?") == true) {
        f.action = "deletePro.jsp";
		f.submit();
    } else {
        return ;
    }
}
</script>
<body>
<%@ include file = "header.jsp"%>

<% 
	String user_no = request.getParameter("user_no");
	
	sql += "select user_name, user_pw,";
	sql += " dept_no, user_gbn,"; 
	sql += " to_char(reg_date, 'yyyy/mm/dd') as reg_date";
	sql += " from user_tbl_08 where user_no = '" + user_no + "'";
	
	rs = stmt.executeQuery(sql);
	rs.next();
%>
	<section>
		<div>
			<h2>수강생 수정</h2>
		</div>
		<form name = "f" method = "post">
			<table border = "1" width = "600" style="margin: 0 auto;">
				<tr>
					<th style = "background-color: skyblue;">사용자번호</th>
					<td>
						<input type = "text" value = "<%=user_no%>" name = "user_no" size = "30" maxlength = "5" readonly>
					</td>
				</tr>
				<tr>
					<th style = "background-color: skyblue;">사용자명</th>
					<td>
						<input type = "text" value = "<%=rs.getString("user_name")%>" name = "user_name" size = "30" maxlength = "50">
					</td>
				</tr>
				<tr>
					<th style = "background-color: skyblue;">암호</th>
					<td>
						<input type = "password" value = "<%=rs.getString("user_pw") %>" name = "user_pw1" size = "30" maxlength = "50">
					</td>
				</tr>
				<tr>
					<th style = "background-color: skyblue;">암호확인</th>
					<td>
						<input type = "password" value = "<%=rs.getString("user_pw") %>" name = "user_pw2" size = "30" maxlength = "50">
					</td>
				</tr>
				<tr>
					<th style = "background-color: skyblue;">소속부서번호</th>
					<td>
						<input type = "text" value = "<%=rs.getString("dept_no") %>" name = "dept_no" size = "30" maxlength = "3">
					</td>
				</tr>
				<tr>
					<th style = "background-color: skyblue;">사용자구분</th>
					<td>
						<input type = "text" value = "<%=rs.getString("user_gbn") %>" name = "user_gbn" size = "30" maxlength = "2">
					</td>
				</tr>
				<tr>
					<th style = "background-color: skyblue;">등록일자</th>
					<td>
						<input type = "text" value = "<%=rs.getString("reg_date")%>" name = "reg_date" size = "30" readonly>
					</td>
				</tr>
			</table>
			<center>
				<input type = "submit" value = "수정" onclick = "check(); return false">
				&nbsp;&nbsp;&nbsp;
				<input type = "button" value = "삭제" onclick = "dlt(); return false">
				&nbsp;&nbsp;&nbsp;
				<input type = "button" value = "조회" onclick = "location = 'select.jsp'">
			</center>
		</form>
	</section>
<%@ include file = "footer.jsp"%>
</body>
</html>