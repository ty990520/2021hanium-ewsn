<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css" href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/table.css" />
</head>


<div class="right-container">
	<h1>
		<b>DA 정보 관리</b>
	</h1>
	<hr>

	<div class="table-cover">
		<table class="table table-bordered">
		
			<tr>
				<th class="table-light">발전소 구분</th>
				<td><c:out value="${da.daptype}" /></td>
				<th class="table-light">발전소 상세구분</th>
				<td><c:out value="${da.daPDetailType}" /></td>
				<th class="table-light">영향성 분석</th>
				<td><c:out value="${da.daImpact}" /></td>
			</tr>
			<tr>
				<th class="table-light">자산명</th>
				<td><c:out value="${da.daImpact}" /></td>
				<th class="table-light">설비유형</th>
				<td><c:out value="${da.daFacilitiesType}" /></td>
				<th class="table-light">설비사용목적</th>
				<td><c:out value="${da.daFacilitiesPurposeOfUse}" /></td>
			</tr>
			<tr>
				<th class="table-light">기능유형</th>
				<td colspan="2"><c:out value="${da.daFuncType}" /></td>
				<th class="table-light">시스템S/W유형</th>
				<td colspan="2"><c:out value="${da.daSystemSW}" /></td>
			</tr>
			<tr>
				<th class="table-light" id="function">자산기능</th>
				<td colspan="5"><c:out value="${da.daFunc}" /></td>

			</tr>


			<tr>
				<th class="table-light">통신 I/F</th>
				<td colspan="2"><c:out value="${da.daReportIF}" /></td>
				<th class="table-light">저장장치</th>
				<td colspan="2"><c:out value="${da.daStorageDevice}" /></td>
			</tr>
			<tr>
				<th class="table-light">운영데이터<br>수정가능여부
				</th>
				<td colspan="2"><c:out value="${da.daModifyOPAvailability}" /></td>
				<th class="table-light">수정 가능한<br>운영데이터
				<td colspan="2"><c:out value="${da.daModifiableOperationData}" /></td>
			</tr>
			<tr>
				<th class="table-light">HMI유형</th>
				<td colspan="5"><c:out value="${da.daHMIType}" /></td>
			</tr>

		</table>
	
	</div>

	<br>
	<div class="table_button_group">
		<button type="button" class="btn  btn-secondary" onclick="modifyBtn(<c:out value="${da.daid}" />)">수정</button>
		<button type="button" class="btn btn-danger">삭제</button>

	</div>
	
	<br>
	<!--right-container-->
</div>
<script>
function modifyBtn(daid){
	alert(daid);
	if (confirm("관리자에게 승인을 요청하시겠습니까?") == true) {
		location.href = ""+daid;
		return true;
	} else {
		return false;
	}
	
}


</script>
<%@include file="../includes/footer.jsp"%>