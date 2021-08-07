<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<b>부서 소속 사원 관리 </b>
	</h1>
	<hr>
	<form class="center_form">
		<select name="search" id="">
			<option value="DAName">발전소구분</option>
			<option value="DAId">부서명</option>
			<option value="DAId">사번</option>
			<option value="DAId">사원명</option>
		</select> <input type="search" name="" value="" placeholder="검색어를 입력해주세요">
		<button type="button" name="button" class="btn btn-outline-secondary">검색</button>
	</form>
	<p>이메일주소를 누르면 해당 사원에게 이메일을 작성할 수 있습니다.</p>
	<BR>
	<table class="table">
		<thead>
			<tr>
				<th style="width: 30px;">Id</th>
				<th>발전소 구분</th>
				<th>부서</th>
				<th>사번</th>
				<th>사원명</th>
				<th>연락처</th>
				<th>이메일주소</th>

			</tr>
		</thead>
		<tbody id="table_body">
		<% String regphone = "^01(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$"; %>
			<c:forEach items="${list}" var="user" varStatus="status">
				<tr>
					<td style="width: 30px;">${(pageMaker.cri.amount*(pageMaker.cri.pageNum-1))+status.count}</td>
					<td><c:out value="${user.userptype}" /></td>
					<td><c:out value="${user.userdept}" /></td>
					<c:set var="phone" value="${user.userphone}"/>
					<td><c:out value="${user.userid}" /></td>
					<td><c:out value="${user.username}" /></td>
					<td><c:out value="${fn:substring(phone,0,3)}-${fn:substring(phone,3,7)}-${fn:substring(phone,7,11)}"/></td>
					<td><a href="mailto: ${user.useremail}" title="이메일 전송"><c:out
								value="${user.useremail}" /></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<nav class="pagination_nav" aria-label="...">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li class="page-item disabled"><a class="page-link"
					href="${pageMaker.startPage -1}" tabindex="-1" aria-disabled="true">이전</a></li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }">
				<c:if test="${pageMaker.cri.pageNum == num}">
					<li class="page-item active" aria-current="page"><a
						class="page-link" href="#">${num}</a></li>
				</c:if>
				<c:if test="${pageMaker.cri.pageNum != num}">
					<li class="page-item"><a class="page-link"
						onclick="pageAction(${num})">${num}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="page-item"><a class="page-link"
					href="${pageMaker.endPage +1}">다음</a></li>
			</c:if>
		</ul>
	</nav>
<br><br><br><br>
	<form id='actionForm' action="/SecurityAssessment/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>
</div>
<script>
	function pageAction(pageNum){
		var actionForm = $('#actionForm');
		console.log('click');
		actionForm.find('input[name="pageNum"]').val(pageNum);
		actionForm.submit();
	}
</script>
<%@include file="../includes/footer.jsp"%>