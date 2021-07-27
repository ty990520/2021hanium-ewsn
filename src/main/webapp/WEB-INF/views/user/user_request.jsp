<%@page import="com.hanium.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
</head>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" id="modal_this">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">사번 인증</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<span id="user_valid">사번 인증이 완료되었습니다.</span>
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
		<b>사용자 승인 요청 관리</b>
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
	<p>관리자만 조회할 수 있는 페이지입니다.</p>
	<BR>
	<table class="table">
		<thead>
			<tr>
				<th style="width: 30px;">Id</th>
				<th>승인 요청 날짜</th>
				<th>발전소 구분</th>
				<th>부서명</th>
				<th>사번</th>
				<th>사번 인증</th>
				<th>사원명</th>
				<th>승인</th>
			</tr>
		</thead>
		<tbody id="table_body">
			<c:forEach items="${userRequest}" var="request" varStatus="status">
				<tr>
					<td style="width: 30px;"><c:out value="${status.count}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${request.reqdate}" /></td>
					<td><c:out value="${request.userptype}" /></td>
					<td><c:out value="${request.userdept}" /></td>
					<td><c:out value="${request.userid}" /></td>
					<td><c:if test="${request.valid eq false}">
							<button class="btn btn-danger" data-oper="valid"
								data-toggle="modal" id="assess_btn"
								data-target="#staticBackdrop"
								onclick="validate('${request.userid}')">인증</button>
						</c:if> <c:if test="${request.valid eq true}">
							<button class="btn btn-danger" data-oper="valid"
								data-toggle="modal" id="assess_btn"
								data-target="#staticBackdrop" disabled="disabled">완료</button>
						</c:if></td>
					<td><c:out value="${request.username}" /></td>
					<c:if test="${request.valid eq true}">
						<td><button type="submit" class="btn btn-success"
								data-oper="permission" onclick="accept('${request.userid}')">승인 확인</button></td>

					</c:if>
					<c:if test="${request.valid eq false}">
						<td><button type="submit" class="btn btn-success"
								onclick="accept()" disabled="disabled">인증 필요</button></td>
					</c:if>
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
		<br> <br>
	</nav>
</div>
<br>

</body>
<script>
	/*사번 인증*/
	function validate(id) {
		alert(id);
		$.ajax({
			contentType : "application/json; charset=utf-8;",
			type : "GET",
			url : "/user/valid",
			data : {
				"userid" : id
			},
			success : function(response) {
				conlose.log(response);
				alert(response);
				/*if (response == "success") {
					$("#user_valid").text("성공");
				} else
					$("#user_valid").text("실패");*/
				//인증 비활성화
				//승인 활성화
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}
	
	/*$(document).ready(
			function() {
				var formObj = $("#button_form");
				$('button').on(
						"click",
						function(e) { //모든 button태그에 대한 클릭 이벤트 처리
							e.preventDefault(); //버튼의 기본 submit() 동작 막기
							var operation = $(this).data("oper"); //data-oper 값 읽어오기
							console.log(operation);

							if (operation === 'valid') {
								formObj.attr("action", "/user/valid").attr(
										"method", "get");
								$("#modal_ok").on("click", function() {
									formObj.submit();
								})
							} else if (operation === 'permission') {
								if (confirm("사용자를 승인하시겠습니까?") == true) {
									alert("승인이 완료되었습니다.");
									formObj.attr("action", "/user/permission")
											.attr("method", "post");
									formObj.submit();
								} else {
									return;
								}
								//move to list
							}

						})
			})*/
</script>
<%@include file="../includes/footer.jsp"%>