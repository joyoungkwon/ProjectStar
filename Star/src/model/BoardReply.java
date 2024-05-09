package model;

import java.util.List;

// 게시물의 댓글
public class BoardReply {
	private int no, board_no, reReply_count;
	private String id, content, post_date;
	
	// 답글 목록
	private List<BoardReReply> reReply_list;
	
	public int getNo() { return no; }
	public void setNo(int no) { this.no = no; }
	public int getBoard_no() { return board_no; }
	public void setBoard_no(int board_no) { this.board_no = board_no; }
	public int getReReply_count() { return reReply_count; }
	public void setReReply_count(int reReply_count) { this.reReply_count = reReply_count; }
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
	public String getPost_date() { return post_date; }
	public void setPost_date(String post_date) { this.post_date = post_date; }
	public List<BoardReReply> getReReply_list() { return reReply_list; }
	public void setReReply_list(List<BoardReReply> reReply_list) { this.reReply_list = reReply_list; }
}
