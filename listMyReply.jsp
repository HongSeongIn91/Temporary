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
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
			<section>


				<table border="1">

					<tr>
						<td>댓글번호</td>
						<td>원글번호</td>
						<td>내용</td>
						<td>작성자</td>

					</tr>
					<c:if test="${replyPage.hasNoReplies() }">
						<tr>
							<td colspan="4">게시글이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="reply" items="${replyPage.content}">
						<tr>
							<td>${reply.rp_num }</td>
							<td>${reply.rp_rv_num }</td>
							<td>${reply.rp_content }</td>
							<td>${reply.rp_m_id }</td>

						</tr>
					</c:forEach>
					<c:if test="${replyPage.hasReplies() }">
						<tr>
							<td colspan="4"><c:if test="${replyPage.startPage > 5 }">
									<a href="myReplylist.do?pageNo=${replyPage.startPage - 5 }">[이전]</a>
								</c:if> <c:forEach var="pNo" begin="${replyPage.startPage }"
									end="${replyPage.endPage }">
									<a href="myReplylist.do?pageNo=${pNo }">[${pNo }]</a>
								</c:forEach> <c:if test="${replyPage.endPage < replyPage.totalPages }">
									<a href="myReplylist.do?pageNo=${replyPage.startPage + 5 }">[다음]</a>
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