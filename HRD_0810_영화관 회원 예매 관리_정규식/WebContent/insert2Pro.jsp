<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "dbconn.jsp"%>

<%
// 회원아이디와 비밀번호를 확인하여 회원이면 insert
try {
	String[] mo_name = request.getParameterValues("mo_name");
	
	sql = "select me_pass from movie_1 where me_id = ?";
	
	ps = conn.prepareStatement(sql);
	ps.setString(1, request.getParameter("me_id"));
	ps.executeQuery();
	rs = ps.executeQuery();
	
	if (rs.next()) { // 입력 아이디가 존재하면(=출력값이 있다면) 실행.
		String dbpasswd = rs.getString(1); // 해당 아이디의 진짜 비밀번호
		if (dbpasswd.equals(request.getParameter("me_pass"))) { // 입력한 비밀번호와 진짜 비밀번호가 일치한다면 실행
			for (int i = 0 ; i < mo_name.length ; i++) {
				
			sql = "insert into movie_2 values (?, ?, ?, ?)";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, request.getParameter("me_id"));
			ps.setString(2, request.getParameter("me_pass"));
			ps.setString(3, mo_name[i]); // 영화제목 여러 개 선택
			ps.setString(4, request.getParameter("rm_date"));
			
			ps.executeUpdate();
			
			}
%>
<script>
			alert("영화 예매가 완료 되었습니다!");
			location = "insert2.jsp"; // 문제에 영화예매화면으로 가라고 하면 insert2.jsp 안적혀있기때문에 그냥 영화예매화면으로 돌아가게함
</script>
<%	
		} else {
%>
		<script>
		alert("비밀번호가 일치하지 않습니다!");
		history.back();
		</script>
<%
		} // password 확인 if문 종료
		
	} else {
%>
<script>
	alert("아이디가 존재하지 않습니다!");
	history.back();
</script>
<%
	} // id 확인 if문 종료
}catch (Exception e) {
%>
<script>
	alert("영화 예매가 완료되지 않았습니다!");
	history.back();
</script>
<%
} finally {
	try {
		if (conn != null) conn.close();
		if (stmt != null) stmt.close();
		if (ps != null) ps.close();
		if (rs != null) rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>