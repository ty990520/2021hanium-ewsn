<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css" href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/table.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/sa_detail_table.css" />
</head>
<div class="right-container">
		<h1>
			<b>단계적 보안성 평가 선택정보 출력</b> <img alt="" src="../../../resources/img/process3.png"
				width="15%" class="process-image">
		</h1>

		<br>
		<div class="table-cover">
			<table class="table table-bordered">

				<tr>
					<th class="table-light" rowspan="4">안전/보안 관련<br>지시/경고 기능</th>
					<th class="table-light">수행 여부</th>
					<td colspan="3">Y</td>
				</tr>
				<tr>
					<th class="table-light">수행 관련 내용</th>
					<td colspan="3">안전해야 함</td>
				</tr>
				<tr>
					<th class="table-light">대체 수단 존재 여부</th>
					<td colspan="3">N</td>
				</tr>
				<tr>
					<th class="table-light">대체 수단 관련 내용</th>
					<td colspan="3">해당 기기는 대체 수단이 없음</td>
				</tr>
				<tr>
					<th class="table-light" rowspan="3">손상여부 탐지방법</th>
					<th class="table-light">존재 여부</th>
					<td colspan="3">Y</td>
				</tr>
				<tr>
					<th class="table-light">관련 내용</th>
					<td colspan="3">손상 여부를 탐지함</td>
				</tr>
				<tr>
					<th class="table-light">근거 문서</th>
					<td colspan="3">손상 여부 탐지 보고서</td>
				</tr>
				<tr>
					<th class="table-light" rowspan="3">손상탐지 시간 내<br>평가 기준</th>
					<th class="table-light">존재 여부</th>
					<td colspan="3">Y</td>
				</tr>
				<tr>
					<th class="table-light">관련 내용</th>
					<td colspan="3">2시간 이내로 함</td>
				</tr>
				<tr>
					<th class="table-light">근거 문서</th>
					<td colspan="3">손상탐지 표준기준을 따름</td>
				</tr>
				<tr>
					<th class="table-light" rowspan="3">교육 훈련</th>
					<th class="table-light">계획 존재 여부</th>
					<td colspan="3">N</td>
				</tr>
				<tr>
					<th class="table-light">내용</th>
					<td colspan="3">교육은 따로 하지 않음</td>
				</tr>
				<tr>
					<th class="table-light">근거 문서</th>
					<td colspan="3">문서 없음</td>
				</tr>
			</table>
		</div>
		<br> <br><br> <br><br> <br>
		<!--right-container-->
	</div>
<%@include file="../includes/footer.jsp"%>