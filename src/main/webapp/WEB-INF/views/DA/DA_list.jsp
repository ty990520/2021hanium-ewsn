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
	.btn{
		float: right;
	}
</style>
<div class="right-container">
	<h1>
		<b>DA 정보 관리</b>
		<button type="button" class="btn btn-danger"
			onclick="location.href='/DA/DA_register' ">등록하기</button>
		
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
	<table class="table table-hover">
		<thead>
			<tr>
				<th style="width: 30px;">Id</th>
				<th>자산번호</th>
				<th>자산명</th>
				
				<th>기능유형</th>
				<th>영향성 분석</th>
				<th>설비유형</th>
				<th>설비사용목적</th>
				<th>시스템S/W유형</th>
				<th>통신I/F</th>
				
			</tr>
		</thead>
		<tbody id="table_body">
			<c:forEach items="${list}" var="da" varStatus="status">
				<tr onclick="DA_detail('<c:out value="${da.daid}"/>')">
					<td style="width: 30px;">${status.count}</td>
					<td><c:out value="${da.daid}" /></td>
					<td><c:out value="${da.daname}" /></td>
				
					<td><c:out value="${da.daFuncType}" /></td>
					<td><c:out value="${da.daImpact}" /></td>
					<td><c:out value="${da.daFacilitiesType}" /></td>
					<td><c:out value="${da.daFacilitiesPurposeOfUse}" /></td>
					<td><c:out value="${da.daSystemSW}" /></td>
					<td><c:out value="${da.daReportIF}" /></td>
				
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
	<form id='actionForm' action="/DA/DA_list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>
</div>

<script>
	/* 식별상세유형 판별해서 디테일 페이지 링크 연결 */
	function DA_detail(daid) {
		//alert(SA_no);
		console.log(daid);
		location.href = "/DA/DA_detail?daid="+daid;

	}
	
	function pageAction(pageNum){
		var actionForm = $('#actionForm');
		console.log('click');
		actionForm.find('input[name="pageNum"]').val(pageNum);
		actionForm.submit();
	}
	</script>
<%@include file="../includes/footer.jsp"%>