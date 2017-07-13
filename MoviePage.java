package movie.service;

import java.util.List;

import movie.model.Movie;

public class MoviePage {

	private int total; //전체 게시글 개수보관
	private int currentPage; // 사용자가 요청한 페이지번호를 보관
	private List<Movie> content; // 화면에 출력할 게시글 목록을 보관
	private int totalPages; //전체페이지개수를 보관
	private int startPage; //화면하단에 보여줄 페이지 이동링크의 시작번호와 끝번호
	private int endPage;
	
	public MoviePage(int total, int currentPage, int size, List<Movie> content) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		if(total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {
			
			//55개/10=5
			totalPages = total/size; //전체개수/10
			if(total % size > 0) { //나머지가 0보다 크면 페이지를 +1함
				totalPages++;//6
			}
			//modVal 화면하단에 보여줄 페이지 이동링크의 시작페이지 번호를 구함 
			int modVal = currentPage % 5; //5개씩보여줄라나보다 5%5 나머지=0 , 10인경우 0
			startPage = currentPage / 5 * 5 + 1;//5/5*5+1;=>6 (6)10/5*5+1 11
			if (modVal == 0) startPage -= 5; // startPage = startPage-5;//6-5=1 11-5=6;
			
			endPage = startPage + 4;//
			if (endPage > totalPages) endPage = totalPages;
		}
	}

	public int getTotal() {
		return total;
	}
	
	public boolean hasNoMovies() {
		return total == 0;
	}
	
	public boolean hasMovies() {
		return total > 0;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public List<Movie> getContent() {
		return content;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
}
