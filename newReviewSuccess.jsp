<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 등록 완료</title>
</head>
<body>
<header>
<a href="http://localhost:8181/board/index.jsp"><img src="/images/Tulips.jpg"></a>
</header>
게시글을 등록했습니다. 
<br>
<%-- ${ctxPath = pageContext.request.contextPath ; } --%>
<a href="${pageContext.request.contextPath}/review/list.do">[무비로그 목록보기]</a>
<%-- <a href="${pageContext.request.contextPath}/review/read.do?no=${newRv_num}&mno=${review.rv_mv_num}">[게시글 내용보기]</a> --%>
</body>
</html>