<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<title>Insert title here</title>
<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/register.css" />
<title>Insert title here</title>
<style>
a {
	text-decoration: none;
	color: black;
}

td.table-light {
	width: 30px;
	vertical-align: middle;
	text-align: center;
}

#openBtn{
	float: right;
}
</style>
</head>
<!-- modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<form action="register2" method="post" id="form">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">이행결과 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<br> <img class="vul_imple_logo"
						src="../../../resources/img/vul_imple_plan.PNG" alt="My Image"
						style="width: 100px;"><br>
					<div class="modal-div">
						<table class="table table-bordered">
							<tr>
								<input type="hidden" name="AI_no" value="${action.AC_no}" />
								<td style="border-style: hidden">이행여부</td>
								<td style="border-style: hidden"><input type="radio"
									name="AI_check">Y &nbsp; <input type="radio"
									name="AI_check">N</td>
							<tr>
								<td style="border-style: hidden">조치불가사유</td>
								<td style="border-style: hidden"><input type="text"
									class="form-control" name="AI_impossibleReason"
									placeholder="불가사유입력"></td>
							<tr>
								<td style="border-style: hidden">대안조치</td>
								<td style="border-style: hidden"><select
									class="custom-select" name="AI_AlterMeasures">
										<option value="대안1">대안조치1</option>
										<option value="대안2">대안조치2</option>
										<option value="대안3" selected>대안조치3</option>
										<option value="대안4">대안조치4</option>
								</select></td>
							<tr>
								<td style="border-style: hidden">이행결과</td>
								<td style="border-style: hidden"><input type="text"
									class="form-control" name="AI_result" placeholder="결과 입력"></td>
							<tr>
								<td style="border-style: hidden">이행완료일자</td>
								<td style="border-style: hidden"><input type="date"
									id="start" name="AI_finishDate" class="form-control"></td>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-danger" id="modal_ok">등록</button>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="right-container">
	<h1>
		<b>이행계획 상세 내용</b>
	</h1>
	<hr>

	<table class="table table-bordered" margin: auto">
		<tr>
			<!-- <th style="text-align: center;">이행계획</th>  -->
			<td colspan="7" style="text-align: center"><b>이행계획</b></td>
		</tr>
		<tr>
			<td class="table-light" colspan="2">조치구분</td>
			<td colspan="2"><c:out value='${action.AC_type}' /></td>
			<td class="table-light" colspan="2">조치부서</td>
			<td colspan="2"><c:out value='${action.AC_dept}' /></td>
		</tr>
		<tr>
			<td class="table-light" colspan="2">조치계획</td>
			<td colspan="2"><c:out value='${action.AC_plan}' /></td>
			<td class="table-light" colspan="2">조치예상일자</td>
			<td colspan="2"><c:out value='${action.AC_expectedDate}' /></td>
		</tr>
		<c:choose>
			<c:when test='${ai.AI_check!=null}'>
				<tr>
					<td colspan="7" style="text-align: center"><b>이행결과</b></td>
				</tr>
				<tr>
					<td class="table-light" colspan="2"
						style="height: 80px; text-align: center">조치불가사유</td>
					<td colspan="2"><c:out value='${ai.AI_impossibleReason}' /></td>
					<td class="table-light" colspan="2"
						style="height: 80px; text-align: center">대안조치</td>
					<td colspan="2"><c:out value='${ai.AI_AlterMeasures}' /></td>
				</tr>
				<tr>
					<td class="table-light" colspan="2"
						style="height: 80px; text-align: center">이행결과</td>
					<td colspan="2"><c:out value='${ai.AI_result}' /></td>
					<td class="table-light" colspan="2"
						style="height: 80px; text-align: center">이행완료일자</td>
					<td colspan="2"><c:out value='${ai.AI_finishDate}' /></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="7" style="height: 200px;">이행결과가 없습니다.</td>
							<button type="button" id="openBtn" class="btn btn-danger"
			data-toggle="modal" data-target="#exampleModal"
			data-whatever="@getbootstrap" data-target="#staticBackdrop">등록</button>
				</tr>
				<div class="table_button_group"></div>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<script>
	var flag = 1; //판별 신호 (1=ep, 0=bop검사)

	$("#assess_btn").on("click", function() {
		console.log(flag);

	});
	function modifyBtn(ai) {
		//alert(daid);
		if (confirm("수정하시겠습니까?") == true) {
			location.href = "/Action/modify?=" + ai;
			return true;
		} else {
			return false;
		}

	}
</script>
<%@include file="../includes/footer.jsp"%>
