<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴 페이지</title>
</head>
<body>
회원탈퇴를 어쩌고ㄴ;ㅇ럼;ㄴ엎;나엎;ㅣㄴ마엎

<form action="goodbye.do" method="post">

<p>
	아이디: ${authUser.id}
</p>

<p>
	비밀번호:<br/><input type="password" name="m_pw">
	<c:if test="${errors.m_pw}"> 비밀번호를 입력하세요.</c:if>
	<c:if test="${errors.PwNotMatch}"> 비밀번호가 일치하지 않습니다.</c:if>
</p>

	
<input type="submit" value="확인">
</form>
</body>
</html>