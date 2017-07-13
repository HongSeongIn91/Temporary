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
<title>게시글 수정</title>
</head>
<body>
	<div id="wrapper">
		<header> <jsp:include page="header.jsp"></jsp:include>
		</header>
		<article> <section>



				<form action="reviewmodify.do" method="post">
					<p>
						번호:<br />${modReq.rv_num} <input type="hidden" name="rv_num"
							value="${modReq.rv_num}">
					</p>
					<p>
						제목:<br /> <input type="text" name="title" value="${modReq.title}">
						<c:if test="${errors.title}">제목을 입력하세요.</c:if>
					</p>
					<p>
						내용:<br />
						<textarea rows="5" cols="30" name="content">${modReq.content}</textarea>
					</p>
					<input type="submit" value="글 수정">
				</form>
			</section> </article>

		<footer> <jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>