package movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import member.dao.JdbcUtil;
import movie.model.Movie;

public class MovieDao {

	public int selectCount(Connection conn) throws SQLException {
		
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from movie_info");
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	//개봉후 영화개수 현재9
	public int relAfterSelectCount(Connection conn) throws SQLException {
		
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT count(*) FROM MOVIE_INFO WHERE mv_reldate <= sysdate");
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	//개봉전 영화개수1
	public int relBeforeSelectCount(Connection conn) throws SQLException {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT count(*) FROM MOVIE_INFO WHERE mv_reldate > sysdate");
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	// 모든영화정보셀렉트
	// 파라미터 movieSort에 따라 개봉일순 혹은 조회순 영화리스트를 SELECT하고 List<Movie>에 저장
	public List<Movie> select(Connection conn, int startRow, int size, String movieSort) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Movie> result = new ArrayList<Movie>();
		
		String sql = "SELECT * FROM (SELECT ROWNUM AS rnum, A.* FROM (";

		if (movieSort.equals("mv_reldate")) {
			sql += "SELECT * FROM Movie_info ORDER BY mv_reldate desc";
		} else {
			sql += "SELECT * FROM Movie_info ORDER BY mv_readcnt desc";

		}
		sql += ") A WHERE ROWNUM <= ?) WHERE RNUM >= ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow + size - 1);
			pstmt.setInt(2, startRow);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				result.add(convertMovie(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	//개봉후 영화 셀렉트
		public List<Movie> relAfterSelect(Connection conn, int startRow, int size) throws SQLException {
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				// 페이징처리
				pstmt = conn.prepareStatement("SELECT * FROM ("
						+ "SELECT ROWNUM AS rnum, A.* FROM ("

						+ "SELECT * FROM Movie_info WHERE mv_reldate <= sysdate ORDER BY mv_reldate desc"

						+ ") A WHERE ROWNUM <= ?" + ") WHERE RNUM >= ?");
				/*
				 * SELECT * FROM (SELECT ROWNUM AS rnum, A.* FROM (SELECT * FROM
				 * ARTICLE ORDER BY ARTICLE_NO DESC) A WHERE ROWNUM <= 3) WHERE RNUM
				 * >=2;
				 */
				pstmt.setInt(1, startRow + size - 1);
				// pstmt.setInt(1, startRow + size); //21+10-1 -> 30
				pstmt.setInt(2, startRow); // 21
				rs = pstmt.executeQuery();

				// 목록리스트를 Arraylist에 담는다
				// result 객체리스트를 생성한다
				List<Movie> result = new ArrayList<Movie>();
				while (rs.next()) {
					result.add(convertMovie(rs));
				}
				return result;
			} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
		}
		
	//개봉전 영화 셀렉트
	public List<Movie> relBeforeSelect(Connection conn, int startRow, int size) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 페이징처리
			pstmt = conn.prepareStatement("SELECT * FROM ("
					+ "SELECT ROWNUM AS rnum, A.* FROM ("

					+ "SELECT * FROM Movie_info WHERE mv_reldate > sysdate ORDER BY mv_reldate"
					+ ") A WHERE ROWNUM <= ?" + ") WHERE RNUM >= ?");

			pstmt.setInt(1, startRow + size - 1);
			// pstmt.setInt(1, startRow + size); //21+10-1 -> 30
			pstmt.setInt(2, startRow); // 21
			rs = pstmt.executeQuery();

			List<Movie> result = new ArrayList<Movie>();
			while (rs.next()) {
				result.add(convertMovie(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	private Movie convertMovie(ResultSet rs) throws SQLException {
		
		return new Movie(rs.getInt("mv_num"),
				rs.getString("mv_title"),
				rs.getString("mv_summary"),
				toDate(rs.getTimestamp("mv_reldate")),
				rs.getString("mv_time"),
				rs.getString("mv_rating"),
				rs.getString("mv_director"),
				rs.getString("mv_actor"),
				rs.getInt("mv_readcnt"),
				rs.getString("mv_poster"));
	}

	private Date toDate(Timestamp timestamp) {
		
		return  new Date(timestamp.getTime());
	}

	public Movie selectByMvNum(Connection conn, int movieNum) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from movie_info where mv_num = ?");
			pstmt.setInt(1, movieNum);
			rs = pstmt.executeQuery();
			Movie movie = null;
			if (rs.next()) {
				movie = convertMovie(rs);
			}
			return movie;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public void increaseReadCount(Connection conn, int movieNum) throws SQLException {
		try (PreparedStatement pstmt = conn
				.prepareStatement("update movie_info set mv_readcnt = mv_readcnt + 1 where mv_num =?")) {
			pstmt.setInt(1, movieNum);
			pstmt.executeUpdate();
		}
		
	}

	//감상평글쓰기 시 영화제목리스트 보여주는 것
	public List<Movie> Relselect(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
		
			pstmt = conn.prepareStatement("SELECT * FROM MOVIE_INFO WHERE mv_reldate <= sysdate order by mv_reldate desc");

			rs = pstmt.executeQuery();

			// 목록리스트를 Arraylist에 담는다
			// result 객체리스트를 생성한다
			List<Movie> result = new ArrayList<Movie>();
			while (rs.next()) {
				result.add(convertMovie(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	

}
