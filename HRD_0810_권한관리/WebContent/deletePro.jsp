<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 시작점에 DB와 연결 해야함 -->
<%@ include file = "dbconn.jsp"%>

<%
	try {
		sql = "delete from user_tbl_08 where user_no = ?";
		
		ps = conn.prepareStatement(sql);
		
		ps.setString(1, request.getParameter("user_no"));
		
		ps.executeUpdate();
%>
<script>
	alert("수강생 삭제 완료되었습니다!")
	location = "select.jsp"; // 문제에 등록완료시 이동할 위치가 안정해져있으므로 다시 등록화면으로
</script>
<%
} catch (Exception e) {
%>
<script>
	alert("수강생 삭제 실패하였습니다!")
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