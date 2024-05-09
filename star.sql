create DATABASE star;
drop DATABASE star;

create table member(
    id varchar(50) not null primary key,
    pw varchar(50) not null,
    user_name varchar(20) not null unique,
    img varchar(500),
    trust int default 5000,
    intro varchar(300),
    addr varchar(100)
);

create table board(
	no int AUTO_INCREMENT PRIMARY key,
    id varchar(50) not null,
    title varchar(50),
    content varchar(300),
    cate varchar(20),
    addr varchar(100) not null,
    post_date datetime default CURRENT_TIMESTAMP,
    isUpdate boolean default false,
    view_count int default 0,
    good_count int default 0,
    bad_count int default 0,
    reply_count int default 0,
    open boolean default true,
    foreign key (id) references member (id) on delete cascade
);

create table wish_member(
	member_id varchar(100) not null,
	wish_id varchar(100) not null,
    wish_date datetime default CURRENT_TIMESTAMP,
    primary key (member_id, wish_id),
    foreign key (member_id) references member (id) on delete cascade,
    foreign key (wish_id) references member (id) on delete cascade
);

create table wish_board(
	member_id varchar(100) not null,
    wish_no int not null,
    wish_date datetime default CURRENT_TIMESTAMP,
    primary key (member_id, wish_no),
    foreign key (member_id) references member (id) on delete cascade,
    foreign key (wish_no) references board (no) on delete cascade
);

create table boardFile(
	no int AUTO_INCREMENT primary key,
    board_no int not null,
    file_name varchar(200) not null,
    foreign key (board_no) REFERENCES board(no) on delete cascade
);

create table boardReply(
	no int AUTO_INCREMENT PRIMARY key,
    board_no int not null,
    id varchar(50) not null,
    content varchar(300) not null,
    post_date datetime default CURRENT_TIMESTAMP,
    isUpdate boolean default false,
    good_count int default 0,
    bad_count int default 0,
	reReply_count int default 0,
    foreign key (board_no) REFERENCES board(no) on delete cascade,
    foreign key (id) references member (id) on delete cascade
);

create table boardReReply(
	no int AUTO_INCREMENT PRIMARY key,
    reply_no int not null,
    id varchar(50) not null,
    content varchar(300) not null,
    post_date datetime default CURRENT_TIMESTAMP,
    isUpdate boolean default false,
    good_count int default 0,
    bad_count int default 0,
    foreign key (reply_no) REFERENCES boardReply(no) on delete cascade,
    foreign key (id) references member (id) on delete cascade
);

create table board_good(
	no int not null,
    member_id varchar(50) not null,
    primary key (no, member_id),
    foreign key (no) references board (no) on delete cascade
);

create table board_bad(
	no int not null,
    member_id varchar(50) not null,
    primary key (no, member_id),
    foreign key (no) references board (no) on delete cascade
);

create table boardReply_Good(
	no int not null,
    member_id varchar(50) not null,
    primary key (no, member_id),
    foreign key (no) references boardReply (no) on delete cascade
);

create table boardReply_bad(
	no int not null,
    member_id varchar(50) not null,
    primary key (no, member_id),
    foreign key (no) references boardReply (no) on delete cascade
);

create table boardReReply_Good(
	no int not null,
    member_id varchar(50) not null,
    primary key (no, member_id),
    foreign key (no) references boardReReply (no) on delete cascade
);

create table boardReReply_bad(
	no int not null,
    member_id varchar(50) not null,
    primary key (no, member_id),
    foreign key (no) references boardReReply (no) on delete cascade
);

create table board_cate(
	no int AUTO_INCREMENT PRIMARY key,
	name varchar(30),
    cate varchar(20),
	path varchar(100) not null,
    mark varchar(500)
);

create table view_count(
	no int not null,
    member_id varchar(50) not null,
    view_date datetime default CURRENT_TIMESTAMP,
    primary key (no, member_id),
    foreign key (no) references board (no) on delete cascade
);