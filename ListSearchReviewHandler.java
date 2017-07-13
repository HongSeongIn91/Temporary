package review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.service.ListReviewService;
import review.service.SearchPage;
import mvc.command.CommandHandler;

public class ListSearchReviewHandler implements CommandHandler {

	private ListReviewService listService = new ListReviewService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		
		String pageNoVal = req.getParameter("pageNo");
		
		// 검색에 필요한 변수들
		String keyField = req.getParameter("keyField");
		String keyWord = req.getParameter("keyWord");
		String reviewSort = req.getParameter("reviewSort");
		
		int pageNo = 1;
		//페이지번호가 넘겨진게있다면 그걸 페이지번호로한다
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		if(reviewSort == null){
			reviewSort="rv_num";
		}
		
		SearchPage searchPage = listService.getSearchPage(pageNo, keyField, keyWord, reviewSort);
		
		int startNum = listService.getTotalPage(pageNo, searchPage.getTotal());
		
		req.setAttribute("searchPage", searchPage);
		req.setAttribute("startNum", startNum);
		req.setAttribute("keyField", keyField);
		req.setAttribute("keyWord", keyWord);
		req.setAttribute("reviewSort", reviewSort);
		
		return "/WEB-INF/view/listSearchReview.jsp";
	}

}
