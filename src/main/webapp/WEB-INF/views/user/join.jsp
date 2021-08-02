<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css" href="../../../resources/css/join.css" />
<style>
.text_body {
	width: 100%;
	height: 1500px;
	position: relative;
	top: 80px;
	left: 0px;
}

.check_inner {
	display: flex;
}

.check02>textarea {
	flex-grow: 1;
}

input[type="checkbox"], input[type="radio"] {
	width: 16px;
	height: 16px;
}

h7 {
	color: red;
}
</style>
</head>

	<div class="img">
		<img src="../../../resources/img/join.png">
	</div>

	<form name=joinForm onsubmit="return checkAll_submit()" action="join2" class="joinForm" method="post">
		<ul class="join_box">

			<br>
			<li><h2>약관 동의</h2>
				<hr class="two"></li>
			<li class="checkBox check01">
				<ul class="clearfix">
					<li>이용약관, 개인정보 수집 및 이용 에 모두 동의합니다.
						<hr class="	">
					</li>
					<li class="checkAllBtn"><input type="checkbox" name="chkAll"
						id="checkAll" class="chkAll" onclick="checkAll_click()"></li>
				</ul>
			</li>
			<li class="checkBox check02">
				<ul class="clearfix">
					<li>이용약관 동의 <h7> * (필수) </h7></li>
					<li class="checkBtn"><input type="checkbox" id="chk1"
						name="chk" onclick="checkbox_click()"></li>
				</ul>
				<div class="check_inner">
					<textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
				</div>
			</li>
			<li class="checkBox check03">
				<ul class="clearfix">
					<li><br>개인정보 수집 및 이용에 대한 안내 <h7> * (필수)</h7></li>
					<li class="checkBtn"><input type="checkbox" id="chk2"
						name="chk" onclick="checkbox_click()"></li>
				</ul>
				<div class="check_inner">
					<textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
				</div> <br> <br> <br>
			</li>

		</ul>


		<ul class="footBtwrap clearfix">
			<li><button type="button" class="btn btn-light btn-lg"
					onclick="location.href = '../base2.html' ">뒤로가기</button></li>
			<li><button type="submit" class="btn btn-danger btn-lg">다음 단계로 이동</button></li>
		</ul>
	</form>
<br><br>


</body>
<script>
	function checkAll_click() {
		if ($('input:checkbox[id="checkAll"]').is(":checked"))
			$('input:checkbox[name="chk"]').prop("checked", true);
		else
			$('input:checkbox[name="chk"]').prop("checked", false);
	}

	function checkbox_click() {
		if ($('input:checkbox[id="chk1"]').is(":checked") == false
				|| $('input:checkbox[id="chk2"]').is(":checked") == false)
			$('input:checkbox[id="checkAll"]').prop("checked", false);
		else if ($('input:checkbox[id="chk1"]').is(":checked") == true
				|| $('input:checkbox[id="chk2"]').is(":checked") == true)
			$('input:checkbox[id="checkAll"]').prop("checked", true);
	}

	function checkAll_submit() {
		if ($('input:checkbox[id="chk1"]').is(":checked") == true
				&& $('input:checkbox[id="chk2"]').is(":checked") == true) {
			return true;
		} else{
			alert("이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.");
			return false;
		}
			
	}
</script>
<%@include file="../includes/footer.jsp"%>