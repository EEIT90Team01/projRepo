package controller.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.AdministratorBean;

@WebFilter({ "/admin/pages/*", "/admin/index.jsp", "/admin/secure/login.jsp" })
public class BackEndLoginFilter implements Filter {
	String contextPath;
	String loginPath;
	String loginControllerPath;

	public BackEndLoginFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		if (request instanceof HttpServletRequest && response instanceof HttpServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			HttpSession session = req.getSession();
			AdministratorBean admin = (AdministratorBean) session.getAttribute("admin");
			if (admin == null
					&& !(req.getServletPath().equals(loginPath) || req.getServletPath().equals(loginControllerPath))) {
				resp.sendRedirect(resp.encodeRedirectURL(contextPath + loginPath));
			} else if (admin != null
					&& (req.getServletPath().equals(loginPath) || req.getServletPath().equals(loginControllerPath))) {
				resp.sendRedirect(resp.encodeRedirectURL(contextPath + "/admin/index.jsp"));
			} else {
				chain.doFilter(request, response);
			}
		} else {
			throw new ServletException("Req/Resp type error");
		}

	}

	public void init(FilterConfig fConfig) throws ServletException {
		contextPath = fConfig.getServletContext().getContextPath();
		loginPath = "/admin/secure/login.jsp";
		loginControllerPath = "/admin/secure/adminLogin.controller";

	}

}
