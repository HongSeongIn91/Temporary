<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/NewBasic.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script src="js/slides.min.jquery.js"></script>

<script>
	function searchCheck(frm) {
		//검색

		if (frm.keyWord.value == "") {
			alert("검색 단어를 입력하세요.");
			frm.keyWord.focus();
			return;
		}
		frm.submit();
	}
</script>

<title>검색결과목록</title>
</head>
<body>
<div id="wrapper">
		<header> <jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
		<section>


	<form action="reviewsearch.do" method="get">
	<input type="hidden" name="keyField" value="${keyField}">
	<input type="hidden" name="keyWord" value="${keyWord}">
		<select name="reviewSort">
				<option value="rv_num"
				<c:if test="${reviewSort eq 'rv_num'}">selected="selected"</c:if>>최근등록순</option>
			<option value="rv_readcnt"
				<c:if test="${reviewSort eq 'rv_readcnt'}">selected="selected"</c:if>>최다조회순</option>
		</select> <input type="submit" value="GO" />
	</form>
	<table border="1">
		<tr>
			<td colspan="8"><a href="reviewwrite.do?no=1">[게시글 쓰기]</a></td>
		</tr>
		<tr>
			<td>게시글목록번호</td>
			<td>리뷰글번호</td>
			<td>영화제목</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<c:if test="${searchPage.hasNoReviews() }">
			<tr>
				<td colspan="8">게시글이 없습니다.</td>
			</tr>
		</c:if>


		<c:forEach var="review" items="${searchPage.content }">
			<tr>
				<td>${startNum}</td>
				<td>${review.rv_num }</td>
				<td>${review.movie.mv_title }</td>
				<td>
					<a href="reviewsearchRead.do?no=${review.rv_num }&pageNo=${searchPage.currentPage}&keyField=${keyField}&keyWord=${keyWord}&reviewSort=${reviewSort}<%-- &mno=${article.rv_mv_num} --%>">
						<c:out value="${review.rv_title }"></c:out>
					</a>
				</td>
				<td>${review.rv_m_id}</td>
				<td><fmt:formatDate value="${review.rv_regdate }"
						pattern="yyyy/MM/dd" /></td>
				<td>${review.rv_readcnt }</td>
			</tr>

			<c:set var="startNum" value="${startNum-1}" />
		</c:forEach>
		<c:if test="${searchPage.hasReviews() }">
			<tr>
				<td colspan="8"><c:if test="${searchPage.startPage > 5 }">
						<a href="reviewsearch.do?pageNo=${searchPage.startPage - 5 }&keyField=${keyField}&keyWord=${keyWord}&reviewSort=${reviewSort}">[이전]</a>
					</c:if> <c:forEach var="pNo" begin="${searchPage.startPage }"
						end="${searchPage.endPage }">
						<a href="reviewsearch.do?pageNo=${pNo}&keyField=${keyField}&keyWord=${keyWord}&reviewSort=${reviewSort}">[${pNo }]</a>
					</c:forEach> <c:if test="${searchPage.endPage < searchPage.totalPages }">
						<a href="reviewsearch.do?pageNo=${searchPage.startPage + 5 }&keyField=${keyField}&keyWord=${keyWord}&reviewSort=${reviewSort}">[다음]</a>
					</c:if>
				</td>
			</tr>
		</c:if>

		<tr>
			<td colspan="8" align="center"><br />
				<form action="reviewsearch.do">
					<input type="hidden" name="reviewSort" value="${reviewSort}">
	
					<select name="keyField" <%-- value="${param.keyField}" --%>>
						<option value="total" <c:if test="${keyField eq 'total'}">selected="selected"</c:if>>감상평제목+내용</option>
						<option value="mv_title" <c:if test="${keyField eq 'mv_title'}">selected="selected"</c:if>>영화제목</option>
						<option value="rv_title" <c:if test="${keyField eq 'rv_title'}">selected="selected"</c:if>>게시글제목</option>
						<option value="rv_m_id" <c:if test="${keyField eq 'rv_m_id'}">selected="selected"</c:if>>작성자(아이디)</option>
					</select> <input type="text" name="keyWord"  value="${param.keyWord}"/>
					 <input type="button" value="검색" onclick="searchCheck(form)" />

				</form>
			</td>
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