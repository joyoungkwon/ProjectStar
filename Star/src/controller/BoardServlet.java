package controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.Board;
import model.BoardDAO;
import model.BoardReply;
import model.BoardReplyDAO;
import model.GoodBadDAO;
import util.JSFunction;

public class BoardServlet extends HttpServlet {
	
	private BoardDAO b_dao;
	private GoodBadDAO g_dao;
	private BoardReplyDAO bR_dao;
	// 시작
	@Override
	public void init() throws ServletException {
		b_dao = new BoardDAO();
		g_dao = new GoodBadDAO();
		bR_dao = new BoardReplyDAO();
	}
	// 종료
	@Override
	public void destroy() {
		b_dao.close();
		g_dao.close();
		bR_dao.close();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI(); // 절대 경로 (현재 파일 이름 포함)
		String Path = request.getContextPath(); // 절대 경로 (현재 파일 이름 미포함)
		String command = uri.substring(Path.length() + 1); // 슬래시 제외 현재 파일 이름
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		if (command.equals("good_bad.board")) {
			good_bad(request, response);
		} else if (command.equals("reply.board")) {
			insert_reply(request);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI(); // 절대 경로 (현재 파일 이름 포함)
		String Path = req.getContextPath(); // 절대 경로 (현재 파일 이름 미포함)
		String command = uri.substring(Path.length() + 1); // 슬래시 제외 현재 파일 이름
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		if (command.equals("writer.board")) {
			int no = insert_board(req);
			resp.sendRedirect("/Star/board_view.jsp");
		} else if (command.equals("edit.board")) {
			int no = update_board(req);
			resp.sendRedirect("/Star/board_view_detail.jsp?no="+no);
		}
	}
	
	protected int insert_board(HttpServletRequest request) throws ServletException ,IOException{
		
		String saveDirectory =request.getServletContext().getRealPath("/resources/img/board");
		
		int maxPostSize =1024*1024*5;
		String encoding ="UTF-8";
		
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize,encoding , new DefaultFileRenamePolicy());
		HttpSession session = request.getSession();
		
		Board board = new Board();
		board.setId((String)session.getAttribute("login_id"));
		board.setTitle(mr.getParameter("title"));
		board.setContent(mr.getParameter("content"));
		board.setCate(mr.getParameter("cate"));
		//board.setAddr(mr.getParameter("addr"));
		board.setAddr("광주");
		board.setOpen((Boolean.parseBoolean(mr.getParameter("open"))));
		
		System.out.println("11"+mr.getParameter("open"));
		
		b_dao.insertBoard(board);
		int last_no = b_dao.get_Board_no();
		
		Enumeration files = mr.getFileNames();
		while (files.hasMoreElements()) {
			String imgName = (String) files.nextElement();
			String fileName = mr.getFilesystemName(imgName);
			if (fileName != null) {
				File realfile = new File(saveDirectory+File.separator+fileName);
				b_dao.insertBoard_file(last_no, fileName);
			}
		}
		return last_no;
	}

	protected int update_board(HttpServletRequest request) throws ServletException ,IOException{
		int no = Integer.parseInt(request.getParameter("no"));
		String content = request.getParameter("content");
		b_dao.updateBoard("content", content, no);
		return no;
	}
	
	protected void good_bad(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("login_id");
		int no = Integer.parseInt(request.getParameter("no"));
		String table = request.getParameter("table");
		
		boolean favor = Boolean.valueOf(request.getParameter("favor"));
		if (favor) {
			g_dao.insertGB(table, no, id);
		} else {
			g_dao.cancelGB(table, no, id);
		}
		
		JSONObject jo = new JSONObject();
		jo.put("result", "성공");
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jo);
	}

	protected void insert_reply(HttpServletRequest request) throws ServletException ,IOException{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("login_id");
		int no = Integer.parseInt(request.getParameter("no"));
		String content = request.getParameter("content");
		
		BoardReply boardReply = new BoardReply();
		boardReply.setBoard_no(no);
		boardReply.setId(id);
		boardReply.setContent(content);
		
		bR_dao.insertBoardReply(boardReply);
	}
}
