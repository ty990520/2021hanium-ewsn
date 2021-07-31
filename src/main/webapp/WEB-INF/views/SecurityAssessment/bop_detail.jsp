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
			<b>단계적 보안성 평가 선택정보 출력</b> <img alt="" src="../../../resources/img/process2.png"
				width="15%" class="process-image">
		</h1>
		<br>
		<div class="table-cover">
			<table class="table table-bordered">
				<tr>
					<th class="table-light" rowspan="2">DA손상시<br>안전시스템에 악영향</th>
					<th class="table-light">악영향 여부</th>
					<td colspan="3">N</td>
				</tr>
				<tr>
					<th class="table-light">내용</th>
					<td colspan="3">해당 기기는 발전소 안전 시스템에 악영향을 미치지 않음</td>
				</tr>
				<tr>
					<th class="table-light" rowspan="2">발전 정지</th>
					<th class="table-light">유발 여부</th>
					<td colspan="3">N</td>
				</tr>
				<tr>
					<th class="table-light">내용</th>
					<td colspan="3">해당 기기는 발전소 발전 정지와 관련된 설비가 아님</td>
				</tr>
				<tr>
					<th class="table-light" rowspan="2">발전소 상태<br>정보 제공</th>
					<th class="table-light">제공 여부</th>
					<td colspan="3">N</td>
				</tr>
				<tr>
					<th class="table-light">내용</th>
					<td colspan="3">해당 기기는 발전소 안전 관련 주요 정보를 제공하지 않음</td>
				</tr>
				<tr>
					<th class="table-light" rowspan="2">심층 방호</th>
					<th class="table-light">관련 여부</th>
					<td colspan="3">N</td>
				</tr>
				<tr>
					<th class="table-light">내용</th>
					<td colspan="3">해당 기기는 발전소 심층 방호 유지를 위해 필수적인 설비가 아님</td>
				</tr>
			</table>
		</div>
		<br> <br>
		<!--right-container-->
	</div><br><br><br><br><br>
<%@include file="../includes/footer.jsp"%>