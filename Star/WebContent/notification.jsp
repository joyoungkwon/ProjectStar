<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!String pageName = "내활동";%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 2. 부트스트랩 CDN 링크 --> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/board_big.css">
<link rel="stylesheet" href="resources/css/board_view.css">
<link rel="stylesheet" href="resources/css/notification.css">
<!-- 5. 아이콘 끌어오기 (폰트어썸)-->
<script src="https://kit.fontawesome.com/64319e1cb9.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<title>내활동</title>
</head>

<body>
	<c:set var="pageName" value="<%=pageName%>"></c:set>
	<%@ include file="menu_bar.jsp"%>
	<div class="hei-1"></div> <!-- head랑 본문이 너무 딱붙어있어서 높이 추가 -->
      <div id="board_container" class="container text-center">
        <div class="row custom_row_basic user_con">
           <!-- 크게보기 (big) -->
          <div class="col-12">
            <div class="content_col_big noti_col_big">

              <div class="noti_content">

                <div class="bline">
                  <i class="fa-solid fa-fire fa-lg" style="color: #f27c1c;"></i>
                  <div class="wid-3"></div> 
                  <div class="in_text">최근 빛가람동 인기글 1위는?</div>
                </div>

                <div class="bline">
                  <i class="fa-solid fa-thumbs-up fa-lg" style="color: #1d69ed;"></i>
                  <div class="wid-3"></div>
                  <div class="in_text">user1님이 회원님에 글에 좋아요를 눌렀어요!</div> 
                </div>

                <div class="bline">
                  <i class="fa-solid fa-fish-fins fa-lg" style="color: #dea221;"></i>
                  <div class="wid-3"></div>
                  <div class="in_text">'붕어빵' 카테고리에 새로운 글이 등록되었어요!</div> 
                </div>

                <div class="bline">
                  <i class="fa-solid fa-thumbs-down fa-lg" style="color: #1d69ed;"></i>
                  <div class="wid-3"></div>
                  <div class="in_text">'user2' 님이 회원님에 글에 싫어요를 눌렀어요 </div> 
                </div>

                <div class="bline">
                  <i class="fa-solid fa-comment-dots fa-lg" style="color: #1dd11a;"></i>
                  <div class="wid-3"></div>
                  <div class="in_text">회원님의 게시글에 댓글이 달렸어요. 지금 확인해 볼까요? </div> 
                </div>

                <div class="bline">
                  <i class="fa-solid fa-comment-dots fa-lg" style="color: #1dd11a;"></i>
                  <div class="wid-3"></div>
                  <div class="in_text">회원님의 게시글에 'ㅇㅇㅇ' 님이 댓글을 달았어요. </div> 
                </div>

                <div class="bline">
                  <i class="fa-solid fa-caret-up fa-lg" style="color: red;"></i>
                  <div class="wid-3"></div>
                  <div class="in_text">최근 'ㅇㅇㅇ' 카테고리의 조회 수가 급증했어요. 가서 확인해 볼까요? </div> 
                </div>

                <div class="bline">
                  <i class="fa-solid fa-circle-user fa-lg" style="color: #1d69ed;"></i>
                  <div class="wid-3"></div>
                  <div class="in_text">'AAA' 님이 회원님을 팔로우하기 시작했어요. </div> 
                </div>

                <div class="bline">
                  <i class="fa-solid fa-mug-hot fa-lg" style="color: #846e0b;"></i>
                  <div class="wid-3"></div>
                  <div class="in_text">이번 주, 리뷰가 가장 많이 등록된 카페는 어디일까요? 맛있는 커피를 찾아서!</div> 
                </div>
              
                <div class="bline">
                  <i class="fa-solid fa-lock fa-lg" style="color: #2adfdc;"></i>
                  <div class="wid-3"></div>
                  <div class="in_text">ㅇㅇ 님! 임시저장했던 글을 업로드해주세요. 사람들이 리뷰를 기다리고 있어요!</div> 
                </div>

                
                <div class="bline">
                  <i class="fa-solid fa-circle-user fa-lg" style="color: #1d69ed;"></i>
                  <div class="wid-3"></div>
                  <div class="in_text">'AAA' 님이 회원님을 팔로우하기 시작했어요. </div> 
                </div>

                <div class="bline">
                  <i class="fa-solid fa-mug-hot fa-lg" style="color: #846e0b;"></i>
                  <div class="wid-3"></div>
                  <div class="in_text">이번 주, 리뷰가 가장 많이 등록된 카페는 어디일까요? 맛있는 커피를 찾아서!</div> 
                </div>
              
                <div class="bline">
                  <i class="fa-solid fa-lock fa-lg" style="color: #2adfdc;"></i>
                  <div class="wid-3"></div>
                  <div class="in_text">ㅇㅇ 님! 임시저장했던 글을 업로드해주세요. 사람들이 리뷰를 기다리고 있어요!</div> 
                </div>

                
                <div class="bline">
                  <i class="fa-solid fa-circle-user fa-lg" style="color: #1d69ed;"></i>
                  <div class="wid-3"></div>
                  <div class="in_text">'AAA' 님이 회원님을 팔로우하기 시작했어요. </div> 
                </div>

                <div class="bline">
                  <i class="fa-solid fa-mug-hot fa-lg" style="color: #846e0b;"></i>
                  <div class="wid-3"></div>
                  <div class="in_text">이번 주, 리뷰가 가장 많이 등록된 카페는 어디일까요? 맛있는 커피를 찾아서!</div> 
                </div>
              
                <div class="bline">
                  <i class="fa-solid fa-lock fa-lg" style="color: #2adfdc;"></i>
                  <div class="wid-3"></div>
                  <div class="in_text">ㅇㅇ 님! 임시저장했던 글을 업로드해주세요. 사람들이 리뷰를 기다리고 있어요!</div> 
                </div>

              </div> <!-- noti_content 닫기 -->
            </div> <!-- noti_col_big 닫기 -->
          </div> <!-- col-12 닫기 -->
        </div> <!-- user_con 닫기 -->
    </div> <!-- board_container 닫기 -->
</body>
</html>