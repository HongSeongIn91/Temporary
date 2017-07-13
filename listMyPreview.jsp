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
						<td>번호</td>
						<td>작성자</td>
						<td>내용</td>
					</tr>
					<c:if test="${previewPage.hasNoPreviews() }">
						<tr>
							<td colspan="4">게시글이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="preview" items="${previewPage.content }">
						<tr>
							<td>${preview.pre_num }</td>
							<td>${preview.pre_m_id }</td>
							<td>${preview.pre_content }</td>
						</tr>
					</c:forEach>
					<c:if test="${previewPage.hasPreviews() }">
						<tr>
							<td colspan="4"><c:if test="${previewPage.startPage > 5 }">
									<a href="myPreviewlist.do?pageNo=${previewPage.startPage - 5 }">[이전]</a>
								</c:if> <c:forEach var="pNo" begin="${previewPage.startPage }"
									end="${previewPage.endPage }">
									<a href="myPreviewlist.do?pageNo=${pNo }">[${pNo }]</a>
								</c:forEach> <c:if test="${previewPage.endPage < previewPage.totalPages }">
									<a href="myPreviewlist.do?pageNo=${previewPage.startPage + 5 }">[다음]</a>
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