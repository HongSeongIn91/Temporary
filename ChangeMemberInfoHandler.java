package member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import member.service.ChangeMemberInfoService;
import member.service.DismatchPasswordException;
import member.service.InvalidPasswordException;
import member.service.MemberNotFoundException;
import mvc.command.CommandHandler;

public class ChangeMemberInfoHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/changeMemberInfoForm.jsp";
	private ChangeMemberInfoService changeMemberInfoSvc = new ChangeMemberInfoService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		
		User user = (User)req.getSession().getAttribute("authUser");
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		req.setAttribute("errors", errors);
		
		String newPwd = req.getParameter("newPwd");
		String confirmPassword = req.getParameter("confirmPassword");
		String newEmail = req.getParameter("newEmail");
		String newPhone = req.getParameter("newPhone");
		
		if(newPwd == null || newPwd.isEmpty()) {
			errors.put("newPwd", Boolean.TRUE);
		}
		if(!errors.isEmpty()){
			return FORM_VIEW;
		}
		
		try {
			changeMemberInfoSvc.changeMemberInfo(user.getId(), newPwd, confirmPassword, newEmail, newPhone);
			return "/WEB-INF/view/changeMemberInfoSuccess.jsp";
		} catch (InvalidPasswordException e) {
			errors.put("badCurPwd", Boolean.TRUE);
			return FORM_VIEW;
		} catch (MemberNotFoundException e) {
			res.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return null;
		} catch (DismatchPasswordException e) {
			errors.put("badNewPwd", Boolean.TRUE);
			return FORM_VIEW;
		}
		
	}

}
