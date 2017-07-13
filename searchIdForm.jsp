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

<script language="javascript">
	function sub() {

		a = document.search.email1.value;
		b = document.search.email2.value;
		c = a + "@" + b;

		document.search.email.value = c;

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


				<form action="searchId.do" name="search" method="post"
					onsubmit="sub()">

					<c:if test="${errors.birthOrEmailNotMatch}">
입력하신 정보가 일치하지 않습니다.
</c:if>

					<%-- <p>
	주민등록번호 7자리:<input type="text" name="regnum">
	<c:if test="${errors.regnum }">주민등록번호 7자리를 입력하세요.</c:if>
	
</p> --%>
					<p>
						<input type="text" name="birth" placeholder="예시) 19970505"
							size="16" maxlength="8" />
						<c:if test="${errors.birth}"> 생년월일8자리 입력하세요.</c:if>
					</p>

					<%-- <p>
	이메일:<input type="text" name="email">
	<c:if test="${errors.email }">이메일을 입력하세요.</c:if>
	
</p> --%>

					<p>
						이메일:<input type="hidden" name="email" /> <input type="text"
							name="email1" id="str_email01" size="16" maxlength="20" /> <span>@</span>
						<input type="text" name="email2" id="str_email02" disabled
							value="gmail.com" size="10" /> <select name="selectEmail"
							id="selectEmail">
							<option value="1">직접입력</option>
							<option value="gmail.com" selected>gamil.com</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
						</select>
						<script type="text/javascript"
							src="http://code.jquery.com/jquery-latest.min.js"></script>
						<script type="text/javascript">
							$('#selectEmail')
									.change(
											function() {
												$(
														"#selectEmail option:selected")
														.each(
																function() {

																	if ($(this)
																			.val() == '1') {
																		$(
																				"#str_email02")
																				.val(
																						'');
																		$(
																				"#str_email02")
																				.attr(
																						"disabled",
																						false);
																	} else {
																		$(
																				"#str_email02")
																				.val(
																						$(
																								this)
																								.text());
																		$(
																				"#str_email02")
																				.attr(
																						"disabled",
																						true);
																	}
																});
											});
						</script>
						<c:if test="${errors.email}"> 이메일 입력하세요.</c:if>
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