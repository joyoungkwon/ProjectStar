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
import model.BoardCate;
import model.BoardDAO;
import model.Member;
import model.MemberDAO;


public class board_view_detail_filter implements Filter {
	BoardDAO b_dao;
	
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
		int no = Integer.parseInt(request.getParameter("no"));
		String login_id = (String)req.getSession().getAttribute("login_id");
		
		Board view = b_dao.getBoard(no);
		if (login_id!=null && !login_id.equals(view.getId())){
			b_dao.insertView_count(login_id, no);
		}
		
		req.setAttribute("menu_btn", true);
		req.setAttribute("view", view);
		req.setAttribute("pageName", view.getTitle());
		
		chain.doFilter(request, response);
		
	}
	
}
