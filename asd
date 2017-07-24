<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="util.Token"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/NewBasic.css">
<link rel="stylesheet" href="css/writeReview.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script src="js/slides.min.jquery.js"></script>
<script language='javascript'>
	function noEvent() {
		if (event.keyCode == 116) {
			event.keyCode = 2;
			return false;
		} else if (event.ctrlKey
				&& (event.keyCode == 78 || event.keyCode == 82)) {
			return false;
		}
	}

	function writeCheck(frm) {
		var titleblank = frm.title.value;
		var contentblank = frm.content.value;
		if ($.trim(titleblank) == "") {
			alert("제목을 입력하세요.");
			$('#titletext').val('');
			frm.title.focus();
			return;
		}

		if ($.trim(contentblank) == "") {
			alert("내용을 입력하세요.");
			$('#contenttext').val('');
			frm.content.focus();
			return;
		}
		frm.submit();
	}
</script>
<title>게시글 쓰기</title>
</head>
<body>
	<%
		if (request.getAttribute("TOKEN_KEY") == null)
			Token.set(request);
	%>
	<div id="wrapper">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
			<section>
				<form action="reviewwrite.do" method="post">
					<div class="diary-register-wrap">
						<div class="sect-diary-register">
							<h4 class="hidden">무비로그 작성</h4>
							<div class="article-any-movie">
								<!-- <em>어떤 영화를 보셨나요?</em> -->
							<label for="movie">영화선택</label> <select name="mv_num">
									<c:forEach var="movie" items="${moviePage.content}">
										<option value="${movie.mv_num }">${movie.mv_title }</option>
									</c:forEach>
								</select>
							</div>
							<!-- 제목을 입력하세요 -->
							<div class="article-subject">
								<label for="subject">제목 기입</label> <input type="text"
									id="titletext" name="title" placeholder="제목을 입력하세요"
									maxlength="60" value="${param.rv_title}">
								<c:if test="${errors.rv_title}">제목을 입력하세요.</c:if>
							</div>
							<!-- 영화 어떻게 보셨나요? -->
							<div class="article-how-see">
								<label for="textContent">영화 감상평</label>
								<textarea name="content" id="contenttext" rows="45" cols="55"
									placeholder="영화 어떻게 보셨나요?">${param.rv_content}</textarea>
							</div>
							<div class="article-info-select">
								<div class="set-btn">
									<!-- <button type="reset" class="round gray on" id="btn-write_cancle">
										<span>취소</span>
									</button> -->
									<input type="hidden" name="TOKEN_KEY"
										value="<%=request.getAttribute("TOKEN_KEY")%>" /> <input
										type="submit" class="round red on" value="등록"
										onclick="writeCheck(form)">
									<!-- <span>등록</span> -->
								</div>
							</div>
						</div>
					</div>
				</form>
			</section>
		</article>

		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>
