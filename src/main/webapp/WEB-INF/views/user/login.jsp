<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" href="../../../resources/css/login.css">
<link rel="stylesheet" href="../../../resources/css/alert.css">
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
<div class="wrap">
	<form action="/user/user_login" method="post">
		<div class="login">
			<h2>로그인</h2>

			<div class="login_id">

				<input type="email" name="userid" id="userid" placeholder="사번 입력">
			</div>
			<div class="login_pw">

				<input type="password" name="userpw" id="userpw"
					placeholder="비밀번호 입력">
			</div>
			<div class="notify">
				<span id="notifyType" class=""></span>
			</div>

			<div class="submit">
				<input class="buutton" type="button" value="로그인" onclick="login()">

			</div>

			<div class="login_etc">
				<div class="forgot_pw">
					<br> <a href="/user/join"> 회원가입 | </a> <a href=""
						onclick="findPw()">비밀번호 찾기 </a>
				</div>
			</div>
		</div>
	</form>
</div>

<script>
	/*login*/
	/*사번 인증*/
	function login() {
		var userid = $('#userid').val();
		var userpw = $('#userpw').val();
		//alert(userid+","+userpw);
		$.ajax({
			contentType : "application/json; charset=UTF-8",
			type : "get",
			url : "/user/user_login",
			data : {
				"userid" : userid,
				"userpw" : userpw
			},
			success : function(response) {
				//alert(response);
				
				document.getElementById("notifyType").innerHTML = response;
				$(".notify").toggleClass("active");
				  $("#notifyType").toggleClass("success");

				  setTimeout(function(){
				    $(".notify").removeClass("active");
				    $("#notifyType").removeClass("success");
				  },2000);
				  
				  if(response!="로그인에 실패하였습니다.")
				  	setTimeout(function(){location.href = "/";},2200);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}
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