
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<style>
.assess_btn {
	float: right;
}
</style>

</head>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">DA 단계적 보안성 평가
					시작하기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				단계적 보안성 평가를 진행할 DA를 선택해주세요.
				<form class="center_form">
					<div style="float: right;">
						<select name="search" id="">
							<option class="dropdown-item"value="DAName">자산명</option>
							<option class="dropdown-item"value="DAId">자산번호</option>
							<option class="dropdown-item"value="daImpact">영향성분석</option>
						</select> <input type="search" name="" value="" placeholder="자산명 입력">
						<button type="button" name="button"
							class="btn btn-outline-secondary">검색</button>
					</div>
				</form>
				<br><br><br><br>
				<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col" style="width: 30px;">Id</th>
				<th scope="col">자산번호</th>
				<th scope="col">자산명</th>
				<th scope="col">영향성분석</th>
				<th scope="col">단계적 보안성 평가 여부</th>
			</tr>
		</thead>
		<tbody id="selectDA_modal">
			<c:forEach items="${list}" var="da" varStatus="status">
				<tr onclick="SA_detail(<c:out value="${status.index}"/>)">
					<td scope="row" style="width: 30px;"><c:out
							value="${status.count}" /></td>
					<td><c:out value="${da.SA_daID}" /></td>
					<td><c:out value="${da.daname}" /></td>
					<td><c:out value="${da.daptype}" /></td>
					<td>미완료</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-danger"
					onclick="location.href = './SA_EP.html' ">평가시작</button>
			</div>
		</div>
	</div>
</div>
<div class="right-container">
	<h1>
		<b>DA 단계적 보안성 평가</b>
		<div class="assess_btn">
			<button type="button" class="btn btn-danger" data-toggle="modal"
				data-target="#staticBackdrop">단계적 보안성 평가 시작하기</button>
		</div>
	</h1>
	<hr>
	<form class="center_form">
		<select name="search" id="">
			<option value="DAName">자산명</option>
			<option value="DAId">자산번호</option>
		</select> <input type="search" name="" value="" placeholder="자산명 입력">
		<button type="button" name="button" class="btn btn-outline-secondary">검색</button>
	</form>
	<p>보안성 평가가 완료된 자산 정보를 확인할 수 있습니다.</p>
	<br>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col" style="width: 30px;">Id</th>
				<th scope="col">자산번호</th>
				<th scope="col">자산명</th>
				<th scope="col">발전소 구분</th>
				<th scope="col">발전소 상세 구분</th>
				<th scope="col">식별상세유형</th>
				<th scope="col">최신평가일자</th>
			</tr>
		</thead>
		<tbody id="table_body">
			<c:forEach items="${list}" var="da" varStatus="status">
				<tr onclick="SA_detail(<c:out value="${status.index}"/>)">
					<td scope="row" style="width: 30px;"><c:out
							value="${status.count}" /></td>
					<td><c:out value="${da.SA_daID}" /></td>
					<td><c:out value="${da.daname}" /></td>
					<td><c:out value="${da.daptype}" /></td>
					<td><c:out value="${da.daPDetailType}" /></td>
					<td><c:out value="${da.SA_IdentifyType}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${da.SA_date}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
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

	</nav>



</div>
<br>
<br>
<br>
<br>
<script>
	/* 단계적 보안성 평가 모달창 띄우는 코드 */
	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').trigger('focus')
	})

	/* 식별상세유형 판별해서 디테일 페이지 링크 연결 */
	function SA_detail(val) {
		var rows = document.getElementById("table_body").getElementsByTagName("tr");
		
		var str = [];

		for (var i = 0; i < rows.length; i++) {
			var row = rows[i].getElementsByTagName("td");
			str[i] = row[5].firstChild.data; // 이름
			//console.log(str[i]);
			//console.log(str[i]);
		}
		if (str[val] == "EP DA") {
			location.href = "/SecurityAssessment/ep_detail";
		} else if (str[val] == "BOP DA") {
			location.href = "/SecurityAssessment/bop_detail";
		} else if (str[val] == "Indirect DA") {
			location.href = "/SecurityAssessment/indirect_detail";
		} else if (str[val] == "Direct DA") { /* 아직 direct DA는 어떻게 할지 고민 */
			alert("Direct DA정보는 제공되지 않습니다.");
		}

	}
</script>
<%@include file="../includes/footer.jsp"%>