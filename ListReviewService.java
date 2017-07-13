package review.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import review.dao.ReviewDao;
import review.model.Review;
import Connection.DBConnection;

public class ListReviewService {

	private ReviewDao reviewDao = new ReviewDao();
	private int size = 10;

	public ReviewPage getReviewPage(int pageNum, String reviewSort)
			throws ClassNotFoundException, NamingException {
		try (Connection conn = DBConnection.getConnection()) {
			// 총 몇개의 게시물이있는지 알려주는 메소드
			int total = reviewDao.selectCount(conn);

			// (3-1)*10+1=21,size=10;
			//pageNum에 해당하는 게시글 목록을 구한다
			// 메서드의 두번쨰 파라미터는 레코드의 시작행
			int startRow= (pageNum - 1) * size + 1;
			List<Review> content = reviewDao.select(conn, startRow, size, reviewSort);
			
			// content = 화면에 출력할 게시글 목록을 보관
			return new ReviewPage(total, pageNum, size, content);
			//return articlePage;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	

	public ReviewPage getMyReviewPage(int pageNum, String reviewSort, String m_id) throws ClassNotFoundException, NamingException {
		try (Connection conn = DBConnection.getConnection()) {
			int total = reviewDao.selectCountByMyId(conn, m_id);
			List<Review> content = reviewDao.selectByMyId(conn, (pageNum-1)*size, size, m_id);
			return new ReviewPage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	
	public SearchPage getSearchPage(int pageNum, String keyField, String keyWord, String reviewSort) throws ClassNotFoundException, NamingException {
		try (Connection conn = DBConnection.getConnection()) {
			
			int total = reviewDao.selectCountByKeyFiledWord(conn, keyField, keyWord);
			
			int startRow = (pageNum - 1) * size + 1;
			
			List<Review> content = reviewDao.selectSearch(conn, startRow, size, keyField, keyWord, reviewSort);
			

			return new SearchPage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public int getTotalPage(int pageNum, int total) throws ClassNotFoundException, NamingException {
		
		try (Connection conn = DBConnection.getConnection()) {
			int return_total = total - (pageNum - 1)*size;

			return return_total;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
	}

}
