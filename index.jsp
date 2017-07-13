<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>

<c:if test="${!empty authUser}">
	${authUser.id}님, 안녕하세요.
	<a href="logout.do">[로그아웃하기]</a>
	<a href="myPage.jsp">[마이페이지]</a>

	<a href="movie/list.do?movieSort=mv_readcnt">[영화]</a>
	<a href="review/list.do?">[무비로그]</a>
	
	<!-- 영화정보 게시판으로 연결될 영화 버튼 만들기 -->
	<!-- 메인페이지로 연결될 로고 버튼 만들기 -->
	<!-- 마이페이지로 연결될 마이페이지 버튼 만들기 -->
</c:if>
<c:if test="${empty authUser}">
	<a href="join.do">[회원가입하기]</a>
	<a href="login.do">[로그인하기]</a>
	
	<!-- 로그인 하지 않았을 경우 접근이 불가하므로, alert로 '로그인이 필요한 서비스입니다' 띄우기. -->
	<!-- web.xml 매핑 -->
	<a href="myPage.jsp">[마이페이지]</a>
	<a href="movie/list.do?movieSort=mv_readcnt">[영화]</a>
	<a href="review/list.do?">[무비로그]</a>
	
</c:if>



<br/>
</body>
</html>