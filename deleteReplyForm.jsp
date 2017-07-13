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
<title>댓글 삭제</title>
</head>
<body>
	<div id="wrapper">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
			<section>

				<form action="deleteReply.do" method="post">
					댓글을 삭제하시겠습니까?
					<p>
						댓글 번호 <input type="text" name="rp_num" value="${rp_num}"><br>
						감상평 번호 <input type="text" name="rp_rv_num" value="${rp_rv_num }"><br>
						댓글 페이지 번호 <input type="text" name="replyPageNo"
							value="${replyPageNo}"><br>
					<p>
						<input type="submit" value="삭제">
				</form>

			</section>
		</article>

		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>