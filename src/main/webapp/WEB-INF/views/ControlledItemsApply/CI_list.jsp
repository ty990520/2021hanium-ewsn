
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
		<b>사이버통제항목 적용관리 </b>
		<div class="table_button_group">
		<button type="button" class="btn btn-danger"
			onclick="location.href='/ControlledItemsApply/CI_list_apply' ">평가하기</button>
		<br>
	</div>
	</h1>
	<hr>
<br><br>

	<table class="table ">
	<thead>
		<tr>
			<th style="width: 30px;">Id</th>
			<th>자산명</th>
			<th>버전</th>
			<th>점검일</th>
		</tr>
		<c:forEach items="${list}" var="cia" varStatus="status">
			<tr onclick="CI_select_print('<c:out value="${cia.CI_apply_version}"/>')">
				<td style="width: 30px;">${status.count}</td>
				<td><c:out value="${cia.CI_daname}" /></td>
				<td><a href="/ControlledItemsApply/CI_select_print"><c:out
							value="${cia.CI_apply_version}" /></a></td>
				<!--ControlledItemsApply 테이블 -->
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${cia.CI_applyDate}" /></td>
			</tr>
		</c:forEach>
		</thead>
	</table>
	<br>


	
</div>
<br>
<br>

<script>

function CI_detail(CI_applyDetail_id) {
	//alert(SA_no);
	console.log(CI_applyDetail_id);
	location.href = "/CI/CI_select_print?CI_applyDetail_id="+CI_applyDetail_id;

}
</script>
<%@include file="../includes/footer.jsp"%>