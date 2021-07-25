<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- menu css -->
<link rel="shortcut icon" href="/resources/favicon.ico">
<link rel="stylesheet" type="text/css" href="/resources/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/demo.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/component.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/menu.css" />
<script src="/resources/js/modernizr.custom.js"></script>
<!-- menu css끝 -->

<!-- bootstrap link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
	integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
	crossorigin="anonymous"></script>
<!-- bootstrap link끝 -->



<style>
.text_body {
	width: 100%;
	height: 2500px;
	position: relative;
	top: 80px;
	left: 0px;
}

.top_img {
	width: 100%;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body>
	<!-- base페이지입니다. -->
	<div class="base_top">
		<div class="main_menu">
			<div class="top_left">
				<span class="title"><a href="/">DA 관리 프로그램</a></span>
			</div>
			<div class="top_center" onmouseleave="out()">
				<section class="color-6">
					<nav class="cl-effect-13">
						<a href="#" onmouseover="loginbox()">자산관리</a> <a href="#"
							onmouseover="loginbox()">위험관리</a> <a href="#"
							onmouseover="loginbox()">취약점관리</a> <a href="#"
							onmouseover="loginbox()">회원관리</a>

					</nav>
				</section>
			</div>
			<div class="top_right">
				<div class="login_box">
					<button id="loginBtn" type="button" class="btn btn-outline-secondary"
						style="margin-right: 10px;">로그인</button>
					<button id="joinBtn" type="button" class="btn btn-outline-danger">회원가입</button>
				</div>
			</div>
		</div>

		<div class="sub_menu" id="submenu">
			<div class="sub_inner">
				<div class="sub_left"></div>
				<div class="sub_center" onmouseover="loginbox()"
					onmouseleave="out()">
					<div class="sub_center_section">
						<nav class="cl-effect-3">
							<a href="./DA/DA_list.html">자산 정보관리</a> <a
								href="./SecurityAssessment/SA_list.html">단계적보안성 평가</a> <a
								href="./code/Code_reList.html">공통코드 관리</a>

						</nav>
					</div>
					<div class="sub_center_section">
						<nav class="cl-effect-3">
							<a href="./controlled_items/Cl_manage_list.html">통제항목</a> <a
								href="./controlled_items/CI_list.html">통제항목 적용관리</a>
						</nav>
					</div>
					<div class="sub_center_section">
						<nav class="cl-effect-3">
							<a href="./vulnerability/new_vulnerability_list.html">신규취약점
								관리</a> <a href="./vulnerability/vul_action_recomm_list.html">조치권고</a>
							<a href="./vulnerability/vul_imple_plan_list.html">이행계획</a>

						</nav>
					</div>
					<div class="sub_center_section_last">
						<nav class="cl-effect-3">
							<a href="./user/user_list.html">사원 조회</a> <a
								href="./user/admin_menu.html">관리자페이지</a> <a
								href="./user/FNQ.html">FAQ</a>
						</nav>
					</div>
				</div>
				<div class="sub_right"></div>
			</div>

		</div>
	</div>

	<script type="text/javascript">
		function MM_changeProp(objId, x, theProp, theValue) { //v9.0
			var obj = null;
			with (document) {
				if (getElementById)
					obj = getElementById(objId);
			}
			if (obj) {
				if (theValue == true || theValue == false)
					eval("obj.style." + theProp + "=" + theValue);
				else
					eval("obj.style." + theProp + "='" + theValue + "'");
			}
		}
		function loginbox() {
			var obj = document.getElementById("submenu");
			obj.style.display = "block"; // 블록 박스로 변경
		}
		function out() {
			var obj = document.getElementById("submenu");
			obj.style.display = "none"; // 안보이게
		}
		
		$("#loginBtn").on("click", function() {
			self.location = "/user/login";
		})
		
		$("#joinBtn").on("click", function() {
			self.location = "/user/join";
		})
	</script>
	<!-- base끝 -->