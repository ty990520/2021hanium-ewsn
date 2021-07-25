<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css" href="../../../resources/css/join3.css" />
<style>
.text_body {
	width: 100%;
	height: 1500px;
	position: relative;
	top: 80px;
	left: 0px;
}

.check_img {
	width: 100px;
}

h2 {
	color: #6c757dbf;
	font-weight: bold;
}
</style>
</head>
<div class="img">
		<img src="../../../resources/img/join3.png">
	</div>

	<form action="" id="joinForm">
		<ul class="join_box">
			<li><img class="check_img" src="../../../resources/img/lock2.png"></li>
			<br><br>
			<h2>
				관리자에게 승인을 <br>요청하였습니다.
			</h2>
			<br>
			<h7>관리자의 승인 후 로그인이 가능합니다.<br>
			승인 요청 후 12시간 뒤에 다시 로그인을 시도해주세요. </h7>
		</ul>

		<ul class="footBtwrap clearfix">
			<li><button type="button" class="btn btn-light btn-lg" id="loginBtn1">로그인</button></li>
			<li><button type="button" class="btn btn-danger btn-lg" id="homeBtn">메인화면으로 이동</button></li>
		</ul>
	</form>

<BR><BR>

	<script>
	$("#loginBtn1").on("click", function() {
		self.location = "/user/login";
	})
	
	$("#homeBtn").on("click", function() {
		self.location = "/";
	})
	</script>
<%@include file="../includes/footer.jsp"%>