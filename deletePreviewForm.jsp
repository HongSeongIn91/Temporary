<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="deletePreview.do" method="post">
		기대평을 삭제하시겠습니까?
		<p>
			<input type="hidden" name="pre_num" value="${pre_num}"> <br>
			<input type="hidden" name="mv_num" value="${mv_num }"><br>
			<input type="hidden" name="prePageNo" value="${prePageNo}"><br>
		<p>
			<input type="submit" value="삭제">
	</form>
	
</body>
</html>