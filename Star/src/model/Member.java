package model;

import java.util.List;

// 멤버
public class Member {
	private String id, pw, user_name, img, intro, addr;
	private int trust;
	
	// frends table에서 가져올 값
	private List<String> wish_member_list;
	
	// wish table에서 가져올 값
	private List<Integer> wish_board_list;

	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	public String getPw() { return pw; }
	public void setPw(String pw) { this.pw = pw; }
	public String getUser_name() { return user_name; }
	public void setUser_name(String user_name) { this.user_name = user_name; }
	public String getImg() { return img; }
	public void setImg(String img) { this.img = img; }
	public int getTrust() { return trust; }
	public void setTrust(int trust) { this.trust = trust; }
	public String getIntro() { return intro; }
	public void setIntro(String intro) { this.intro = intro; }
	public String getAddr() { return addr; }
	public void setAddr(String addr) { this.addr = addr; }
	public List<String> getWish_member_list() { return wish_member_list; }
	public void setWish_member_list(List<String> wish_member_list) { this.wish_member_list = wish_member_list; }
	public List<Integer> getWish_board_list() { return wish_board_list; }
	public void setWish_board_list(List<Integer> wish_board_list) { this.wish_board_list = wish_board_list; }
	
	
}
