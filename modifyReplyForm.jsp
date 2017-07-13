<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/NewBasic.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script src="js/slides.min.jquery.js"></script>
<title>댓글 수정</title>
</head>
<body>
	<div id="wrapper">
		<header> <jsp:include page="header.jsp"></jsp:include>
		</header>
		<article> <section> <!-- 댓글 수정 입력 폼 -->
		<form action="reviewmodifyReply.do" method="post">
			<p>
			<div>
				댓글 수정 <br>
				<textarea rows="5" cols="30" name="content">${param.rp_content}</textarea>
				<input type="hidden" name="rp_num" value="${rp_num}"> <br>
				<input type="hidden" name="rp_rv_num" value="${rp_rv_num }"><br>
				<input type="hidden" name="replyPageNo" value="${replyPageNo}"><br>

			</div>
			<p>
				<input type="submit" value="등록"> <input type="reset"
					value="취소">
		</form>
		</section> </article>

		<footer> <jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>