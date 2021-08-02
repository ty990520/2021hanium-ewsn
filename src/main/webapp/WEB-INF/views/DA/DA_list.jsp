<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css" href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/common.css" />
</head>
<div class="right-container">
		<h1>
			<b>DA 정보 관리</b>
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
					<th>자산기능</th>
					<th>기능유형</th>
					<th>영향성 분석</th>
					<th>설비유형</th>
					<th>설비사용목적</th>
					<th>시스템S/W유형</th>
					<th>통신I/F</th>
					<th>사용여부</th>
				</tr>
			</thead>
			<tbody id="table_body">
			<c:forEach items="${list}" var="da" varStatus="status">
				<tr onclick="DA_detail(<c:out value="${da.daid}"/>)">
					<td style="width: 30px;">${status.count}</td>
					<td><c:out value="${da.daid}" /></td> 
					<td><c:out value="${da.daname}" /></td> 
					<td><c:out value="${da.daFunc}" /></td>
					<td><c:out value="${da.daFuncType}" /></td>
					<td><c:out value="${da.daImpact}" /></td>
					<td><c:out value="${da.daFacilitiesType}" /></td>
					<td><c:out value="${da.daFacilitiesPurposeOfUse}" /></td>
					<td><c:out value="${da.daSystemSW}" /></td>
					<td><c:out value="${da.daReportIF}" /></td>
					<td><c:out value="${da.daUse}" /></td>
				</tr>
				
				</c:forEach>
			</tbody>
		</table>
		<br>

		<div class="table_button_group">
			<button type="button" class="btn btn-danger"
				onclick="location.href='/DA/DA_register' ">등록</button>
			
		</div>
		<nav class="pagination_nav" aria-label="...">
			<ul class="pagination">
				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1" aria-disabled="true">이전</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item active" aria-current="page"><a
					class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">다음</a></li>
			</ul>
			<br>
		</nav>
	</div>
	
	<script>
	/* 식별상세유형 판별해서 디테일 페이지 링크 연결 */
	function DA_detail(daid) {
		//alert(SA_no);
		location.href = "/DA/DA_detail?daid="+daid;

	}
	</script>
<%@include file="../includes/footer.jsp"%>