<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/common.css" />
<title>Insert title here</title>
<style>

.btn {
	float: right;
}
</style>
</head>
<div class="right-container">
	<h1>
		<b>조치권고
		<button type="button" class="btn btn-danger" data-toggle="modal"
			data-target="#staticBackdrop"
			onclick="location.href='/ActionRecommend/register_pre' ">등록하기</button>
		</b>
	</h1>
	<hr>
	<form class="center_form">
		<select name="search" id="">
			<option value="DAName">자산명</option>
			<option value="DAId">자산번호</option>
		</select> <input type="search" name="" value="" placeholder="자산명 입력">
		<button type="button" name="button" class="btn btn-outline-secondary">검색</button>
	</form>
	<br>
	<br>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col" style="width: 30px;">Id</th>
				<th scope="col">자산번호</th>
				<th scope="col">자산명</th>
				<th scope="col">조치유형</th>
				<th scope="col">제목</th>
				<th scope="col">권고사항</th>

			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="ar" varStatus="status">
			<tr onclick="get(<c:out value="${ar.AR_no}"/>)">
				<td style="width: 30px;">${status.count}</td>
				<td><c:out value="${ar.AR_daID}" /></td>
				<td><c:out value="${ar.AR_daName}" /></td>
				<td><c:out value="${ar.AR_ActionType}" /></td>
				<td><c:out value="${ar.AR_title}" /></td>
				<td><c:out value="${ar.AR_issue}" /></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</div>
<script>
   $('#myModal').on('shown.bs.modal', function() {
      $('#myInput').trigger('focus')
   })
   	function get(AR_no) {
		//alert(SA_no);
		location.href = "/ActionRecommend/get?AR_no="+AR_no;

	}
</script>
<%@include file="../includes/footer.jsp"%>
