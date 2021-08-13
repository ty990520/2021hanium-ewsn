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
						<select class="select_width50" name="daPDetailType">
							<option value="한강">한강</option>
							<option value="청평">청평</option>
							<option value="삼랑진">삼랑진</option>
							<option value="무주">무주</option>
							<option value="산청">산청</option>
							<option value="양양">양양</option>
							<option value="청송">청송</option>
						</select>
					</div>
				</div>
				<br>
				<p>자산번호</p>
				<input type="text" class="input_width100" name="daid"
					placeholder="자산번호 입력"> <br> <br>

				<p>자산명</p>
				<input type="text" class="input_width100" name="daname"
					placeholder="자산명 입력"> <br> <br>
				<p>자산기능</p>
				<textarea cols="50" class="input_width100" rows="10" name="daFunc"
					placeholder="자산기능 입력"></textarea>
				<br> <br>
				<p>기능유형</p>
				<select class="select_width100" name="daFuncType">
					<option value="Safety">Safety</option>
					<option value="Security">Security</option>
					<option value="EP(Emergency Preparedness)">EP(Emergency
						Preparedness)</option>
					<option value="Support">Support</option>
				</select>
			</div>
			<div class="register_box_inner">
				<p>영향성분석</p>
				<select class="select_width100" name="daImpact">
					<option value="Safety Related">Safety Related</option>
					<option value="Important to Safety">Important to Safety</option>
					<option value="Security Function">Security Function</option>
					<option value="Emergency Preparedness Function">Emergency
						Preparedness Function</option>
					<option value="Support Function">Support Function</option>
				</select> <br> <br>
				<p>설비유형</p>
				<select class="select_width100" name="daFacilitiesType">
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
				<select class="select_width100" name="daFacilitiesPurposeOfUse">
					<option value="발전연관 장비">발전연관 장비</option>
					<option value="유지보수 장비">유지보수 장비</option>
				</select> <br> <br>
				<p>시스템 S/W유형</p>
				<select class="select_width100" name="daSystemSW">
					<option value="Windows">Windows</option>
					<option value="Unix">Unix</option>
					<option value="Linux">Linux</option>
					<option value="Firmware">Firmware</option>
				</select>
			</div>
			<div class="register_box_inner_last">
				<div class="register_box_inner_detail">
					<div class="register_box_inner_flexdirection_row">
						<p>통신 I/F</p>

						<input type="radio" name="daReportIF" class="radio_size"
							value="Ethernet"> Ethernet &nbsp;<input type="radio"
							name="daReportIF" value="Serial" class="radio_size">
						Serial &nbsp;<input type="radio" name="daReportIF"
							value="Hard Wiring" class="radio_size"> Hard Wiring
						&nbsp;<input type="radio" name="daReportIF" value=" 기타"
							class="radio_size"> 기타
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
							class="radio_size"> Y &nbsp; <input type="radio"
							name="daModifyOPAvailability" value="N" class="radio_size">
						N
					</div>
				</div>
				<br> <br>
				<div class="register_box_inner_detail">
					<div class="register_box_inner_flexdirection_row">
						<p>수정 가능한 운영 데이터</p>
						<input type="radio" name="daModifiableOperationData"
							value="Control Logic" class="radio_size"> Control Logic
						&nbsp;&nbsp; <input type="radio" name="daModifiableOperationData"
							value="Firmware Setting" class="radio_size"> Firmware
						Setting
					</div>
				</div>
				<br> <br>
				<p>HMI유형</p>
				<select class="select_width100" name="da.daFacilitiesType">
					<option value="터빈제어설비_2020_1">터빈제어설비_2020_1</option>
					<option value="터빈제어설비_2020_2">터빈제어설비_2020_2</option>
					<option value="새 버전 추가">새 버전 추가</option>
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
	var checkUnload = true;

	window.addEventListener('beforeunload', (event) => { // 명세에 따라 preventDefault는 호출해야하며, 기본 동작을 방지합니다. 
		if(checkUnload){
			event.preventDefault(); // 대표적으로 Chrome에서는 returnValue 설정이 필요합니다. 
			event.returnValue = ''; 
	    }
	}); 
	function register(){
		checkUnload = false;
		if (confirm("자산정보를 등록하시겠습니까?") == true) {
			alert("자산정보가 등록되었습니다.");
			document.getElementById('form').submit();
			return true;
		} else {
			return false;
		}
	}
	
</script>

<%@include file="../includes/footer.jsp"%>