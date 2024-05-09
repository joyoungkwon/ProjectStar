package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Member;
import model.MemberDAO;
import util.JSFunction;

public class MemberServlet extends HttpServlet {
	
	private MemberDAO dao;
	
	@Override
	public void init() throws ServletException {
		dao = new MemberDAO();
	}
	
	@Override
	public void destroy() {
		dao.close();
	}


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();	// 절대 경로 (현재 파일 이름 포함)
		String Path = request.getContextPath();	// 절대 경로 (현재 파일 이름 미포함)
		String command = uri.substring(Path.length()+1);	// 슬래시 제외 현재 파일 이름
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		if (command.equals("logout.member")){
			logout(request, response);
			response.sendRedirect("/Star/index.jsp");
		} else if (command.equals("add_change.member")){
			add_change(request);
			response.sendRedirect("/Star/my_edit.jsp");
		} else if (command.equals("wish_board.member")){
			wish_board(request);
			JSFunction.historyBack(response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();	// 절대 경로 (현재 파일 이름 포함)
		String Path = request.getContextPath();	// 절대 경로 (현재 파일 이름 미포함)
		String command = uri.substring(Path.length()+1);	// 슬래시 제외 현재 파일 이름
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		if (command.equals("login.member")){
			login(request, response);
		} else if(command.equals("edit_intro.member")) {
			edit_intro(request);
			response.sendRedirect("/Star/my_edit.jsp");
		}
	}
	
	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		if (email.length() != 0) {
			id = email;
		}
		String pw = request.getParameter("pw");
		String auto = request.getParameter("auto");
		String user_name = request.getParameter("user_name");
		String img = request.getParameter("img");
		
		if (user_name.length() != 0) {	// 회원가입
			Member member = new Member();
			member.setId(id);
			member.setPw(pw);
			member.setUser_name(user_name);
			member.setImg(img);
			dao.insertMember(member);
		}
		
		
		if (!dao.hasMember(id)) {	// 아이디 없음, 회원가입 진행
			session.setAttribute("noid", 1);
			response.sendRedirect("/Star/login.jsp");
			return;
		}
		
		int login_code = dao.login(id, pw);
		if (login_code == 0) {	// 로그인 성공
			Member member = dao.getMember(id);
			session.setAttribute("login_id", id);
			session.setAttribute("login_name", member.getUser_name());
			session.setAttribute("login_img", member.getImg());
			String login_addr_bef = member.getAddr();
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
			
			if (auto != null) {
				Cookie cookie = new Cookie("login_id", id);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
			
			response.sendRedirect("/Star/index.jsp");	// 나중에 이전 페이지로 복귀 방식으로 수정하기
			return;
		} else {
			session.setAttribute("login_error", login_code);
		}
		response.sendRedirect("/Star/login.jsp");
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		session.invalidate();
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
		    for(Cookie cookie : cookies){
		    	if(cookie.getName().equals("login_id")){
		    		cookie.setMaxAge(0);
		    		cookie.setPath("/");
		    		response.addCookie(cookie);
		    	}
		    }
		}
	}

	private void add_change(HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("login_id");
		String addr = request.getParameter("addr");
		
		dao.updateMember("addr", addr, id);
		String [] login_addr_aft = addr.split(" ");
		addr="";
		
		for(int i = 0; i<3; i++) {
			if(i != 0) {
				addr += " ";
			}
			addr += login_addr_aft[i];
		}
		session.setAttribute("addr", addr);
	}

	private void wish_board(HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("login_id");
		int no = Integer.parseInt(request.getParameter("no"));
		
		boolean favor = Boolean.valueOf(request.getParameter("favor"));
		if (favor) {
			dao.insertWish_board(id, no);
		} else {
			dao.deleteWish_board(id, no);
		}
	}
	
	private void edit_intro(HttpServletRequest request) throws IOException {
		 dao.updateMember("intro", request.getParameter("intro"), request.getParameter("login_user")); 
	}
}
