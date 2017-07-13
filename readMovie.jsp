<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html >
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


				<table border="1" width="100%">
				<%-- 	<tr>
						<td>번호</td>
						<td>${movieData.movie.mv_title }</td>
					</tr> --%>

					<tr>
						<td>제목</td>
						<td><c:out value="${movieData.movie.mv_title }"></c:out></td>
					</tr>
					<tr>
						<td>포스터</td>
						<td><img src="${movieData.movie.mv_poster }" width=200
							height=300 /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><u:pre value='${movieData.movie.mv_summary}' /></td>
					</tr>
					<tr>
						<td>개봉일</td>
						<td><u:pre value='${movieData.movie.mv_reldate}' /></td>
					</tr>
					<tr>
						<td>등급</td>
						<td><u:pre value='${movieData.movie.mv_rating}' /></td>
					</tr>
					<tr>
						<td>감독</td>
						<td><u:pre value='${movieData.movie.mv_director}' /></td>
					</tr>

					<tr>
						<td>배우</td>
						<td><u:pre value='${movieData.movie.mv_actor}' /></td>
					</tr>
					
				</table>

			</section>
		</article>

		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>