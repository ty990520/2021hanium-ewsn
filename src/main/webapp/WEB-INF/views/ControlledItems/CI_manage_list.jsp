
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
</head>
<style>
.table_button_group{
	float: right;
	top: 0;
}
</style>
<div class="right-container">
	<h1>
		<b>사이버보안 통제항목 관리</b>
		<c:if test="${login_dept eq '관리자 그룹'}">
		<div class="table_button_group">
			<button type="button" class="btn btn-danger"
				onclick="location.href='/ControlledItems/CI_register' ">등록하기</button>
		</div>
		</c:if>
	</h1>
	<hr>

	<BR> <br> <br>
	<table class="table ">
		<thead>
			<tr>
				<th scope="col">통제항복분류</th>
				<th scope="col">상세분류번호</th>
				<th scope="col">상세분류</th>
				<th scope="col">항목내용</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach items="${list}" var="ci" varStatus="status">
				<tr>
					<td><c:out value="${ci.CI_type}" /></td>
					<td><c:out value="${ci.CI_detail_id}" /></td>
					<td><c:out value="${ci.CI_detailType}" /></td>
					<td><c:out value="${ci.CI_content}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</div>


<%@include file="../includes/footer.jsp"%>