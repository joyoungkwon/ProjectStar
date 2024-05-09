package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	
	// 회원가입
	public void insertMember(Member member) {
		String sql = "insert into member (id, pw, user_name, img, intro) values(?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, member.getId());
			psmt.setString(2, member.getPw());
			psmt.setString(3, member.getUser_name());
			psmt.setString(4, member.getImg());
			psmt.setString(5, member.getIntro());
			psmt.executeUpdate();
			System.out.println("model.MemberDAO.insertMember() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.MemberDAO.insertMember() 실패");
		}
	}
	
	// 회원수정
	public void updateMember(String column, String value, String id) {
		String sql = "update member set "+column+" = ? where id = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, value);
			psmt.setString(2, id);
			psmt.executeUpdate();
			System.out.println("model.MemberDAO.updateMember() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.MemberDAO.updateMember() 실패");
		}
	}
	
	// 회원삭제
	public void deleteMember(String id, String pw) {
		String sql = "delete from member where id = ? and pw = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.executeUpdate();
			System.out.println("model.MemberDAO.deleteMember() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.MemberDAO.deleteMember() 실패");
		}
	}
	
	// id값으로 회원가입 유무 검사, 있음 : true | 없음 : false
	public boolean hasMember(String id) {
		boolean result = false;
		String sql = "select id from member where id = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				result = true;
			}
			System.out.println("model.MemberDAO.hasMember() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.MemberDAO.hasMember() 실패");
		}
		return result;
	}
	
	// id, pw으로 로그인, 로그인 성공 : 0, 아이디 오류 : 1, 비번 오류 : 2
	public int login(String id, String pw) {
		int result = 0;
		String sql = "select pw from member where id = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				if(!rs.getString(1).equals(pw)) {
					result = 2;
				}
			} else {
				result = 1;
			}
			System.out.println("model.MemberDAO.login() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.MemberDAO.login() 실패");
		}
		return result;
	}
	
	// 신뢰도(trust)순 회원 정렬
	public List<Member> getMember_list() {
		List<Member> list = new ArrayList<>();
		String sql = "select * from member order by trust desc";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Member member = new Member();
				member.setId(rs.getString("id"));
				member.setUser_name(rs.getString("user_name"));
				member.setTrust(rs.getInt("trust"));
				list.add(member);
			}
			System.out.println("model.MemberDAO.getMember_list() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.MemberDAO.getMember_list() 실패");
		}
		return list;
	}
	
	// id값으로 회원 정보 반환
	public Member getMember(String id) {
		Member member = new Member();
		String sql = "select * from member where id = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				String member_id = rs.getString("id");
				member.setId(member_id);
				member.setPw(rs.getString("pw"));
				member.setUser_name(rs.getString("user_name"));
				member.setImg(rs.getString("img"));
				member.setTrust(rs.getInt("trust"));
				member.setIntro(rs.getString("intro"));
				member.setAddr(rs.getString("addr"));
				member.setWish_member_list(wish_member_list(member_id));
				member.setWish_board_list(wish_board_list(member_id));
			}
			System.out.println("model.MemberDAO.getMember() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.MemberDAO.getMember() 실패");
		}
		return member;
	}
	
	// id값으로 찜목록(회원) 반환
	public List<String> wish_member_list(String id){
		List<String> list = new ArrayList<>();
		String sql = "select wish_id from wish_member where member_id = ? order by wish_date desc";
		ResultSet rs2;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs2 = psmt.executeQuery();
			while (rs2.next()) {
				list.add(rs2.getString(1));
			}
			if (rs2 != null) { rs2.close(); }
			System.out.println("model.MemberDAO.wish_member_list() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.MemberDAO.wish_member_list() 실패");
		}
		return list;
	}
	
	// id값으로 찜목록(게시물) 반환
	public List<Integer> wish_board_list(String id){
		List<Integer> list = new ArrayList<>();
		String sql = "select wish_no from wish_board where member_id = ? order by wish_date desc";
		ResultSet rs2;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs2 = psmt.executeQuery();
			while (rs2.next()) {
				list.add(rs2.getInt(1));
			}
			if (rs2 != null) { rs2.close(); }
			System.out.println("model.MemberDAO.wish_board_list() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.MemberDAO.wish_board_list() 실패");
		}
		return list;
	}
	
	// 찜목록 추가 (게시물)
	public void insertWish_board(String id, int no) {
		
		String sql = "insert into wish_board (member_id, wish_no) values (?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, no);
			psmt.executeUpdate();
			System.out.println("model.MemberDAO.insertWish_board() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.MemberDAO.insertWish_board() 실패");
		}
	}
	
	
	// 찜목록 삭제 (게시물)
	public void deleteWish_board(String id, int no) {
		String sql = "delete from wish_board where member_id = ? and wish_no = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, no);
			psmt.executeUpdate();
			System.out.println("model.MemberDAO.deleteWish_board() 성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("model.MemberDAO.deleteWish_board() 실패");
		}
	}
}
