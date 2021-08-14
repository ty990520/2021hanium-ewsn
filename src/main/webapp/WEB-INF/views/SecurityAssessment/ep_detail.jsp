<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css" href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/table.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/sa_detail_table.css" />
<script>

</script>
</head>
<div class="right-container">
		<h1>
			<b>단계적 보안성 평가 선택정보 출력</b> <img alt="" src="../../../resources/img/process1.png"
				width="15%" class="process-image">
		</h1>
		<BR>
		<div class="table-cover">
			<table class="table table-bordered">
				<tr>
					<th rowspan="4" class="table-light">대체 수단</th>
					<th class="table-light">존재여부</th>
					<td colspan="8">Y</td>
				</tr>
				<tr>

					<th class="table-light">내용</th>
					<td colspan="6"><c:out value='${EP.epAlterContent}'/></td>
				</tr>
				<tr>
					<th class="table-light">내용 유형</th>
					<td colspan="6"><c:out value='${EP.epAlterTypeComment}'/></td>
				</tr>
				<tr>
					<th class="table-light">근거 문서 유형</th>
					<td colspan="6"><c:out value='${EP.epAlterDoc}'/></td>
				</tr>
				<tr>
					<th rowspan="3" class="table-light">손상여부 탐지방법</th>
					<th class="table-light">존재 여부</th>
					<td colspan="6">Y</td>
				</tr>
				<tr>
					<th class="table-light">내용</th>
					<td colspan="6"><c:out value='${EP.epDmgDetMContent}'/></td>
				</tr>
				<tr>
					<th class="table-light">근거 문서</th>

					<td colspan="6"><c:out value='${EP.epDmgDoc}'/></td>
				</tr>
				<tr>
					<th rowspan="3" class="table-light">교육훈련 계획</th>
					<th class="table-light">존재 여부</th>
					<td colspan="6">Y</td>
				</tr>
				<tr>
					<th class="table-light">내용</th>
					<td colspan="6"><c:out value='${EP.epETContent}'/></td>
				</tr>
				<tr>
					<th class="table-light">근거문서</th>
					<td colspan="6"><c:out value='${EP.epETDoc}'/></td>
				</tr>
			</table>
		</div>

		<!--right-container-->
	</div>

<%@include file="../includes/footer.jsp"%>