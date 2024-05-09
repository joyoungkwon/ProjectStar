package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {
	
	// 게시글 작성, title, content, cate : null값 허용
	// younkwon -> if opne 추가
	public void insertBoard(Board board) {
		String title = board.getTitle();
		String content = board.getContent();
		String cate = board.getCate();
		boolean open  = board.isOpen();
		
		String sql = "insert into board(id,addr";
		if (title!=null) { sql += ", title"; }
		if (content!=null) { sql += ", content"; }
		if (cate!=null) { sql += ", cate"; }
		if (open) { sql += ", open"; }
		sql += ") values(?, ?";
		if (title!=null) { sql += ", '" + title + "'" ; }
		if (content!=null) { sql += ", '" + content + "'"; }
		if (cate!=null) { sql += ", '" + cate + "'"; }
		if (open) { sql += ", " + open; }
		sql += ")";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, board.getId());
			psmt.setString(2, board.getAddr());
			System.out.println(psmt);
			psmt.executeUpdate();
			System.out.println("model.BoardDAO.insertBoard() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.insertBoard() 실패"+e.getMessage());
			e.printStackTrace();
		}
	}
	//보드 파일에 추가하기
	public void insertBoard_file(int no ,String file_name) {
		String sql = "insert into boardfile (board_no,file_name) values(?,?)";
		try {
			psmt =con.prepareStatement(sql);
			psmt.setInt(1, no);
			psmt.setString(2, file_name);
			psmt.executeUpdate();
			System.out.println("model.BoardDAO.insertBoard_file() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.insertBoard_file() 실패"+e.getMessage());
			e.printStackTrace();
		}
	}
	// board_no값 찾는 메서드
	public int get_Board_no() {
		int result =0;
		String sql ="select max(no) from board";
		try {
			stmt =con.prepareStatement(sql);
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				result = rs.getInt(1);
				System.out.println(result);
			}
		} catch (Exception e) {
			System.out.println("get_Board_no()실패"+e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	// 게시글 수정
	public void updateBoard(String column, String value, int no) {
		String sql = "update board set "+column+" = ? where no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, value);
			psmt.setInt(2, no);
			psmt.executeUpdate();
			System.out.println("model.BoardDAO.updateBoard() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.updateBoard() 실패");
		}
		
		sql = "update board set isUpdate = true where no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, no);
			psmt.executeUpdate();
			System.out.println("model.BoardDAO.updateBoard()_isUpdate 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.updateBoard()_isUpdate 실패");
		}
	}
	
	// 게시글 삭제
	public void deleteBoard(String no) {
		String sql = "delete from board no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, no);
			psmt.executeUpdate();
			System.out.println("model.BoardDAO.deleteBoard() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.deleteBoard() 실패");
		}
	}
	
	// 게시물 전체 반환
	public List<Board> getBoard_list() {
		List<Board> list = new ArrayList<>();
		String sql = "select no from board order by no desc";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Board board = getBoard(rs.getInt(1));
				list.add(board);
			}
			System.out.println("model.BoardDAO.getBoard_list() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.getBoard_list() 실패");
		}
		return list;
	}
	
	// 게시물 검색 
	public List<Board> getBoard_view(String cate, String search_value, String sort) {
		List<Board> list = new ArrayList<>();
		String sql = "select no from board join member on board.id=member.id where ( ";
		if (cate == null) {
			sql += "cate is null ||";
			cate = "";
		}
		sql += "cate like ? ) and title like ? and content like ? order by "+sort+" desc";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, '%'+cate+'%');
			psmt.setString(2, '%'+search_value+'%');
			psmt.setString(3, '%'+search_value+'%');
			
			System.out.println(psmt);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Board board = getBoard(rs.getInt(1));
				list.add(board);
			}
			System.out.println("model.BoardDAO.getBoard_view() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.getBoard_view() 실패");
		}
		return list;
	}
	
	// 게시물 검색
	public List<Board> getBoard_serch(String column, String value) {
		List<Board> list = new ArrayList<>();
		String sql = "select no from board where "+column+" = ? order by no desc";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, value);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Board board = getBoard(rs.getInt(1));
				list.add(board);
			}
			System.out.println("model.BoardDAO.getBoard_serch() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.getBoard_serch() 실패");
		}
		return list;
	}
	
	
	// no값으로 게시물 반환
	public Board getBoard(int no) {
		Board board = new Board();
		String sql = "select board.*, member.img as img from board join member on board.id=member.id where no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, no);
			ResultSet rs2 = psmt.executeQuery();
			if(rs2.next()) {
				board.setNo(no);
				board.setView_count(rs2.getInt("view_count"));
				board.setGood_count(rs2.getInt("good_count"));
				board.setBad_count(rs2.getInt("bad_count"));
				board.setReply_count(rs2.getInt("reply_count"));
				board.setId(rs2.getString("id"));
				board.setTitle(rs2.getString("title"));
				board.setContent(rs2.getString("content"));
				board.setCate(rs2.getString("cate"));
				board.setAddr(rs2.getString("addr"));
				board.setPost_date(rs2.getString("post_date"));
				board.setIsUpdate(rs2.getBoolean("isUpdate"));
				board.setOpen(rs2.getBoolean("open"));
				board.setImg(rs2.getString("img"));
				
				board.setFile_name(getBoardFile_list(no));
				board.setReply_list(getBoardReply_list(no));
				board.setFavorite_list(getFavorite_list(no));
				board.setGood_list(getGood_list(no));
				board.setBad_list(getBad_list(no));
			}
			if (rs2 != null) { rs2.close(); }
			System.out.println("model.BoardDAO.getBoard() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.getBoard() 실패");
		}
		return board;
	}
	
	// no값으로 file 목록 반환
	public List<String> getBoardFile_list(int board_no) {
		List<String> list = new ArrayList<>();
		String sql = "select file_name from boardFile where board_no = ? order by no desc";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, board_no);
			ResultSet rs3 = psmt.executeQuery();
			while (rs3.next()) {
				list.add(rs3.getString(1));
			}
			if (rs3 != null) { rs3.close(); }
			System.out.println("model.BoardDAO.getBoardFile_list() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.getBoardFile_list() 실패");
		}
		return list;
	}
	
	// no값으로 댓글 리스트 반환
	public List<BoardReply> getBoardReply_list(int board_no) {
		List<BoardReply> list = new ArrayList<>();
		String sql = "select * from boardReply where board_no = ? order by no desc";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, board_no);
			ResultSet rs3 = psmt.executeQuery();
			while (rs3.next()) {
				BoardReply boardReply = new BoardReply();
				int no = rs3.getInt("no");
				boardReply.setNo(no);
				boardReply.setBoard_no(board_no);
				boardReply.setReReply_count(rs3.getInt("reReply_count"));
				boardReply.setId(rs3.getString("id"));
				boardReply.setContent(rs3.getString("content"));
				boardReply.setPost_date(rs3.getString("post_date"));
				boardReply.setReReply_list(getBoardReReply_list(no));
				list.add(boardReply);
			}
			if (rs3 != null) { rs3.close(); }
			System.out.println("model.BoardDAO.getBoardReply_list() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.getBoardReply_list() 실패");
		}
		return list;
	}
	
	// no값으로 답글 리스트 반환
	public List<BoardReReply> getBoardReReply_list(int reply_no) {
		List<BoardReReply> list = new ArrayList<>();
		String sql = "select * from boardReReply where reply_no = ? order by no desc";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, reply_no);
			ResultSet rs4 = psmt.executeQuery();
			while (rs4.next()) {
				BoardReReply boardReReply = new BoardReReply();
				boardReReply.setNo(rs4.getInt("no"));
				boardReReply.setReply_no(reply_no);
				boardReReply.setId(rs4.getString("id"));
				boardReReply.setContent(rs4.getString("content"));
				boardReReply.setPost_date(rs4.getString("post_date"));
				list.add(boardReReply);
			}
			if (rs4 != null) { rs4.close(); }
			System.out.println("model.BoardDAO.getBoardReReply_list() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.getBoardReReply_list() 실패");
		}
		return list;
	}
	
	public List<BoardCate> getBoard_cate_list() {
		List<BoardCate> list = new ArrayList<>();
		String sql = "select * from board_cate order by no";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				BoardCate cate = new BoardCate();
				cate.setNo(rs.getInt(1));
				cate.setName(rs.getString(2));
				cate.setCate(rs.getString(3));
				cate.setPath(rs.getString(4));
				cate.setMark(rs.getString(5));
				list.add(cate);
			}
			System.out.println("model.BoardDAO.getBoard_cate_list() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.getBoard_cate_list() 실패");
		}
		return list;
	}
	
	// cate값으로 이름값 리턴
	public BoardCate get_Board_cate_name(String cate) {
		BoardCate boardcate = new BoardCate();
		
		String sql = "select name from board_cate where cate = '"+cate+"'";
		try {
			psmt =con.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				boardcate.setName(rs.getString("name"));
			}
			
			System.out.println("get_Board_cate_name()성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("get_Board_cate_name()실패");
		}
		return boardcate;
	}
	
	// 찜 누른 유저의 아이디 리스트 반환
	public List<String> getFavorite_list(int wish_no) {
		List<String> list = new ArrayList<>();
		String sql = "select member_id from wish_board where wish_no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, wish_no);
			ResultSet rs3 = psmt.executeQuery();
			while (rs3.next()) {
				String id = rs3.getString(1);
				list.add(id);
			}
			System.out.println("model.BoardDAO.getFavorite_list() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.getFavorite_list() 실패");
		}
		return list;
	}
	
	// id값으로 찜목록(리뷰) 추출
	public List<Board> getWish_board(String id) {
		List<Board> list = new ArrayList<>();
		String sql = "select wish_no from wish_board where member_id = ? order by wish_no desc";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Board board = getBoard(rs.getInt(1));
				list.add(board);
			}
			System.out.println("model.BoardDAO.getWish_board() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.getWish_board() 실패");
		}
		return list;
	}
	
	// 좋아요 누른 유저의 아이디 리스트 반환
	public List<String> getGood_list(int no) {
		List<String> list = new ArrayList<>();
		String sql = "select member_id from board_good where no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, no);
			ResultSet rs3 = psmt.executeQuery();
			while (rs3.next()) {
				String id = rs3.getString(1);
				list.add(id);
			}
			System.out.println("model.BoardDAO.getGood_list() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.getGood_list() 실패");
		}
		return list;
	}

	// 싫어요 누른 유저의 아이디 리스트 반환
	public List<String> getBad_list(int no) {
		List<String> list = new ArrayList<>();
		String sql = "select member_id from board_bad where no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, no);
			ResultSet rs3 = psmt.executeQuery();
			while (rs3.next()) {
				String id = rs3.getString(1);
				list.add(id);
			}
			System.out.println("model.BoardDAO.getBad_list() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.getBad_list() 실패");
		}
		return list;
	}
	
	// 조회수 증가
	public void insertView_count(String id, int no) {
		hasViewC(id, no);
		String sql = "insert into view_count (no, member_id) values(?, ?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, no);
			psmt.setString(2, id);
			
			psmt.executeUpdate();
			System.out.println("model.BoardDAO.insertView_count() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.insertView_count() 실패");
		}
	}
	
	// 조회수 증가 시도 시 이미 존재하는 튜플이면 튜플 삭제
	public void hasViewC(String id, int no) {
		String sql = "select * from view_count where no = ? and member_id = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, no);
			psmt.setString(2, id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				sql = "delete from view_count where no = ? and member_id = ?";
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, no);
				psmt.setString(2, id);
				psmt.executeUpdate();
			}
			System.out.println("model.BoardDAO.hasViewC() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.hasViewC() 실패");
		}
	}
	
	// 최근 본 목록
	public List<Board> get_latest(String id) {
		List<Board> list = new ArrayList<>();
		String sql = "select no from view_count where member_id = ? order by view_date desc limit 10";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Board board = getBoard(rs.getInt(1));
				list.add(board);
			}
			System.out.println("model.BoardDAO.get_latest() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardDAO.get_latest() 실패");
		}
		return list;
	}
	
	//로그인한 id, 에 임시저장 끌어오기
	public List<Board> save_list (String id ) {
		List<Board> list_save = new ArrayList<Board>();
		
		String sql ="select * from board where id =? and open =false";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Board board2 = getBoard(rs.getInt(1));
				list_save.add(board2);
			}
			System.out.println("save_list()메서드성공");
			
		} catch (Exception e) {
			System.out.println("save_list()메서드실패"+e.getMessage());
			e.printStackTrace();
		}
		
		return list_save;
	}
	
	
	// member id로 게시물  새기
	public void get_count(String id) {
		
		String sql ="select count(*) from board where id =?";
		
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				System.out.println(rs);
				System.out.println("get_count() 성공");
			}
			
		} catch (Exception e) {
			System.out.println(" get_count() 실패"+e.getMessage());
			e.printStackTrace();
		}
		
		
	}
}
