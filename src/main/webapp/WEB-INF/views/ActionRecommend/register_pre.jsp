<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/register.css" />
</head>
<style>
a {
	text-decoration: none;
	color: black;
}

td.table-light {
	vertical-align: middle;
	text-align: center;
}

#table_fixed {
	table-layout: fixed;
	word-break: break-all;
}
</style>
<div class="right-container">
	<h1>
		<b>신규 취약점 관리 </b>
	</h1>

	<table class="table table-bordered" id="table_fixed">
		<tr>
			<td class="table-light" colspan="2">취약점명</td>
			<td colspan="10"><select class="input_width100">
					<option value="부서1">취약점1</option>
					<option value="부서2">취약점2</option>
					<option value="부서3">취약점3</option>
			</select></td>

		</tr>
		<tr>
			<td class="table-light" colspan="2">제조사</td>
			<td colspan="2">삼성</td>
			<td class="table-light" colspan="2">모델</td>
			<td colspan="2">Window</td>
			<td class="table-light" colspan="2">시스템S/W유형</td>
			<td colspan="2">Window방화벽</td>
		</tr>
		<tr>
			<td class="table-light" colspan="2">관련 통제항목</td>
			<td>1.3</td>
			<td>기술적</td>
			<td colspan="2">시스템 및 통신의 보호</td>
			<td colspan="6">주어진 업무를 수행하는데 필요한 만큼의 제한된 접근권한을 각 계정에 부여하고 있는가?</td>
		</tr>
	</table>
	<br> <br> <br> <br>
	<h5>
		<b>조치권고를 등록할 설비를 선택해주세요.</b>
	</h5>
	<hr>
	<table class="table table-hover">
		<thead>
			<tr>
				<th style="width: 30px;">Id</th>
				<th>자산번호</th>
				<th>자산명</th>
				<th>자산기능</th>
				<th>기능유형</th>
				<th>영향성 분석</th>
				<th>설비유형</th>
				<th>설비사용목적</th>
				<th>시스템S/W유형</th>
				<th>통신I/F</th>
				<th>사용여부</th>
			</tr>
		</thead>
		<tbody id="table_body">
			<tr onclick="location.href = 'DA_detail.html' ">
				<td style="width: 30px;">1</td>
				<td>H-01-0001</td>
				<td>PC</td>
				<td>Win 7</td>
				<td>Support</td>
				<td>Support function</td>
				<td>PLC</td>
				<td>발전연관장비</td>
				<td>Windows</td>
				<td>Ethernet</td>
				<td>O</td>
			</tr>
			<tr onclick="location.href = 'DA_detail.html' ">
				<td style="width: 30px;">2</td>
				<td>H-01-0002</td>
				<td>PC</td>
				<td>Win 7</td>
				<td>Safety</td>
				<td>Important to Safety</td>
				<td>DCS</td>
				<td>유지보수장비</td>
				<td>Windows</td>
				<td>Ethernet</td>
				<td>O</td>
			</tr>
			<tr onclick="location.href = 'DA_detail.html' ">
				<td style="width: 30px;">3</td>
				<td>H-01-0003</td>
				<td>PC</td>
				<td>Win XP</td>
				<td>Safety</td>
				<td>Safety Related</td>
				<td>Pc/server</td>
				<td>발전연관장비</td>
				<td>Firmware</td>
				<td>Hard Wiring</td>
				<td>O</td>
			</tr>
			<tr onclick="location.href = 'DA_detail.html' ">
				<td style="width: 30px;">4</td>
				<td>H-01-0004</td>
				<td>PC</td>
				<td>Win XP</td>
				<td>Security</td>
				<td>Safety Related</td>
				<td>Pc/server</td>
				<td>발전연관장비</td>
				<td>Firmware</td>
				<td>Serial</td>
				<td>O</td>
			</tr>
			<tr onclick="location.href = 'DA_detail.html' ">
				<td style="width: 30px;">5</td>
				<td>H-01-0005</td>
				<td>PC</td>
				<td>Win 2003</td>
				<td>Safety</td>
				<td>Support function</td>
				<td>Pc/server</td>
				<td>발전연관장비</td>
				<td>Windows</td>
				<td>Ethernet</td>
				<td>O</td>
			</tr>
			<tr onclick="location.href = 'DA_detail.html' ">
				<td style="width: 30px;">6</td>
				<td>H-01-0006</td>
				<td>PC</td>
				<td>Win 2003</td>
				<td>Support</td>
				<td>Important to Safety</td>
				<td>PLC</td>
				<td>유지보수장비</td>
				<td>Windows</td>
				<td>Hard Wiring</td>
				<td>O</td>
			</tr>
			<tr onclick="location.href = 'DA_detail.html' ">
				<td style="width: 30px;">7</td>
				<td>H-01-0007</td>
				<td>PC</td>
				<td>Win 2003</td>
				<td>Security</td>
				<td>Safety Related</td>
				<td>DCS</td>
				<td>유지보수장비</td>
				<td>Firmware</td>
				<td>Serial</td>
				<td>O</td>
			</tr>
		</tbody>
	</table>
	<div class="table_button_group">
		<button type="button" class="btn btn-danger" data-toggle="modal"
			data-target="#staticBackdrop" onclick="location.href='/ActionRecommend/register'">조치 권고 등록하기</button>
	</div>
	<br><br>
</div>
<%@include file="../includes/footer.jsp"%>