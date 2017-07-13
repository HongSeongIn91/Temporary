<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="review.service.ReviewData"%>
<%@page import="review.model.Review"%>
<%@page import="review.model.ReviewContent"%>
<%@page import="movie.model.Movie"%>
<%@page import="Connection.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/NewBasic.css">
<link rel="stylesheet" href="css/global.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script src="js/slides.min.jquery.js"></script>

<script>
	$(function() {
		$('#slides').slides({
			preload : true,
			preloadImage : 'image/loading.gif',
			play : 5000,
			pause : 2500,
			hoverPause : true,
			animationStart : function(current) {
				$('.caption').animate({
					bottom : -35
				}, 100);
				if (window.console && console.log) {
					// example return of current slide number
					console.log('animationStart on slide: ', current);
				}
				;
			},
			animationComplete : function(current) {
				$('.caption').animate({
					bottom : 0
				}, 200);
				if (window.console && console.log) {
					// example return of current slide number
					console.log('animationComplete on slide: ', current);
				}
				;
			},
			slidesLoaded : function() {
				$('.caption').animate({
					bottom : 0
				}, 200);
			}
		});
	});
</script>
<style type="text/css">
.write {
	height: 200px;
}

.slide {
	height: 550px;
}

.list {
	height: 500px;
}

.write a:hover, .write a:focus, .write a:visited, .write a:link{
	text-decoration: none;
	color: white;
}
.list a:hover, .list a:focus, .list a:visited, .list a:link {
	text-decoration: none;
	color: white;
}

</style>
<title>게시판</title>
</head>
<body>
	<%!private static Date toDate(Timestamp timestamp) {

		return new Date(timestamp.getTime());
	}%>
	<%
		ArrayList<ReviewData> reviewlist = new ArrayList<ReviewData>();
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT * FROM ( SELECT ROWNUM AS rnum, A.* FROM (select rv.*, rvc.*, mv.mv_title from  review rv, review_content rvc, Movie_info mv where rv.rv_num = rvc.rvc_rv_num and rv.rv_mv_num = mv.mv_num order by  rv_readcnt desc) A WHERE ROWNUM <= 5 ) WHERE RNUM >=1";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		int startNum = 1;

		if (rs.next()) {
			do {
				Review review; //게시정보
				ReviewContent reviewContent; //게시내용
				Movie movie;
				ReviewData reviewdata = new ReviewData(new Review(
						rs.getInt("rv_num"), rs.getInt("rv_mv_num"),
						rs.getString("rv_m_id"),
						toDate(rs.getTimestamp("rv_regdate")),
						rs.getString("rv_title"), rs.getInt("rv_readcnt"),
						new Movie(rs.getString("mv_title"))),
						new ReviewContent(rs.getInt("rvc_rv_num"), rs
								.getString("rvc_content")));

				reviewlist.add(reviewdata);
				//dto단위로 완성
			} while (rs.next());

		}

		request.setAttribute("reviewlist", reviewlist);
		rs.close();
		stmt.close();
		conn.close();
	%>



	<div id="wrapper">
		<header>
	

			<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
			
		</header>
		<article>
			<section class="slide">
				<div id="container">
					<div id="example">
						<div id="slides">
							<div class="slides_container">
								<div class="slide">
									<a href="movieread.do?mv_num=9"><img
										src="image/movieposter/1.jpg" width="600" height="450"
										alt="Slide 1"></a>
									<div class="caption" style="bottom: 0">
										<span> 내 사랑</span>
									</div>
								</div>
								<div class="slide">
									<a href="movieread.do?mv_num=11"><img
										src="image/movieposter/2.jpg" width="600" height="450"
										alt="Slide 2"></a>
									<div class="caption">
										<span>다크나이트</span>
									</div>
								</div>
								<div class="slide">
									<a href="movieread.do?mv_num=6"><img
										src="image/movieposter/3.jpg" width="600" height="450"
										alt="Slide 3"></a>
									<div class="caption">
										<span>재꽃</span>
									</div>
								</div>
								<div class="slide">
									<a href="movieread.do?mv_num=1"><img
										src="image/movieposter/4.jpg" width="600" height="450"
										alt="Slide 4"></a>
									<div class="caption">
										<span>박열</span>
									</div>
								</div>
								<div class="slide">
									<a href="movieread.do?mv_num=7"><img
										src="image/movieposter/5.jpg" width="600" height="450"
										alt="Slide 5"></a>
									<div class="caption">
										<span>그 후</span>
									</div>
								</div>
								<div class="slide">
									<a href="movieread.do?mv_num=5"><img
										src="image/movieposter/6.jpg" width="600" height="450"
										alt="Slide 6"></a>
									<div class="caption">
										<span>스파이더맨 : 홈커밍</span>
									</div>
								</div>
								<div class="slide">
									<a href="movieread.do?mv_num=4"><img
										src="image/movieposter/7.jpg" width="600" height="450"
										alt="Slide 7"></a>
									<div class="caption">
										<span>옥자</span>
									</div>
								</div>
							</div>
							<a href="#" class="prev"><img src="image/arrow-prev.png"
								width="24" height="43" alt="Arrow Prev"></a> <a href="#"
								class="next"><img src="image/arrow-next.png" width="24"
								height="43" alt="Arrow Next"></a>
						</div>
						<img src="image/example-frame.png" width="739" height="341"
							alt="Example Frame" id="frame">
					</div>
				</div>

			</section>
			<section class="write">
				
					<a href="reviewwrite.do">[글쓰기]</a>
				
			</section>
			<section class="list">
				<table border="1">

					<tr>
						<td colspan="8" align="right"><a href="reviewlist.do">[게시글더보기]</a></td>

					</tr>
					<tr>
						<td>No.</td>
						<!-- 	<td>관리번호</td>
			<td>영화번호</td> -->
						<td>영화제목</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>


					<c:forEach var="reviewdata" items="${reviewlist }">
						<tr>

							<td>${startNum+1}</td>
							<%-- 	<td>${articledata.article.rv_num }</td>
				<td>${articledata.article.rv_mv_num}</td> --%>
							<td>${reviewdata.review.movie.mv_title }</td>
							<td><a
								href="reviewread.do?rv_num=${reviewdata.review.rv_num }"> <c:out
										value="${reviewdata.review.rv_title }"></c:out>
							</a></td>
							<td>${reviewdata.review.rv_m_id}</td>
							<td><fmt:formatDate value="${reviewdata.review.rv_regdate }"
									pattern="yyyy/MM/dd" /></td>
							<td>${reviewdata.review.rv_readcnt }</td>


						</tr>

						<c:set var="startNum" value="${startNum+1}" />
					</c:forEach>
				</table>
			</section>
		</article>

		<footer>
			<jsp:include page="/WEB-INF/view/footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>