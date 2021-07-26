<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/admin_menu.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<head>

</head>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">부서 이동</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="recipient-name" class="col-form-label">기존에 등록된
							사원에 대해 부서 이동</label> <input type="text" class="form-control"
							id="recipient-name"> <br>
						<button type="button" class="btn btn-danger" style="float: right;">사원
							조회</button>
					</div>
					<br>
					<hr>
					<br>
					<div class="form-group">
						<label for="message-text" class="col-form-label">해당 사원을 다음
							부서로 이동</label> <select class="custom-select" id="inputGroupSelect01">
							<option selected>발전소 구분</option>
							<option value="1">수력</option>
							<option value="2">원자력</option>
							<option value="3">화력</option>
						</select>


					</div>
					<div class="form-group">
						<select class="custom-select" id="inputGroupSelect01">
							<option selected>부서명</option>
							<option value="1">관리자그룹</option>
							<option value="2">사이버보안 담당 그룹</option>
							<option value="3">설비운영 그룹</option>
						</select>


					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-danger">부서 이동</button>
			</div>
		</div>
	</div>
</div>
<div class="content">

	<div class="box_Set">
		<h1>관리자 페이지</h1>
		<p>관리자는 다음 기능을 사용할 수 있습니다.</p>
		<br>
		<div class="box" onclick="location.href='../code/Code_reEnroll.html'">
			<div class="inner_box">
				<div class="img">
					<img src="../../../resources/img/check.png">
				</div>
				<div class="text">
					<h2>부서 추가</h2>
					<p>공통코드에 부서코드를 추가합니다.</p>
				</div>
			</div>
		</div>
		<div class="box" data-toggle="modal" data-target="#exampleModal"
			data-whatever="@getbootstrap">
			<div class="inner_box">
				<div class="img">
					<img src="../../../resources/img/person.png">
				</div>
				<div class="text">
					<h2>부서 이동</h2>
					<p>특정 사원의 부서를 이동시킵니다.</p>
				</div>
			</div>
		</div>
		<div class="box" id="user_req">
			<div class="inner_box">
				<div class="img">
					<img src="../../../resources/img/accept.png">
				</div>
				<div class="text">
					<h2>승인 요청 관리</h2>
					<p>승인 요청을 보낸 사용자를 관리합니다.</p>
				</div>
			</div>
		</div>
		<!-- 최고관리자는 아래의 페이지도 뜸 -->
		<div class="box" id="admin_req">
			<div class="inner_box">
				<div class="img">
					<img src="../../../resources/img/lock2.png">
				</div>
				<div class="text">
					<h2>관리자 승인 요청</h2>
					<p>관리자그룹으로 승인 요청을 보낸 사용자를 관리합니다.</p>
				</div>
			</div>
		</div>
		<br><br>
	</div>
</div>

</body>
<script>
	/*사원정보 테이블에 존재하는 사번인지 비교하여 상황별 메시지 띄움*/
	var flag = 1; //판별 신호 (1=ep, 0=bop검사)

	$("#assess_btn").on("click", function() {
		//console.log(flag);

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
	
	$("#user_req").on("click", function() {
		self.location = "/user/user_request";
	})
	
	$("#admin_req").on("click", function() {
		self.location = "/user/admin_request";
	})
</script>
<%@include file="../includes/footer.jsp"%>