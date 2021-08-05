<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/register.css" />
<style>
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
<script>
	function btnActive() {
		const target = document.getElementById('target_btn');
		target.disabled = false;
	}

	function btnDisabled() {
		const target = document.getElementById('target_btn');
		target.disabled = true;
	}

	function btnActive2() {
		const target = document.getElementById('target_btn2');
		target.disabled = false;
	}

	function btnDisabled2() {
		const target = document.getElementById('target_btn2');
		target.disabled = true;
	}

	function btnActive3() {
		const target = document.getElementById('target_btn3');
		target.disabled = false;
	}

	function btnDisabled3() {
		const target = document.getElementById('target_btn3');
		target.disabled = true;
	}

	function btnActive4() {
		const target = document.getElementById('target_btn4');
		target.disabled = false;
	}

	function btnDisabled4() {
		const target = document.getElementById('target_btn4');
		target.disabled = true;
	}

	function btnActive5() {
		const target = document.getElementById('target_btn5');
		target.disabled = false;
	}

	function btnDisabled5() {
		const target = document.getElementById('target_btn5');
		target.disabled = true;
	}
</script>
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
				<span id="indirect_msg"> </span> <span id="indirect_msg2"><br>단계적
					보안성 평가를 종료합니다.</span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="modal_ok">평가 종료</button>
			</div>
		</div>
	</div>
</div>
<div class="right-container">
	<form action="registerIndirect" method="post" onSubmit="return false;" id="form">
		<div class="register_box">
			<h1>
				<b>DA 단계적 보안성 평가</b> <img alt=""
					src="../../../resources/img/process3.png" width="20%"
					class="process-image">
			</h1>
			<hr>
			<p style="color: gray;">Indirect자산을 평가하는 과정입니다.</p>
			<br> <input type="hidden" value="<c:out value="${daid}"/>"
				name="SA_daID" id="daid"/> <input type="hidden" value="Indirect DA"
				name="SA_IdentifyType"/> <br>
			<h4>
				<b>평가1) DA 손상시 안전시스템에 악영향</b>
			</h4>
			<br>
			<div class="register_box_inner_detail">
				<div class="register_box_inner_flexdirection_row">
					<p>안전/보안 관련 지시/경보 기능 수행 여부</p>
					<input type="radio" name="group1" value="Yes"
						checked="checked" class="radio_size"> Y &nbsp; <input
						type="radio" name="group1" value="No" class="radio_size"
						> N
				</div>
			</div>
			<br>
			<fieldset id="target_btn">
				<p>안전/보안 관련 지시/경보 기능 수행 관련 내용</p>
				<textarea cols="50" class="input_width100" rows="5"
					placeholder="안전/보안 관련 지시/경보 기능 수행 관련 내용 입력"
					name="indIWPerformContent"></textarea>
			</fieldset>
			<br> <br> <br> <br> <br>
			<div class="register_box_inner_detail">
				<div class="register_box_inner_flexdirection_row">
					<p>안전/보안 관련 지시/경보 기능 대체 수단 존재 여부</p>
					<input type="radio" name="group2" value="Y" onclick="btnActive2()"
						checked="checked" class="radio_size"> Y &nbsp; <input
						type="radio" name="group2" value="N" class="radio_size"
						onclick="btnDisabled2()"> N
				</div>
			</div>
			<br>
			<fieldset id="target_btn2">
				<p>안전/보안 관련 지시/경보 기능 대체 수단 존재 관련 내용</p>
				<textarea cols="50" class="input_width100" rows="5"
					placeholder="안전/보안 관련 지시/경보 기능 대체 수단 존재 관련 내용 입력"
					name="indIWAlterContent"></textarea>
			</fieldset>
			<br> <br>
			<hr>
			<br> <br>
			<h4>

				<b>평가2) 손상여부 탐지방법</b>
			</h4>
			<br>
			<div class="register_box_inner_detail">
				<div class="register_box_inner_flexdirection_row">
					<p>손상여부 탐지방법 존재 여부</p>
					<input type="radio" name="group3" value="Y" onclick="btnActive3()"
						checked="checked" class="radio_size"> Y &nbsp; <input
						type="radio" name="group3" value="N" class="radio_size"
						onclick="btnDisabled3()"> N
				</div>
			</div>
			<br>
			<fieldset id="target_btn3">
				<p>손상여부 탐지방법 관련 내용</p>
				<textarea cols="50" class="input_width100" rows="5"
					placeholder="손상여부 탐지방법 관련 내용 입력" name="indDmgDetectContent"></textarea>
				<br> <br>
				<p>손상여부 탐지 근거 문서</p>
				<textarea cols="50" class="input_width100" rows="5"
					placeholder="손상여부 탐지 근거 문서 입력" name="indDmgDetectDoc"></textarea>
			</fieldset>
			<br> <br>
			<hr>
			<br> <br>
			<h4>

				<b>평가3) 손상탐지 시간 내 평가 기준</b>
			</h4>
			<br>
			<div class="register_box_inner_detail">
				<div class="register_box_inner_flexdirection_row">
					<p>손상탐지 시간 내 평가 기준 존재 여부</p>
					<input type="radio" name="group4" value="Y" onclick="btnActive4()"
						checked="checked" class="radio_size"> Y &nbsp; <input
						type="radio" name="group4" value="N" class="radio_size"
						onclick="btnDisabled4()"> N
				</div>
			</div>
			<br>
			<fieldset id="target_btn4">
				<p>손상탐지 시간 내 평가 기준 내용</p>
				<textarea cols="50" class="input_width100" rows="5"
					placeholder="손상탐지 시간 내 평가 기준 내용 입력" name="indDmgDetectASContent"></textarea>
				<br> <br>
				<p>손상탐지 시간 내 평가 기준 근거 문서</p>
				<textarea cols="50" class="input_width100" rows="5"
					placeholder="손상탐지 시간 내 평가 기준 근거 문서 입력" name="indDmgDetectASDoc"></textarea>
			</fieldset>
			<br> <br>
			<hr>
			<br> <br>
			<h4>

				<b>평가4) 교육 훈련 계획의 존재</b>
			</h4>
			<br>
			<div class="register_box_inner_detail">
				<div class="register_box_inner_flexdirection_row">
					<p>교육 훈련 계획 존재 여부</p>
					<input type="radio" name="group5" value="Y" onclick="btnActive5()"
						checked="checked" class="radio_size"> Y &nbsp; <input
						type="radio" name="group5" value="N" class="radio_size"
						onclick="btnDisabled5()"> N
				</div>
			</div>
			<br>
			<fieldset id="target_btn5">
				<p>교육 훈련 내용</p>
				<textarea cols="50" class="input_width100" rows="5"
					placeholder="교육 훈련 내용 입력" name="indETContent"></textarea>
				<br> <br>
				<p>교육 훈련 근거 문서</p>
				<textarea cols="50" class="input_width100" rows="5"
					placeholder="교육 훈련 근거 문서 입력" name="indETDoc"></textarea>
			</fieldset>
			<br> <br>
			<div class="table_button_group">
				<button type="button" class="btn btn-danger" data-toggle="modal"
					data-target="#staticBackdrop" onclick="assess_btn()">등록</button>

			</div>
			<br> <br>
		</div>
	</form>
</div>
<script>
	/*indirect판별*/
	
	//판별 신호 flag1과 flag2를 모두 고려
	var flag1 = 0;	// 안전/보안 관련 지시/경보 기능 수행 여부 고려 flag
	var flag2 = 1;	// 그 외 조건 고려 flag
	
	function assess_btn(){
		var daid = $('#daid').val();
		console.log(daid);
		
		flag1 = 0;
		flag2 = 1;
		
		/*(안전/보안 관련 지시/경보 기능 수행 여부 = N)*/
		const group1NodeList
		  = document.getElementsByName('group1');
		  
		group1NodeList.forEach((node) => {
		    if(node.checked)  {
		    	if(node.value=='No')
		     flag1=1;	//무조건 indirect
		    }
		  }) 
		  
		var radios = $(":radio[value='Y']");
		for (var i = 0; i < radios.length; i++) {
			var $this = $(radios[i]);

			if (!$this.is(":checked"))
				flag2 = 0;	//무조건 direct
		}

		if (flag1 == 1) {
			$("#indirect_msg").text("해당 자산은 Indirect DA입니다.");
		} else if (flag1 != 1 && flag2 == 0) {
			$("#indirect_msg").text("해당 자산은 Direct DA입니다.");
		}else{
			$("#indirect_msg").text("해당 자산은 Indirect DA입니다.");
		}
		
		$("#modal_ok").on("click", function() {
			if (flag1 == 1) {
				document.getElementById('form').submit();
			} else if (flag1 != 1 && flag2 == 0) {
				location.href = "/SecurityAssessment/registerDirect?daid="+daid;
			}else{
				document.getElementById('form').submit();
			}
		});
	}
	
</script>