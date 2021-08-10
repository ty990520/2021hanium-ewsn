<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" href="../../../resources/css/Code_Enroll.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/table.css" />
</head>
<div class="right-container">
	<form name=form action="register2" method="post">
		<h1>
			<b>공통코드관리 - 상세코드 등록창 </b>
		</h1>
		<hr>
		<div class="inner">

			<div class="code_id">

				<h6>대표코드</h6>
				<select id="vul_action-select">
					<c:forEach items="${d_list}" var="re" varStatus="status">
						<option selected value="${re.represent_id}">${re.r_code}</option>
					</c:forEach>
				</select>
				<input type="hidden" name="R_code" value="" id="r_code_hidden">
			</div>
			<div class="code_id">

				<h6>대표코드명</h6>
				<input name="R_codeName" id="r_codeName" style="background-color: #e8e8e7;"> <br>
				<br> <br>
				<hr>
			</div>
			<div class="code_id">
				<h6>상세코드 번호</h6>
				<input type="text" name="D_code" placeholder="상세코드번호 ">

				<h6>상세코드명</h6>
				<input type="text" name="D_codeName" placeholder="상세코드명 ">
			</div>

		</div>

		<br> <br>
		<div align="right">
			<button type="submit" class="btn btn-danger btn-lg">등록</button>

		</div>
	</form>
</div>


<script>
		$("#vul_action-select").change(
				function() {
					//selectbox의 리스트에서 선택된 Index를 구하는 방법은 다음과 같다.
					var selectedIndex = $("#vul_action-select option:selected")
							.val();
					console.log(selectedIndex);
					$.ajax({
						contentType : "application/json; charset=utf-8;",
						dataType : "json",
						type : "GET",
						url : "/RepresentCode/selectAr",
						data : {
							"represent_id" : selectedIndex
						},
						success : function(data) {
							if (!data) {
								console.log("err");
							}
							console.log(data);
							$('#r_codeName').val(data.R_codeName);
							$('#r_code_hidden').val(data.R_code);
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						}
					})
				});
	</script>
<br>
<br>
<br>
<br>
<br>
<%@include file="../includes/footer.jsp"%>