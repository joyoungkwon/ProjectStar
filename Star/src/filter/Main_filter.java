package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDAO;
import model.Member;
import model.MemberDAO;
import util.JSFunction;

public class Main_filter implements Filter {
	
	private BoardDAO b_dao;
	
	
	@Override
	public void destroy() {
		b_dao.close();
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		b_dao = new BoardDAO();
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		HttpSession session = req.getSession();
		
		Cookie[] cookies = req.getCookies();
		String cookieValue = "";

		if(cookies!=null){
		    for(int i=0;i<cookies.length;i++){
		        if(cookies[i].getName().equals("login_id")){	// 자동로그인 설정
		            cookieValue = cookies[i].getValue();
		        }
		    }
		}
		
		if (cookieValue.length() != 0) {	// 자동로그인 설정
			session.setAttribute("login_id", cookieValue);
		}
		
		String login_addr_bef = req.getParameter("addr");
		if (login_addr_bef != null) {
			String login_addr="";
			String [] login_addr_aft = login_addr_bef.split(" ");
			
			for(int i = 0; i<3; i++) {
				if(i != 0) {
					login_addr += " ";
				}
				login_addr += login_addr_aft[i];
			}
			session.setAttribute("addr", login_addr);
		}
		
		req.setAttribute("addr_bool", true);
		req.setAttribute("cate_list", b_dao.getBoard_cate_list());
		
		chain.doFilter(request, response);
	}
	
}
