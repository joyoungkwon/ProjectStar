 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/layout.css">
	<link rel="stylesheet" href="resources/css/login.css">
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<title>로그인</title>
</head>
<body class="hei-100vh">
	<div id="top" class="wid-100 hei-7 flex flex-ali-center flex-between">
		<div class="wid-10 hei-35">
			<img onclick="location.href='index.jsp'" class="hei-100 btn" alt="lt" src="resources/img/lt.png">
		</div>
		<p class="vh20">로그인</p>
		<div class="wid-10"></div>
	</div>
	<form action="login.member" name="frm" method="post" class="wid-100 hei-93 flex flex-column flex-ali-center">
		<div class="wid-100 hei-30 flex flex-center">
			<img class="hei-60" alt="star" src="resources/img/star.png">
		</div>
		<div class="wid-90 hei-30 flex flex-column">
			<input id="write" class="hei-30 vh25" type="text" name="id" placeholder="계정">
			<input id="write" class="hei-30 vh25" type="password" name="pw" placeholder="비밀번호">
			<div class="wid-100 hei-30 flex flex-ali-center">
				<div class="wid-3"></div>
				<input type="checkbox" id="check" name="auto">
				<label class="hei-30 wid-5 check" for="check"></label>
				<div class="wid-3"></div>
				<div class="vh20" style="color: white;">자동 로그인</div>
			</div>
		</div>
		<div class="wid-100 hei-7_5 flex flex-center">
			<button id="login_btn" onclick="submit()" class="wid-90 hei-90 btn">로그인</button>
		</div>
		<input type="hidden" name="email">
		<input type="hidden" name="user_name">
		<input type="hidden" name="img">
	</form>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
		window.Kakao.init('5e6b74ea4529faab016309dd56092033');
		function kakaoLogin(){
			window.Kakao.Auth.login({
				scope:'profile_nickname, profile_image, account_email',
				success: function(authObj){
					window.Kakao.API.request({
						url:'/v2/user/me',
						success: res => {
							const kakao_account = res.kakao_account;
							document.frm.elements['id'].disabled = true;
							document.frm.id.value = kakao_account.email;
							document.frm.email.value = kakao_account.email;
							document.frm.user_name.value = kakao_account.profile.nickname;
							document.frm.img.value = kakao_account.profile.profile_image_url;
							alert('비밀번호 입력 후 로그인해주세요.');
						}
					});			
				}
			});
		}
		<c:if test="${not empty noid}">
			if(!document.frm.elements['id'].disabled){
				if(confirm('등록되지 않은 아이디입니다.\n회원가입 페이지로 이동하시겠습니까?')){
					kakaoLogin();
				}
			}
		</c:if>
	</script>
</body>
</html>