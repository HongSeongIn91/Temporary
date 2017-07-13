<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<a href="http://localhost:8383/C201702/index.jsp"><img src="images/logo3.png" class="logo-img">
			</a>
			<!-- 			로그인한 경우 -->

			<c:if test="${!empty authUser}">
				<div class="commonGo">
					<div id="id">${authUser.id}님, 안녕하세요.</div>
					<div class="logout go">
						<a href="logout.do">[로그아웃하기]</a>
					</div>

					<!-- 영화정보 게시판으로 연결될 영화 버튼 만들기 -->
					<!-- 메인페이지로 연결될 로고 버튼 만들기 -->
					<!-- 마이페이지로 연결될 마이페이지 버튼 만들기 -->
				</div>
			</c:if>

			<!-- 로그인하지않은 경우  -->
			<c:if test="${empty authUser}">

				<div class="commonGo">
					<div class="join go">
						<a href="join.do">회원가입</a>
					</div>
					<div class="login go">
						<a href="login.do">로그인</a>
					</div>
				</div>
				<!-- 로그인 하지 않았을 경우 접근이 불가하므로, alert로 '로그인이 필요한 서비스입니다' 띄우기. -->
				<!-- web.xml 매핑 -->

			</c:if>
			<div class="QuickMenu">
				<div class="movie menu">
					<a href="movielist.do">영화</a>
				</div>
				<div class="review menu">
					<a href="reviewlist.do">무비로그</a>
				</div>
				<div class="myPage menu">
					<a href="myPage.jsp">마이페이지</a>
				</div>
			</div>
</body>
</html>