
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}

.modal-footer {
	border-top: none;
}

.pagination {
	margin: 50px 0 100px 0;
	justify-content: center;
}

.page-link {
	margin: 0;
	font-size: 1rem;
	color: #dc3545;
}

.page-link:hover {
	color: #dc3545;
}

.assess_btn {
	float: right;
}

.page-item.active .page-link {
	z-index: 3;
	color: #fff;
	background-color: #dc3545;
	border-color: #dc3545;
}
</style>

</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">DA 단계적 보안성 평가
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">단계적 보안성 평가 관리를 시작합니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
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
					data-target="#staticBackdrop">보안성 평가하기</button>
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

				</tr>
			</thead>
			<tbody id="table_body">
				<tr onclick="SA_detail(0)">
					<td scope="row" style="width: 30px;">1</td>
					<td>H-01-0001</td>
					<td>PC</td>
					<td>수력</td>
					<td>한강</td>
					<td>Direct DA</td>
				</tr>
				<tr onclick="SA_detail(1)">
					<td scope="row" style="width: 30px;">2</td>
					<td>H-01-0001</td>
					<td>PC</td>
					<td>화력</td>
					<td>남동</td>
					<td>Indirect DA</td>

				</tr>
				<tr onclick="SA_detail(2)">
					<td scope="row" style="width: 30px;">3</td>
					<td>H-01-0001</td>
					<td>PC</td>
					<td>원자력</td>
					<td>고리</td>
					<td>BOP</td>

				</tr>
				<tr onclick="SA_detail(3)">
					<td scope="row" style="width: 30px;">4</td>
					<td>H-01-0001</td>
					<td>PC</td>
					<td>수력</td>
					<td>한강</td>
					<td>EP</td>

				</tr>
				<tr onclick="SA_detail(4)">
					<td scope="row" style="width: 30px;">5</td>
					<td>H-01-0001</td>
					<td>PC</td>
					<td>원자력</td>
					<td>고리</td>
					<td>EP</td>

				</tr>
				<tr onclick="SA_detail(5)">
					<td scope="row" style="width: 30px;">6</td>
					<td>H-01-0001</td>
					<td>PC</td>
					<td>화력</td>
					<td>남동</td>
					<td>Indirect DA</td>

				</tr>
				<tr onclick="SA_detail(6)">
					<td scope="row" style="width: 30px;">7</td>
					<td>H-01-0001</td>
					<td>PC</td>
					<td>원자력</td>
					<td>고리</td>
					<td>Direct DA</td>

				</tr>
			</tbody>
		</table>

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

</body>
<script>
	/* 단계적 보안성 평가 모달창 띄우는 코드 */
	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').trigger('focus')
	})

	/* 식별상세유형 판별해서 디테일 페이지 링크 연결 */
	function SA_detail(val) {
		var rows = document.getElementById("table_body").getElementsByTagName(
				"tr");
		var str = [];

		for (var i = 0; i < rows.length; i++) {
			var row = rows[i].getElementsByTagName("td");
			str[i] = row[5].firstChild.data; // 이름
			//console.log(str[i]);
		}

		if (str[val] == "EP") {
			location.href = "./EP_detail.html";
		} else if (str[val] == "BOP") {
			location.href = "./BOP_detail.html";
		} else if (str[val] == "Indirect DA") {
			location.href = "./indirect_detail.html";
		} else if (str[val] == "Direct DA") { /* 아직 direct DA는 어떻게 할지 고민 */
			alert("Direct DA정보는 제공되지 않습니다.");
		}

	}
</script>