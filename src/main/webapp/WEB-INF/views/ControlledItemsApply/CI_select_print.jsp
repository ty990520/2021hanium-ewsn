<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
</head>

<div class="right-container">
	<h1>
		<b>사이버통제항목 선택정보 출력 </b>
	</h1>
	<hr>
<br>
	<table class="table table-bordered">

		<tr>
			<td class="table-light" colspan="2">점검일자</td>
			<td colspan="2">2020-03-31</td>
			<td class="table-light" colspan="2">버전</td>
			<td colspan="2">제어봉구동장치 2020_1</td>
		</tr>
		<tr>
			<th style="text-align: center;" colspan="8">평가 자산 상세 내역</th>

		</tr>
		<tr>
			<td class="table-light" colspan="2">자산</td>
			<td colspan="6">제어봉구동장치 PLC</td>

		</tr>

		<tr>
			<td class="table-light">발전</td>
			<td>수력</td>
			<td class="table-light">발전소 위치</td>
			<td>한강</td>
			<td class="table-light">자산번호</td>
			<td>H-01-0001</td>
			<td class="table-light">자산식별 상세 유형</td>
			<td>DP-DA</td>

		</tr>
		<tr>
			<th style="text-align: center;" colspan="8">제어봉구동장치 PLC의 보안조치
				적용결과</th>

		</tr>


		<tr>
			<th>분야번호</th>
			<th>통제항목 분류</th>
			<th>상세분류</th>
			<th>이행여부</th>
			<th colspan="4">적용내용</th>
		</tr>
		<tr>

			<td>1</td>
			<td>기술적</td>
			<td>접근통제</td>
			<td style="text-align: center;">Y</td>
			<td colspan="4">제어시스템 개발자, 운영자, 관리자에 대한 접근권한을 분리하고 있음</td>


		</tr>
		<tr>
			<td>1</td>
			<td>기술</td>
			<td>감사 및 책임</td>
			<td style="text-align: center;">Y</td>
			<td colspan="4">제어시스템 계정의 접근 여부를 주기적으로 감사하고 있으며, 부적절한 접근에 대해
				통제하고 있음</td>
		</tr>
		<tr>
			<td>1</td>
			<td>기술</td>
			<td>시스템 통신의 보호</td>
			<td style="text-align: center;">Y</td>
			<td colspan="4">제어 네트워크 외부와 물리적 일방향 환경을 구축하였음</td>

		</tr>
		<tr>
			<td>2</td>
			<td>운영적</td>
			<td>형상관</td>
			<td style="text-align: center;">Y</td>
			<td colspan="4">제어시스템에 대한 최신 업데이트, 보안패치를 안전하게 적용하기 위한 절차를 수립하였음</td>

		</tr>
	</table>


</div>




<%@include file="../includes/footer.jsp"%>