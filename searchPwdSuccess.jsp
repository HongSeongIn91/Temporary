<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
${tempMember.m_id }님, 가입하실 때 입력하신 이메일 ${tempMember.m_email }로 임시 비밀번호를 보내드렸습니다. <br>
	비밀번호: ${tempMember.m_pw }
</p>
<a href="login.do">[로그인하기]</a>
<a href="searchId.do">[아이디 찾기]</a>
</body>
</html>