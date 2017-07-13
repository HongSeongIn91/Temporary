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
<title>게시글 수정 완료</title>
</head>
<body>
	<div id="wrapper">
		<header> <jsp:include page="header.jsp"></jsp:include>
		</header>
		<article> <section> 게시글을 수정했습니다. <br>
		<a href="${pageContext.request.contextPath}/reviewlist.do">[무비로그
			목록보기]</a> 



		</section> </article>

		<footer> <jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>