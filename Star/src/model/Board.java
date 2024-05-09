package model;

import java.util.List;

// 게시물
// 2023 12 - 04 영권 dto , int 타입 open 추가
public class Board {
	private int no, view_count, good_count, bad_count, reply_count ;
	private String id, title, content, cate, addr, post_date, img;
	private boolean isUpdate ,open;

	// boardFile table에서 가져올 값
	private List<String> file_name;
	
	// 댓글 목록
	private List<BoardReply> reply_list;
	
	// 찜 누른 유저의 아이디 리스트
	private List<String> favorite_list;
	
	// 좋아요 누른 유저의 아이디 리스트
	private List<String> good_list;
	// 싫어요 누른 유저의 아이디 리스트
	private List<String> bad_list;

	public int getNo() { return no; }
	public void setNo(int no) { this.no = no; }
	public int getView_count() { return view_count; }
	public void setView_count(int view_count) { this.view_count = view_count; }
	public int getGood_count() { return good_count; }
	public void setGood_count(int good_count) { this.good_count = good_count; }
	public int getBad_count() { return bad_count; }
	public void setBad_count(int bad_count) { this.bad_count = bad_count; }
	public int getReply_count() { return reply_count; }
	public void setReply_count(int reply_count) { this.reply_count = reply_count; }
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
	public String getCate() { return cate; }
	public void setCate(String cate) { this.cate = cate; }
	public String getAddr() { return addr; }
	public void setAddr(String addr) { this.addr = addr; }
	public String getPost_date() { return post_date; }
	public void setPost_date(String post_date) { this.post_date = post_date; }
	public boolean getIsUpdate() { return isUpdate; }
	public void setIsUpdate(boolean isUpdate) { this.isUpdate = isUpdate; }
	public List<String> getFile_name() { return file_name; }
	public void setFile_name(List<String> file_name) { this.file_name = file_name; }
	public List<BoardReply> getReply_list() { return reply_list; }
	public void setReply_list(List<BoardReply> reply_list) { this.reply_list = reply_list; }
	public List<String> getFavorite_list() { return favorite_list; }
	public void setFavorite_list(List<String> favorite_list) { this.favorite_list = favorite_list; }
	public List<String> getGood_list() { return good_list; }
	public void setGood_list(List<String> good_list) { this.good_list = good_list; }
	public List<String> getBad_list() { return bad_list; }
	public void setBad_list(List<String> bad_list) { this.bad_list = bad_list; }
	public boolean isOpen() {return open;}
	public void setOpen(boolean open) {this.open = open;}
	public String getImg() { return img; }
	public void setImg(String img) { this.img = img; }
	
	
}
