
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
		<b>사이버통제항목 적용관리 </b>
	</h1>
	<hr>
	<form class="center_form">
		<select name="search" id="">
			<option value="DAName">자산명</option>
			<option value="DAId">자산번호</option>
		</select> <input type="search" name="" value="" placeholder="자산명 입력">
		<button type="button" name="button" class="btn btn-outline-secondary">검색</button>
	</form>
	<p>버전명을 클릭하면 자세한 정보를 확인할 수 있습니다.</p>
	<table class="table table-hover">
	<thead>
		<tr>
			<th style="width: 30px;">Id</th>
			<th>자산명</th>
			<th>버전</th>
			<th>점검일</th>
		</tr>
		<c:forEach items="${list}" var="cia" varStatus="status">
			<tr onclick="CI/select_print('<c:out value="${da.daid}"/>')">
				<td style="width: 30px;">${status.count}</td>
				<td><c:out value="${cia.CI_daname}" /></td>
				<td><a href="Cl_select_print.html"><c:out
							value="${cia.CI_apply_version}" /></a></td>
				<!--ControlledItemsApply 테이블 -->
				<td><c:out value="${cia.CI_applyDate}" /></td>
			</tr>
		</c:forEach>
		</thead>
	</table>
	<br>


	<div class="table_button_group">
		<button type="button" class="btn btn-danger"
			onclick="location.href='ControlledItemsApply/CI_list_apply' ">평가하기</button>
		<br>
	</div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<%@include file="../includes/footer.jsp"%>