package model;

// 게시물의 댓글에 대한 답글
public class BoardReReply {
	private int no, reply_no;
	private String id, content, post_date;
	
	public int getNo() { return no; }
	public void setNo(int no) { this.no = no; }
	public int getReply_no() { return reply_no; }
	public void setReply_no(int reply_no) { this.reply_no = reply_no; }
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
	public String getPost_date() { return post_date; }
	public void setPost_date(String post_date) { this.post_date = post_date; }
}
