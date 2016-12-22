package controller;

import java.io.IOException;

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

//@WebFilter({ "/order.controller", "/writeOrder.controller", "/order/*","/login.jsp" })
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
		System.out.println("filter");

		if (loginOK != null) {// 有登入的話
			// resp.sendRedirect(req.getParameter("url"));
			chain.doFilter(request, response);

		}
		
		String url = "";
		if (req.getPathInfo() != null) {
			url = req.getPathInfo();
		}

		System.out.println(req.getServletPath().indexOf("login.jsp"));
		
		if (loginOK != null &&(req.getServletPath().indexOf("login.jsp")!=-1||req.getServletPath().indexOf("login.controller")!=-1)) {
			request.getRequestDispatcher("/list").forward(request, response);
			System.out.println("重登入");
		}
		
		if (loginOK == null && req.getServletPath().indexOf("login.jsp")== -1) {
			session.setAttribute("url", req.getServletPath() + url);
			System.out.println("請求的url=" + req.getParameter("url"));
			request.getRequestDispatcher("/login.controller").forward(request, response);
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
