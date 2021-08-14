<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/table.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/sa_detail_table.css" />
</head>
<div class="right-container">
	<h1>
		<b>단계적 보안성 평가 선택정보 출력</b> <img alt=""
			src="../../../resources/img/process3.png" width="15%"
			class="process-image">
	</h1>

	<br>
	<div class="table-cover">
		<table class="table table-bordered">

			<tr>
				<th class="table-light" rowspan="4">안전/보안 관련<br>지시/경고 기능
				</th>
				<th class="table-light">수행 여부</th>
				<td colspan="3">
					<c:out value='${Indirect.indIWPerformCheck eq true? "Y":"N"}'/>
				</td>
			</tr>
			<tr>
				<th class="table-light">수행 관련 내용</th>
				<td colspan="3">
					<c:out value='${Indirect.indIWPerformContent}' />
					<c:if test="${Indirect.indIWPerformContent == null}">
						<c:out value="--" />
					</c:if>
				</td>
			</tr>
			<tr>
				<th class="table-light">대체 수단 존재 여부</th>
				<td colspan="3">
					<c:out value='${Indirect.indIWAlterCheck eq true? "Y":"N"}'/>
				</td>
			</tr>
			<tr>
				<th class="table-light">대체 수단 관련 내용</th>
				<td colspan="3">
					<c:out value='${Indirect.indIWAlterContent}' />
					<c:if test="${Indirect.indIWAlterContent == ''}">
						<c:out value="--" />
					</c:if>
				</td>
			</tr>
			<tr>
				<th class="table-light" rowspan="3">손상여부 탐지방법</th>
				<th class="table-light">존재 여부</th>
				<td colspan="3">
					<c:out value='${Indirect.indDmgDetectCheck eq true? "Y":"N"}'/>
				</td>
			</tr>
			<tr>
				<th class="table-light">관련 내용</th>
				<td colspan="3">
					<c:out value='${Indirect.indDmgDetectASContent}' />
					<c:if test="${Indirect.indDmgDetectASContent == ''}">
						<c:out value="--" />
					</c:if>
				</td>
			</tr>
			<tr>
				<th class="table-light">근거 문서</th>
				<td colspan="3">
					<c:out value='${Indirect.indDmgDetectDoc}' />
					<c:if test="${Indirect.indDmgDetectDoc == ''}">
							<c:out value="--" />
						</c:if>
				</td>
			</tr>
			<tr>
				<th class="table-light" rowspan="3">손상탐지 시간 내<br>평가 기준
				</th>
				<th class="table-light">존재 여부</th>
				<td colspan="3">
					<c:out value='${Indirect.indDmgDetectASCheck eq true? "Y":"N"}'/>
				</td>
			</tr>
			<tr>
				<th class="table-light">관련 내용</th>
				<td colspan="3">
					<c:out value='${Indirect.indDmgDetectASContent}' />
					<c:if test="${Indirect.indDmgDetectASContent == ''}">
						<c:out value="--" />
					</c:if>
				</td>
			</tr>
			<tr>
				<th class="table-light">근거 문서</th>
				<td colspan="3">
					<c:out value='${Indirect.indDmgDetectASDoc}' />
					<c:if test="${Indirect.indDmgDetectASDoc == ''}">
							<c:out value="--" />
						</c:if>
				</td>
			</tr>
			<tr>
				<th class="table-light" rowspan="3">교육 훈련</th>
				<th class="table-light">계획 존재 여부</th>
				<td colspan="3">
						<c:out value='${Indirect.indETCheck eq true? "Y":"N"}'/>
				</td>
			</tr>
			<tr>
				<th class="table-light">내용</th>
				<td colspan="3">
					<c:out value='${Indirect.indETContent}' />
					<c:if test="${Indirect.indETContent == ''}">
								<c:out value="--" />
							</c:if>
				</td>
			</tr>
			<tr>
				<th class="table-light">근거 문서</th>
				<td colspan="3"><c:out value='${Indirect.indETDoc}' />
				<c:if test="${Indirect.indETDoc == ''}">
								<c:out value="--" />
							</c:if>
				</td>
			</tr>
		</table>
	</div>

	<!--right-container-->
</div>
<%@include file="../includes/footer.jsp"%>