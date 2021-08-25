<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/menu.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/join2_1.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/join_2.css" />
</head>
<style>
form#joinForm {
	margin-top: 120px;
}

img {
	margin: 0;
	float: right;
	width: 40px;
}

body {
	background-color: #9d7d7d29;
}

h5 {
	text-align: center;
}

p#msg {
	text-align: center;
	color: #428cce;
	font-weight: normal;
}

.btn-danger {
	float: right;
}
</style>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div
		class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">탈퇴 안내</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.
				<hr>
				<br> 사용하고 계신 아이디(
				<c:out value="${login_id}" />
				)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br> <span style="color: red;">탈퇴한
					아이디는 본인과 타인 모두 재사용 및 복구가 불가</span>하오니 신중하게 선택하시기 바랍니다. <br> <br>
				<br> 탈퇴 후에도 사용자 본인의 사번으로 등록한 게시물은 그대로 남아 있습니다. <br>DA자산 등록
				및 수정, 취약점 조치 등에 사용된 사번은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다. <br> <span
					style="color: red;">삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나
					관리자에게 문의하십시오.</span> <br> <br> <br> <input type="checkbox"
					id="accept" /> 안내 사항을 모두 확인하였으며, 이에 동의합니다.

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#staticBackdrop" disabled="disabled" id="dropout">탈퇴하기</button>
			</div>
		</div>
	</div>
</div>
<!-- 탈퇴 비밀번호 입력 -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">탈퇴하기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" onclick="location.href='/user/mypage'">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<input type="hidden" value="${login_pw}" id="user_pw"> <label
							for="exampleInputEmail1">비밀번호 입력</label> <input type="password"
							class="form-control" id="exampleInputPassword"
							aria-describedby="emailHelp"> <input type="checkbox"
							id="showPw" /> <small>비밀번호 표시</small> <br> <br> <small
							id="emailHelp" class="form-text text-muted">비밀번호를 입력한 뒤,
							탈퇴하기 버튼을 누르게 되면 정상적으로 탈퇴처리됩니다.</small>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					onclick="location.href='/user/mypage'">취소</button>
				<button type="button" class="btn btn-primary" onclick="remove()">탈퇴하기</button>
			</div>
		</div>
	</div>
</div>
<!-- 비밀번호 수정 모달1 -->
<div class="modal fade" id="staticBackdrop2" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">비밀번호 수정</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="exampleInputEmail1">계속하려면 먼저 본인임을 인증하세요.</label> <small
							class="form-text text-muted">비밀번호 입력</small> <input
							type="password" class="form-control" id="old_pw"
							aria-describedby="emailHelp"> <br> <input
							type="checkbox" id="showPw2" /> 비밀번호 표시
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					onclick="location.href='/user/mypage'">취소</button>
				<button type="button" class="btn btn-primary"
					onclick="updatepw_pre()">확인</button>
				<button type="button" class="btn btn-primary" id="updatePw_pre"
					style="display: none;" data-toggle="modal"
					data-target="#staticBackdrop3">확인</button>
			</div>
		</div>
	</div>
</div>
<!-- 비밀번호 수정 모달2 -->
<div class="modal fade" id="staticBackdrop3" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">비밀번호 수정</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" onclick="location.href='/user/mypage'">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="updatePw" method="post" id="updatepwform"
				onsubmit="return false;">
				<div class="modal-body">
					<div class="form-group">
						안전한 비밀번호로 내정보를 보호하세요.
						<ul>
							<li><span style="color: red;">다른 아이디/사이트에서 사용한 적 없는
									비밀번호</span></li>
							<li><span style="color: red;">이전에 사용한 적 없는 비밀번호</span>가
								안전합니다.</li>
						</ul>
						<input type="hidden" name="userid" value="${login_id}"> <br>
						<label for="exampleInputEmail1">새 비밀번호 입력</label> <input
							type="password" class="form-control" id="new_pw1" name="userpw"
							aria-describedby="emailHelp" placeholder="새 비밀번호 입력"> <br>
						<label for="exampleInputEmail1">새 비밀번호 확인</label> <input
							type="password" class="form-control" id="new_pw2"
							aria-describedby="emailHelp" placeholder="새 비밀번호 확인">
					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" onclick="location.href='/user/mypage'">취소</button>
					<button type="button" class="btn btn-primary" onclick="updatepw()">비밀번호
						변경</button>
				</div>
			</form>
		</div>
	</div>
</div>
<form name=form onsubmit="return false;" id="joinForm" action="modify"
	method="post">
	<ul class="join_box">
		<br>
		<li class="center">
			<h2>
				마이페이지<img src="../../../resources/img/person.png">
			</h2>
			<hr class="two">
		</li>
		<li class="checkBox check01">
			<ul class="clearfix">
				<li><h5>나의 소속 정보</h5>
					<p id="msg">소속 정보 수정은 관리자에게 문의해주세요.</p> <br>
					<div>
						<h6 class="join_title">
							<label for="id">사번</label>
						</h6>
						<span class="box int_id"> <input type="text" name="userid"
							class="int" maxlength="20" value="${user.userid }"
							readonly="readonly">
						</span>

					</div> <!-- PW1 --> <br>
					<div>
						<h6 class="join_title">
							<label for="id">발전소 구분</label>
						</h6>
						<span class="box int_id"> <input type="text"
							name="userptype" class="int" maxlength="20"
							value="${user.userptype }" readonly="readonly">
						</span>

					</div> <!-- PW1 --> <br>
					<div>
						<h6 class="join_title">
							<label for="id">소속 부서</label>
						</h6>
						<span class="box int_id"> <input type="text"
							name="userdept" class="int" maxlength="20"
							value="${user.userdept }" readonly="readonly">
						</span> <br>
					</div> <!-- PW1 --> <br>

					<hr> <br>
					<h5>개인 정보 수정</h5> <br>

					<div>
						<h6 class="join_title">
							<br> <label for="name">이름</label>
						</h6>
						<span class="box int_name"> <input type="text"
							name="username" class="int" maxlength="20"
							value="${user.username}">
						</span>

					</div> <!-- BIRTH -->
					<div>
						<h6 class="join_title">
							<br> <label for="email">이메일주소</label>
						</h6>
						<span class="box int_name"> <input type="text"
							name="useremail" class="int" maxlength="20"
							value="${user.useremail }">
						</span>

					</div>
					<div>
						<h6 class="join_title">
							<label for="yy">생년월일<h7> (선택)</h7></label>
						</h6>

						<div id="bir_wrap">
							<!-- BIRTH_YY -->
							<div id="bir_yy">
								<span class="box"> <input type="text" id="yy" class="int"
									maxlength="4" placeholder="년(4자)" name="b_year">
								</span>
							</div>

							<!-- BIRTH_MM -->
							<input type="hidden" value="${user.userbirth}" id="birth"
								name="userbirth">
							<div id="bir_mm">
								<span class="box"> <select id="mm" class="sel"
									name="b_month">
										<option>월</option>
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
								</select>
								</span>
							</div>

							<!-- BIRTH_DD -->
							<div id="bir_dd">
								<span class="box"> <input type="text" id="dd" class="int"
									maxlength="2" placeholder="일" name="b_day">
								</span>
							</div>

						</div>

					</div>



					<div>
						<h6 class="join_title">
							<br> <label for="phone">연락처<h7> (선택)</h7></label>
						</h6>
						<span class="box int_name"> <input type="text" id="phone"
							name="userphone" class="int" maxlength="20"
							value="${user.userphone }">
						</span>

					</div> <!-- GENDER --></li>
			</ul>
		</li>
	</ul>

	<button type="button" class="btn btn-light" data-toggle="modal"
		data-target="#exampleModal">회원 탈퇴</button>
	<button type="button" class="btn btn-light" onclick="sendEmail()"
		data-toggle="modal" data-target="#staticBackdrop2">비밀번호 수정</button>
	<button type="button" class="btn btn-danger" onclick="modify()">정보
		수정</button>

	<br> <br> <br>
</form>
<script>
	$(document).ready(function() {
		var birth = $("#birth").val()
		//console.log(birth);

		var year = birth.substr(0, 4) //year
		var month = birth.substr(4, 2) //month
		var day = birth.substr(6, 2) //day

		console.log(month);
		console.log(day);

		$("#yy").val(year);
		$('#mm').val(month).prop("selected", true);
		$("#dd").val(day);
	});

	$(function() {
		$('#accept').click(function() {
			if ($("#accept").prop("checked")) {
				$("#dropout").attr("disabled", false);
			} else
				$("#dropout").attr("disabled", true);
		});
	});

	$(function() {
		$('#dropout').click(function() {
			$("#exampleModal").hide();

		});
	});

	$(function() {
		$('#showPw').click(function() {
			if ($("#showPw").prop("checked")) {
				$("#exampleInputPassword").attr("type", "text");
			} else
				$("#exampleInputPassword").attr("type", "password");
		});
	});

	$(function() {
		$('#showPw2').click(function() {
			if ($("#showPw2").prop("checked")) {
				$("#exampleInputPassword2").attr("type", "text");
			} else
				$("#exampleInputPassword2").attr("type", "password");
		});
	});

	function remove() {
		console.log($("#user_pw").val());
		if ($("#exampleInputPassword").val() == $("#user_pw").val()) {
			alert("성공적으로 탈퇴되었습니다.");
			location.href = "/user/dropout";
		} else
			alert("비밀번호가 일치하지 않습니다.");
	}

	$(function() {
		$('#updatePw_pre').click(function() {
			$("#staticBackdrop2").hide();

		});
	});

	function updatepw_pre() {
		if ($("#old_pw").val() == $("#user_pw").val()) {
			document.getElementById('updatePw_pre').click();
		} else
			alert("비밀번호가 일치하지 않습니다.");

	}

	function updatepw() {
		if ($("#new_pw1").val() != $("#new_pw2").val()) {
			alert("비밀번호가 일치하지 않습니다.");
		} else{
			alert("비밀번호가 변경되었습니다.");
			document.getElementById('updatepwform').submit();
		}
	}

	function modify() {
		if (form.b_year.value != "" && form.b_month.value != ""
				&& form.b_day.value != "") {
			var day = "";
			if (form.b_day.value.length == 1) {
				day = "0" + form.b_day.value;
			} else
				day = form.b_day.value;

			var str = form.b_year.value + form.b_month.value + day;

			document.getElementById('birth').value = str;
			alert("정보가 수정되었습니다.");
			document.getElementById('joinForm').submit();
			return true;
		} else {
			return false;
		}
	}
</script>
<%@include file="../includes/footer.jsp"%>

