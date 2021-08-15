
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

.register_box_inner_detail2 {
	display: flex;
	align-items: center;
}

.register_box_inner {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.input_width100 {
	width: fit-content;
}
</style>
<form name=form action="register" method="post" id="form">
	<div class="right-container">
		<h1>
			<b>사이버보안 통제항목 관리 등록 내용</b>
		</h1>
		<hr>
		<br>

		<div class="register_box">
			<div class="register_box_inner">
				<div class="register_box_inner_detail2">
					<div class="register_box_inner_flexdirection_row">
						<h6>통제항목분류&nbsp;&nbsp;&nbsp;</h6>
						<select id="select1" onChange="chnQnaType()" name="CI_type">
							<option value="기술적">기술적</option>
							<option value="운영적">운영적</option>
							<option value="관리적">관리적</option>
							<option value="Baseline 보호기준">Baseline 보호기준</option>
						</select>
					</div>
					<div class="register_box_inner_flexdirection_row">
						<h6>&nbsp;&nbsp;&nbsp;&nbsp;통제항목 상세분류</h6>
						&nbsp;&nbsp; <select id="schQnaType" name="CI_detailType">
						</select>
					</div>

				</div>
				<br> <br>

				<h6>자산기능</h6>
				<textarea cols="50" class="input_width100" rows="10"
					name="CI_content" placeholder="자산기능 입력"></textarea>
				<br> <br>

				<div class="register_box_inner_detail2">
					<div class="register_box_inner_flexdirection_row">
						<h6 align="center">해당 통제항목이 적용되는 자산</h6>
						<br> <input type="checkbox" onchange="YnCheck(this)"
							class="checkSelect" value="CI_pcServer"> PC/Server &nbsp;
						<input type="hidden" name="CI_pcServer" value="N" id="CI_pcServer">

						<input type="checkbox" onchange="YnCheck(this)"
							class="checkSelect" value="CI_BOP"> BOP DA &nbsp; <input
							type="hidden" name="CI_BOP" value="N" id="CI_BOP"> <input
							type="checkbox" onchange="YnCheck(this)" class="checkSelect"
							value="CI_indirect"> Indirect DA <input type="hidden"
							name="CI_indirect" value="N" id="CI_indirect"> <input
							type="hidden" name="CI_EP" value="N" id="CI_EP"> <input
							type="checkbox" onchange="YnCheck(this)" class="checkSelect"
							value="CI_EP"> EP DA &nbsp;
					</div>
				</div>
				<br> <br>
				<div class="register_box_inner_detail2">
					<div class="register_box_inner_flexdirection_row">
						<input type="hidden" name="CI_CF_MF" value="N" id="CI_CF_MF">
						<input type="checkbox" onchange="YnCheck(this)"
							class="checkSelect" value="CI_CF_MF"> Control Facilities
						MF DA &nbsp; <input type="hidden" name="CI_CF_LF" value="N"
							id="CI_CF_LF"> <input type="checkbox"
							onchange="YnCheck(this)" class="checkSelect" value="CI_CF_LF">
						Control Facilities LF DA
					</div>
				</div>
				<br> <br>
				<div class="register_box_inner_detail2">
					<div class="register_box_inner_flexdirection_row">
						<input type="hidden" name="CI_CF_HF" value="N" id="CI_CF_HF">
						<input type="checkbox" onchange="YnCheck(this)"
							class="checkSelect" value="CI_CF_HF"> Control Facilities
						HF DA &nbsp; <input type="hidden" name="CI_FF_MF" value="N"
							id="CI_FF_MF"> <input type="checkbox"
							onchange="YnCheck(this)" class="checkSelect" value="CI_FF_MF">
						Field Facilites MF DA
					</div>
				</div>
				<br> <br>
				<div class="register_box_inner_detail2">
					<div class="register_box_inner_flexdirection_row">
						<input type="hidden" name="CI_FF_LF" value="N" id="CI_FF_LF">
						<input type="checkbox" onchange="YnCheck(this)"
							class="checkSelect" value="CI_FF_LF"> Field Facilites LF
						DA &nbsp;&nbsp; <input type="hidden" name="CI_FF_HF" value="N"
							id="CI_FF_HF"> <input type="checkbox"
							onchange="YnCheck(this)" class="checkSelect" value="CI_FF_HF">
						Field Facilites HF DA
					</div>
				</div>
				<br> <br>
			</div>
		</div>

		<br>
		<hr>
		<br>
		<div class="table_button_group">
			<button type="button" class="btn btn-secondary">취소</button>
			<button type="submit" class="btn btn-danger">등록</button>

		</div>
		<br> <br>
	</div>
</form>


<script>
	/* 다중 체크박스 처리 */
	$(document)
			.ready(
					function() {
						$('#schQnaType').append(
								"<option value='접근통제' >접근통제</option>'");
						$('#schQnaType').append(
								"<option value='감사 및 책임' >감사 및 책임 </option>'");
						$('#schQnaType')
								.append(
										"<option value='시스템 및 통신의 보호' >시스템 및 통신의 보호 </option>'");
						$('#schQnaType').append(
								"<option value='식별 및 인증' >식별 및 인증 </option>'");
						$('#schQnaType')
								.append(
										"<option value='시스템 보안 강화' >시스템 보안 강화 </option>'");
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
			$('#schQnaType').append("<option value='접근통제' >접근통제</option>'");
			$('#schQnaType').append(
					"<option value='감사 및 책임' >감사 및 책임 </option>'");
			$('#schQnaType').append(
					"<option value='시스템 및 통신의 보호' >시스템 및 통신의 보호 </option>'");
			$('#schQnaType').append(
					"<option value='식별 및 인증' >식별 및 인증 </option>'");
			$('#schQnaType').append(
					"<option value='시스템 보안 강화' >시스템 보안 강화 </option>'");

		} else if (type == '운영적') { // 운영적 
			console.log('운영적');
			$('#schQnaType').append("<option value='인적 보안' >인적 보안 </option>'");
			$('#schQnaType').append(
					"<option value='시스템 및 정보 무결성' >시스템 및 정보 무결성 </option>'");
			$('#schQnaType').append("<option value='유지보수' >유지보수 </option>'");
			$('#schQnaType').append(
					"<option value='물리적 및 환경적 보호' >물리적 및 환경적 보호 </option>'");
			$('#schQnaType').append(
					"<option value='인식제고 및 훈련 ' >인식제고 및 훈련 </option>'");
			$('#schQnaType').append("<option value='형상관리' >형상관리  </option>'");
		} else if (type == '관리적') { // 관리적 
			$('#schQnaType').append(
					"<option value='시스템 및 서비스 획득' >시스템 및 서비스 획득 </option>'");
			$('#schQnaType').append("<option value='위험 관리 ' >위험 관리 </option>'");
			document.getElementById("schQnaType").style.display = "";
		} else if (type == 'Baseline 보호기준') { // 보호기
			console.log('Baseline 보호기준');
			$('#schQnaType')
					.append(
							"<option value='보호구역 위치 및 물리적 보호 조치 적용' >보호구역 위치 및 물리적 보호 조치 적용 </option>'");
			$('#schQnaType').append(
					"<option value='무선연결 사용 금지' >무선연결 사용 금지</option>'");
			$('#schQnaType')
					.append(
							"<option value='필수적인 통신 연결 외 통제 조치' >필수적인 통신 연결 외 통제 조치 </option>'");
			$('#schQnaType').append(
					"<option value='휴대용 매체 사용 통제' >휴대용 매체 사용 통제 </option>'");
			$('#schQnaType')
					.append(
							"<option value='설계 변경 전 사이버보안 측면 평가 수행 ' >설계 변경 전 사이버보안 측면 평가 수행</option>'");
			$('#schQnaType').append(
					"<option value='주기적 기능 시험 수행' >주기적 기능 시험 수행  </option>'");
			$('#schQnaType')
					.append(
							"<option value='주기적 사이버보안 평가 수행' >주기적 사이버보안 평가 수행  </option>'");
		}
	}
</script>

<%@include file="../includes/footer.jsp"%>