<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<link rel="stylesheet" type="text/css" href="../../../resources/css/menu.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/demo.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/component.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/vul_imple_plan.css" />
<title>Insert title here</title>
<style>
.btn {
	float: right;
}
</style>
</head>
<div class="right-container">
		<h1>
			<b>이행계획 리스트 등록</b>
		</h1>
		<hr>

		<script>
			$(function() {
				$("#btn_toggle").click(function() {
					$(".empty").toggle();
					$(".right").toggle();
				});
			})
		</script>

		<div class="imple_plan_box">
			<div class="left">
				<table class="table table-bordered">
					<tr>
						<td colspan="6">
						<label for="vul_action-select"> 등록할 조치권고 선택:</label>
						 <select id="vul_action-select">
								<option value="">--조치권고 선택--</option>
								<c:forEach items="${ac_list}" var="ar" varStatus="status">
								<option value="${ar.AR_title}">${ar.AR_title}</option>
								</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td class="table-light">등록일자</td>
						<td>2021-00-00</td>
					</tr>
					<tr>
						<td class="table-light">권고 발행번호</td>
						<td>21-0001</td>
					</tr>
					<tr>
						<td class="table-light">취약점 정보변경</td>
						<td>21-090-112</td>

					</tr>
					<tr>
						<td class="table-light">자산명</td>
						<td>제어봉구동장치PLC</td>
					</tr>
					<tr>
						<td class="table-light">자산번호</td>
						<td>H-01-0001</td>
					</tr>
					<tr>
						<td class="table-light">시스템 S/W</td>
						<td>Window</td>
					</tr>
					<tr>
						<td class="table-light">제목</td>
						<td>윈도우 서버 내 패스워드 파일 권한 변경</td>
					</tr>
					<tr>
						<td class="table-light">조치방법</td>
						<td>권고사항 윈도우 서버 내 패스워드 파일의 권한은 600으로 변경할 것</td>
					</tr>
				</table>
				<br>
				<div class="table_button_group">
					<button type="button" id="btn_toggle" class="btn btn-danger"
						data-toggle="modal" data-target="#staticBackdrop">이행계획등록</button>
				</div>
			</div>
			
			<div class="empty">
				<h5>이행계획등록 버튼을 누르면<br>조회한 조치권고에 해당하는 이행계획을 등록할 수 있습니다.</h5>
			</div>
			<div class="right" style="display: none">
				<table class="table table-bordered" style="top: 80px">
					<tr>
						<td class="table-light">조치제목</td>
						<td><input type="text" style="width: 400px; height: 32px;"
							placeholder="내용입력"></td>
					</tr>
					<tr>
						<td class="table-light">조치방법</td>
						<td><input type="text" placeholder="단기"></td>
					</tr>
					<tr>
						<td class="table-light">조치부서</td>
						<td><input type="text" placeholder="정보보안"></td>
					</tr>
					<tr>
						<td class="table-light">조치계획일자</td>
						<td><input type="text" placeholder="2021-00-00"></td>
					</tr>
					<tr>
						<td class="table-light">조치예상일자</td>
						<td><input type="text" placeholder="3일"></td>
					</tr>
				</table>
				<div class="register_table_button_group">
					<button type="button" id="btn_toggle" class="btn btn-danger"
						data-toggle="modal" data-target="#staticBackdrop"
						onclick="accept()">등록</button>
				</div>
			</div>
		</div>
	</div>
