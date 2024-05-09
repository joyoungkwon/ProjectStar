package model;

import java.sql.SQLException;

import common.JDBConnect;

public class BoardReReplyDAO extends JDBConnect{
	
	// 답글 작성
	public void insertBoardReReply(BoardReReply boardReReply) {
		String sql = "insert into boardReReply (reply_no, id, content) values(?, ?, ?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, boardReReply.getReply_no());
			psmt.setString(2, boardReReply.getId());
			psmt.setString(3, boardReReply.getContent());
			psmt.executeUpdate();
			System.out.println("model.BoardReReplyDAO.insertBoardReReply() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardReReplyDAO.insertBoardReReply() 실패");
		}
	}
	
	// 답글 수정
	public void updateBoardReReply(String content, int no) {
		String sql = "update boardReReply set content = ? where no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, content);
			psmt.setInt(2, no);
			psmt.executeUpdate();
			System.out.println("model.BoardReReplyDAO.updateBoardReReply() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardReReplyDAO.updateBoardReReply() 실패");
		}
		sql = "update boardReReply set isUpdate = true where no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, no);
			psmt.executeUpdate();
			System.out.println("model.BoardReReplyDAO.updateBoardReReply()_isUpdate 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardReReplyDAO.updateBoardReReply()_isUpdate 실패");
		}
	}
	
	// 답글 삭제
	public void deleteBoardReReply(BoardReReply boardReReply) {
		String sql = "delete from boardReReply no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, boardReReply.getNo());
			psmt.executeUpdate();
			System.out.println("model.BoardReReplyDAO.deleteBoardReReply() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.BoardReReplyDAO.deleteBoardReReply() 실패");
		}
	}
}
