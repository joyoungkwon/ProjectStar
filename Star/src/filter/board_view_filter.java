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


public class board_view_filter implements Filter {
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
		
		String cate = req.getParameter("cate");
		String search_value = req.getParameter("search_value");
		String sort = req.getParameter("sort");
		
		//cate 로 name값 가져오기 가져와서
		// set어튜류비트 cate_name으로 세팅하기
		
		BoardCate cate_board = b_dao.get_Board_cate_name(cate);
		
		String cate_name = cate_board.getName();
		req.setAttribute("cate_name", cate_name);
		
		List<Board> list;
		
		if (search_value == null) {
			search_value = "";
		}
		if (sort == null) {
			sort = "no";
		}
		
		list = b_dao.getBoard_view(cate,search_value,sort);
		
		List<Board> view_list = new ArrayList<>();
		for (Board bo : list) {
			if (bo.isOpen()) {
				view_list.add(bo);
			}
		}
		
		req.setAttribute("list", view_list);
		req.setAttribute("cate_list_mini", b_dao.getBoard_cate_list());
		
		chain.doFilter(request, response);
		
	}
	
}
