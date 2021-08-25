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
		<b>사이버통제항목 선택정보 출력 </b>
	</h1>
	<hr>
	<br>
	<table class="table table-bordered">
		<tr>
			<th style="text-align: center;" colspan="8">평가 자산 상세 내역</th>

		</tr>
		<tr>
			<td class="table-light" colspan="2">버전명</td>
			<td colspan="6">${version}</td>
		</tr>
		
		<tr>
			<td class="table-light" colspan="2">자산번호</td>
			<td colspan="2">${daid}</td>
			<td class="table-light" colspan="2">자산식별 상세 유형</td>
			<td colspan="2">${datype}</td>

		</tr>
		<tr>
			<td class="table-light" colspan="2">점검일자</td>
			<td colspan="2"><fmt:formatDate pattern="yyyy-MM-dd" value="${applydate}" />
			</td>
			<td class="table-light" colspan="2">점검자</td>
			<td colspan="2">${checkerid}</td>
		</tr>

</table>
<br>
<table class="table table-bordered">

		<tr>
			<th style="text-align: center;" colspan="8">보안조치 적용결과</th>

		</tr>


		<tr>
			<th>통제항목번호</th>
			<th>통제항목 분류</th>
			<th>상세분류</th>
			<th>이행여부</th>
			<th colspan="4">적용내용</th>
		</tr>
		<c:forEach items="${ci_arr}" var="ci">
		<tr>
			<td>${ci.ciid}</td>
			<td>${ci.citype}</td>
			<td>${ci.cidetype}</td>
			<td>${ci.check}</td>
			<td colspan="4">${ci.content}</td>
		</tr>
		</c:forEach>
	</table>


</div>




<%@include file="../includes/footer.jsp"%>