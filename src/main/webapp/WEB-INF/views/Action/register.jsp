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

.input_width100 {
	float: left;
	font-size: 0.9rem;
	padding: 5px 3px;
	width: -webkit-fill-available;
	border-radius: 4px;
	border-color: ghostwhite;
}


td.table-light {
	text-align: center;
	vertical-align: middle;
	width: 20%;
}

.table {
	margin-bottom: 0;
}
</style>
</head>
<div class="right-container">
	<h1>
		<b>이행계획 등록</b>
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
					<td colspan="2" class="table-light">등록할 조치권고 선택</td>
					<td colspan="10"><select class="selectBox"
						id="vul_action-select">
							<!-- <option>조치권고를 선택하세요.</option> -->
							<c:forEach items="${ac_list}" var="ar" varStatus="status">
								<option value="${ar.AR_no}">${ar.AR_title}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td class="table-light" colspan="2" style="width: 20%">발행일자</td>
					<td colspan="10"><p id="AR_regDate"></p></td>
				</tr>
				<tr>
					<td colspan="2" class="table-light">자산번호</td>
					<td colspan="4"><p id="AR_daID"></p></td>
					<td colspan="2" class="table-light">자산명</td>
					<td colspan="4"><p id="AR_daName"></p></td>
				</tr>


				<tr>
					<td colspan="2" class="table-light">제목</td>
					<td colspan="10"><p id="AR_title"></p></td>
				</tr>
				<tr>
					<td colspan="2" class="table-light">권고사항</td>
					<td colspan="10"><p id="AR_issue"></p></td>
				</tr>
				<tr>
					<td colspan="2" class="table-light">조치유형</td>
					<td colspan="4"><p id="AR_ActionType"></p></td>
					<td colspan="2" class="table-light">시스템 S/W유형</td>
					<td colspan="4" id="AR_daSystemSW"></td>
				</tr>
				<tr>
					<td colspan="2" class="table-light">발행부서</td>
					<td colspan="4"><p id="AR_regDept"></p></td>
					<td colspan="2" class="table-light">발행자</td>
					<td colspan="4"><p id="RegistrarID"></p></td>
				</tr>

			</table>
			<br>

			<div class="table_button_group">
				<span sytle="float:left;"> 이행계획등록 버튼을 누르면 조회한 조치권고에 해당하는
					이행계획을 등록할 수 있습니다. </span>
				<button type="button" id="btn_toggle" class="btn btn-danger"
					data-toggle="modal" data-target="#staticBackdrop">이행계획등록</button>
			</div>
			<br><hr><br><br>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			selectActionRec();
		});

		$("#vul_action-select").change(function() {
			selectActionRec();
		});

		function selectActionRec() {
			//selectbox의 리스트에서 선택된 Index를 구하는 방법은 다음과 같다.
			var selectedIndex = $("#vul_action-select option:selected").val();
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
					alert("이행할 조치권고가 없습니다.");
					window.history.back();
				}
			});
		}
	</script>
	<div class="right" style="display: none">
		<form name=form onsubmit="return checkAll()" id="register"
			action="register" method="post">
			<table class="table table-bordered">
				<tr>
					<c:forEach items="${ac_list}" var="ar" varStatus="status">
						<input id="hiddenNo" type="hidden" name="AC_no">
						<script>
							$(document).ready(function() {
								$('#hiddenNo').val("${ar.AR_no}");
							});
						</script>
					</c:forEach>
				</tr>

				<tr>
					<td class="table-light" colspan="2">조치부서</td>
					<td colspan="10"><input type="text"class="input_width100" placeholder="조치부서 입력"  name="AC_dept"></td>
				</tr>
				<tr>
					<td colspan="2" class="table-light">조치담당자</td>
					<td colspan="10"><input type="text"class="input_width100" placeholder="조치담당자 입력"  name="AC_manager"></td>
				</tr>

				<tr>
					<td class="table-light" colspan="2">조치구분</td>
					<td colspan="10"><select name="AC_type" class="input_width100" >
							<option value="장기">장기</option>
							<option value="중기">중기</option>
							<option value="단기">단기</option>
					</select></td>
				</tr>
				<tr>
					<td class="table-light" rowspan="3" colspan="2">조치계획</td>
					<td class="table-light" colspan="1">Task1</td>
					<td colspan="9"><textarea class="input_width100" rows="10"
						placeholder="조치계획 Task1 입력" name="AC_plan1"></textarea></td>
				</tr>
				<tr>
					<td class="table-light" colspan="1">Task2</td>
					<td colspan="9"><textarea class="input_width100" rows="10"
						placeholder="조치계획 Task2 입력" name="AC_plan2"></textarea></td>
				</tr>
				<tr>
					<td class="table-light" colspan="1">Task3</td>
					<td colspan="9"><textarea class="input_width100" rows="10"
						placeholder="조치계획 Task3 입력" name="AC_plan3"></textarea></td>
				</tr>
				<tr>
					<td class="table-light" colspan="2">예상 비용</td>
					<td colspan="10"><input class="input_width100" type="text" placeholder="예상비용 입력 (','제외한 숫자값으로 입력)" name="estimated_cost"></td>
				</tr>
				<tr>
					<td class="table-light" rowspan="3" colspan="2">일정</td>
					<td class="table-light"  colspan="1">task1</td>
					<td><input type="date" class="input_width100" name="AC_expectedDate1"></td>
				</tr>
				<tr>
					<td class="table-light" colspan="1">task2</td>
					<td><input type="date" class="input_width100" name="AC_expectedDate2"></td>
				</tr>
					<tr>
					<td class="table-light" colspan="1">task3</td>
					<td><input type="date" class="input_width100" name="AC_expectedDate3"></td>
				</tr>
			</table>
			<div class="register_table_button_group">
				<button type="submit" id="btn_toggle" class="btn btn-danger"
					data-toggle="modal" data-target="#staticBackdrop">등록</button>
			</div>
		</form>

	</div>

</div>
<script>
	$(document).ready(function() {
		/* 호출할 내용
		alert('다 로딩됐다!')*/
	});
</script>
<%@include file="../includes/footer.jsp"%>