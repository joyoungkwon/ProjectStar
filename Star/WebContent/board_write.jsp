<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! String pageName = "리뷰작성"; %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<!-- 1. 반응형 meta 태그 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 2. 부트스트랩 CDN 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<!-- 3. 내 스타일은 부트스트랩 스타일 뒤에 -->
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/board_view.css">
<link rel="stylesheet" href="resources/css/board_big.css">
<link rel="stylesheet" href="resources/css/board_write.css">
<!-- 5. 아이콘 끌어오기 (폰트어썸)-->
<script src="https://kit.fontawesome.com/64319e1cb9.js" crossorigin="anonymous"></script>
<!-- 6. 구글 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<!-- 이미지 자르기 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.13/cropper.min.css" integrity="sha512-cyzxRvewl+FOKTtpBzYjW6x6IAYUCZy3sGP40hn+DQkqeluGRCax7qztK2ImL64SA+C7kVWdLI6wvdlStawhyw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>글 작성 페이지</title>
</head>
<body>
	<c:set var="pageName" value="<%=pageName %>"></c:set>
	<%@ include file="menu_bar.jsp" %>
	<div id="board_container" class="container text-center">
    	<div class="row custom_row_basic">
			<div class="col-12">
				<form action="writer.board" method="post" enctype="multipart/form-data" class="content_col_big" name="writer_frm">
					<!-- input type=file 이 들어갈 공간 -->
					<div id="inputFile">
						<!-- 파일 업로드를 위한 input 요소, 숨겨두기 display: none -->
						<input type="file" id="file1" name="imgfile1" onchange="ImgFileview(event)"> 
						<input type="file" id="file2" name="imgfile2" onchange="ImgFileview(event)"> 
						<input type="file" id="file3" name="imgfile3" onchange="ImgFileview(event)"> 
						<input type="file" id="file4" name="imgfile4" onchange="ImgFileview(event)"> 
						<input type="file" id="file5" name="imgfile5" onchange="ImgFileview(event)"> 
						<input type="file" id="file6" name="imgfile6" onchange="ImgFileview(event)"> 
						<input type="file" id="file7" name="imgfile7" onchange="ImgFileview(event)"> 
						<input type="file" id="file8" name="imgfile8" onchange="ImgFileview(event)"> 
						<input type="file" id="file9" name="imgfile9" onchange="ImgFileview(event)"> 
						<input type="file" id="file10" name="imgfile10" onchange="ImgFileview(event)"> 
					</div>
					<input type="hidden" id="open" name="open">
					<div class="big content_head">
						<div class="write_head flex wid-100 hei-90 flex-ali-center">
							<div class="profile">
								<img class="profile_img" src="${login_img}">
							</div> <!-- /.profile -->
							<div id="user_id">${login_id}</div>
							<div class="middle_i">
								<button type="button" id="fileUpload_btn" onclick="openFileUpload()">
									<!-- input type=file 클릭 시킴-->
									<i class="fa-regular fa-images fa-2xl" style="color: #ffffff;"></i>
									<!--  이미지 아이콘 -->
									<i class="fa-solid fa-plus fa-sm" style="color: #ffffff;"></i>
								</button>
							</div> <!-- /.middle_i -> 사진 업로드 할 버튼 -->
						</div> <!-- /.write_head -->
					</div> <!-- /.content_head -->
					
					<div class="big content_img write_img">
	
						<!-- 작성 페이지에서 캐러셀은 사진을 추가 했을 때 나타나야 함. 그 전엔 안보이게 하기 -->
						<!-- 슬라이드 캐러셀-->
						<div id="carousel" class="carousel slide">
							<!-- 하단 위치 표시 (인디케이터)-->
							<div class="carousel-indicators" id="carouselIndicators">
								<!-- 이 안에서 선택한 이미지들에 대한 인디케이터가 동적으로 추가됨 -->
							</div>
							<!-- carousel-indicators 닫기 -->
							
							
							<!-- 이미지 나오는 부분 -->
							<div class="carousel-inner hei-100" id="carouselInner">
								<!-- 여기서 선택한 이미지들이 동적으로 추가됨-->
								<!-- (지도는 맨 뒤에!)-->
								<!-- addr(api지도)<input type="text" name="addr"> 이건 어디에 둬야 할지 몰라서..-->
							</div>
							<!-- carousel-inner 닫기 -->
	
							<!--왼쪽 오른쪽 화살표 버튼-->
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carousel" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">이전</span>
							</button>
							<!--왼쪽 < -->
							<button class="carousel-control-next" type="button"
								data-bs-target="#carousel" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">다음</span>
							</button>
							<!-- 오른쪽 > -->
						</div> <!-- 슬라이드 캐러셀 끝 -->
					</div> <!-- /.write_img -->
					<div class="big write_title">
						제목 &nbsp; <input type="text" name="title">
					</div> <!-- /.content_title (big에서 .content_midbar랑 같은 위치)-->
					<div class="big write_content">
						<div class="hei-1"></div>
						<div>내용</div>
						<div>
							<textarea name="content" rows="5"></textarea>
						</div>
						<div class="hei-1"></div>
					</div> <!-- /.write_content -->
					<div class="big write_submit">
						<div id="option_div" class="save_div">
							<button type="button" class="btn btn-white" onclick="upload(true)">저장</button>
							<button type="button" class="btn btn-white" onclick="upload(false)">임시저장</button>
						</div> <!-- /.option_div -->
					</div> <!-- /.write_submit -->
				</form>
    		</div> <!-- /.col-12 -->
 		</div> <!-- /.custom_row_basic -->
 	</div> <!-- /#board_container -->
	
	<!-- 영권  -->
	
	<!-- <form action="writer.board" method="post" enctype="multipart/form-data" name="writer_frm" id="writer_frm">	
		<p>cate</p><input type="text" name="cate">
		<p>addr(api지도)</p><input type="text" name="addr">
	</form> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/board_write.js" ></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>