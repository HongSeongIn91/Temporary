<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>전체영화목록</h1>
<a href="list.do">[영화목록]</a>
	<a href="relafter.do">[현재상영작]</a>
	<a href="relbefore.do">[개봉예정작]</a>
	<a href="../index.jsp">[메인페이지로 돌아가기]</a>
<hr>

	<form action="list.do" method="get" name="frm">
		<select name="movieSort">
			<option value="mv_readcnt" <c:if test="${movieSort eq 'mv_readcnt'}">selected="selected"</c:if>>조회순</option>
			<option value="mv_reldate" <c:if test="${movieSort eq 'mv_reldate'}">selected="selected"</c:if>>개봉일순</option>
		
			<!--<option value="mv_reply ">기대평많은순</option> -->

		</select> <input type="submit" value="GO" />
	</form>
<br>
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
				<td><a href="read.do?mv_num=${movie.mv_num }&pageNo=${moviePage.currentPage}">
						<img src="${movie.mv_poster}" width=200 height=300>
				</a></td>
				<td><fmt:formatDate value="${movie.mv_reldate }"
						pattern="yyyy/MM/dd" /></td>
				<td>${movie.mv_readcnt }</td>
			</tr>
		</c:forEach>
		<c:if test="${moviePage.hasMovies() }">
			<tr>
				<td colspan="4"><c:if test="${moviePage.startPage > 5 }">
						<a href="list.do?pageNo=${moviePage.startPage - 5 }">[이전]</a>
					</c:if> <c:forEach var="pNo" begin="${moviePage.startPage }"
						end="${moviePage.endPage }">
						<a href="list.do?pageNo=${pNo }&movieSort=${movieSort}">[${pNo }]</a>
					</c:forEach> <c:if test="${moviePage.endPage < moviePage.totalPages }">
						<a href="list.do?pageNo=${moviePage.startPage + 5 }">[다음]</a>
					</c:if></td>
			</tr>
		</c:if>
	</table>
</body>
</html>