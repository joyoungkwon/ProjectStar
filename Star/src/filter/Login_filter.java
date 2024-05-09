package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.JSFunction;

public class Login_filter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		HttpSession session = req.getSession();
		
		if (session.getAttribute("noid") != null) {
			session.removeAttribute("noid");
			req.setAttribute("noid", 1);
		}
		if (session.getAttribute("login_error")!=null){
			JSFunction.alert(res, "비번 틀림");
			session.removeAttribute("login_error");
		}
		chain.doFilter(request, response);
	}
	
}
