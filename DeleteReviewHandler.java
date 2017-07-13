package review.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.service.ReadReviewService;
import review.service.ReviewContentNotFoundException;
import review.service.ReviewData;
import review.service.ReviewNotFoundException;
import review.service.DeleteReviewService;
import review.service.DeleteRequest;
import auth.service.User;
import mvc.command.CommandHandler;

public class DeleteReviewHandler implements CommandHandler {
	
	private static final String FORM_VIEW = "/WEB-INF/view/deleteForm.jsp";
	private ReadReviewService readService = new ReadReviewService();
	private DeleteReviewService deleteService = new DeleteReviewService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res) throws ClassNotFoundException, NamingException, IOException {
		
		String noVal = req.getParameter("rv_num");
		int rv_num = Integer.parseInt(noVal);
		
	/*	String noVal1= req.getParameter("mno");
		int mno=Integer.parseInt(noVal1);
*/
		req.setAttribute("rv_num",rv_num);
		/*req.setAttribute("mno", mno);*/
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws ClassNotFoundException, NamingException, IOException, ReviewContentNotFoundException {
		try {

			User authUser = (User)req.getSession().getAttribute("authUser");
			
			String noVal = req.getParameter("rv_num");
			int rv_num = Integer.parseInt(noVal);
		/*	String noVal1 = req.getParameter("mv_num");
			int mno = Integer.parseInt(noVal1);
		*/	
			ReviewData reviewData = readService.getReview(rv_num, false/*, mno*/);
			if(!canDelete(authUser, reviewData)) {
				res.sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			}
			DeleteRequest delReq = new DeleteRequest(authUser.getId(), rv_num);
			req.setAttribute("delReq", delReq);
			deleteService.delete(delReq);
			return "/WEB-INF/view/deleteSuccess.jsp";
		} catch (ReviewNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}

	private boolean canDelete(User authUser, ReviewData reviewData) {
		String writerId = reviewData.getReview().getRv_m_id();
		return authUser.getId().equals(writerId);
	}
	
	
}


















