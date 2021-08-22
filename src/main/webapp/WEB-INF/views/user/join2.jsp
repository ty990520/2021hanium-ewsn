<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/join2_1.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/join_2.css" />
<style>
.text_body {
	width: 100%;
	height: 1500px;
	position: relative;
	top: 80px;
	left: 0px;
}

.join_title {
	margin-top: 12px;
}

h5 {
	text-align: center;
}
</style>
</head>
<div class="img">
	<img src="../../../resources/img/join2.png">
</div>
<br>
<!--  method="post"방식으로 넘겨줘야함(나중에 스프링 컨트롤러에서 RequestMethod.POST로 제어할 것) -->
<form name=form onsubmit="return checkAll()" id="joinForm"
	action="register" method="post">
	<ul class="join_box">
		<br>
		<li><h2>회원가입</h2>
			<hr class="two"></li>
		<li class="checkBox check01">
			<ul class="clearfix">
				<li>
					<h5>소속 정보 입력</h5> <br>
					<div>
						<h6 class="join_title">
							<label for="userptype">발전소 구분</label>
						</h6>
						<span class="box gender_code"> <select name="userptype"
							class="sel">
								<option>발전소 구분</option>
								<option value="수력">수력</option>
								<option value="원자력">원자력</option>
								<option value="화력">화력</option>
						</select>
						</span>

					</div> <!--가입버튼 -->
					<div>
						<h6 class="join_title">
							<label for="userdept">부서</label>
						</h6>
						<span class="box gender_code"> <select name="userdept"
							class="sel" onchange="chageDeptSelect(this)">
								<option>부서</option>
								<option value="관리자 그룹">관리자 그룹</option>
								<option value="사이버보안 담당 그룹">사이버보안 담당 그룹</option>
								<option value="설비운영 그룹">설비운영 그룹</option>
						</select>
						</span>

					</div> <!--가입버튼 --> <br> <br>
					<hr> <br>
					<h5>개인 정보 입력</h5> <br>
					<div>
						<h6 class="join_title">
							<label for="id">사번</label>
						</h6>
						<span class="box int_id"> <input type="text" name="userid"
							class="int" maxlength="20">
						</span>

					</div> <!-- PW1 -->
					<div>
						<h6 class="join_title">
							<label for="pswd1">비밀번호 </label>
						</h6>
						<span class="box int_pass"> <input type="password"
							name="userpw" class="int" maxlength="20"> <img
							src="../../../resources/img/lock.png" id="pswd1_img1"
							class="pswdImg">
						</span>

					</div> <!-- PW2 -->
					<div>
						<h6 class="join_title">
							<label for="pswd2">비밀번호 재확인</label>
						</h6>
						<span class="box int_pass_check"> <input type="password"
							name="password2" class="int" maxlength="20"> <img
							src="../../../resources/img/lock.png" id="pswd2_img1"
							class="pswdImg">
						</span>

					</div> <!-- NAME -->
					<div>
						<h6 class="join_title">
							<label for="name">이름</label>
						</h6>
						<span class="box int_name"> <input type="text"
							name="username" class="int" maxlength="20">
						</span>

					</div> <!-- BIRTH -->
					<div>
						<h6 class="join_title">
							<label for="euseremail">이메일주소</label>
						</h6>
						<span class="box int_name"> <input type="text"
							name="useremail" class="int" maxlength="20">
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
							<div id="bir_mm">
								<span class="box"> <select id="mm" class="sel" name="b_month">
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
							<label for="phone">연락처<h7> (선택)</h7></label>
						</h6>
						<span class="box int_name"> <input type="text" id="phone"
							class="int" maxlength="20" name="userphone">
						</span> <input type="hidden" id="birth" name="userbirth"/>
					</div> <!-- GENDER -->
				</li>
			</ul>
		</li>
	</ul>
	<ul class="footBtwrap clearfix">
		<li><button type="button" class="btn btn-light btn-lg">뒤로가기</button></li>
		<li><button type="submit" class="btn btn-danger btn-lg">승인
				요청</button></li>
	</ul>
</form>

<br>

<script src="main.js"></script>

</body>
<script>
	/*function alertSignUp() {
		if (confirm("관리자에게 승인을 요청하시겠습니까?") == true) {
			alert("승인이 요청되었습니다.");
			location.href = "join_3.html";
		} else {
			return;
		}
	}*/
	var chageDeptSelect = function(select_obj) {
		// 우선 selectbox에서 선택된 index를 찾고 
		var selected_index = select_obj.selectedIndex;
		// 선택된 index의 value를 찾고 
		if (selected_index == 1) {
			alert("관리자그룹으로 승인을 요청하는 경우, \n해당 프로그램의 관리자 기능을 사용할 수 있습니다.");
		}

	};
	
	

	function checkAll() {
		
		/* 유효성 검사 */
		if (form.userptype.value == "발전소 구분") {
			alert("발전소 구분을 선택해주세요!");
			return false;
		} else if (form.userdept.value == "부서") {
			alert("부서를 선택해주세요!");
			return false;
		} else if (!checkUserId(form.userid.value)) {
			return false;
		} else if (!checkPassword(form.userid.value, form.userpw.value,
				form.password2.value)) {
			return false;
		} else if (!checkuseremail(form.useremail.value)) {
			return false;
		} else if (!checkName(form.username.value)) {
			return false;
		}
		/* 검사 성공 후 승인 요청 */
		else {
			if (confirm("관리자에게 승인을 요청하시겠습니까?") == true) {
				if(form.b_year.value!=""&&form.b_month.value!=""&&form.b_day.value!=""){
					var day="";
					if(form.b_day.value.length == 1){
						day = "0"+form.b_day.value;
					}else
						day = form.b_day.value;
					console.log(day);
					document.getElementById('birth').value = form.b_year.value+form.b_month.value+day;
				}
				alert("승인이 요청되었습니다.");
				return true;
			} else {
				return false;
			}
		}

	}

	// 공백확인 함수
	function checkExistData(value, dataName) {
		if (value == "") {
			alert(dataName + " 입력해주세요!");
			return false;
		}
		return true;
	}

	function checkUserId(id) {
		//Id가 입력되었는지 확인하기
		if (!checkExistData(id, "사번을"))
			return false;
		return true; //확인이 완료되었을 때
	}

	function checkPassword(id, userpw, password2) {
		//비밀번호가 입력되었는지 확인하기
		if (!checkExistData(userpw, "비밀번호를"))
			return false;
		//비밀번호 확인이 입력되었는지 확인하기
		if (!checkExistData(password2, "비밀번호 확인을"))
			return false;

		var userpwRegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
		if (!userpwRegExp.test(userpw)) {
			alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
			form.userpw.value = "";
			form.userpw.focus();
			return false;
		}
		//비밀번호와 비밀번호 확인이 맞지 않다면..
		if (userpw != password2) {
			alert("두 비밀번호가 맞지 않습니다.");
			form.userpw.value = "";
			form.password2.value = "";
			form.password2.focus();
			return false;
		}

		//아이디와 비밀번호가 같을 때..
		if (id == userpw) {
			alert("아이디와 비밀번호는 같을 수 없습니다!");
			form.userpw.value = "";
			form.password2.value = "";
			form.password2.focus();
			return false;
		}
		return true; //확인이 완료되었을 때
	}

	function checkuseremail(useremail) {
		//useremail이 입력되었는지 확인하기
		if (!checkExistData(useremail, "이메일을"))
			return false;

		var euseremailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		if (!euseremailRegExp.test(useremail)) {
			alert("이메일 형식이 올바르지 않습니다!");
			form.useremail.value = "";
			form.useremail.focus();
			return false;
		}
		return true; //확인이 완료되었을 때
	}

	function checkName(username) {
		if (!checkExistData(username, "이름을"))
			return false;
		return true; //확인이 완료되었을 때
	}
	
	
</script>
<%@include file="../includes/footer.jsp"%>