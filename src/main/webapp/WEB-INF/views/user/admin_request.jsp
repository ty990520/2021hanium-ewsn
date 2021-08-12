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
				<span id="user_valid">
					<div class="spinner-border text-danger" role="status">
						<span class="sr-only">Loading...</span>
					</div>
				</span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal"
					id="modal_ok" onclick="location.reload();">닫기</button>
			</div>
		</div>
	</div>
</div>
<div class="right-container">
	<h1>
		<b>관리자 승인 요청 관리</b>
	</h1>
	<hr>
	<form id="searchForm" action="/user/admin_request" method="get">
		<select name="type">
			<option value="N" selected="selected" <c:out value='${cri.type eq "N"?"selected": "" }'/>>사원명</option>
			<option value="I" <c:out value='${cri.type eq "I"?"selected": "" }'/>>사원번호</option>
			<option value="P" <c:out value='${cri.type eq "P"?"selected": "" }'/>>발전소구분</option>
		</select> <input type="text" name="keyword" class="kw" value="<c:out value='${cri.keyword}'/>"/>
		<button class="btn btn-outline-secondary">검색</button>
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
					<td style="width: 30px;"><c:out value="${status.count}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${request.reqdate}" /></td>
					<td><c:out value="${request.userptype}" /></td>

					<td><c:out value="${request.userid}" /></td>
					<td><c:if test="${request.valid eq false}">
							<button class="btn btn-danger" data-oper="valid"
								data-toggle="modal" id="assess_btn"
								data-target="#staticBackdrop"
								onclick="validate('${request.userid}')">인증</button>
						</c:if> <c:if test="${request.valid eq true}">
							<button class="btn btn-danger" disabled="disabled">완료</button>
						</c:if></td>
					<td><c:out value="${request.username}" /></td>
					<c:if test="${request.valid eq true}">
						<td><button class="btn btn-success" data-oper="permission"
								onclick="permiss('${request.userid}')">유저 승인</button></td>

					</c:if>
					<c:if test="${request.valid eq false}">
						<td><button type="button" class="btn btn-success"
								disabled="disabled">인증 필요</button></td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<br>
	<br>
	<br>
</div>

</body>
<script>
	var searchForm = $('#searchForm');
	$('#searchForm button').on('click', function(e) {
		if (!searchForm.find('input[name="keyword"]').val()) {
			alert('키워드를 입력하세요');
			return false;
		}
		e.preventDefault();
		searchForm.find('input[name="pageNum"]').val('1');
		searchForm.submit();
	});

	/*사번 인증*/
	function validate(id) {
		$.ajax({
			contentType : "application/json; charset=utf-8;",
			type : "GET",
			url : "/user/valid",
			data : {
				"userid" : id
			},
			success : function(response) {
				//conlose.log(response);
				if (response == "success") {
					$("#user_valid").text("인증에 성공하였습니다.");
				} else
					$("#user_valid").text("인증에 실패하였습니다.");
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}

	/*유저 승인*/
	function permiss(id) {
		if (confirm("사용자를 승인하시겠습니까?") == true) {
			$.ajax({
				contentType : "application/json; charset=utf-8;",
				type : "GET",
				url : "/user/permission",
				data : {
					"userid" : id
				},
				success : function(response) {
					//conlose.log(response);
					alert("승인이 완료되었습니다.");
					location.reload();
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			})
		} else {
			return;
		}

	}
</script>
<%@include file="../includes/footer.jsp"%>