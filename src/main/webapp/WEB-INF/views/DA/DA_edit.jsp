<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/table.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/register.css" />
</head>
<div class="right-container">
   <h1>
      <b>DA 정보 관리</b>
   </h1>
   <hr>
   <form name=form action="modify" method="post">
      <div class="table-cover">
   <input type="hidden" name="daid" value="<c:out value='${da.daid}'/>">
      
         <table class="table table-bordered">

				<tr>
					<th class="table-light">발전소 구분</th>
					<td><input   readonly class="form-control"
						name="daptype" value="<c:out value='${da.daptype}'/> "></td>

					<th class="table-light">발전소 상세구분</th>
					<td><input readonly class="form-control"
						name="daPDetailType" value="<c:out value='${da.daPDetailType}'/> ">
					</td>
					<th class="table-light">영향성 분석</th>
					<td><select class="select_width100" name="daImpact"
						id="daImpact">
							<option value="Safety Related"
								<c:if test="${da.daImpact eq 'Safety Related'}">selected</c:if>>Safety
								Related</option>
							<option value="Important to Safety"
								<c:if test="${da.daImpact eq 'Important to Safety'}">selected</c:if>>Important
								to Safety</option>
							<option value="Security Function"
								<c:if test="${da.daImpact eq 'Security Function'}">selected</c:if>>Security
								Function</option>
							<option value="Emergency Preparedness Function"
								<c:if test="${da.daptype eq 'Emergency Preparedness Function'}">selected</c:if>>Emergency
								Preparedness Function</option>
							<option value="Support Function"
								<c:if test="${da.daImpact eq 'Support Function'}">selected</c:if>>Support
								Function</option>
					</select></td>
				</tr>
				<tr>
					<th class="table-light">자산명</th>
					<td><input class="form-control" name="daname"
						value="<c:out value='${da.daname}'/>"></td>
					<th class="table-light">설비유형</th>
					<td><select class="select_width100" name="daFacilitiesType"
						id="daFacilitiesType">
							<option value="PC/Server"
								<c:if test="${da.daFacilitiesType eq 'PC/Server'}">selected</c:if>>PC/Server</option>
							<option value="DCS"
								<c:if test="${da.daFacilitiesType eq 'DCS'}">selected</c:if>>DCS</option>
							<option value="PLC"
								<c:if test="${da.daFacilitiesType eq 'PLC'}">selected</c:if>>PLC</option>
							<option value="네트워크 스위치"
								<c:if test="${da.daFacilitiesType eq '네트워크 스위치'}">selected</c:if>>네트워크
								스위치</option>
							<option value="전송기"
								<c:if test="${da.daFacilitiesType eq '전송기'}">selected</c:if>>전송기</option>
							<option value="기록"
								<c:if test="${da.daFacilitiesType eq '기록계'}">selected</c:if>>기록계</option>
							<option value="지시"
								<c:if test="${da.daFacilitiesType eq '지시계'}">selected</c:if>>지시계</option>
							<option value="기타"
								<c:if test="${da.daFacilitiesType eq '</'}">selected</c:if>>기타</option>
					</select></td>
					<th class="table-light">설비사용목적</th>
					<td><select class="select_width100"
						name="daFacilitiesPurposeOfUse" id="daFacilitiesPurposeOfUse">
							<option value="발전연관 장비"
								<c:if test="${da.daFacilitiesPurposeOfUse eq '발전연관 장비'}">selected</c:if>>발전연관
								장비</option>
							<option value="유지보수 장비"
								<c:if test="${da.daFacilitiesPurposeOfUse eq '유지보수 장비'}">selected</c:if>>유지보수
								장비</option>
					</select></td>
				</tr>
				<tr>
					<th class="table-light">기능유형</th>
					<td colspan="2"><select class="select_width100"
						name="daFuncType" id="daFuncType">
							<option value="Safety"
								<c:if test="${da.daFuncType eq 'Safety'}">selected</c:if>>Safety</option>
							<option value="Security"
								<c:if test="${da.daFuncType eq 'Security'}">selected</c:if>>Security</option>
							<option value="EP(Emergency Preparedness)"
								<c:if test="${da.daFuncType eq 'EP(Emergency Preparedness)'}">selected</c:if>>EP(Emergency
								Preparedness)</option>
							<option value="Support"
								<c:if test="${da.daFuncType eq 'Support'}">selected</c:if>>Support</option>
					</select></td>
					<th class="table-light">시스템S/W유형</th>
					<td colspan="2"><select class="select_width100"
						name="daSystemSW" id="daSystemSW" onclick="checkMF()">
							<option value="Windows"
								<c:if test="${da.daSystemSW eq 'Windows'}">selected</c:if>>Windows</option>
							<option value="Unix"
								<c:if test="${da.daSystemSW eq 'Unix'}">selected</c:if>>Unix</option>
							<option value="Linux"
								<c:if test="${da.daSystemSW eq 'Linux'}">selected</c:if>>Linux</option>
							<option value="Firmware"
								<c:if test="${da.daSystemSW eq '	Firmware Setting'}">selected</c:if>>Firmware</option>
					</select></td>
				</tr>
				<tr>
					<th class="table-light" id="function">자산기능</th>
					<td colspan="5"><textarea class="input_width100" rows="10"
							cols="50" name="daFunc">
					${da.daFunc}</textarea></td>

				</tr>


				<tr>
					<th class="table-light">통신 I/F</th>
					<td colspan="2"><input type="radio" name="daReportIF"
						value="Ethernet"
						<c:if test="${da.daReportIF  eq 'Ethernet'}">checked</c:if>>
						Ethernet &nbsp; <input type="radio" name="daReportIF"
						value="Serial" class="radio_size"
						<c:if test="${da.daReportIF  eq 'Serial'}">checked</c:if>>
						Serial &nbsp; <input type="radio" name="daReportIF"
						value="Hard Wiring" class="radio_size"
						<c:if test="${da.daReportIF  eq 'Hard Wiring'}">checked</c:if>>Hard
						Wiring</td>

					<th class="table-light">저장장치</th>
					<td colspan="2"><input type="radio" name="daStorageDevice"
						value="USB"
						<c:if test="${da.daStorageDevice  eq 'USB'}">checked</c:if>>
						USB &nbsp;&nbsp; <input type="radio" name="daStorageDevice"
						value="메모리카드"
						<c:if test="${da.daStorageDevice  eq '메모리카드'}">checked</c:if>>메모리카드
						&nbsp;&nbsp; <input type="radio" name="daStorageDevice"
						value=" 기타"
						<c:if test="${da.daStorageDevice  eq '기타'}">checked</c:if>>
						기타</td>
				</tr>
				<tr>
					<th class="table-light">운영데이터<br>수정가능여부
					</th>
					<td colspan="2"><input type="radio"
						name="daModifyOPAvailability" value="Y" onclick="checkMF()"
						class="radio_size"
						<c:if test="${da.daModifyOPAvailability  eq 'Y'}">checked</c:if>>
						Y &nbsp; <input type="radio" name="daModifyOPAvailability"
						value="N" class="radio_size" onclick="checkMF()"
						<c:if test="${da.daModifyOPAvailability  eq 'N'}">checked</c:if>>
						N</td>

					<th class="table-light">수정 가능한<br>운영데이터
					<td colspan="2"><input type="radio"
						name="daModifiableOperationData" value="Control Logic"
						class="radio_size" id="cl"
						<c:if test="${da.daModifiableOperationData  eq 'Control Logic'}">checked</c:if>>
						Control Logic &nbsp;&nbsp; <input type="radio"
						name="daModifiableOperationData" value="Firmware Setting"
						class="radio_size"
						<c:if test="${da.daModifiableOperationData  eq 'Firmware Setting'}">checked</c:if>>
						Firmware Setting&nbsp;&nbsp; <input type="radio"
						name="daModifiableOperationData" value="Operaing parameter"
						class="radio_size" id="op"
						<c:if test="${da.daModifiableOperationData  eq 'Operaing parameter'}">checked</c:if>>Operaing
						parameter</td>
				</tr>

		    </table>

      </div>

      <br>
      <div class="table_button_group">
         <button type="submit" class="btn  btn-secondary"
            onclick="modifyBtn('<c:out value="${da.daid}" />')">수정</button>
         <button type="button" class="btn btn-danger"
            onclick="removeBtn('<c:out value="${da.daid}" />')">비활성화</button>
      </div>
   </form>

   <br>
   <!--right-container-->
</div>
<script>
   function modifyBtn(daid) {
      //alert(daid);
      if (confirm("수정을 완료하시겠습니까?") == true) {
         location.href = "modify"
         return true;
      } else {
         return false;
      }

   }

   function removeBtn(daid) {
      //alert(daid);
      if (confirm("비활성화하시겠습니까?") == true) {
         location.href = "/DA/remove?daid=" + daid;
         return true;
      } else {
         return false;
      }

   }
</script>
<%@include file="../includes/footer.jsp"%>