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
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
			<section>


				<form action="check.do" method="post">
					<p>아이디: ${authUser.id}</p>

					<p>
						비밀번호:<br />
						<input type="password" name="m_pw">
						<c:if test="${errors.m_pw}"> 비밀번호를 입력하세요.</c:if>
						<%-- <c:if test="${errors.?}"> 잘못된 비밀번호입니다.</c:if> --%>
					</p>


					<input type="submit" value="확인">
				</form>

			</section>
		</article>

		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>