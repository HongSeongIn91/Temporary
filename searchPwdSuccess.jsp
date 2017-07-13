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
${tempMember.m_id }님, 가입하실 때 입력하신 이메일 ${tempMember.m_email }로 임시 비밀번호를 보내드렸습니다. <br>
	비밀번호: ${tempMember.m_pw }
</p>
<a href="login.do">[로그인하기]</a>
<a href="searchId.do">[아이디 찾기]</a>

	

		</section>
		</article>

		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>