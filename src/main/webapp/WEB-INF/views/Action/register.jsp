<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<link rel="stylesheet" type="text/css"
	href="../../../resources/css/menu.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/component.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/vul_imple_plan.css" />
<title>Insert title here</title>
<style>
.btn {
	float: right;
}
</style>
</head>
<div class="right-container">
	<h1>
		<b>이행계획 리스트 등록</b>
	</h1>
	<hr>

	<script>
		$(function() {
			$("#btn_toggle").click(function() {
				$(".empty").toggle();
				$(".right").toggle();
			});
		})
	</script>

	<div class="imple_plan_box">
		<div class="left">
			<table class="table table-bordered">
				<tr>
					<td colspan="6"><label for="vul_action-select"> 등록할
							조치권고 선택:</label> <select id="vul_action-select">
							<c:forEach items="${ac_list}" var="ar" varStatus="status">
								<option selected value="${ar.AR_no}">${ar.AR_title}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td class="table-light">발행일자</td>
					<td><p id="AR_regDate"></p></td>
				</tr>
				<tr>
					<td class="table-light">자산번호</td>
					<td><p id="AR_daID"></p></td>
				</tr>
				<tr>
					<td class="table-light">자산명</td>
					<td><p id="AR_daName"></p></td>
				</tr>
				<tr>
					<td class="table-light">시스템 S/W유형</td>
					<td id="AR_daSystemSW"></td>
				</tr>
				<tr>
					<td class="table-light">시스템 S/W</td>
					<td><p id="AR_ActionType"></p></td>
				</tr>
				<tr>
					<td class="table-light">제목</td>
					<td><p id="AR_title"></p></td>
				</tr>
				<tr>
					<td class="table-light">권고사항</td>
					<td><p id="AR_issue"></p></td>
				</tr>
				<tr>
					<td class="table-light">발행부서</td>
					<td><p id="AR_regDept"></p></td>
				</tr>
				<tr>
					<td class="table-light">발행자</td>
					<td><p id="RegistrarID"></p></td>
				</tr>
			</table>
			<br>
			<div class="table_button_group">
				<button type="button" id="btn_toggle" class="btn btn-danger"
					data-toggle="modal" data-target="#staticBackdrop">이행계획등록</button>
			</div>
		</div>
		<script>
			$("#vul_action-select").change(
					function() {
						//selectbox의 리스트에서 선택된 Index를 구하는 방법은 다음과 같다.
						var selectedIndex = $(
								"#vul_action-select option:selected").val();
						console.log(selectedIndex);
						$.ajax({
							contentType : "application/json; charset=utf-8;",
							dataType : "json",
							type : "GET",
							url : "/Action/selectAr",
							data : {
								"AR_no" : selectedIndex
							},
							success : function(data) {
								if (!data) {
									console.log("err");
								}
								console.log(data);
								$("#AR_regDate").text(data.ar_regDate)
								$("#AR_no").text(data.ar_no)
								$("#AR_daID").text(data.ar_daID)
								$("#AR_daName").text(data.ar_daName)
								$("#AR_daSystemSW").text(data.ar_daSystemSW)
								$("#AR_title").text(data.ar_title)
								$("#AR_ActionType").text(data.ar_ActionType)
								$("#AR_issue").text(data.ar_issue)
								$("#AR_regDept").text(data.ar_regDept)
								$("#RegistrarID").text(data.registrarID)
							},
							error : function(request, status, error) {
								alert("code:" + request.status + "\n"
										+ "message:" + request.responseText
										+ "\n" + "error:" + error);
							}
						})
					});
		</script>
		<div class="empty">
			<h5>
				이행계획등록 버튼을 누르면<br>조회한 조치권고에 해당하는 이행계획을 등록할 수 있습니다.
			</h5>
		</div>
		<div class="right" style="display: none">
			<form name=form onsubmit="return checkAll()" id="register"
				action="register" method="post">
				<table class="table table-bordered" style="top: 80px">
					<tr>						<c:forEach items="${ac_list}" var="ar" varStatus="status">
						<input id="hiddenNo" type="hidden" name="AC_no" value= placeholder="단기">
			<script>
			$(document).ready(function() {
		        $('#hiddenNo').val("${ar.AR_no}");
		    });
			</script>
			</c:forEach>
					</tr>
					<tr>
						<td class="table-light">조치계획</td>
						<td><input name="AC_plan" type="text" placeholder="단기"></td>
					</tr>

					<tr>
						<td class="table-light">조치부서</td>
						<td><input type="text" name="AC_dept" placeholder="정보보안"></td>
					</tr>
					<tr>
						<td class="table-light">조치담당자</td>
						<td><input type="text" name="AC_manager" placeholder="담당자"></td>
					</tr>
					<tr>
						<td class="table-light">조치예상일자</td>
						<td><input type="text" name="AC_expectedDate" placeholder="3일"></td>
					</tr>
					<tr>
						<td class="table-light">조치구분</td>
						<td><input type="text" name="AC_type"
							placeholder="조치구분"></td>
					</tr>
				</table>
				<div class="register_table_button_group">
					<button type="submit" id="btn_toggle" class="btn btn-danger"
						data-toggle="modal" data-target="#staticBackdrop"
						onclick="register()">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>


</script>