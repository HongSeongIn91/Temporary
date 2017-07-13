package review.command;

import java.util.HashMap;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.service.WriteRequest;
import review.service.WriteReviewService;
import auth.service.User;
import movie.service.ListMovieService;
import movie.service.MoviePage;
import mvc.command.CommandHandler;


public class WriteReviewHandler implements CommandHandler {
	
	private static final String FORM_VIEW = "/WEB-INF/view/newReviewForm.jsp";
	private ListMovieService mlistServive = new ListMovieService();
	private WriteReviewService writeService = new WriteReviewService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if(req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws ClassNotFoundException, NamingException {
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		req.setAttribute("errors", errors);
		
		//사용자정보
		User user = (User)req.getSession(false).getAttribute("authUser");
		
		//req에는 title, mv_num, content 있음
		WriteRequest writeReq = createWriteRequest(user, req);//사용자와 제목, 내용을 담은 것을
		writeReq.validate(errors);
		
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		//입력된 그 정보로 이용해서 서비스실행
		int newRv_num = writeService.write(writeReq);
		req.setAttribute("newRv_num", newRv_num);
		
		return "/WEB-INF/view/newReviewSuccess.jsp";
	}
	
	private WriteRequest createWriteRequest(User user, HttpServletRequest req) {
		//post로 넘어온 그정보를 각각 담아
		return new WriteRequest(
				//new Writer(user.getId()),//user객체에 담인 계정정보를 writer에 담아
				user.getId(),
				req.getParameter("title"), 
				Integer.parseInt(req.getParameter("mv_num")),
				req.getParameter("content"));
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res) throws Exception {

		MoviePage moviePage = mlistServive.getMovie();
		req.setAttribute("moviePage",moviePage);
		return FORM_VIEW;
	}

}
