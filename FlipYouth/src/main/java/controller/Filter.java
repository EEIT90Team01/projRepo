package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberBean;

@WebFilter({ "/order.controller", "/writeOrder.controller", "/order/*" ,"/pages/editMember.jsp"})
public class Filter implements javax.servlet.Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		MemberBean loginOK = (MemberBean) session.getAttribute("loginOK");

		if (loginOK != null) {// 有登入的話
			session.setAttribute("url", req.getServletPath().substring(0, req.getServletPath().indexOf(".")));
			chain.doFilter(request, response);
			return;
		}

		String url = "";
		if (req.getPathInfo() != null) {
			url = req.getPathInfo();
		}
		if (loginOK == null) {
			session.setAttribute("url", req.getServletPath() + url);
			req.getRequestDispatcher("/login/login.jsp").forward(request, response);
		}
			
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
