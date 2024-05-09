-- 댓글 작성시
delimiter //
create trigger reply_insert
	after insert
	on boardReply
	for each row
begin
	update board set reply_count = reply_count +1 where no = new.board_no;
end //
delimiter ;

-- 댓글 삭제시
delimiter //
create trigger reply_delete
	after delete
	on boardReply
	for each row
begin
	update board set reply_count = reply_count -1 where no = old.board_no;
end //
delimiter ;

-- 답글 작성시
delimiter //
create trigger rereply_insert
	after insert
	on boardrereply
	for each row
begin
	update boardreply set reReply_count = reReply_count +1 where no = new.reply_no;
end //
delimiter ;

-- 답글 삭제시
delimiter //
create trigger rereply_delete
	after delete
	on boardrereply
	for each row
begin
	update boardreply set reReply_count = reReply_count -1 where no = old.reply_no;
end //
delimiter ;

-- 좋아요 클릭 시
delimiter //
create trigger boardGood_insert
	after insert
	on board_good
	for each row
begin
	update board set good_count = good_count + 1 where no = new.no;
end //
delimiter ;

-- 좋아요 해제 시
delimiter //
create trigger boardGood_delete
	after delete
	on board_good
	for each row
begin
	update board set good_count = good_count - 1 where no = old.no;
end //
delimiter ;

-- 싫어요 클릭 시
delimiter //
create trigger boardBad_insert
	after insert
	on board_bad
	for each row
begin
	update board set bad_count = bad_count + 1 where no = new.no;
end //
delimiter ;

-- 싫어요 해제 시
delimiter //
create trigger boardBad_delete
	after delete
	on board_bad
	for each row
begin
	update board set bad_count = bad_count - 1 where no = old.no;
end //
delimiter ;

-- 조회수 증가
delimiter //
create trigger view_count_up
	after insert
	on view_count
	for each row
begin
	update board set view_count = view_count + 1 where no = new.no;
end //
delimiter ;

-- 조회수 감소
delimiter //
create trigger view_count_down
	after delete
	on view_count
	for each row
begin
	update board set view_count = view_count - 1 where no = old.no;
end //
delimiter ;