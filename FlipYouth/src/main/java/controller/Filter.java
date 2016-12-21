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

@WebFilter({ "/order.controller", "/writeOrder.controller" })
public class Filter implements javax.servlet.Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();

		System.out.println("filter");
		// session.removeAttribute("loginOK");
		System.out.println(session.getAttribute("loginOK"));
		if (session.getAttribute("loginOK") != null) {// 有登入的話
			// resp.sendRedirect(req.getParameter("url"));
			chain.doFilter(request, response);

		}
		if (session.getAttribute("loginOK") == null) {
			String url = req.getParameter("url");
			System.out.println("請求的url=" + req.getParameter("url"));
			if (url != null) {
				session.setAttribute("url", url.substring(0, url.indexOf('.')));
			}
			resp.sendRedirect("login.jsp");
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
