
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/table.css" />
</head>
<style>
.table {
	width: 70%;
	margin-bottom: 1rem;
	color: #212529;
	margin: auto;
	text-align: center;
}
</style>
<div class="right-container">
	<h1>
		<b>공통코드관리 > 대표코드 </b>
	</h1>
	<c:if test="${login_dept eq '관리자 그룹'}">
		<div align="right">
			<button type="submit" class="btn btn-success"
				onclick="location.href='/RepresentCode/Code_reEnroll' ">대표코드
				등록</button>
		</div>
	</c:if>

	<hr>
	<p>대표코드를 선택하면 해당하는 상세코드를 확인할 수 있습니다.</p>
	<br>

	<table class="table table-hover">
		<thead>
			<tr>
				<th>Id</th>
				<th>대표코드</th>
				<th>대표코드명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="re" varStatus="status">
				<tr onclick="Code_deList('<c:out value="${re.r_code}"/>')">
					<td style="width: 30px;">${status.count}</td>
					<td><c:out value="${re.r_code}" /></td>
					<td><c:out value="${re.r_codeName}" /></td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
	<br> <br> <br> <br> <br> <br>

</div>

<script>
	function Code_deList(r_code) {
		//alert(SA_no);
		console.log(r_code);
		location.href = "/RepresentCode/Code_deList?r_code=" + r_code;

	}
</script>
<%@include file="../includes/footer.jsp"%>