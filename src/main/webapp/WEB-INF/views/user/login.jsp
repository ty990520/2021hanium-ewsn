<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" href="../../../resources/css/login.css">

<style>
.text_body {
	width: 100%;
	height: 1500px;
	position: relative;
	top: 80px;
	left: 0px;
}
</style>
</head>
<div class="wrap"float:left;>
	<div class="login">
		<h2>로그인</h2>

		<div class="login_id">

			<input type="email" name="" id="" placeholder="사번 입력">
		</div>
		<div class="login_pw">

			<input type="password" name="" id="" placeholder="비밀번호 입력">
		</div>


		<div class="submit">
			<input type="submit" value="로그인">
		</div>

		<div class="login_etc">
			<div class="forgot_pw">
				<br> <a href="./join.html"> 회원가입 | </a> <a href=""
					onclick="findPw()">비밀번호 찾기 </a>
			</div>
		</div>
	</div>

</div>
<script>
	function findPw() {
		if (confirm("비밀번호 찾기는 소속의 담당 관리자에게 문의해주세요.\n확인을 누르면 메일창으로 이동합니다.") == true) {
			window
					.open('mailto:admin@ewsnproj.com?subject=비밀번호를 잊어버렸습니다.&body=소속:사번:주민등록번호을 입력해주세요.');
		} else {
			return;
		}
	}
</script>
<%@include file="../includes/footer.jsp"%>