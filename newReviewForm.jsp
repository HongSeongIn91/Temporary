<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script language='javascript'>
function noEvent() {
if (event.keyCode == 116) {
event.keyCode= 2;
return false;
}
else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
{
return false;
}
}
document.onkeydown = noEvent;
</script>

<title>게시글 쓰기</title>
</head>
<body>
	<form action="write.do" method="post">
		<p>
			제목:<br /> <input type="text" name="title" value="${param.rv_title}">
			<c:if test="${errors.rv_title}">제목을 입력하세요.</c:if>
		</p>
		<p>영화를 선택하세요
			<select name="mv_num">
				<c:forEach var="movie" items="${moviePage.content}">
					<option value="${movie.mv_num }">${movie.mv_title }</option>
				</c:forEach>
			</select><p>
		</p>

			<!-- 		<select name=movie_select>
			<option selected value="#">Cginjs.Com 메뉴</option>
			<option value="1">C.n.J CGI</option>
			<option value="2">C.n.J 자바스크립트</option>
			<option value="3">구글</option>
			<option value="4">네이버</option>
		</select>  -->
		<p>
			내용:<br />
			<textarea name="content" rows="5" cols="30">${param.rv_content}</textarea>
		</p>
		<input type="submit" value="새 글 등록">
	</form>
</body>
</html>