<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/NewBasic.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script src="js/slides.min.jquery.js"></script>
<title>게시글 삭제</title>
<!-- <script type="text/javascript">
function button_event() {
	if(confirm("정말 삭제하시겠습니까?")==true){
		document.form.submit();
	}else{
		return;
	}
}
</script>
 --></head>
<body>
<div id="wrapper">
		<header> <jsp:include page="header.jsp"></jsp:include>
		</header>
		<article>
		<section>


<form action="delete.do" method="post">
게시글을 삭제하시겠습니까?
<input type="hidden"  name="rv_num" value="${rv_num}">
<%-- <input type="hidden"  name="mv_num" value="${mno}"> --%>
<p>
<!-- <input type="submit" value="삭제" onclick="button_event()">
 -->
  <input type="submit" value="삭제" >
취소도하고싶어 
</form>
	</section>
		</article>

		<footer>
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>