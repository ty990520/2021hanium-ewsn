<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
</head>
<!-- modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">사번 인증</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<span id="user_yes">사번 인증이 완료되었습니다. </span> <span id="user_no">확인할
					수 없는 사번입니다. <BR> 다음 평가로 넘어갑니다.
				</span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal"
					id="modal_ok">닫기</button>
			</div>
		</div>
	</div>
</div>
<div class="right-container">
	<h1>
		<b>관리자 승인 요청 관리</b>
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
	<p>최고관리자만 조회할 수 있는 페이지입니다.</p>
	<BR>
	<table class="table">
		<thead>
			<tr>
				<th style="width: 30px;">Id</th>
				<th>승인 요청 날짜</th>
				<th>발전소 구분</th>
				<th>사번</th>
				<th>사번 인증</th>
				<th>사원명</th>
				<th>승인</th>
			</tr>
		</thead>
		<tbody id="table_body">
		 <c:forEach items="${adminRequest}" var="request" varStatus="status">
			<tr>
				<td style="width: 30px;"><c:out value="${status.count}"/></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${request.reqdate}"/></td>
				<td><c:out value="${request.userptype}"/></td>

				<td><c:out value="${request.userid}"/></td>
				<td><button type="button" class="btn btn-danger"
						data-toggle="modal" id="assess_btn" data-target="#staticBackdrop">인증</button></th>
				<td><c:out value="${request.username}"/></td>
				<td><button type="button" class="btn btn-success"
						onclick="accept()">승인</button></td>
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
		<br>
	</nav>
</div>

</body>
<script>
	/*사원정보 테이블에 존재하는 사번인지 비교하여 상황별 메시지 띄움*/
	var flag = 1; //판별 신호 (1=ep, 0=bop검사)

	$("#assess_btn").on("click", function() {
		console.log(flag);
		/*flag = 1;
		var radios = $(":radio[value='Y']");
		for (var i = 0; i < radios.length; i++) {
			var $this = $(radios[i]);
			
			// (영향성 분석 = Emergency Preparedness Function) AND
			if(!$this.is(":checked"))
				flag = 0;
		}*/

		if (flag == 0) {
			$("#user_no").show();
			$("#user_yes").hide();
			//location.href="./SA_BOP.html"

		} else if (flag == 1) {
			$("#user_yes").show();
			$("#user_no").hide();
			//$("modal_ok").on("click",function() {location.href="./SA_list.html"});
		}

	});

	$("#modal_ok").on("click", function() {
		if (flag == 1) {
			location.reload();
		}
	});

	function accept() {
		if (confirm("사용자를 승인하시겠습니까?") == true) {
			alert("승인이 완료되었습니다.");
			location.reload();
		} else {
			return;
		}
	}
</script>
<%@include file="../includes/footer.jsp"%>