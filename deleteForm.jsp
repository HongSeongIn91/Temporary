<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</body>
</html>