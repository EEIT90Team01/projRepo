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

@WebFilter({ "/order.controller", "/writeOrder.controller", "/Tim/page/order/*" ,"/pages/editMember.jsp"})
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
		String ServletPath =req.getServletPath();
		if (loginOK != null) {// 有登入的話
			chain.doFilter(request, response);
			return;
		}
		String url = "";
		if (req.getPathInfo() != null) {
			url = req.getPathInfo();
		}
		if (loginOK == null) {
			int last=ServletPath.indexOf(".");
			int first=ServletPath.lastIndexOf("/")+1;
			url = ServletPath.substring(first, last);
			session.setAttribute("url", url);
			req.getRequestDispatcher("/Tim/login/login.jsp").forward(request, response);
		}
			
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
