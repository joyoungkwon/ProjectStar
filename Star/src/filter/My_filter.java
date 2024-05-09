package filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Board;
import model.BoardDAO;
import model.Member;
import model.MemberDAO;


public class My_filter implements Filter {
	BoardDAO b_dao;
	MemberDAO m_dao;
	
	@Override
	public void destroy() {
		b_dao.close();
		m_dao.close();
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		b_dao = new BoardDAO();
		m_dao = new MemberDAO();
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		String login_id = (String)req.getSession().getAttribute("login_id");
		Member member = m_dao.getMember(login_id);
		req.setAttribute("my", member);
		
		if (login_id==null) {
			System.out.println("접근금지!!");
		}
		List<Board> latest_list = b_dao.get_latest(login_id);
		req.setAttribute("list", latest_list);
		
		chain.doFilter(request, response);
		
	}
	
}
