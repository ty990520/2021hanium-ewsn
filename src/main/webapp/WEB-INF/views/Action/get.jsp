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

td#cost {
	vertical-align: middle;
}

td.table-light {
	width: 15%;
	vertical-align: middle;
	text-align: center;
}

#openBtn {
	float: right;
	margin-top: 20px;
}

.custom-select {
	width: 300px;
}
td {
    vertical-align: middle !important;
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
									name="AI_check" value="Y">Y &nbsp; <input type="radio"
									name="AI_check" value="N" checked>N</td>
							<tr>
								<td style="border-style: hidden">조치불가사유</td>
								<td style="border-style: hidden"><input type="text"
									class="form-control" name="AI_impossibleReason"
									placeholder="불가사유입력"></td>
							<tr>
								<td style="border-style: hidden">대안조치</td>
								<td style="border-style: hidden">
								<select class="custom-select" id="select1" name="control" onChange="chnQnaType()">
								<option>--통제 항목 분류를 선택해주세요--</option>
								<option value="기술적">기술적</option>
								<option value="운영적">운영적</option>
								</select>
								</td>
								
							<tr>
								<td style="border-style: hidden">상세유형</td>
								<td style="border-style: hidden">
								<select class="custom-select" id="schQnaType" name="AI_AlterMeasures"></select>
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

	<table class="table table-bordered"margin:auto">
		<tr>
			<!-- <th style="text-align: center;">이행계획</th>  -->
			<td colspan="12" style="text-align: center"><b>이행계획</b></td>
		</tr>
		<tr>

			<td class="table-light" colspan="2">조치 부서</td>
			<td colspan="4"><c:out value='${action.AC_dept}' /></td>
			<td class="table-light" colspan="2">조치 담당자</td>
			<td colspan="4"><c:out value='${action.AC_manager}' /></td>
		</tr>
		<tr>
			<td class="table-light" colspan="2">조치 구분</td>
			<td colspan="4"><c:out value='${action.AC_type}' /></td>
			<td class="table-light" colspan="2">예상 비용</td>
			<td colspan="4" id="cost"><c:out
					value='${action.estimated_cost}' /></td>
		</tr>
		<tr>
			<td class="table-light" colspan="2" rowspan="3">추진 방안</td>
			<td class="table-light" colspan="2">task1</td>
			<td colspan="9"><c:out value='${action.AC_plan1}' /></td>

		</tr>
		<tr>
			<td class="table-light" colspan="2">task2</td>
			<td colspan="9"><c:out value='${action.AC_plan2}' /></td>

		</tr>
		<tr>
			<td class="table-light" colspan="2">task3</td>
			<td colspan="9"><c:out value='${action.AC_plan3}' /></td>
		</tr>
		<tr>
			<td class="table-light" colspan="2">task1 조치일자</td>
			<td colspan="2"><c:out value='${action.AC_expectedDate1}' /></td>
			<td class="table-light" colspan="2">task2 조치일자</td>
			<td colspan="2"><c:out value='${action.AC_expectedDate2}' /></td>
			<td class="table-light" colspan="2">task3 조치일자</td>
			<td colspan="2"><c:out value='${action.AC_expectedDate3}' /></td>
		</tr>
	</table>
	<table class="table table-bordered" margin:auto">
		<tr>
			<!-- <th style="text-align: center;">이행계획</th>  -->
			<td colspan="12" style="text-align: center"><b>이행결과</b></td>
		</tr>
		<c:choose>
			<c:when test='${ai.AI_no!=null}'>
				<tr>
					<c:if test="${ai.AI_impossibleReason!=null}">
						<td class="table-light" colspan="2"
							style="height: 80px; text-align: center">조치불가사유</td>
						<td colspan="4"><c:out value='${ai.AI_impossibleReason}' /></td>
					</c:if>
					<c:if test="${ai.AI_impossibleReason==null}">
						<td class="table-light" colspan="2"
							style="height: 80px; text-align: center">조치불가사유</td>
						<td colspan="4">불가사유가 없습니다.</td>
					</c:if>
					<c:if test="${ai.AI_AlterMeasures!=null}">
						<td class="table-light" colspan="2"
							style="height: 80px; text-align: center">대안조치</td>
						<td colspan="4"><c:out value='${ai.AI_AlterMeasures}' /></td>
					</c:if>
					<c:if test="${ai.AI_AlterMeasures==null}">
						<td class="table-light" colspan="2"
							style="height: 80px; text-align: center">대안조치</td>
						<td colspan="4">대안조치가 없습니다.</td>
					</c:if>
				</tr>
				<tr>
					<td class="table-light" colspan="2"
						style="height: 80px; text-align: center">이행결과</td>
					<td colspan="4"><c:out value='${ai.AI_result}' /></td>
					<td class="table-light" colspan="2"
						style="height: 80px; text-align: center">이행완료일자</td>
					<td colspan="4"><c:out value='${ai.AI_finishDate}' /></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="12" style="height: 200px;">이행결과가 없습니다.</td>
					<button type="button" id="openBtn" class="btn btn-danger"
						data-toggle="modal" data-target="#exampleModal"
						data-whatever="@getbootstrap" data-target="#staticBackdrop">이행결과
						등록</button>
				</tr>
				<div class="table_button_group"></div>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<script>
	$(document).ready(function() {
		var price = $("#cost").text();

		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		console.log(price.toString().replace(regexp, ','));
		$("#cost").text(price.toString().replace(regexp, ','));
	});

	$('input:radio[name=AI_check]').click(function() {
		if ($("input[name=AI_check]:checked").val() == "Y") {
			//console.log("input[name=AI_check]:checked").val());
			$("input:text[name=AI_impossibleReason]").attr("disabled", true);
			$("select[name=AI_AlterMeasures]").attr("disabled", true);
			$("select[name=control]").attr("disabled", true);
		} else if ($("input[name=AI_check]:checked").val() == "N") {
			$("input:text[name=AI_impossibleReason]").attr("disabled", false);
			$("select[name=AI_AlterMeasures]").attr("disabled", false);
			$("select[name=control]").attr("disabled", false);
		}
	});

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

	/* select 선택 시 변환 처리  */
	function chnQnaType() {
		var type = document.getElementById("select1");

		type = type.options[type.selectedIndex].value;
		console.log(type);

		$('#schQnaType').empty();

		if (type == '기술적') { // 기술적 
			console.log('기술적');
			$('#schQnaType').append("<option value='계정관리'>계정관리</option>'");
			$('#schQnaType').append("<option value='접근통제 이행'>접근통제 이행</option>'");
			$('#schQnaType').append("<option value='데이터 이동 통제'>데이터 이동 통제</option>'");
			$('#schQnaType').append("<option value='기능의 분리'>기능의 분리</option>'");
			$('#schQnaType').append("<option value='최소 권한'>최소 권한</option>'");
			$('#schQnaType').append("<option value='접속실패 기록'>접속실패 기록</option>'");
			$('#schQnaType').append("<option value='시스템 사용 공지'>시스템 사용 공지</option>'");
			$('#schQnaType').append("<option value='이전 접속기록 공지'>이전 접속기록 공지</option>'");
			$('#schQnaType').append("<option value='세션 잠금'>세션 잠금</option>'");
			$('#schQnaType').append("<option value='접근통제 감독 및 검토'>접근통제 감독 및 검토</option>'");
			$('#schQnaType').append("<option value='식별이나 인증 없이 허가된 활동'>식별이나 인증 없이 허가된 활동</option>'");
			$('#schQnaType').append("<option value='네트워크 접근통제'>네트워크 접근통제</option>'");
			$('#schQnaType').append(
					"<option value='안전하지 않은 프로토콜의 제한'>안전하지 않은 프로토콜의 제한</option>'");
			$('#schQnaType').append("<option value='무선연결 금지'>무선연결 금지</option>'");
			$('#schQnaType')
					.append("<option value='안전하지 않은 연결'>안전하지 않은 연결</option>'");
			$('#schQnaType').append(
					"<option value='휴대용 매체 및 모바일 기기 접근 통제'>휴대용 매체 및 모바일 기기 접근 통제</option>'");
			$('#schQnaType').append(
					"<option value='특정 프로토콜 가시성'>특정 프로토콜 가시성</option>'");
			$('#schQnaType')
					.append("<option value='제3자 제품 사용' >제3자 제품 사용</option>'");
			$('#schQnaType').append("<option value='외부시스템의 사용'>외부시스템의 사용</option>'");
			$('#schQnaType').append(
					"<option value='사용자 식별 및 인증'>사용자 식별 및 인증</option>'");
			$('#schQnaType').append("<option value='패스워드 요건' >패스워드 요건</option>'");
			$('#schQnaType')
					.append(
							"<option value='인증 불가한 HMI(Human-Manchine Interface) 보안'>인증 불가한 HMI(Human-Manchine Interface) 보안</option>'");
			$('#schQnaType').append(
					"<option value='기기 식별 및 인증' >기기 식별 및 인증</option>'");
			$('#schQnaType').append("<option value='식별자 관리'>식별자 관리</option>'");
			$('#schQnaType').append("<option value='인증자 관리'>인증자 관리</option>'");
			$('#schQnaType').append(
					"<option value='암호화 모듈 인증에 따라 암호화를 수행' >암호화 모듈 인증에 따라 암호화를 수행</option>'");
			$('#schQnaType').append(
					"<option value='불필요한 서비스 및 프로그램 제거' >불필요한 서비스 및 프로그램 제거</option>'");
			$('#schQnaType')
					.append(
							"<option value='호스트기반 침임탐지시스템' >호스트기반 침임탐지시스템(HIDS, Host Intrusion Detection System)</option>'");
			$('#schQnaType').append(
					"<option value='파일시스템 및 운영체제 변경 승인' >파일시스템 및 운영체제 변경 승인</option>'");
			$('#schQnaType').append("<option value='하드웨어 구성' >하드웨어 구성</option>'");
			$('#schQnaType')
					.append(
							"<option value='운영체제, 응용프로그램 및 제3자 소프트웨어 설치 및 업데이트' >운영체제, 응용프로그램 및 제3자 소프트웨어 설치 및 업데이트</option>'");

		} else if (type == '운영적') { // 운영적 
			console.log('운영적');
			$('#schQnaType').append("<option value='결함 제거'>결함 제거</option>'");
			$('#schQnaType').append("<option value='악성코드 유입 방지'>악성코드 유입 방지</option>'");
			$('#schQnaType').append(
					"<option value='모니터링 도구 및 기술'>모니터링 도구 및 기술</option>'");
			$('#schQnaType').append("<option value='보안 경고'>보안 경고</option>'");
			$('#schQnaType').append("<option value='보안기능 확인'>보안기능 확인</option>'");
			$('#schQnaType').append(
					"<option value='소프트웨어 및 정보의 무결성'>소프트웨어 및 정보의 무결성</option>'");
			$('#schQnaType').append("<option value='정보의 입력 제한'>정보의 입력 제한</option>'");
			$('#schQnaType').append("<option value='에러에 대한 조치>에러에 대한 조치</option>'");
			$('#schQnaType').append(
					"<option value='인식제고 및 훈련 범위'>인식제고 및 훈련 범위</option>'");
			$('#schQnaType').append(
					"<option value='인식제고 및 훈련 범위'>인식제고 및 훈련 범위</option>'");
			$('#schQnaType').append("<option value='기술적 훈련'>기술적 훈련 </option>'");
			$('#schQnaType').append(
					"<option value='특화된 사이버보안 훈련'>특화된 사이버보안 훈련</option>'");
			$('#schQnaType').append("<option value='교육훈련 피드백'>교육훈련 피드백</option>'");
			$('#schQnaType').append("<option value='유관기관과의 협력'>유관기관과의 협력</option>'");
		}
	}

</script>
<%@include file="../includes/footer.jsp"%>
