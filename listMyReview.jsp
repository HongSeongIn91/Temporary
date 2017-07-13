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
		<header> <jsp:include page="header.jsp"></jsp:include>
		</header>
		<article> <section>

		<table border="1">

			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>조회수</td>
			</tr>
			<c:if test="${reviewPage.hasNoReviews() }">
				<tr>
					<td colspan="4">게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="review" items="${reviewPage.content }">
				<tr>
					<td>${review.rv_num }</td>
					<td><a
						href="myReviewread.do?rv_num=${review.rv_num }&pageNo=${reviewPage.currentPage}">
							<c:out value="${review.rv_title }"></c:out>
					</a></td>
					<td>${review.rv_m_id }</td>
					<td>${review.rv_readcnt }</td>
				</tr>
			</c:forEach>
			<c:if test="${reviewPage.hasReviews() }">
				<tr>
					<td colspan="4"><c:if test="${reviewPage.startPage > 5 }">
							<a href="myReviewlist.do?pageNo=${reviewPage.startPage - 5 }">[이전]</a>
						</c:if> <c:forEach var="pNo" begin="${reviewPage.startPage }"
							end="${reviewPage.endPage }">
							<a href="myReviewlist.do?pageNo=${pNo }">[${pNo }]</a>
						</c:forEach> <c:if test="${reviewPage.endPage < reviewPage.totalPages }">
							<a href="myReviewlist.do?pageNo=${reviewPage.startPage + 5 }">[다음]</a>
						</c:if></td>
				</tr>
			</c:if>
		</table>


		</section> </article>

		<footer> <jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>