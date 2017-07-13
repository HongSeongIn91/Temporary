<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<header> <jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
		<section>


<p>
	아이디: ${member.m_id }
</p>
<a href="login.do">[로그인하기]</a>
<a href="searchPw.do">[비밀번호 찾기]</a>
	

		</section>
		</article>

		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>