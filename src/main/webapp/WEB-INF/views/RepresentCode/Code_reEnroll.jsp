<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" href="../../../resources/css/Code_Enroll.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/table.css" />
</head>

<div class="right-container">
	<h1>
		<b>공통코드관리 - 대표코드 등록창 </b>
	</h1>
	<hr>

	<form name=form action="register" method="post">
		<div class="inner">

			<div class="code_id">
				<h6>코드번호</h6>
				<input type="text" name="R_code" placeholder="코드번호 ">
			</div>
			<div class="code_id">
				<h6>코드명</h6>
				<input type="text" name="R_codeName" placeholder="코드명 ">
			</div>
		</div>

		<div align="right">
			<button type="submit" class="btn btn-danger btn-lg"
				onclick="register()">등록</button>
		</div>
		</form>
</div>


<script>
function modifyBtn(daid) {
	//alert(daid);
	if (confirm("대표코드를 등하시겠습니까?") == true) {
		alert("등록되었습니다");
		return true;
	} else {
		return false;
	}

}
</script>
<br><br><br><br>
<%@include file="../includes/footer.jsp"%>