<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<head>
<link rel="stylesheet" type="text/css" href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/register.css" />
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
		<table class="table table-bordered">
			<tr>
				<td class="table-light" colspan="2">발행일자</td>
				<td colspan="2"><fmt:formatDate pattern="yyyy-MM-dd" value="${ar.AR_regDate}" /></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">발행부서</td>
				<td colspan="2"><c:out value='${ar.AR_regDept}'/></td>
				<td class="table-light" colspan="2">발행자</td>
				<td colspan="2">${RegistrarID}</td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">자산명</td>
				<td colspan="2"><c:out value='${ar.AR_daName}'/></td>
				<td class="table-light" colspan="2">자산번호</td>
				<td colspan="2"><c:out value='${ar.AR_daID}'/></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">시스템sw유형</td>
				<td colspan="2"><c:out value='${ar.AR_daSystemSW}'/></td>
				<td class="table-light" colspan="2">조치유형</td>
				<td colspan="2"><c:out value='${ar.AR_ActionType}'/></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">제목</td>
				<td colspan="6"><c:out value='${ar.AR_title}'/></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">권고사항(조치사항)</td>
				<td colspan="6"><c:out value='${ar.AR_issue}'/></td>
			</tr>
		</table>

		<div class="table_button_group">
			<button type="submit" class="btn btn-danger" onclick="alert()">확인</button>
				<br><br><br><br><br><br><br><br>
		</div>
	</div>
	<script>
	function alert() {
		if (confirm("리스트로 돌아갑니다.") == true) {
			//alert("등록되었습니다");
			location.href = "list";
		} else {
			return;
		}
	}
	
	console.log();
</script>
<%@include file="../includes/footer.jsp"%>
