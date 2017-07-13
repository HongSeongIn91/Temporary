package review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.service.ListReviewService;
import review.service.ReviewPage;
import mvc.command.CommandHandler;

public class ListReviewHandler implements CommandHandler {

	private ListReviewService listService = new ListReviewService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		//게시판 리스트를 보여주는 페이지처리
		//페이지번호를 확인한다
		String pageNoVal = req.getParameter("pageNo");
		String reviewSort = req.getParameter("reviewSort");
		
		int pageNo = 1;
		//페이지번호가 넘겨진게있다면 그걸 페이지번호로한다
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		if(reviewSort==null){
			reviewSort="rv_num";
		}
		
		ReviewPage reviewPage = listService.getReviewPage(pageNo, reviewSort);

		int startNum = listService.getTotalPage(pageNo, reviewPage.getTotal());
		
		req.setAttribute("reviewPage", reviewPage);
		req.setAttribute("startNum", startNum);
		req.setAttribute("reviewSort", reviewSort);
		return "/WEB-INF/view/listReview.jsp";
	}

}
