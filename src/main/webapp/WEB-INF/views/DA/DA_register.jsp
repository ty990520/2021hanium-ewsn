<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>

<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/register.css" />
</head>

<style>
body {
	background-color: #dcdcdc4a;
}

.text_body {
	width: 100%;
	height: 1500px;
	position: relative;
	top: 80px;
	left: 0px;
}
</style>


<div class="right-container">
	<h1>
		<b>DA 정보 관리</b>
	</h1>
	<hr>
	<br>
	<form id="form" name=form action="register" method="post"
		onsubmit="return false;">
		<div class="register_box">
			<div class="register_box_inner">
				<div class="register_box_inner_detail">
					<div class="register_box_inner_flexdirection_row">
						<p>발전소 구분&nbsp;&nbsp;&nbsp;</p>
						<select class="select_width50" name="daptype">
							<option value="수력">수력</option>
							<option value="원자력">원자력</option>
							<option value="화력">화력</option>
						</select>
					</div>
					<div class="register_box_inner_flexdirection_row">

						<p>발전소 상세구분</p>
						<select class="select_width50" id="H">
							<option value="--">--</option>
							<option value="한강">한강</option>
							<option value="청평">청평</option>
							<option value="삼랑진">삼랑진</option>
							<option value="무주">무주</option>
							<option value="산청">산청</option>
							<option value="양양">양양</option>
							<option value="청송">청송</option>
						</select> <select class="select_width50" id="N">
							<option value="--">--</option>
							<option value="고리">고리</option>
							<option value="한빛">한빛</option>
							<option value="월성">월성</option>
							<option value="한울">한울</option>
							<option value="새울">새울</option>
						</select> <select class="select_width50" id="F">
							<option value="--">--</option>
							<option value="남동">남동</option>
							<option value="중부">중부</option>
							<option value="서부">서부</option>
							<option value="남부">남부</option>
							<option value="동서">동서</option>
						</select> <input type="hidden" name="daPDetailType" id="daPDetailType"
							value="--">
					</div>
				</div>
				<br>

				<p>자산명</p>
				<input type="text" class="input_width100" name="daname" id="daname"
					placeholder="자산명 입력"> <br> <br>
				<p>자산기능</p>
				<textarea cols="50" class="input_width100" rows="10" name="daFunc"
					id="daFunc" placeholder="자산기능 입력"></textarea>
				<br> <br>
				<p>제조사</p>
				<input type="text" class="input_width100" name="daManufacturer"
					id="daManufacturer" placeholder="제조사 입력"> <br> <br>
				<p>모델명</p>
				<input type="text" class="input_width100" name="daModel"
					id="daModel" placeholder="모델명 입력"> <br> <br>
				<p>기능유형</p>
				<select class="select_width100" name="daFuncType" id="daFuncType">
					<option value="Safety">Safety</option>
					<option value="Security">Security</option>
					<option value="EP(Emergency Preparedness)">EP(Emergency
						Preparedness)</option>
					<option value="Support">Support</option>
				</select>
			</div>
			<br>
			<div class="register_box_inner">
				<p>영향성분석</p>
				<select class="select_width100" name="daImpact" id="daImpact">
					<option value="Safety Related">Safety Related</option>
					<option value="Important to Safety">Important to Safety</option>
					<option value="Security Function">Security Function</option>
					<option value="Emergency Preparedness Function">Emergency
						Preparedness Function</option>
					<option value="Support Function">Support Function</option>
				</select> <br> <br>
				<p>설비유형</p>
				<select class="select_width100" name="daFacilitiesType"
					id="daFacilitiesType">
					<option value="PC/Server">PC/Server</option>
					<option value="DCS">DCS</option>
					<option value="PLC">PLC</option>
					<option value="네트워크 스위치">네트워크 스위치</option>
					<option value="전송기">전송기</option>
					<option value="기록">기록계</option>
					<option value="지시">지시계</option>
					<option value="기타">기타</option>
				</select> <br> <br>
				<p>설비사용목적</p>
				<select class="select_width100" name="daFacilitiesPurposeOfUse"
					id="daFacilitiesPurposeOfUse">
					<option value="발전연관 장비">발전연관 장비</option>
					<option value="유지보수 장비">유지보수 장비</option>
				</select> <br> <br>
				<p>시스템 S/W유형</p>
				<select class="select_width100" name="daSystemSW" id="daSystemSW"
					onclick="checkMF()">
					<option value="Windows">Windows</option>
					<option value="Unix">Unix</option>
					<option value="Linux">Linux</option>
					<option value="Firmware">Firmware</option>
				</select>
			</div>
			<br>
			<div class="register_box_inner_last">
				<div class="register_box_inner_detail">
					<div class="register_box_inner_flexdirection_row">
						<p>통신 I/F</p>

						<input type="radio" name="daReportIF" class="radio_size"
							value="Ethernet" onclick="checkMF()"> Ethernet &nbsp;<input
							type="radio" name="daReportIF" value="Serial" class="radio_size"
							onclick="checkMF()"> Serial &nbsp;<input type="radio"
							name="daReportIF" onclick="checkMF()" value="Hard Wiring"
							class="radio_size"> Hard Wiring

					</div>
				</div>
				<br> <br>
				<div class="register_box_inner_detail">
					<div class="register_box_inner_flexdirection_row">
						<p>저장장치</p>
						<input type="radio" name="daStorageDevice" value="USB"
							class="radio_size"> USB &nbsp;&nbsp;<input type="radio"
							name="daStorageDevice" value="메모리카드" class="radio_size">
						메모리카드 &nbsp;&nbsp;<input type="radio" name="daStorageDevice"
							value=" 기타" class="radio_size"> 기타
					</div>
				</div>
				<br> <br>
				<div class="register_box_inner_detail">
					<div class="register_box_inner_flexdirection_row">
						<p>운영데이터 수정 가능 여부</p>
						<input type="radio" name="daModifyOPAvailability" value="Y"
							onclick="ModifyOP()" class="radio_size"> Y &nbsp; <input
							type="radio" name="daModifyOPAvailability" value="N"
							class="radio_size" onclick="ModifyOP()"> N
					</div>
				</div>
				<br> <br>
				<div class="register_box_inner_detail">
					<div class="register_box_inner_flexdirection_row">
						<p>수정 가능한 운영 데이터</p>
						<input type="radio" name="daModifiableOperationData"
							value="Control Logic" class="radio_size" id="cl"> Control
						Logic &nbsp;&nbsp; <input type="radio" id="fs"
							name="daModifiableOperationData" value="Firmware Setting"
							class="radio_size"> Firmware Setting&nbsp;&nbsp; <input
							type="radio" name="daModifiableOperationData"
							value="Operaing parameter" class="radio_size" id="op">
						Operaing parameter
					</div>
				</div>
				<br> <br>
				<p>HMI유형</p>
				<select class="select_width100" name="daHMIType" onclick="checkMF()"
					id="daHMIType">
					<option value="External">External</option>
					<option value="Integral">Integral</option>
				</select>
			</div>
		</div>
		<br>
		<hr>
		<br>
		<div class="table_button_group">

			<button type="button" class="btn btn-secondary"
				onclick="location.href='/DA/DA_list'">취소</button>
			<button type="button" class="btn btn-danger" onclick="register()">등록</button>

		</div>
	</form>
	<br> <br>
</div>
<script type="text/javascript"> 
	$(document).ready(function(){
	    $("#N").hide();
	    $("#F").hide();
	    
	});
	
	$("select[name=daptype]").change(function(){
		//alert($(this).val()); //value값 가져오기
		if($(this).val() == "수력"){
			$("#H").show();
			$("#N").hide();
			$("#F").hide();
		}else if($(this).val() == "원자력"){
			$("#H").hide();
			$("#N").show();
			$("#F").hide();
		}else if($(this).val() == "화력"){
			$("#H").hide();
			$("#N").hide();
			$("#F").show();
		}
	});
	
	$("select[id=H]").change(function(){
		$("#daPDetailType").val($(this).val());
		console.log($("#daPDetailType").val());
	});
	$("select[id=N]").change(function(){
		$("#daPDetailType").val($(this).val());
		console.log($("#daPDetailType").val());
	});
	$("select[id=F]").change(function(){
		$("#daPDetailType").val($(this).val());
		console.log($("#daPDetailType").val());
	});
	
	$("select[name=daptype]").change(function(){
		$("#daPDetailType").val("--");
	});
	
		
	var checkUnload = true;

	window.addEventListener('beforeunload', (event) => { // 명세에 따라 preventDefault는 호출해야하며, 기본 동작을 방지합니다. 
		if(checkUnload){
			event.preventDefault(); // 대표적으로 Chrome에서는 returnValue 설정이 필요합니다. 
			event.returnValue = ''; 
	    }
	}); 
	function register(){
		if($("#daPDetailType").val()=="--"){
			alert("발전소 상세 유형을 선택해주세요.");
			return false;
		}
		
		 var radioVal1 = $('input[name="daReportIF"]:checked').val();
		 var radioVal2 = $('input[name="daStorageDevice"]:checked').val();
		 var radioVal3 = $('input[name="daModifyOPAvailability"]:checked').val();
		 //var radioVal4 = $('input[name="daModifiableOperationData"]:checked').val();
		
         if($("#daname").val()==""||$("#daFunc").val()==""||
				$("#daManufacturer").val()==""||$("#daModel").val()==""||
				$("#daFuncType").val()==""||$("#daImpact").val()==""||
				$("#daFacilitiesType").val()==""||$("#daSystemSW").val()==""||
				$("#daFacilitiesPurposeOfUse").val()==""||$("#daHMIType").val()==""||
				radioVal1 == undefined||radioVal2 == undefined||radioVal3 == undefined){
				alert("모든 요소는 필수로 작성해야 합니다.");
				return false;
			
		}
		
		
		checkUnload = false;
		if (confirm("자산정보를 등록하시겠습니까?") == true) {
			alert("자산정보가 등록되었습니다.");
			document.getElementById('form').submit();
			return true;
		} else {
			return false;
		}
	}
	function checkMF(){
		if($("input[name='daModifyOPAvailability']:checked").val() == "Y"){
		if($("#daSystemSW").val() == "Firmware"){
			if($("input[name='daReportIF']:checked").val() == "Hard Wiring"){
				$("#cl").attr("disabled", true); //설정
			}else if($("input[name='daReportIF']:checked").val() == "Serial"){
					if($("select[name=daHMIType]").val() == "External"){
						$("#op").attr("disabled", true); //설정
						$("#cl").attr("disabled", false); //설정
					}else{
						$("#cl").attr("disabled", true); //설정
						$("#op").attr("disabled", false); //설정
					}
			}
		}
		}
	}
	 function ModifyOP(){
		 if($("input[name='daModifyOPAvailability']:checked").val() == "N"){
				$("#op").attr("disabled", true); //설정
				$("#cl").attr("disabled", true); //설정
				$("#fs").attr("disabled", true); //설정
			}else{
				$("#op").attr("disabled", false); //설정
				$("#cl").attr("disabled", false); //설정
				$("#fs").attr("disabled", false); //설정
			}
		 checkMF();
	 }
	/*
	
	*/
</script>

<%@include file="../includes/footer.jsp"%>