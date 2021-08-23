
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
		<b>공통코드관리 > 상세코드 </b>
	</h1>
	<c:if test="${login_dept eq '관리자 그룹'}">
	<div align="right">
		<button type="submit" class="btn btn-success"
			onclick="location.href='/RepresentCode/Code_deEnroll' ">상세코드
			등록</button>
	</div>
	</c:if>
	<hr>
	<p>대표코드의 상세코드를 출력한 결과입니다.</p>
	<br>

	<table class="table table-hover">
		<thead>
			<tr>
				<th>Id</th>
				<th>상세코드</th>
				<th>상세코드명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="re" varStatus="status">
				<tr>
					<td style="width: 30px;">${status.count}</td>
					<td><c:out value="${re.d_code}" /></td>
					<td><c:out value="${re.d_codeName}" /></td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
	<br> <br> <br> <br> <br> <br>

</div>

<%@include file="../includes/footer.jsp"%>