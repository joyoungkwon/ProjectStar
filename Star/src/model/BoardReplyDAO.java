package model;

import java.sql.SQLException;

import common.JDBConnect;

public class BoardReplyDAO extends JDBConnect{
	
	// 댓글 작성, 해당 board 테이블의 reply_count값은 DB에서 트리거로 증가
	public void insertBoardReply(BoardReply boardReply) {
		String sql = "insert into boardReply (board_no, id, content) values(?, ?, ?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, boardReply.getBoard_no());
			psmt.setString(2, boardReply.getId());
			psmt.setString(3, boardReply.getContent());
			
			psmt.executeUpdate();
			System.out.println("model.BoardReplyDAO.insertBoardReply() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardReplyDAO.insertBoardReply() 실패");
		}
	}
	
	// 댓글 수정
	public void updateBoardReply(String content, int no) {
		String sql = "update boardReply set content = ? where no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, content);
			psmt.setInt(2, no);
			psmt.executeUpdate();
			System.out.println("model.BoardReplyDAO.updateBoardReply() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardReplyDAO.updateBoardReply() 실패");
		}
		sql = "update boardReply set isUpdate = true where no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, no);
			psmt.executeUpdate();
			System.out.println("model.BoardReplyDAO.updateBoardReply()_isUpdate 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardReplyDAO.updateBoardReply()_isUpdate 실패");
		}
	}
	
	// 댓글 삭제, 해당 board 테이블의 reply_count값은 DB에서 트리거로 감소
	public void deleteBoardReply(BoardReply boardReply) {
		String sql = "delete from boardReply no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, boardReply.getNo());
			psmt.executeUpdate();
			System.out.println("model.BoardReplyDAO.deleteBoardReply() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardReplyDAO.deleteBoardReply() 실패");
		}
	}
}
