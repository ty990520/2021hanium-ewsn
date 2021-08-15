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

<style>
select {
	width: 500px;
	height: 50px;
	padding: 5px;
	border: 1px solid #999;
	font-family: 'Nanumgothic';
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%;
	border-radius: 50px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}
</style>
<div class="right-container">
	<form name=form action="register2" method="post" onsubmit="return false;">
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
				</select> <input type="hidden" name="R_code" value="" id="r_code_hidden">
			</div>
			<div class="code_id">

				<h6>대표코드명</h6>
				<input name="R_codeName" id="r_codeName"
					style="background-color: #e8e8e7;"> <br> <br> <br>
				<hr>
			</div>
			<div class="code_id">
				<h6>상세코드 번호</h6>
				<input type="text" name="D_code" placeholder="상세코드번호 " id="D_code"> <br>
				<br>
				<h6>상세코드명</h6>
				<input type="text" name="D_codeName" placeholder="상세코드명 ">
			</div>

		</div>

		<br> <br>
		<div align="right">
			<button type="submit" class="btn btn-danger btn-lg"  onclick="checkExistDeCode()">등록</button>

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

	function checkExistDeCode() {
		var rcode = $("#r_code_hidden").val();
		console.log(rcode);
		var dcode = $("#D_code").val();
		console.log(rcode);
		//alert(code);
		$.ajax({
			contentType : "application/json; charset=utf-8;",
			type : "GET",
			url : "/RepresentCode/checkExistDecode",
			data : {
				"R_code" : rcode,
				"D_code" : dcode
			},
			success : function(response) {
				if (response == "exists") {
					//alert(response);
					alert("이미 존재하는 대표코드입니다.");
					return false;
				} else if (response == "possible") {
					if (confirm("대표코드를 등록하시겠습니까?") == true) {
						alert("등록되었습니다");
						document.getElementById('form').submit();
						return true;
					} else {
						return false;
					}
				}
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}
</script>

<%@include file="../includes/footer.jsp"%>