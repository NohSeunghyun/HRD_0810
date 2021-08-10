<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 관리 프로그램</title>
</head>
<body>
<%@ include file="header.jsp" %> <!-- 바디 시작 위치에 헤더 불러오기 -->
	<section>
		<div>
			<h2>권한 관리 프로그램</h2>
		</div>
		<p>국제학교 포탈에서 사용자 정보, 권한정보 데이터베이스를 구축하고 권한관리 프로그램을 작성하는 프로그램이다.</p>
		<p>프로그램 작성 순서</p>
		<ol>
			<li>사용자정보 테이블을 생성한다.</li>
			<li>부서별권한정보 테이블을 생성한다.</li>
			<li>사용자별권한정보 테이블을 생성한다.</li>
			<li>사용자정보, 부서별권한정보, 사용자별권한정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.</li>
			<li>사용자정보 입력 화면 프로그램을 작성한다.</li>
			<li>사용자정보 조회/수정 프로그램을 작성한다.</li>
			<li>권한 정보 조회 프로그램을 작성한다.</li>
		</ol>
	</section>
<%@ include file="footer.jsp" %> <!-- 바디 종료 위치에 푸터 불러오기 -->
</body>
</html>