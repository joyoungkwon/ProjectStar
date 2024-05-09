-- index.jsp에서 카테고리 목록 출력을 위해 필요
insert into  board_cate values(null, '전체보기', 'null', 'board_view.jsp', 'fa-solid fa-hashtag fa-xl');
insert into  board_cate values(null, '맛집', 'food', 'board_view.jsp?cate=food', 'fa-solid fa-utensils fa-xl');
insert into  board_cate values(null, '카페', 'cafe', 'board_view.jsp?cate=cafe', 'fa-solid fa-mug-saucer fa-xl');
insert into  board_cate values(null, '병원', 'hos', 'board_view.jsp?cate=hos', 'fa-regular fa-hospital fa-xl');
insert into  board_cate values(null, '무인매장', 'shop', 'board_view.jsp?cate=shop', 'fa-solid fa-shop fa-xl');
insert into  board_cate values(null, '헬스장', 'gym', 'board_view.jsp?cate=gym', 'fa-solid fa-dumbbell fa-xl');
insert into  board_cate values(null, '여행지', 'tra', 'board_view.jsp?cate=tra', 'fa-solid fa-plane-departure fa-xl');
insert into  board_cate values(null, '영화관', 'movie', 'board_view.jsp?cate=movie', 'fa-solid fa-film fa-xl');
insert into  board_cate values(null, '미용실', 'hair', 'board_view.jsp?cate=hair', 'fa-solid fa-scissors fa-xl');
insert into  board_cate values(null, '은행', 'bank', 'board_view.jsp?cate=bank', 'fa-solid fa-building-columns fa-xl');
insert into  board_cate values(null, '가구점', 'furn', 'board_view.jsp?cate=furn', 'fa-solid fa-couch fa-xl');
insert into  board_cate values(null, '수리점', 'eng', 'board_view.jsp?cate=eng', 'fa-solid fa-wrench fa-xl');
insert into  board_cate values(null, '동물병원', 'animal', 'board_view.jsp?cate=animal', 'fa-solid fa-dog fa-xl');
insert into  board_cate values(null, '마트', 'mart', 'board_view.jsp?cate=mart', 'fa-solid fa-cart-shopping fa-xl');
insert into  board_cate values(null, '옷가게', 'clo', 'board_view.jsp?cate=clo', 'fa-solid fa-shirt fa-xl');
insert into  board_cate values(null, '문구점', 'pen', 'board_view.jsp?cate=pen', 'fa-brands fa-waze fa-xl"></i><i class="fa-solid fa-pen fa-sm');
insert into  board_cate values(null, '붕어빵', 'fis', 'board_view.jsp?cate=fis', 'fa-solid fa-fish fa-xl');

-- 회원
insert into member (id, pw, user_name, img, intro) values('1','1','1','star.png','hi');
insert into member (id, pw, user_name, img, intro) values('2','2','2','resources/img/star.png','hi');
insert into member (id, pw, user_name, img, intro) values('3','3','3','resources/img/star.png','hi');
insert into member (id, pw, user_name, img, intro) values('4','4','4','resources/img/star.png','hi');
insert into member (id, pw, user_name, img, intro) values('5','5','5','resources/img/star.png','hi');
insert into member (id, pw, user_name, img, intro) values('6','6','6','resources/img/star.png','hi');
insert into member (id, pw, user_name, img, intro) values('7','7','7','resources/img/star.png','hi');
insert into member (id, pw, user_name, img, intro) values('8','8','8','resources/img/star.png','hi');
insert into member (id, pw, user_name, img, intro) values('9','9','9','resources/img/star.png','hi');
insert into member (id, pw, user_name, img, intro) values('10','10','10','resources/img/star.png','hi');

-- 리뷰
insert into board (id, addr, title, content, cate) values('1', '광주광역시 북구 중흥동 279-42', 'title-1', 'content-1', null);
insert into board (id, addr, title, content, cate) values('2', '서울 강남구 강남대로156길 39 지하 1층', '쿠라우니',
	'쿠라우니<br>
	유럽감성 인테리어가 멋있는 분위기 좋은 카페.<br>
	달달한 디저트 한가득 당충전 제대로 할 수 있어요.<br>
	티팟에 나오는 차도 좋고,<br>
	헤이즐럿 라떼도 디저트랑 잘 어울렸어요.<br>
	디저트 포장으로도 좋아요.<br>
	쿠키&브라우니 = 쿠라우니<br>
	달인 님은 관두셨대요..', 
	'food');
insert into board (id, addr, title, content, cate) values('3', '광주광역시 북구 중흥동 279-42', 'title-3', 'content-3', 'cafe');
insert into board (id, addr, title, content, cate) values('4', '광주광역시 북구 중흥동 279-42', 'title-4', 'content-4', 'movie');
insert into board (id, addr, title, content, cate) values('5', '광주광역시 북구 중흥동 279-42', 'title-5', 'content-5', 'movie');
insert into board (id, addr, title, content, cate) values('6', '광주광역시 북구 중흥동 279-42', 'title-6', 'content-6', 'pen');
insert into board (id, addr, title, content, cate) values('7', '광주광역시 북구 중흥동 279-42', 'title-7', 'content-7', 'pen');
insert into board (id, addr, title, content, cate) values('8', '광주광역시 북구 중흥동 279-42', 'title-8', 'content-8', 'bank');
insert into board (id, addr, title, content, cate) values('9', '광주광역시 북구 중흥동 279-42', 'title-9', 'content-9', 'bank');
insert into board (id, addr, title, content, cate) values('10', '광주광역시 북구 중흥동 279-42', 'title-10', 'content-10', null);
-- insert into board (id, addr, title, content, cate) values('sojung017@kakao.com', '광주광역시 북구 중흥동 279-42', 'hi', 'hi', null);

-- 리뷰 사진
insert into boardFile values(null, 1, 'test1.jpg');
insert into boardFile values(null, 2, 'test2.jpg');
insert into boardFile values(null, 3, 'test3.jpg');
insert into boardFile values(null, 4, 'test4.jpg');
insert into boardFile values(null, 5, 'test5.jpg');
insert into boardFile values(null, 6, 'test6.jpg');
insert into boardFile values(null, 7, 'test7.jpg');
insert into boardFile values(null, 8, 'test8.jpg');
insert into boardFile values(null, 9, 'test9.jpg');
insert into boardFile values(null, 10, 'test10.jpg');

-- 댓글
insert into boardReply (board_no, id, content) values(1, '2', 'hi');
insert into boardReply (board_no, id, content) values(3, '1', 'hi');
insert into boardReply (board_no, id, content) values(3, '2', 'hi');
insert into boardReply (board_no, id, content) values(3, '3', 'hi');
insert into boardReply (board_no, id, content) values(3, '4', 'hi');
insert into boardReply (board_no, id, content) values(3, '5', 'hi');
insert into boardReply (board_no, id, content) values(3, '6', 'hi');
insert into boardReply (board_no, id, content) values(3, '7', 'hi');
insert into boardReply (board_no, id, content) values(3, '8', 'hi');
insert into boardReply (board_no, id, content) values(3, '9', 'hi');
insert into boardReply (board_no, id, content) values(3, '10', 'hi');

-- 답글
insert into boardReReply (reply_no, id, content) values(2, '1', 'hii');
insert into boardReReply (reply_no, id, content) values(2, '2', 'hii');
insert into boardReReply (reply_no, id, content) values(2, '3', 'hii');
insert into boardReReply (reply_no, id, content) values(2, '4', 'hii');
insert into boardReReply (reply_no, id, content) values(2, '5', 'hii');
insert into boardReReply (reply_no, id, content) values(2, '6', 'hii');
insert into boardReReply (reply_no, id, content) values(2, '7', 'hii');
insert into boardReReply (reply_no, id, content) values(2, '8', 'hii');
insert into boardReReply (reply_no, id, content) values(2, '9', 'hii');
insert into boardReReply (reply_no, id, content) values(2, '10', 'hii');

