<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기대평 수정</title>
</head>
<body>

<form action="modifyPreview.do" method="post">
			<p>
			<div>
			기대평 수정 <br>
			<textarea rows="5" cols="30" name="content">${param.pre_content}</textarea>
			<input type="hidden" name="pre_num" value="${pre_num}"> <br>
			<input type="hidden" name="mv_num" value="${mv_num }"><br>
			<input type="hidden" name="prePageNo" value="${prePageNo}"><br>
			
			</div>
			<p>
			<input type="submit" value="등록">
			<input type="reset" value="취소">
	</form>
	
</body>
</html>