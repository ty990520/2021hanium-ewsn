
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
</head>
<div class="right-container">
	<h1>
		<b>사이버보안 통제항목 관리</b>
	</h1>
	<hr>
	<form class="center_form">
		<select name="search" id="">
			<option value="DAName">자산명</option>
			<option value="DAId">자산번호</option>
		</select> <input type="search" name="" value="" placeholder="자산명 입력">
		<button type="button" name="button" class="btn btn-outline-secondary">검색</button>
	</form>
	<p>자산번호를 선택하면 자세한 정보를 확인할 수 있습니다.</p>
	<BR>
	<br> <br>
	<table class="table table-hover">
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
	<div class="table_button_group">
		<button type="button" class="btn btn-danger"
			onclick="location.href='/ControlledItems/CI_register' ">등록하기</button>
	</div>

</div>
<br><br>
<br><br>
<br><br>
<br><br>

<%@include file="../includes/footer.jsp"%>