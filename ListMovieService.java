package movie.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import movie.dao.MovieDao;
import movie.model.Movie;
import Connection.DBConnection;



public class ListMovieService {

	private MovieDao movieDao = new MovieDao();
	private int size = 12;//한 페이지에 보여지는 영화개수 3*4, 3*3


	public MoviePage getMovie() {
		try (Connection conn = DBConnection.getConnection()) {
			List<Movie> content = movieDao.Relselect(conn);
			
			return new MoviePage(0,0,0,content);
		}catch (SQLException | ClassNotFoundException | NamingException e) {
			throw new RuntimeException(e);
		}
	}
	
	// 전체영화목록 페이지 처리
	public MoviePage getMoviePage(int pageNum, String movieSort) throws ClassNotFoundException, NamingException {
		
		try (Connection conn = DBConnection.getConnection()) {
			// 총 몇개의 게시물이있는지 알려주는 메소드
			//int total = articleDao.selectCount(conn);
			int total = movieDao.selectCount(conn);
			// (3-1)*10+1=21,size=10;
			//pageNum에 해당하는 게시글 목록을 구한다
			// 메서드의 두번쨰 파라미터는 레코드의 시작행
			
			List<Movie> content = movieDao.select(conn, (pageNum - 1)* size + 1, size, movieSort);

			// content = 화면에 출력할 게시글 목록을 보관
			return new MoviePage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 개봉 후 영화목록 페이지 처리
	public MoviePage getAfterMoviePage(int pageNum) throws ClassNotFoundException, NamingException {
		
		try (Connection conn = DBConnection.getConnection()) {
			// 총 몇개의 게시물이있는지 알려주는 메소드
			int total = movieDao.relAfterSelectCount(conn);
			// (3-1)*10+1=21,size=10;
			//pageNum에 해당하는 게시글 목록을 구한다
			// 메서드의 두번쨰 파라미터는 레코드의 시작행
			
			List<Movie> content = movieDao.relAfterSelect(conn, (pageNum - 1)* size + 1, size);

			// content = 화면에 출력할 게시글 목록을 보관
			return new MoviePage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public MoviePage getBeforeMoviePage(int pageNum) throws ClassNotFoundException, NamingException {
		
		try (Connection conn = DBConnection.getConnection()) {
			// 총 몇개의 게시물이있는지 알려주는 메소드
			int total = movieDao.relBeforeSelectCount(conn);
			
			List<Movie> content = movieDao.relBeforeSelect(conn, (pageNum - 1)* size + 1, size);

			return new MoviePage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
