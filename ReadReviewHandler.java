package review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reply.service.ListReplyService;
import reply.service.ReplyPage;
import review.service.ReadReviewService;
import review.service.ReviewContentNotFoundException;
import review.service.ReviewData;
import review.service.ReviewNotFoundException;
import mvc.command.CommandHandler;

public class ReadReviewHandler implements CommandHandler {

	private ReadReviewService readReviewService = new ReadReviewService();
	private ListReplyService listReplyService = new ListReplyService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String noVal = req.getParameter("rv_num");
		int rv_num = Integer.parseInt(noVal);
		System.out.println("ReadReviewHandler_rv_num= "+rv_num );
		
		try {
			ReviewData reviewData = readReviewService.getReview(rv_num, true);
			req.setAttribute("reviewData", reviewData);
			
			String replyPageNoVal = req.getParameter("replyPageNo");
			int pageNo = 1;
			
			if (replyPageNoVal != null) {
				pageNo = Integer.parseInt(replyPageNoVal);
			}
			
			ReplyPage replyPage = listReplyService.getReplyPage(pageNo, rv_num);
			req.setAttribute("replyPage", replyPage);
			req.setAttribute("rv_num", rv_num);
			
			return "/WEB-INF/view/readReview.jsp";
		} catch (ReviewNotFoundException | ReviewContentNotFoundException e) {
			req.getServletContext().log("no review", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}

}
