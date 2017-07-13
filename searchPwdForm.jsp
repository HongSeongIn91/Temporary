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
<title>비밀번호 찾기</title>

<script language="javascript">
	function sub() {
		a = document.search.phone1.value;
		b = document.search.phone2.value;
		c = document.search.phone3.value;
		d = a + "-" + b + "-" + c;

		document.search.phone.value = d;

		return true;
	}
</script>

</head>
<body>
	<div id="wrapper">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
			<section>


				<form action="searchPw.do" name="search" method="post"
					onsubmit="sub()">

					<c:if test="${errors.idOrphoneNotMatch}">
입력하신 정보가 일치하지 않습니다.
</c:if>

					<p>
						ID:<input type="text" name="id">
						<c:if test="${errors.id }">ID를 입력하세요.</c:if>

					</p>
					<%-- <p>
	핸드폰 번호:<input type="text" name="phone">
	<c:if test="${errors.phone }">핸드폰번호를 입력하세요.</c:if>
	
</p> --%>
					<p>
						핸드폰 번호:<input type="hidden" name="phone"> <select
							name="phone1">
							<option value="010">010</option>
						</select> - <input type="text" name="phone2" size="1" maxlength="4" /> - <input
							type="text" name="phone3" size="1" maxlength="4" />

						<c:if test="${errors.phone }">핸드폰번호를 입력하세요. </c:if>
					</p>
					<input type="submit" value="확인">

				</form>



			</section>
		</article>

		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>