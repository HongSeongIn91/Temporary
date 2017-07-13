<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색된 게시글 읽기</title>
</head>
<body>

<table border="1" width="100%">

<tr>
	<td>번호</td>
	<td>${searchReviewData.review.rv_num }</td>
</tr>


<tr>
	<td>제목</td>
	<td><c:out value="${searchReviewData.review.rv_title }"></c:out></td>
</tr>
<tr>
	<td>작성자</td>
	<td><c:out value="${searchReviewData.review.rv_m_id }"></c:out></td>
</tr>

<tr>
	<td>조회수</td>
	<td><c:out value="${searchReviewData.review.rv_readcnt }"></c:out></td>
</tr>
<tr>
	<td>작성일</td>
	
	<td>
	<fmt:formatDate value="${searchReviewData.review.rv_regdate }" pattern="yyyy/MM/dd hh:mm:ss" /></td>
</tr>

<tr>
	<td>본영화</td>
	<td><c:out value="${searchReviewData.review.rv_mv_num }"></c:out></td>
</tr>

<tr>
	<td>본영화제목</td>
	<td><c:out value="${searchReviewData.review.movie.mv_title }"></c:out></td>
</tr>
<tr>
	<td>내용</td>
	<td><u:pre value='${searchReviewData.content }'/></td>
</tr>

<tr>
	<td colspan="2">
	<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"></c:set>
		<a href="search.do?pageNo=${pageNo }&keyField=${keyField}&keyWord=${keyWord}&reviewSort=${reviewSort}">[목록]</a>
		<c:if test="${authUser.id == searchReviewData.review.rv_m_id }">
			<a href="modify.do?no=${searchReviewData.review.rv_num }&pageNo=${pageNo }">[게시글 수정]</a>
			<a href="delete.do?no=${searchReviewData.review.rv_num }&pageNo=${pageNo }">[게시글 삭제]</a>
		</c:if>
	</td>
</tr>
</table>

</body>
</html>