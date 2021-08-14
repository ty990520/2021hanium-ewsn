<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/register.css" />
<style>
.modal-body {
	text-align: center;
}

body {
	background-color: #dee2e673;
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

.text-danger {
	width: 46px;
	height: 46px;
}

p#indirect_msg3 {
	margin: 20px;
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
				<p id="indirect_msg"></p>
				<p id="indirect_msg2">단계적 보안성 평가를 종료합니다.</p>
				<span id="spinner">
					<div class="spinner-border text-danger" role="status">
						<br> <span class="sr-only">Loading...</span> <br>
					</div>
				</span> <img id="directda_img"
					src="../../../resources/img/confirmation.png" width="10%"">

				<p id="indirect_msg3">분류가 완료될 때 까지 기다려주세요.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="modal_ok">평가
					종료</button>
			</div>
		</div>
	</div>
</div>
<div class="right-container">
	<form action="registerIndirect" method="post" onSubmit="return false;"
		id="form">
		<div class="register_box">
			<h1>
				<b>DA 단계적 보안성 평가</b> <img alt=""
					src="../../../resources/img/process3.png" width="20%"
					class="process-image">
			</h1>
			<hr>
			<p style="color: gray;">Indirect자산을 평가하는 과정입니다.</p>
			<br> <input type="hidden" value="<c:out value="${daid}"/>"
				name="SA_daID" id="daid" /> <input type="hidden"
				value="Indirect DA" name="SA_IdentifyType" /> <br>
			<h4>
				<b>평가1) DA 손상시 안전시스템에 악영향</b>
			</h4>
			<br>
			<div class="register_box_inner_detail">
				<div class="register_box_inner_flexdirection_row">
					<p>안전/보안 관련 지시/경보 기능 수행 여부</p>
					<input type="radio" name="group1" value="Y" checked="checked"
						class="radio_size"> Y &nbsp; <input type="radio"
						name="group1" value="N" class="radio_size"> N
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
					<input type="radio" name="group2" value="Y"
						checked="checked" class="radio_size"> Y &nbsp; <input
						type="radio" name="group2" value="N" class="radio_size">
					N
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
					<input type="radio" name="group3" value="Y"
						checked="checked" class="radio_size"> Y &nbsp; <input
						type="radio" name="group3" value="N" class="radio_size">
					N
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
					<input type="radio" name="group4" value="Y"
						checked="checked" class="radio_size"> Y &nbsp; <input
						type="radio" name="group4" value="N" class="radio_size">
					N
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
					<input type="radio" name="group5" value="Y"
						checked="checked" class="radio_size"> Y &nbsp; <input
						type="radio" name="group5" value="N" class="radio_size"
						> N
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
			<br> <br> <input type="hidden" name="checkArray" value="1">
			<input type="hidden" name="checkArray" value="2"> <input
				type="hidden" name="checkArray" value="3"> <input
				type="hidden" name="checkArray" value="4"> <input
				type="hidden" name="checkArray" value="5">
			<div class="table_button_group">
				<button type="button" class="btn btn-danger" data-toggle="modal"
					data-target="#staticBackdrop" onclick="assess_btn()">등록</button>

			</div>
			<br> <br>
		</div>
	</form>
</div>
<script>
$(document).ready(function(){
	$("#directda_img").hide();
});
	/*indirect판별*/
	
	//판별 신호 flag1과 flag2를 모두 고려
	var flag1 = 0;	// 안전/보안 관련 지시/경보 기능 수행 여부 고려 flag
	var flag2 = 1;	// 그 외 조건 고려 flag
	
	var type="";
	
	function assess_btn(){
		/*y,n값 추출*/
		var groups_elements=["group1","group2","group3","group4","group5"];
		
		for(var i=0; i<groups_elements.length; i++) {
			groups_elements[i] = document.getElementsByName(groups_elements[i]);
		}
		
		var group_items = new Array(); // 여기에 선택된 radio 버튼의 값이 담기게 된다.
		for(var i=0; i<groups_elements.length; i++) {
		    for(var j=0; j<groups_elements[i].length; j++)
				if(groups_elements[i][j].checked) {
					group_items[i] = groups_elements[i][j].value;
		    }
		}
		
		console.log(group_items)
		
		//var checkArray=new Array();
		var checkArray = document.getElementsByName("checkArray");
		for(var i=0; i<groups_elements.length; i++) {
			checkArray[i].value = group_items[i];
			console.log(checkArray[i].value);
			//checkArray[i].value = group_items[i];
		}
		//console.log(document.getElementsByName("checkArray"));
		
		var daid = $('#daid').val();
		console.log(daid);
		
		flag1 = 0;
		flag2 = 1;
		
		/*(안전/보안 관련 지시/경보 기능 수행 여부 = N)*/
		const group1NodeList
		  = document.getElementsByName('group1');
		  
		group1NodeList.forEach((node) => {
		    if(node.checked)  {
		    	if(node.value=='N')
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
			$("#indirect_msg2").text("단계적 보안성 평가를 종료합니다.");
			$("#spinner").hide();
			$("#indirect_msg3").hide();
			$("#directda_img").hide();
		} else if (flag1 != 1 && flag2 == 0) {
			$("#indirect_msg").text("해당 자산은 Direct DA입니다.");
			$("#indirect_msg2").text("Direct DA의 상세 분류를 진행하고 있습니다.");
			$("#spinner").show();
			$("#indirect_msg3").show();
			sort_out(daid);
		}else{
			$("#indirect_msg").text("해당 자산은 Indirect DA입니다.");
			$("#indirect_msg2").text("단계적 보안성 평가를 종료합니다.");
			$("#spinner").hide();
			$("#indirect_msg3").hide();
			$("#directda_img").hide();
		}
		
		$("#modal_ok").on("click", function() {
			if (flag1 == 1) {
				document.getElementById('form').submit();
			} else if (flag1 != 1 && flag2 == 0) {
				location.href = "/SecurityAssessment/registerDirect?daid="+daid+"&type="+type;
			}else{
				document.getElementById('form').submit();
			}
		});
	}
	
	function sort_out(id) {
		//alert(id);
		$.ajax({
			contentType : "application/json; charset=utf-8;",
			type : "GET",
			url : "/SecurityAssessment/sortOut", ///user/valid?userid=id
			data : {
				"daid" : id
			},
			success : function(response) {
				type = response;
				setTimeout(function(){
					$(".text-danger").hide();
					$("#directda_img").show();
					$("#indirect_msg3").text("해당 자산의 상세 유형은 "+response+"입니다.");
				},2200);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}

</script>