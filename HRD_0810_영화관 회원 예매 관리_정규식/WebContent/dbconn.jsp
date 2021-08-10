<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*"%> <!-- java.sql의 모든클래스 가져오기 -->

<%
request.setCharacterEncoding("UTF-8"); // 한글깨짐방지
Class.forName("oracle.jdbc.OracleDriver"); // 오라클 드라이버 로딩
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234"); // Connection 객체 생성

Statement stmt = conn.createStatement(); // select문 실행할 객체
PreparedStatement ps = null; // update, insert, delete문 실행할 객체

ResultSet rs = null; // 결과를 담을 객체
String sql = ""; // sql문을 담을 객체
%>