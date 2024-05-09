package model;

import java.sql.SQLException;

import common.JDBConnect;

public class GoodBadDAO extends JDBConnect{
	
	// 좋아요 | 싫어요 버튼 클릭, table 목록 : board_Good | board_Bad
	// 해당 board 테이블의 good_count|bad_count값은 DB에서 트리거로 증감
	public void insertGB(String table, int no, String id) {
		String sql = "insert into "+table+" values(?, ?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, no);
			psmt.setString(2, id);
			
			psmt.executeUpdate();
			System.out.println("model.GoodBadDAO.insertGB() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.GoodBadDAO.insertGB() 실패");
		}
	}
	
	// 좋아요 | 싫어요 취소, table 목록 : board_Good | board_Bad
	public void cancelGB(String table, int no, String id) {
		String sql = "delete from "+table+" where no = ? and member_id = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, no);
			psmt.setString(2, id);
			
			psmt.executeUpdate();
			System.out.println("model.GoodBadDAO.cancelGB() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.GoodBadDAO.cancelGB() 실패");
		}
	}

}
