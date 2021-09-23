
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/register.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
</head>
<style>
h6 {
	color: navy;
}

p {
	margin-top: revert;
}

td.table-light {
	vertical-align: middle;
}

input.checkSelect {
	width: 15px;
	height: 15px;
}

.input_width100 {
	width: -webkit-fill-available;
}

.table_button_group {
	float: right;
	position: relative;
	top: 0px;
	margin-bottom: 50px;
}

.right-container {
	margin-bottom: 150px;
}

.register_box {
	padding-bottom: 50px;
	width: 80%;
	font-size: large;
	margin: auto;
}
</style>
<form name=form action="register" method="post" id="form"
	onsubmit="return false;">
	<div class="right-container">
		<h1>
			<b>사이버보안 통제항목 관리 등록 내용</b>
		</h1>
		<hr>
		<br>

		<div class="register_box">
			<table class="table table-bordered">
				<tr>
					<td class="table-light" colspan="2">통제항목분류</td>
					<td colspan="6"><select class="input_width100" id="select1"
						onChange="chnQnaType()" name="CI_type">
							<option>--통제 항목 분류를 선택해주세요--</option>
							<option value="기술적">기술적</option>
							<option value="운영적">운영적</option>

					</select></td>
				</tr>
				<tr>
					<td class="table-light" colspan="2">통제항목 상세유형</td>
					<td colspan="6"><select class="input_width100" id="schQnaType"
						name="CI_detail_id" onchange="selectDetailType(this.value);">
							<option>--통제 항목 분류를 선택해주세요--</option>
					</select></td>
				</tr>
				<tr>
					<td class="table-light" colspan="2">통제항목 상세유형번호</td>
					<td colspan="6"><p style="font-size: 16px;" id="detail_id">통제
							항목 상세유형을 선택해주세요</p></td>
				</tr>
				<tr>
					<td class="table-light" colspan="2">통제항목 내용</td>
					<td><textarea cols="50" class="input_width100" rows="10"
							id="da_func" name="CI_content" placeholder="통제항목 내용을 입력해주세요."></textarea></td>
				</tr>
				<tr>
					<td class="table-light" colspan="2">통제항목 적용 자산</td>
					<td>
						<table class="table table-bordered">
							<tr>
								<td class="table-light" colspan="12">해당 통제항목이 적용되는 자산을
									선택해주세요.</td>
							</tr>
							<tr>
								<td class="table-light" colspan="10">자산유형</td>
								<td class="table-light" colspan="2">선택</td>
							</tr>
							<tr>
								<td colspan="10">PC/Server</td>
								<td colspan="2"><input type="checkbox"
									onchange="YnCheck(this)" class="checkSelect"
									value="CI_pcServer"></td>
							</tr>

							<tr>
								<td colspan="10">Control Facilities HF DA</td>
								<td colspan="2"><input type="checkbox"
									onchange="YnCheck(this)" class="checkSelect" value="CI_CF_HF"></td>
							</tr>
							<tr>
								<td colspan="10">Control Facilities MF DA</td>
								<td colspan="2"><input type="checkbox"
									onchange="YnCheck(this)" class="checkSelect" value="CI_CF_MF"></td>
							</tr>
							<tr>
								<td colspan="10">Control Facilities LF DA</td>
								<td colspan="2"><input type="checkbox"
									onchange="YnCheck(this)" class="checkSelect" value="CI_CF_LF"></td>
							</tr>

							<tr>
								<td colspan="10">Field Facilites HF DA</td>
								<td colspan="2"><input type="checkbox"
									onchange="YnCheck(this)" class="checkSelect" value="CI_FF_HF"></td>
							</tr>
							<tr>
								<td colspan="10">Field Facilites MF DA</td>
								<td colspan="2"><input type="checkbox"
									onchange="YnCheck(this)" class="checkSelect" value="CI_FF_MF"></td>
							</tr>

							<tr>
								<td colspan="10">Field Facilites LF DA</td>
								<td colspan="2"><input type="checkbox"
									onchange="YnCheck(this)" class="checkSelect" value="CI_FF_LF"></td>
							</tr>
							<tr>
								<td colspan="10">EP DA</td>
								<td colspan="2"><input type="checkbox"
									onchange="YnCheck(this)" class="checkSelect" value="CI_EP"></td>
							</tr>
							<tr>
								<td colspan="10">BOP DA</td>
								<td colspan="2"><input type="checkbox"
									onchange="YnCheck(this)" class="checkSelect" value="CI_BOP">
								</td>
							</tr>
							<tr>
								<td colspan="10">Indirect DA</td>
								<td colspan="2"><input type="checkbox"
									onchange="YnCheck(this)" class="checkSelect"
									value="CI_indirect"></td>
							</tr>

						</table>
					</td>
				</tr>
			</table>
			<input type="hidden" name="CI_pcServer" value="N" id="CI_pcServer">
			<input type="hidden" name="CI_BOP" value="N" id="CI_BOP"> <input
				type="hidden" name="CI_indirect" value="N" id="CI_indirect">
			<input type="hidden" name="CI_EP" value="N" id="CI_EP"> <input
				type="hidden" name="CI_CF_MF" value="N" id="CI_CF_MF"> <input
				type="hidden" name="CI_CF_LF" value="N" id="CI_CF_LF"> <input
				type="hidden" name="CI_CF_HF" value="N" id="CI_CF_HF"> <input
				type="hidden" name="CI_FF_MF" value="N" id="CI_FF_MF"> <input
				type="hidden" name="CI_FF_LF" value="N" id="CI_FF_LF"> <input
				type="hidden" name="CI_FF_HF" value="N" id="CI_FF_HF"> <input
				type="hidden" name="CI_detailType" id="ci_dtype_id">
		</div>
		<div class="table_button_group">
			<button type="button" class="btn btn-secondary">취소</button>
			<button type="button" class="btn btn-danger" onclick="register()">등록</button>

		</div>
	</div>



</form>


<script>
	/* 다중 체크박스 처리 */
	$(document).ready(function() {
		//chnQnaType();
	});

	function selectDetailType(val) {
		$("#detail_id").text(val);
		//$('#test').val(text);
		$('#ci_dtype_id').val($("#schQnaType option:checked").text());
	}
	$("#select1").change(function() {

		$("#detail_id").text("통제 항목 상세유형을 선택해주세요");
	});

	function YnCheck(obj) {

		//console.log(obj.value);
		var checked = obj.checked;
		var str = "#" + obj.value;
		console.log($(str).val());

		if (checked) {
			$(str).val("Y");
		} else {
			$(str).val("N");
		}

	};

	/* select 선택 시 변환 처리  */
	function chnQnaType() {
		var type = document.getElementById("select1");

		type = type.options[type.selectedIndex].value;
		console.log(type);

		$('#schQnaType').empty();

		if (type == '기술적') { // 기술적 
			console.log('기술적');
			$('#schQnaType').append("<option value='1.1' >계정관리</option>'");
			$('#schQnaType').append("<option value='1.2' >접근통제 이행</option>'");
			$('#schQnaType').append("<option value='1.3' >데이터 이동 통제</option>'");
			$('#schQnaType').append("<option value='1.4' >기능의 분리</option>'");
			$('#schQnaType').append("<option value='1.5' >최소 권한</option>'");
			$('#schQnaType').append("<option value='1.6' >접속실패 기록</option>'");
			$('#schQnaType').append("<option value='1.7' >시스템 사용 공지</option>'");
			$('#schQnaType')
					.append("<option value='1.8' >이전 접속기록 공지</option>'");
			$('#schQnaType').append("<option value='1.9' >세션 잠금</option>'");
			$('#schQnaType').append(
					"<option value='1.10' >접근통제 감독 및 검토</option>'");
			$('#schQnaType').append(
					"<option value='1.11' >식별이나 인증 없이 허가된 활동</option>'");
			$('#schQnaType')
					.append("<option value='1.12' >네트워크 접근통제</option>'");
			$('#schQnaType').append(
					"<option value='1.13' >안전하지 않은 프로토콜의 제한</option>'");
			$('#schQnaType').append("<option value='1.14' >무선연결 금지</option>'");
			$('#schQnaType').append(
					"<option value='1.15' >안전하지 않은 연결</option>'");
			$('#schQnaType').append(
					"<option value='1.16' >휴대용 매체 및 모바일 기기 접근 통제</option>'");
			$('#schQnaType').append(
					"<option value='1.17' >특정 프로토콜 가시성</option>'");
			$('#schQnaType')
					.append("<option value='1.18' >제3자 제품 사용</option>'");
			$('#schQnaType')
					.append("<option value='1.19' >외부시스템의 사용</option>'");
			$('#schQnaType').append(
					"<option value='1.20' >사용자 식별 및 인증</option>'");
			$('#schQnaType').append("<option value='1.21' >패스워드 요건</option>'");
			$('#schQnaType')
					.append(
							"<option value='1.22' >인증 불가한 HMI(Human-Manchine Interface) 보안</option>'");
			$('#schQnaType').append(
					"<option value='1.23' >기기 식별 및 인증</option>'");
			$('#schQnaType').append("<option value='1.24' >식별자 관리</option>'");
			$('#schQnaType').append("<option value='1.25' >인증자 관리</option>'");
			$('#schQnaType').append(
					"<option value='1.26' >암호화 모듈 인증에 따라 암호화를 수행</option>'");
			$('#schQnaType').append(
					"<option value='1.27' >불필요한 서비스 및 프로그램 제거</option>'");
			$('#schQnaType')
					.append(
							"<option value='1.28' >호스트기반 침임탐지시스템(HIDS, Host Intrusion Detection System)</option>'");
			$('#schQnaType').append(
					"<option value='1.29' >파일시스템 및 운영체제 변경 승인</option>'");
			$('#schQnaType').append("<option value='1.30' >하드웨어 구성</option>'");
			$('#schQnaType')
					.append(
							"<option value='1.31' >운영체제, 응용프로그램 및 제3자 소프트웨어 설치 및 업데이트</option>'");

		} else if (type == '운영적') { // 운영적 
			console.log('운영적');
			$('#schQnaType').append("<option value='2.1'>결함 제거</option>'");
			$('#schQnaType').append("<option value='2.2'>악성코드 유입 방지</option>'");
			$('#schQnaType').append(
					"<option value='2.3'>모니터링 도구 및 기술</option>'");
			$('#schQnaType').append("<option value='2.4'>보안 경고</option>'");
			$('#schQnaType').append("<option value='2.5'>보안기능 확인</option>'");
			$('#schQnaType').append(
					"<option value='2.6'>소프트웨어 및 정보의 무결성</option>'");
			$('#schQnaType').append("<option value='2.7'>정보의 입력 제한</option>'");
			$('#schQnaType').append("<option value='2.8'>에러에 대한 조치</option>'");
			$('#schQnaType').append(
					"<option value='2.9'>인식제고 및 훈련 범위</option>'");
			$('#schQnaType').append(
					"<option value='2.10'>인식제고 및 훈련 범위</option>'");
			$('#schQnaType').append("<option value='2.11'>기술적 훈련 </option>'");
			$('#schQnaType').append(
					"<option value='2.12'>특화된 사이버보안 훈련</option>'");
			$('#schQnaType').append("<option value='2.13'>교육훈련 피드백</option>'");
			$('#schQnaType').append("<option value='2.14'>유관기관과의 협력</option>'");
		}
	}

	function register() {
		if ($("#detail_id").text() == "") {
			alert("통제항목 상세 유형을 선택해주세요.");
			return false;
		}
		/*if($("#da_func").text()==""){
			alert("자산 기능을 입력해주세요.");
			return false;
		}*/
		var func = $("#da_func").val();

		// 미입력 또는 공백 입력 방지
		if (func.replace(/\s|　/gi, "").length == 0) {
			alert("통제항목 내용을 입력해주세요.");
			$("#da_func").focus();
			return false;
		}

		if (confirm("통제항목을 등록하시겠습니까?") == true) {
			alert("통제항목이 등록되었습니다.");
			document.getElementById('form').submit();
			return true;
		} else {
			return false;
		}
	}
</script>

<%@include file="../includes/footer.jsp"%>