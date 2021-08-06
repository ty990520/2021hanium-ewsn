<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<head>
<link rel="stylesheet" type="text/css" href="../../css/list.css" />
<link rel="stylesheet" type="text/css" href="../../css/common.css" />
<link rel="stylesheet" type="text/css" href="../../css/register.css" />
<title>Insert title here</title>
<style>
a {
	text-decoration: none;
	color: black;
}
td.table-light {
width: 80px;
vertical-align: middle;
text-align: center;
}
</style>
</head>
<div class="right-container">
		<h1>
			<b>조치권고 등록 </b>
		</h1>
		<hr>
		<form name=form onsubmit="return checkAll()" id="register"
		action="register" method="post">
		<table class="table table-bordered">
			<tr>
				<td class="table-light" colspan="2">권고발행번호</td>
				<td colspan="2">21-0001</td>
				<td class="table-light" colspan="2">발행일자</td>
				<td colspan="2"><!-- input type="text"
					class="vulner_register_input" placeholder="발행일자"></td> -->
			</tr>
			<tr>
				<td class="table-light" colspan="2">발행부서</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="AR_regDept" placeholder="발행부서"></td>
				<td class="table-light" colspan="2">발행자</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="RegistrarID" placeholder="발행자"></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">자산명</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="AR_daName" placeholder="자산명검색"></td>
				<td class="table-light" colspan="2">자산번호</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="AR_daID" placeholder="자산번호검색"></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">시스템sw유형</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="AR_daSystemSW" placeholder="시스템SW유형검색"></td>
				<td class="table-light" colspan="2">조치유형</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="AR_ActionType" placeholder="조치유형검색"></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">제목</td>
				<td colspan="6"><input type="text" class="input_width100"
					name="AR_title" placeholder="취약점 내용 입력"></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">권고사항(조치사항)</td>
				<td colspan="6"><input type="text" class="input_width100"
					name="AR_issue" placeholder="조치 내용 입력"></td>
			</tr>
		</table>

		
		<div class="table_button_group">
			<button type="submit" class="btn btn-danger" onclick="register()">등록</button>
		</div>
		</form>
	</div>
	<script>
	function alertRegister() {
		if (confirm("조치권고를 등록하시겠습니까?") == true) {
			alert("등록되었습니다");
			location.href = "list";
		} else {
			return;
		}
	}
</script>
<%@include file="../includes/footer.jsp"%>
