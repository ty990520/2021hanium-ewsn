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
				<span id="ep_yes">해당 자산은 EP입니다.<BR> 단계적 보안성 평가를 종료합니다.
				</span> <span id="ep_no">해당 자산은 EP가 아닙니다.<BR> 다음 평가로 넘어갑니다.
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
	<form action="registerEP" method="post" onSubmit="return false;"
		id="form">
		<div class="register_box">
			<h1>
				<b>DA 단계적 보안성 평가</b> <img alt=""
					src="../../../resources/img/process1.png" width="20%"
					class="process-image">
			</h1>
			<hr>
			<p style="color: gray;">EP자산을 평가하는 과정입니다.</p>
			<br> <input type="hidden" value="<c:out value="${daid}"/>"
				name="SA_daID" id="daid" /> <input type="hidden" value="EP DA"
				name="SA_IdentifyType" />
			<h4>
				<b>평가1) 대체 수단의 존재</b>
			</h4>
			<br>
			<div class="register_box_inner_detail">
				<div class="register_box_inner_flexdirection_row">
					<p>1-1. 대체 수단 존재 여부</p>
					<input type="radio" name="group1" value="Y" class="radio_size"
						 checked="checked"> Y &nbsp; <input
						type="radio" name="group1" value="N" class="radio_size"
					> N
				</div>
			</div>
			<br>
			<fieldset id="target_btn">
				<p>1-2. 대체 수단</p>
				<input type="text" class="input_width100" name="epAlterContent"
					placeholder="대체 수단 입력"> <br> <br>
				<p>1-3. 대체 내용</p>
				<textarea cols="50" class="input_width100" rows="10"
					name="epAlterTypeComment" placeholder="대체 내용 입력"></textarea>
				<br> <br>
				<p>1-4. 대체수단 근거문서</p>
				<textarea cols="50" class="input_width100" rows="5"
					name="epAlterDoc" placeholder="대체수단 근거문서 입력"></textarea>
			</fieldset>
			<br> <br>
			<hr>
			<br> <br>
			<h4>
				<b>평가2) 손상여부 탐지 방법의 존재</b>
			</h4>
			<br>
			<div class="register_box_inner_detail">
				<div class="register_box_inner_flexdirection_row">
					<p>2-1. 손상여부 탐지방법 존재 여부</p>
					<input type="radio" name="group2" value="Y" class="radio_size"
						 checked="checked"> Y &nbsp; <input
						type="radio" name="group2" value="N" class="radio_size"
						> N
				</div>
			</div>
			<br>
			<fieldset id="target_btn2">
				<p>2-2. 손상여부 탐지방법</p>
				<input type="text" class="input_width100" name="epDmgDetMContent"
					placeholder="손상여부 탐지방법 입력"> <br> <br>
				<p>2-3. 손상여부 탐지 근거문서</p>
				<textarea cols="50" class="input_width100" rows="5" name="epDmgDoc"
					placeholder="손상여부 탐지 근거문서 입력"></textarea>
			</fieldset>
			<br> <br>
			<hr>
			<br> <br>
			<h4>
				<b>평가3) 교육 훈련 계획의 존재</b>
			</h4>
			<br>
			<div class="register_box_inner_detail">
				<div class="register_box_inner_flexdirection_row">
					<p>3-1. 교육훈련 계획 존재여부</p>
					<input type="radio" name="group3" value="Y" class="radio_size"
					checked="checked"> Y &nbsp; <input
						type="radio" name="group3" value="N" class="radio_size"
					> N
				</div>
			</div>
			<br>
			<fieldset id="target_btn3">
				<p>3-2. 교육 훈련 내용</p>
				<input type="text" class="input_width100" name="epETContent"
					placeholder="교육 훈련 내용 입력"> <br> <br>
				<p>3-3. 교육훈련 근거문서</p>
				<textarea cols="50" class="input_width100" rows="5" name="epETDoc"
					placeholder="교육훈련 근거문서 입력"></textarea>
			</fieldset>
		</div>
		<br>
		<hr>
		<br>
		<div class="table_button_group">
			<button type="button" class="btn btn-danger" data-toggle="modal"
				data-target="#staticBackdrop" onclick="assess_btn()">평가하기</button>

		</div>
	</Form>
	<br> <br>
</div>
</body>
<script>
	/*ep판별*/
	var flag = 1; //판별 신호 (1=ep, 0=indirect검사)

	function assess_btn() {
		var daid = $('#daid').val();
		console.log(daid);
		
		flag = 1;
		var radios = $(":radio[value='Y']");
		for (var i = 0; i < radios.length; i++) {
			var $this = $(radios[i]);

			// (영향성 분석 = Emergency Preparedness Function) AND
			if (!$this.is(":checked"))
				flag = 0;

		}

		if (flag == 0) {
			$("#ep_no").show();
			$("#ep_yes").hide();
			//location.href="./SA_BOP.html"

		} else if (flag == 1) {
			$("#ep_yes").show();
			$("#ep_no").hide();
			//$("modal_ok").on("click",function() {location.href="./SA_list.html"});
		}

		$("#modal_ok").on("click",function() {
			if (flag == 0) {
				location.href = "/SecurityAssessment/assessIndirect?daid="+ daid;
				return false;
			} else if (flag == 1) {
				document.getElementById('form').submit();
				return true;
			}
		});
	}
</script>