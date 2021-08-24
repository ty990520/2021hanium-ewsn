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
<div class="modal fade" id="transferDeptModal" tabindex="-1"
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
				<form id="updateDeptForm" action="/user/update_userdept"
					method="post">
					<div class="form-group">
						<label for="recipient-name" class="col-form-label"><b>기존에
								등록된 사원에 대해 부서 이동</b></label> <input type="text" class="form-control"
							name="userid" id="inputUserid" placeholder="사번 입력"><label
							for="recipient-name" class="col-form-label"><span
							id="userSearch" style="color: #8e9092; display: none;">유저조회결과</span></label>
						<br>
						<button type="button" class="btn btn-danger" style="float: right;"
							onclick="findUser()">사원 조회</button>
					</div>
					<br>
					<hr>
					<br>
					<div class="form-group">
						<label for="message-text" class="col-form-label"><b>해당
								사원을 다음 부서로 이동</b></label> <select class="custom-select" disabled="disabled"
							id="inputGroupSelect01" name="userptype">
							<option selected disabled="disabled">발전소 구분</option>
							<option value="수력">수력</option>
							<option value="원자력">원자력</option>
							<option value="화력">화력</option>
						</select>
					</div>
					<div class="form-group">
						<select class="custom-select" id="inputGroupSelect02"
							disabled="disabled" name="userdept">
							<option selected disabled="disabled">부서명</option>
							<c:forEach items="${deptList}" var="dept" varStatus="status">
								<option value="${dept}"><c:out value="${dept}" /></option>
							</c:forEach>
						</select>


					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-danger" id="transferBtn"
					onclick="transferDept()" disabled="disabled">부서 이동</button>
			</div>
		</div>
	</div>
</div>
<div class="content">

	<div class="box_Set">
		<h1>관리자 페이지</h1>
		<p>관리자는 다음 기능을 사용할 수 있습니다.</p>
		<br>
		<div class="box" onclick="location.href='/RepresentCode/Code_deEnroll'">
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
		<div class="box" data-toggle="modal" data-target="#transferDeptModal"
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
		<c:if test="${not empty admin}">
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
		</c:if>
		<br> <br>
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

	$("#user_req").on("click", function() {
		self.location = "/user/user_request";
	})

	$("#admin_req").on("click", function() {
		self.location = "/user/admin_request";
	})

	function findUser() {
		var id = $("#inputUserid").val();
		$.ajax({
			contentType : "application/json; charset=utf-8;",
			dataType : "json",
			type : "GET",
			url : "/user/findUserDept",
			data : {
				"userid" : id

			},
			success : function(data) {
				if (!data) {
					alert("존재하지 않는 사번입니다");
					$("#userSearch").css('display', 'none')
					return false;
				}
				console.log(data);
				$("#userSearch").text(
						data.username + "님(" + data.userid + ")은 현재 "
								+ data.userptype + " 발전소 " + data.userdept
								+ " 소속입니다.");
				$("#userSearch").css('display', 'block')
				$("#inputGroupSelect01").attr("disabled", false);
				$("#inputGroupSelect02").attr("disabled", false);
				$("#transferBtn").attr("disabled", false);

				/*var html = '';
				html += '<form class="form-signin" action="" id="ajax">';
				html += '사번<input type="text" class="form-control"  name="name" value="'+data.userid+'">';
				html += '<input type="text" class="form-control" name=id" value="'+data.userptype+'">';
				html += '이메일<input type="text" class="form-control"  name="email" value="'+data.userdept+'">';
				html += '비밀번호<input type="text" class="form-control" name="password" value="'+data.username+'">';
				html += '</form>';
				$("#container").after(html);*/

			},
			error : function(request, status, error) {
				alert("존재하지 않는 사번입니다");
				$("#userSearch").css('display', 'none');
				$("#inputGroupSelect01").attr("disabled", true);
				$("#inputGroupSelect02").attr("disabled", true);
				$("#transferBtn").attr("disabled", true);
			}
		})
	}

	function transferDept() {
		var formObj = $("#updateDeptForm");
		if (confirm("해당 사원의 부서를 이동시키겠습니까?") == true) {
			alert("부서 이동이 완료되었습니다.");
			formObj.submit();
		} else {
			return false;
		}
	}
</script>
<%@include file="../includes/footer.jsp"%>