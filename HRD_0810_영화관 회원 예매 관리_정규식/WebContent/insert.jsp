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
	// 아이디와 패스워드 값 데이터 정규화 공식
	const regIDPass = /^[a-zA-Z0-9]{4,12}$/;
	//					[a부터zA부터Z0부터9까지 사용]{4자리부터시작 12자리까지}
	
	//이름 정규화 공식
	const regName = /^[가-힣a-zA-Z]{2,}$/;
	//				  [가부터힣a부터zA부터Z까지 사용]{2자리부터 시작 무제한}
	
	//전화번호 정규화 공식
	const regTel = /^\d{3}-\d{3,4}-\d{4}$/;
	//				{앞에 수로 세자리}-{수로 세자리,네자리}-{수로 네자리}
	
	// 아이디 유효성 검사
	if (!f.me_id.value) { // f.me_1d.value == "" 와 같다.
		alert("아이디를 입력해주세요!");
		f.me_id.focus();
		return false;
	} else if (!regIDPass.test(f.me_id.value)) { 
		/*  사용자가 입력한 데이터를 검사하는 test()메서드
		 *  입력한 값이 정규화 데이터를 사용했다면 true를 반환해서 호출된 곳으로 리턴됨
		 */ 
		 alert("아이디는 4~12자의 대소문자와 숫자로만 입력가능합니다!")
		 return f.me_id.select();
	}
	
	// 비밀번호 유요성 검사
	if (!f.me_pass.value) {
		alert("비밀번호를 입력해주세요!");
		return f.me_pass.focus();
	} else if (!regIDPass.test(f.me_pass.value)) {
		alert("비밀번호는 4~12자의 대소문자와 숫자로만 입력가능합니다!")
		return f.me_pass.select();
	}
	
	// 회원 이름 유효성 검사
	if (f.me_name.value == "") {
		alert("이름을 입력해주세요!");
		return f.me_name.focus();
	} else if (!regName.test(f.me_name.value)) { // 이름에 실수로 특수문자가 들어갔을 경우
		alert("이름이 잘못 입력 되었습니다!")
		return f.me_name.select();
	}
	
	if (f.gender[0].checked == false && f.gender[1].checked == false) {
		alert("성별을 체크해주세요!");
		return;
	}
	if (f.birth.value == "") {
		alert("생년월일을 입력해주세요!");
		return f.birth.focus();
	}
	if (f.address.value == "") {
		alert("주소를 입력해주세요!");
		return f.address.focus();
	}
	
	// 전화번호 유효성 검사
	if (f.tel.value == "") {
		alert("전화번호를 입력해주세요!");
		return f.tel.focus();
	} else if (!regTel.test(f.tel.value)) {
		alert("전화번호가 잘못 입력 되었습니다!")
		return f.tel.select();
	}
	f.submit();
}
function rewrite() {
	f.reset();
	f.me_id.focus();
}
</script>
<body>
<%@ include file = "header.jsp" %>
	<section>
		<div>
			<h2>회원등록</h2>
		</div>
		<form action = "insertPro.jsp" name = "f" method = "post">
			<table border = "1" width = "500" style = "margin: 0 auto;">
				<tr width = 100%>
					<th width = 27%>회원아이디</th>
					<td width = 73%>
						<input type = "text" value = "" name = "me_id" size = "20" maxlength = "12" placeholder = "4~12자의 영문 대소문자와 숫자로만 입력">
					</td>
				</tr>
				<tr>
					<th>회원비밀번호</th>
					<td>
						<input type = "password" value = "" name = "me_pass" size = "20" maxlength = "15" placeholder = "4~12자의 영문 대소문자와 숫자로만 입력">
					</td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td>
						<input type = "text" value = "" name = "me_name" size = "20" maxlength = "20">
					</td>
				</tr>
				<tr>
					<th>회원성별</th>
					<td>
						<label><input type = "radio" value = "M" name = "gender">남자</label>
						<label><input type = "radio" value = "F" name = "gender">여자</label>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type = "text" value = "" name = "birth" size = "20" placeholder = "(예)1999-10-10">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type = "text" value = "" name = "address" size = "40" maxlength = "100">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type = "text" value = "" name = "tel" size = "20" maxlength = "13" placeholder = "(예)010-1234-5678">
					</td>
				</tr>
				<tr>
					<th colspan = "2">
						<input type = "submit" value = "회원등록" onclick = "check(); return false">
						<input type = "button" value = "다시쓰기" onclick = "rewrite()">
						<!-- type="reset"으로 해도되나 메서드추가해서 해보도록 -->
					</th>
				</tr>
			</table>
		</form>
	</section>
<%@ include file = "footer.jsp" %>
</body>
</html>