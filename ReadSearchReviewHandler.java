package review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.service.ReadSearchReviewService;
import review.service.ReviewContentNotFoundException;
import review.service.ReviewNotFoundException;
import review.service.SearchReviewData;
import mvc.command.CommandHandler;

public class ReadSearchReviewHandler implements CommandHandler {

	private ReadSearchReviewService readService = new ReadSearchReviewService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String noVal = req.getParameter("no");
		int rv_num = Integer.parseInt(noVal);
		String keyField = null;
		keyField=req.getParameter("keyField");
		String keyWord = null;
		keyWord=req.getParameter("keyWord");
		String reviewSort= req.getParameter("reviewSort");
		
		try {
			SearchReviewData searchReviewData = readService.getReview(rv_num, true);
			req.setAttribute("searchReviewData", searchReviewData);
			req.setAttribute("keyField", keyField);
			req.setAttribute("keyWord", keyWord);
			req.setAttribute("reviewSort", reviewSort);
			
			return "/WEB-INF/view/readSearchReview.jsp";
		} catch (ReviewNotFoundException | ReviewContentNotFoundException e) {
			req.getServletContext().log("no review", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
		return null;
		}
	}

}
