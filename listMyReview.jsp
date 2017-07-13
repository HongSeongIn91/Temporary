<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가 쓴 무비로그</title>
</head>
<body>
<a href="../index.jsp">[메인페이지로 돌아가기]</a>

<%-- <form action="list.do" method="get">
	<select name="reviewSort">
		<option value="rv_num"
			<c:if test="${reviewSort eq 'rv_num'}">selected="selected"</c:if>>최근등록순</option>
		<option value="rv_readcnt"
			<c:if test="${reviewSort eq 'rv_readcnt'}">selected="selected"</c:if>>최다조회순</option>
	</select> <input type="submit" value="GO" />
</form>
<hr> --%>
	
<table border="1">
	
	<tr>
		<td>게시글목록번호</td>
		<td>리뷰글번호</td>
		<td>영화제목</td>
		<td>제목</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
<c:if test="${reviewPage.hasNoReviews() }">
	<tr>
		<td colspan="4">게시글이 없습니다.</td>
	</tr>
</c:if>
<c:forEach var="review" items="${reviewPage.content }">
	<tr>
		<td>${startNum}</td>
		<td>${review.rv_num }</td>
		<td>${review.movie.mv_title }</td>
		<td>
			<a href="read.do?rv_num=${review.rv_num }&pageNo=${reviewPage.currentPage}">
				<c:out value="${review.rv_title }"></c:out>
			</a>
		</td>
		<td><fmt:formatDate value="${review.rv_regdate }" pattern="yyyy/MM/dd" /></td>
		<td>${review.rv_readcnt }</td>
	</tr>
	<c:set var="startNum" value="${startNum-1}" />
</c:forEach>
<c:if test="${reviewPage.hasReviews() }">
	<tr>
		<td colspan="6">
			<c:if test="${reviewPage.startPage > 5 }">
			<a href="list.do?pageNo=${reviewPage.startPage - 5 }">[이전]</a>
			</c:if>
			<c:forEach var="pNo"
					begin="${reviewPage.startPage }"
					end="${reviewPage.endPage }">
				<a href="list.do?pageNo=${pNo }">[${pNo }]</a>
			</c:forEach>
			<c:if test="${reviewPage.endPage < reviewPage.totalPages }">
				<a href="list.do?pageNo=${reviewPage.startPage + 5 }">[다음]</a>
			</c:if>
		</td>
	</tr>
</c:if>
</table>
</body>
</html>