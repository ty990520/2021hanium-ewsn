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
<form name=form onsubmit="return false;" id="joinForm" action="modify" method="post">
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
						<span class="box int_id"> <input type="text"
							name="userid" class="int" maxlength="20"
							value="${user.userid }" readonly="readonly">
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
							<input type="hidden" value="${user.userbirth}" id="birth" name="userbirth">
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
						<span class="box int_name"> <input type="text" id="phone" name="userphone"
							class="int" maxlength="20" value="${user.userphone }">
						</span>

					</div> <!-- GENDER --></li>
			</ul>
		</li>
	</ul>

	<button type="button" class="btn btn-light">회원 탈퇴</button>
	<button type="button" class="btn btn-light">비밀번호 수정</button>
	<button type="button" class="btn btn-danger" onclick="modify()">정보
		수정</button>

	<br> <br> <br>
</form>
<script>
$(document).ready(function(){
	var birth = $("#birth").val()
    //console.log(birth);
    
	var year=birth.substr(0,4) //year
	var month=birth.substr(4,2) //month
	var day=birth.substr(6,2) //day
	
	console.log(month);
	console.log(day);
	
	$("#yy").val(year);
	$('#mm').val(month).prop("selected",true);
	$("#dd").val(day);
});

function modify(){
	if(form.b_year.value!=""&&form.b_month.value!=""&&form.b_day.value!=""){
		var day="";
		if(form.b_day.value.length == 1){
			day = "0"+form.b_day.value;
		}else
			day = form.b_day.value;
		
		var str = form.b_year.value+form.b_month.value+day;
		
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

