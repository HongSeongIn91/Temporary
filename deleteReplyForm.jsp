<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 삭제</title>
</head>
<body>

<form action="deleteReply.do" method="post">
댓글을 삭제하시겠습니까?<p>
댓글 번호 <input type="text" name="rp_num" value="${rp_num}"><br>
감상평 번호 <input type="text" name="rp_rv_num" value="${rp_rv_num }"><br>
댓글 페이지 번호 <input type="text" name="replyPageNo" value="${replyPageNo}"><br>
<p>
<input type="submit" value="삭제">
</form>

</body>
</html>