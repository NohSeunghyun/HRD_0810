<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 시작위치에 db연결해야함 -->
<%@ include file="dbconn.jsp"%>

<%
	try {
		sql = "insert into user_tbl_08 values (?, ?, ?, ?, ?, ?)";
		
		ps = conn.prepareStatement(sql);
		
		ps.setString(1, request.getParameter("user_no"));
		ps.setString(2, request.getParameter("user_name"));
		ps.setString(3, request.getParameter("user_pw1"));
		ps.setString(4, request.getParameter("dept_no"));
		ps.setString(5, request.getParameter("user_gbn"));
		ps.setString(6, request.getParameter("reg_date"));
		
		ps.executeUpdate();
%>
<script>
	alert("수강생 등록 완료되었습니다!")
	location = "insert.jsp"; // 문제에 등록완료시 이동할 위치가 안정해져있으므로 다시 등록화면으로
</script>
<%
} catch (Exception e) {
%>
<script>
	alert("수강생 등록 실패하였습니다!")
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