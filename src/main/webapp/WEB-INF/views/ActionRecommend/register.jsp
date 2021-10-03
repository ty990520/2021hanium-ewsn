<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<head>
<link rel="stylesheet" type="text/css" href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/register.css" />
<title>Insert title here</title>
<style>
a {
	text-decoration: none;
	color: black;
}

td.table-light {
width: 80px;
vertical-align: middle;
text-align: center;
}
</style>
</head>
<div class="right-container">
		<h1>
			<b>조치권고 등록 </b>
		</h1>
		<hr>
		<form name=form onsubmit="return checkAll()" id="register"
		action="register" method="post">
		<table class="table table-bordered">
			<tr>
			</tr>
			<tr>
				<td class="table-light" colspan="2">발행부서</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="AR_regDept" placeholder="발행부서"></td>
				<td class="table-light" colspan="2">발행자</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="RegistrarID" placeholder="발행자"></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">자산명</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="AR_daName" value="${da.daname}" readonly></td>
				<td class="table-light" colspan="2">자산번호</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="AR_daID" value="${da.daid}" readonly></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">시스템sw유형</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="AR_daSystemSW" value="${da.daSystemSW}" readonly></td>
					
				<td class="table-light" colspan="2">조치유형</td>
				<td colspan="2">
				<select name="AR_ActionType" >
				 <option value="장기">장기</option>
				 <option value="중기">중기</option>
				 <option value="중기">단기</option>
				</select>
				<!--  input type="text"
					class="vulner_register_input" name="AR_ActionType" placeholder="조치유형검색"></td-->
			</tr>
			<tr>
				<td class="table-light" colspan="2">제목</td>
				<td colspan="6"><input type="text" class="input_width100"
					name="AR_title" placeholder="취약점 내용 입력"></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">권고사항(조치사항)</td>
				<td colspan="6"><input type="text" class="input_width100"
					name="AR_issue" placeholder="조치 내용 입력"></td>
			</tr>
		</table>

		
		<div class="table_button_group">
			<button type="submit" class="btn btn-danger">등록</button>
			<br><br><br><br><br><br><br><br>
		</div>
		</form>
	</div>

<%@include file="../includes/footer.jsp"%>
