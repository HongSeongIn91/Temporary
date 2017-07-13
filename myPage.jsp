<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/NewBasic.css">
<link rel="stylesheet" href="css/global.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script src="js/slides.min.jquery.js"></script>
<title>마이페이지</title>
</head>
<body>
	<div id="wrapper">
		<header> <jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
		</header>
		<article> 
			<section class="right"><!--  class="right" 왼쪽에 기본으로 붙는 메뉴 -->
				<h3>[내가 쓴 글 보기]</h3>
				<ul>
					<li><a href="myReviewlist.do">[내 무비로그]</a></li>
					<li><a href="myPreviewlist.do">[내 기대평]</a></li>
					<li><a href="myReplylist.do">[내 댓글]</a></li>
				</ul>

				<h3>
					<a href="check.do">[회원정보 수정]</a>
				</h3>
				<br />
				<h3>
					<a href="goodbye.do">[회원탈퇴]</a>
				</h3>


		</section>
		</article>

		<footer>
			<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>