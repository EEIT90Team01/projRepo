package controller.simpleServlet;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
public class AdminLogoutServlet {

	@RequestMapping(path = { "/admin/secure/adminLogout.servlet" })
	public String adminLogoutMethod(HttpSession session) {
		session.removeAttribute("admin");
		return "adminLogin.index";
	}
}
