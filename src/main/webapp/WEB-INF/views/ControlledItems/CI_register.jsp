
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
<form name=form action="register" method="post" onsubmit="return false;">
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
						</select>
					</div>
					<div class="register_box_inner_flexdirection_row">
						<h6>&nbsp;&nbsp;&nbsp;&nbsp;통제항목 상세분류</h6>
						<select id="schQnaType" name="CI_detailType">
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
						<br> <input type="checkbox" name="CI_pcServer"
							class="checkbox_size"> PC/Server &nbsp; <input
							type="checkbox" name="CI_BOP" class="checkbox_size"> BOP
						DA &nbsp; <input type="checkbox" name="CI_indirect" value="1"
							class="checkbox_size"> Indirect DA <input type="checkbox"
							name="CI_EP" class="checkbox_size"> EP DA &nbsp;
					</div>
				</div>
				<br> <br>
				<div class="register_box_inner_detail2">
					<div class="register_box_inner_flexdirection_row">
						<input type="checkbox" name="CI_CF_MF" class="checkbox_size">
						Control Facilities MF DA &nbsp;<input type="checkbox"
							name="CI_CF_LF" class="checkbox_size"> Control Facilities
						LF DA
					</div>
				</div>
				<br> <br>
				<div class="register_box_inner_detail2">
					<div class="register_box_inner_flexdirection_row">
						<input type="checkbox" name="CI_CF_HF" class="checkbox_size">
						Control Facilities HF DA &nbsp; <input type="checkbox"
							name="CI_FF_MF" class="checkbox_size"> Field Facilites MF
						DA
					</div>
				</div>
				<br> <br>
				<div class="register_box_inner_detail2">
					<div class="register_box_inner_flexdirection_row">
						<input type="checkbox" name="CI_FF_LF" class="checkbox_size">
						Field Facilites LF DA &nbsp;&nbsp; <input type="checkbox"
							name="CI_FF_HF" class="checkbox_size">Field Facilites HF
						DA
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
			<button type="button" class="btn btn-danger" onclick="Ycheck()">등록</button>

		</div>
		<br> <br>
	</div>
</form>


<script>


function Ycheck(){
	var obj = $("[name=SEQ_CHK]");
    var chkArray = new Array(); // 배열 선언

    $('input:checkbox[name=SEQ_CHK]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
        chkArray.push(this.value);
    });
    $('#hiddenValue').val(chkArray);
    
    alert($('#hiddenValue').val()); // 아래 체크박스가 모두 체크되어 있다면 1,2,3,4 가 출력 된다.
}  ;

	$(document).ready(function() {
		chnQnaType()
	});

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
		}

	}
</script>

<%@include file="../includes/footer.jsp"%>