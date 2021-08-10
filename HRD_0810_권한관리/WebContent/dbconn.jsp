<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*"%> <!-- 시작점에 java.sql의 모든 클래스를 가져온다 -->

<%
request.setCharacterEncoding("UTF-8"); // 한글 깨짐 방지
Class.forName("oracle.jdbc.OracleDriver"); // 오라클 드라이버 로딩, 클래스쩜포네임 -> 오라클.jdbc.오라클드라이버(앞글자는 대문자)로 외우면 편함
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234"); // conn객체 생성. 연결경로, 사용자, 암호 입력
// 커넥션 변수명 = 드라이버매니저 쩜 겟커넥션 (경로, 사용자, 암호) 경로는 New Oracle 우클릭 정보에서 URL

Statement stmt = conn.createStatement(); // select문 실행 객체
PreparedStatement ps = null; // update, delete, insert문 실행 객체

String sql = ""; // sql문을 담을 객체
ResultSet rs = null; // 결과를 담을 객체
%>