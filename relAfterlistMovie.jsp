<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				
				<h1>[현재상영작]</h1>

				<a href="movielist.do">[영화목록]</a> <a href="movierelafter.do">[현재상영작]</a> <a
					href="movierelbefore.do">[개봉예정작]</a> 
				

				<br>
				<hr>
				<table border="1">

					<tr>
						<td>제목</td>
						<td>이미지</td>
						<td>개봉일</td>
						<td>조회수</td>
					</tr>
					<c:if test="${moviePage.hasNoMovies() }">
						<tr>
							<td colspan="3">게시글이 없습니다.</td>
						</tr>
					</c:if>


					<c:forEach var="movie" items="${moviePage.content }">
						<tr>
							<td>${movie.mv_title }</td>
							<td><a
								href="movieread.do?mv_num=${movie.mv_num }&pageNo=${moviePage.currentPage}&movieSort=${movieSort}">
									<img src="${movie.mv_poster}" width=200 height=300>
							</a></td>
							<td><fmt:formatDate value="${movie.mv_reldate }" pattern="yyyy/MM/dd" /></td>
							<td>${movie.mv_readcnt }</td>
						</tr>
					</c:forEach>
					<c:if test="${moviePage.hasMovies() }">
						<tr>
							<td colspan="4"><c:if test="${moviePage.startPage > 5 }">
									<a href="movierelafter.do?pageNo=${moviePage.startPage - 5 }&movieSort=${movieSort}">[이전]</a>
								</c:if> <c:forEach var="pNo" begin="${moviePage.startPage }"
									end="${moviePage.endPage }">
									<a href="movierelafter.do?pageNo=${pNo }&movieSort=${movieSort}">[${pNo }]</a>
								</c:forEach> <c:if test="${moviePage.endPage < moviePage.totalPages }">
									<a href="movierelafter.do?pageNo=${moviePage.startPage + 5 }&movieSort=${movieSort}">[다음]</a>
								</c:if></td>
						</tr>
					</c:if>
				</table>
			</section>
		</article>

		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>