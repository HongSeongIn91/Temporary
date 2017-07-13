<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/NewBasic.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script src="js/slides.min.jquery.js"></script>

<title>로그인</title>
</head>
<body>



				<div id="wrapper">
					<header>
						<jsp:include page="header.jsp"></jsp:include>
					</header>
					<article>
						<section>

							<form action="login.do" method="post">
								<c:if test="${errors.idOrPwNotMatch}">
아이디와 비밀번호가 일치하지 않습니다.
</c:if>
								<p>
									아이디:<br /> <input type="text" name="m_id"
										value="${param.m_id}">
									<c:if test="${errors.m_id}">ID를 입력하세요.</c:if>
								</p>
								<p>
									비밀번호:<br /> <input type="password" name="m_pw">
									<c:if test="${errors.m_pw}">비밀번호를 입력하세요.</c:if>
								</p>
								<input type="submit" value="로그인">
							</form>
							<p>
								<a href="searchId.do">[아이디 찾기]</a> <a href="searchPw.do">[비밀번호
									찾기]</a> <a href="join.do">회원가입</a>
							<p>
						</section>
					</article>

					<footer>
						<jsp:include page="footer.jsp"></jsp:include>
					</footer>
				</div>

</body>
</html>