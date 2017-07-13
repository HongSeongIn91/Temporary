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
<title>회원정보변경</title>

<script language="javascript">
	function sub() {

		a = document.change.email1.value;
		b = document.change.email2.value;
		c = a + "@" + b;

		document.change.newEmail.value = c;

		d = document.change.phone1.value;
		e = document.change.phone2.value;
		f = document.change.phone3.value;
		g = d + "-" + e + "-" + f;

		document.change.newPhone.value = g;

		return true;
	}
</script>

</head>
<body>
	<div id="wrapper">
		<header> <jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
		<section>
		<form action="change.do" name="change" method="post" onsubmit="sub()">
			<p>아이디: ${authUser.id}</p>

			<p>
				새 비밀번호:<br /> <input type="password" name="newPwd">
				<c:if test="${errors.newPwd}"> 새 비밀번호를 입력하세요.</c:if>
				<c:if test="${errors.badNewPwd }">기존 비밀번호와 일치합니다. 새로 만들어주세요.</c:if>
			</p>

			<p>
				새 비밀번호 확인:<br /> <input type="password" name="confirmPassword">
				<c:if test="${errors.confirmPassword}"> 새 비밀번호를 입력하세요.</c:if>
			</p>

			<p>
				새 이메일:<br /> <input type="text" name="newEmail"
					value="${authUser.email }">
			</p>

			<p>
				새 핸드폰번호:<br /> <input type="text" name="newPhone"
					value="${authUser.phone }">

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