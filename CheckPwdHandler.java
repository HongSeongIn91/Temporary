package member.command;

import java.util.HashMap;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import member.service.CheckPwdService;
import member.service.InvalidPasswordException;
import mvc.command.CommandHandler;

public class CheckPwdHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/checkPwdForm.jsp";
	private CheckPwdService checkPwdSvc = new CheckPwdService();
	
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
		// checkPwdForm.jsp에서 넘어온 m_pw를 password에 저장
		String password = trim(req.getParameter("m_pw"));
		
		User user = (User)req.getSession().getAttribute("authUser");
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		req.setAttribute("errors", errors);
		
		/*Member member = new Member(authUser.getId(), )
		req.setAttribute("member", member);*/
		
		// 비밀번호 입력란이 공란일 경우 FORM_VIEW를 return. 나중에 alert로 "입력하신 정보가 잘못되었습니다" 뭐 요런 뉘앙스의 문구를 띄우고 FORM_VIEW로 돌아감.
		if(password==null || password.isEmpty())
			errors.put("m_pw", Boolean.TRUE);
		if(!errors.isEmpty()){
			return FORM_VIEW;
		}
		
		try {
			checkPwdSvc.checkPassword(user.getId(), password);
			return "/WEB-INF/view/changeMemberInfoForm.jsp";
		} catch (InvalidPasswordException e) {
			errors.put("badCurPwd", Boolean.TRUE);
			return FORM_VIEW;
		}
		
	}

	private String trim(String str) {
	
		return str == null ? null : str.trim();
	}


	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		
		return FORM_VIEW;
	}

}
