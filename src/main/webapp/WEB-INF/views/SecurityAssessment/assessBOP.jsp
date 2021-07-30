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
</script>
</head>
<div class="right-container">


	<div class="register_box">
		<h1>
			<b>DA 단계적 보안성 평가</b> <img alt=""
				src="../../../resources/img/process2.png" width="20%"
				class="process-image">
		</h1>
		<hr>
		<p style="color: gray;">BOP자산을 평가하는 과정입니다.</p>
		<br>
		<h4>
			<b>평가1) DA 손상시 안전시스템에 악영향</b>
		</h4>
		<br>
		<div class="register_box_inner_detail">

			<div class="register_box_inner_flexdirection_row">
				<p>1-1. DA 손상시 안전시스템에 악영향 여부</p>
				<input type="radio" name="group1" value="Y" onclick="btnActive()"
					checked="checked" class="radio_size"> Y &nbsp; <input
					type="radio" name="group1" value="N" class="radio_size"
					onclick="btnDisabled()"> N
			</div>
		</div>
		<br>
		<fieldset id="target_btn">
			<p>1-2. DA 손상시 안전시스템에 악영향 관련 내용</p>
			<textarea cols="50" class="input_width100" rows="5"
				placeholder="손상시 안전시스템에 악영향 관련 내용 입력"></textarea>
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
				<input type="radio" name="group2" value="Y" onclick="btnActive2()"
					checked="checked" class="radio_size"> Y &nbsp; <input
					type="radio" name="group2" value="N" class="radio_size"
					onclick="btnDisabled2()"> N
			</div>
		</div>
		<br>
		<fieldset id="target_btn2">
			<p>2-2 .발전정지 관련 내용</p>
			<textarea cols="50" class="input_width100" rows="5"
				placeholder="발전정지 관련 내용 입력"></textarea>
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
				<input type="radio" name="group3" value="Y" onclick="btnActive3()"
					checked="checked" class="radio_size"> Y &nbsp; <input
					type="radio" name="group3" value="N" class="radio_size"
					onclick="btnDisabled3()"> N
			</div>
		</div>
		<br>
		<fieldset id="target_btn3">
			<p>3-2. 발전소 상태 정보제공 관련 내용</p>
			<textarea cols="50" class="input_width100" rows="5"
				placeholder="발전소 상태 정보제공 관련 내용 입력"></textarea>
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
				<input type="radio" name="group4" value="Y" onclick="btnActive4()"
					checked="checked" class="radio_size"> Y &nbsp; <input
					type="radio" name="group4" value="N" class="radio_size"
					onclick="btnDisabled4()"> N
			</div>
		</div>
		<br>
		<fieldset id="target_btn4">
			<p>4-2. 심층 방호 관련 내용</p>
			<textarea cols="50" class="input_width100" rows="5"
				placeholder="심층 방호 관련 내용 입력"></textarea>
		</fieldset>

	</div>
	<br>
	<hr>
	<br>
	<div class="table_button_group">
		<button type="button" class="btn btn-danger" data-toggle="modal"
			id="assess_btn" data-target="#staticBackdrop">평가하기</button>

	</div>
	<br> <br>
</div>
	<script>
		/*ep판별*/
		var flag = 1; //판별 신호 (1=ep, 0=bop검사)

		$("#assess_btn").on("click", function() {
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
		});

		$("#modal_ok").on("click", function() {
			if (flag == 0) {
				location.href = "./SA_BOP.html";

			} else if (flag == 1) {
				location.href = "./SA_list.html";
			}
		});
	</script>