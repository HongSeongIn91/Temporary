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
import review.service.ModifyReviewService;
import review.service.ModifyRequest;
import review.service.PermissionDeniedException;
import auth.service.User;
import movie.model.Movie;
import movie.service.MovieData;
import movie.service.ReadMovieService;
import mvc.command.CommandHandler;

public class ModifyReviewHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/modifyForm.jsp";
	
	private ReadReviewService readService = new ReadReviewService();
	private ModifyReviewService modifyService = new ModifyReviewService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res)
			throws ClassNotFoundException, NamingException, IOException {

		User authUser = (User) req.getSession().getAttribute("authUser");
		
		String noVal = req.getParameter("rv_num");
	System.out.println("ModifyReviewHandler_noVal="+noVal);
		int rv_num = Integer.parseInt(noVal);

		// 요청 파라미터와 현재 사용자 정보를 이용해서 ModifyRequest 객체를 생성한다.
		ModifyRequest modReq = new ModifyRequest(
				authUser.getId(), 
				rv_num,
				req.getParameter("title"), 
				req.getParameter("content")
				);
		req.setAttribute("modReq", modReq);

		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		req.setAttribute("errors", errors);
		modReq.validate(errors);
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		try {
			modifyService.modify(modReq);
			return "/WEB-INF/view/modifySuccess.jsp";
		} catch (ReviewNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		} catch (PermissionDeniedException e) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}

	}

	// 수정전의 데이터 기존데이터를 불러와 보여줘야한다
	private String processForm(HttpServletRequest req, HttpServletResponse res)
			throws ClassNotFoundException, NamingException, IOException, ReviewContentNotFoundException {

		try {
			//게시글번호
			String noVal = req.getParameter("rv_num");
			int rv_num = Integer.parseInt(noVal);
			
		/*	String noVal1= req.getParameter("mno");
			int mno=Integer.parseInt(noVal1);
*/
			// 게시글을 읽어온다 대신 조회는 증가하지않음
			//작성자 정보와 저장된 모든 정보를 다 가져옴 
			ReviewData reviewData = readService.getReview(rv_num, false);
			// 로그인한 사용자정보를 불러온다
			User authUser = (User) req.getSession().getAttribute("authUser");

			// 유저와 게시글의 작성자와 비교하는 매소드
			if (!canModify(authUser, reviewData)) {
				res.sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			}
			
			// 위모두가 잘 통과했다는뜻은 => 수정요청하는 사용자와 게시글작성자와 동일하다는뜻임
			ModifyRequest modReq = new ModifyRequest(
					authUser.getId(), 
					rv_num,
					reviewData.getReview().getRv_title(),
					reviewData.getContent());

			// 수정정보를 담아 폼에보여준다!
			req.setAttribute("modReq", modReq);
			
			return FORM_VIEW;
		} catch (ReviewNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}

	// authUser 세션에 담긴 사용자 아이디와 수정요청하는 글의 작성자가 아이디가 동일한지 확인
	// return 1이면 같음 0이면 같지않음 ;
	private boolean canModify(User authUser, ReviewData reviewData) {
		String writerId = reviewData.getReview().getRv_m_id();
		return authUser.getId().equals(writerId);
	}

}
