<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>DA 관리 프로그램</title>
<!-- menu css -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/component.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/menu.css" />
<script src="/resources/js/modernizr.custom.js"></script>
<!-- menu css끝 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
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

select {
	height: 30px;
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
						<a href="" onmouseover="loginbox()">자산관리</a> <a href=""
							onmouseover="loginbox()">위험관리</a> <a href=""
							onmouseover="loginbox()">취약점관리</a> <a href=""
							onmouseover="loginbox()">회원관리</a>
					</nav>
				</section>
			</div>

			<div class="top_right">
				<div class="login_box">
					<c:if test="${empty login_id}">
						<button id="loginBtn" type="button"
							class="btn btn-outline-secondary" style="margin-right: 10px;">로그인</button>
						<button id="joinBtn" type="button" class="btn btn-outline-danger">회원가입</button>
					</c:if>
					<c:if test="${not empty login_id}">
						<button id="" type="button" class="btn btn-outline-secondary"
							style="margin-right: 10px;"
							onclick="location.href='/user/mypage'">마이페이지</button>
						<button type="button" class="btn btn-outline-danger"
							onclick="location.href='/user/logout'">로그아웃</button>
					</c:if>
				</div>
			</div>
		</div>
		<c:if test="${empty login_id}">
			<div class="sub_menu" id="submenu">
				<div class="sub_inner">
					<div class="sub_left"></div>
					<div class="sub_center" onmouseover="loginbox()"
						onmouseleave="out()">
						<div class="sub_center_section">
							<nav class="cl-effect-3">
								<a onclick="pass_login_page()">자산 정보관리</a> <a
									onclick="pass_login_page()">단계적보안성 평가</a> <a
									onclick="pass_login_page()">공통코드 관리</a>

							</nav>
						</div>
						<div class="sub_center_section">
							<nav class="cl-effect-3">
								<a onclick="pass_login_page()">통제항목</a> <a
									onclick="pass_login_page()">통제항목 적용관리</a>
							</nav>
						</div>
						<div class="sub_center_section">
							<nav class="cl-effect-3">
								<a onclick="pass_login_page()">신규취약점 관리</a> <a
									onclick="pass_login_page()">조치권고</a> <a
									onclick="pass_login_page()">이행계획</a>

							</nav>
						</div>
						<div class="sub_center_section_last">
							<nav class="cl-effect-3">
								<a href="/user/list">사원 조회</a>
								<c:if test="${login_dept eq '관리자 그룹'}">
									<a href="/user/admin_menu">관리자페이지</a>
								</c:if>
								<a onclick="pass_login_page()">FAQ</a>
							</nav>
						</div>
					</div>
					<div class="sub_right"></div>
				</div>

			</div>
		</c:if>
		<c:if test="${not empty login_id}">
			<div class="sub_menu" id="submenu">
				<div class="sub_inner">
					<div class="sub_left"></div>
					<div class="sub_center" onmouseover="loginbox()"
						onmouseleave="out()">
						<div class="sub_center_section">
							<nav class="cl-effect-3">
								<a href="/DA/DA_list">자산 정보관리</a> <a
									href="/SecurityAssessment/list">단계적보안성 평가</a> <a
									href="/RepresentCode/Code_reList">공통코드 관리</a>

							</nav>
						</div>
						<div class="sub_center_section">
							<nav class="cl-effect-3">
								<a href="/ControlledItems/CI_manage_list">통제항목</a> <a
									href="/ControlledItemsApply/CI_list">통제항목 적용관리</a>
							</nav>
						</div>
						<div class="sub_center_section">
							<nav class="cl-effect-3">
								<a href="/vulnerability/vul_list">신규취약점 관리</a> <a
									href="/ActionRecommend/list">조치권고</a> <a href="/Action/list">이행계획</a>

							</nav>
						</div>
						<div class="sub_center_section_last">
							<nav class="cl-effect-3">
								<a href="/user/list">사원 조회</a>
								<c:if test="${login_dept eq '관리자 그룹'}">
									<a href="/user/admin_menu">관리자페이지</a>
								</c:if>
								<a href="/FAQ">FAQ</a>
							</nav>
						</div>
					</div>
					<div class="sub_right"></div>
				</div>

			</div>
		</c:if>
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

		function pass_login_page() {
			alert("먼저 로그인을 한 뒤 서비스를 이용하실 수 있습니다.");
			self.location = "/user/login";
		}
		/*$('a').click(function() {
			$(".loding-inner").show();
		});*/
	</script>
	<!-- base끝 -->