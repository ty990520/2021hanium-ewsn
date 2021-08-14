<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/register.css" />
<style>
body{
	background-color:#dee2e673;
}
.process-image {
	float: right;
}

.register_box_inner {
	width: 40%;
	padding: 0 120px 0 0;
}

.register_box_inner_last {
	width: 40%;
	padding: 0 0 0 100px;
}
</style>

</head>
<!-- Modal ep 확정인 경우 -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">DA 단계적 보안성 평가
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<span id="bop_yes">해당 자산은 BOP입니다.<BR> 단계적 보안성 평가를 종료합니다.
				</span> <span id="bop_no">해당 자산은 BOP가 아닙니다.<BR> 다음 평가로 넘어갑니다.
				</span>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-danger" id="modal_ok">확인</button>
			</div>
		</div>
	</div>
</div>
<div class="right-container">
	<form action="registerBOP" method="post" onSubmit="return false;" id="form">

		<div class="register_box">
			<h1>
				<b>DA 단계적 보안성 평가</b> <img alt=""
					src="../../../resources/img/process2.png" width="20%"
					class="process-image">
			</h1>
			<hr>
			<p style="color: gray;">BOP자산을 평가하는 과정입니다.</p>
			<input id="daid" type="hidden" value="<c:out value="${daid}"/>" name="SA_daID" />
			<input type="hidden" value="BOP DA" name="SA_IdentifyType" /> <br>
			<h4>
				<b>평가1) DA 손상시 안전시스템에 악영향</b>
			</h4>
			<br>
			<div class="register_box_inner_detail">

				<div class="register_box_inner_flexdirection_row">
					<p>1-1. DA 손상시 안전시스템에 악영향 여부</p>
					<input type="radio" name="group1" value="Y"
						 class="radio_size"> Y &nbsp; <input
						type="radio" name="group1" value="N" class="radio_size" checked="checked"
						> N
				</div>
			</div>
			<br>
			<fieldset id="target_btn">
				<p>1-2. DA 손상시 안전시스템에 악영향 관련 내용</p>
				<textarea cols="50" class="input_width100" rows="5"
					placeholder="손상시 안전시스템에 악영향 관련 내용 입력" name="bopAdverseEffectsContent"></textarea>
			</fieldset>
			<br> <br>
			<hr>
			<br> <br>
			<h4>

				<b>평가2) 발전정지 유발</b>
			</h4>
			<br>
			<div class="register_box_inner_detail">
				<div class="register_box_inner_flexdirection_row">
					<p>2-1. 발전정지 유발 여부</p>
					<input type="radio" name="group2" value="Y"
						checked="checked" class="radio_size"> Y &nbsp; <input
						type="radio" name="group2" value="N" class="radio_size"
					> N
				</div>
			</div>
			<br>
			<fieldset id="target_btn2">
				<p>2-2 .발전정지 관련 내용</p>
				<textarea cols="50" class="input_width100" rows="5"
					placeholder="발전정지 관련 내용 입력" name="bopPowergenStop"></textarea>
			</fieldset>

			<br> <br>
			<hr>
			<br> <br>
			<h4>

				<b>평가3) 발전소 상태 정보 제공</b>
			</h4>
			<br>
			<div class="register_box_inner_detail">
				<div class="register_box_inner_flexdirection_row">

					<p>3-1. 발전소 상태 정보제공 여부</p>
					<input type="radio" name="group3" value="Y"
						checked="checked" class="radio_size"> Y &nbsp; <input
						type="radio" name="group3" value="N" class="radio_size"
						> N
				</div>
			</div>
			<br>
			<fieldset id="target_btn3">
				<p>3-2. 발전소 상태 정보제공 관련 내용</p>
				<textarea cols="50" class="input_width100" rows="5"
					placeholder="발전소 상태 정보제공 관련 내용 입력" name="bopPlantStatusInfo"></textarea>
			</fieldset>

			<br> <br>
			<hr>
			<br> <br>
			<h4>

				<b>평가4) 심층 방호</b>
			</h4>
			<br>
			<div class="register_box_inner_detail">
				<div class="register_box_inner_flexdirection_row">
					<p>4-1. 심층 방호 관련 여부</p>
					<input type="radio" name="group4" value="Y"
						class="radio_size"> Y &nbsp; <input
						type="radio" name="group4" value="N" class="radio_size" checked="checked" 
						> N
				</div>
			</div>
			<br>
			<fieldset id="target_btn4">
				<p>4-2. 심층 방호 관련 내용</p>
				<textarea cols="50" class="input_width100" rows="5"
					placeholder="심층 방호 관련 내용 입력" name="bopDeepProtectiContent"></textarea>
			</fieldset>

		</div>
		<br>
		<hr>
		<br>
		<div class="table_button_group">
			<button type="button" class="btn btn-danger" data-toggle="modal" onclick="assess_btn()"
				 data-target="#staticBackdrop">평가하기</button>

		</div>
		<br> <br>
	</form>
</div>
<script>
	/*bop판별*/
	var cnt = 0; //판별 신호 (cnt=4 bop)

	function assess_btn() {
		var daid = $('#daid').val();
		console.log(daid);
		
		cnt = 0;
		var radios = $(":radio[value='Y']");
		for (var i = 0; i < radios.length; i++) {
			var $this = $(radios[i]);
			console.log($this.is(":checked"));
			// (영향성 분석 = Important to Safety) AND
			// (안전 시스템에 악영향 여부 = N) AND (심층 방호 관련 여부 = N)
			if ((i == 0 || i == 3) && !$this.is(":checked"))
				cnt++;
			//(발전정지 유발 여부 = Y) AND (발전소 상태 정보 제공 여부 = Y)
			if ((i == 1 || i == 2) && $this.is(":checked"))
				cnt++;
		}
		console.log(cnt);

		if (cnt == 4) {
			$("#bop_yes").show();
			$("#bop_no").hide();

		} else {
			$("#bop_no").show();
			$("#bop_yes").hide();

		}

		$("#modal_ok").on("click", function() {
			console.log(cnt);
			if (cnt == 4) {
				document.getElementById('form').submit();
				return true;
			} else {
				location.href = "/SecurityAssessment/assessIndirect?daid="+ daid;
				return false;
			}
		});
	}
</script>