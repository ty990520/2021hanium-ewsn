<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<title>Insert title here</title>
<style>
.btn {
	float: right;
}
</style>
</head>

<div class="right-container">
	<h1>
		<b>이행계획
			<button type="button" class="btn btn-danger" data-toggle="modal"
				data-target="#staticBackdrop"
				onclick="location.href='/Action/register' ">등록하기</button>
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
	<br> <br>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col" style="width: 30px;">Id</th>
				<!-- <th scope="col">조치예정일</th> -->
				<!-- <th scope="col">조치계획</th> -->
				<th scope="col">조치부서</th>
				<th scope="col">조치담당자</th>
				<th scope="col">조치구분</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="ac" varStatus="status">
				<tr onclick="get(<c:out value="${ac.AC_no}"/>)">
					<td scope="row" style="width: 30px;">${status.count}</td>
					
					<td><c:out value="${ac.AC_dept}" /></td>
					<td><c:out value="${ac.AC_manager}" /></td>
					<td><c:out value="${ac.AC_type}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<br>
</div>

<script>
   $('#myModal').on('shown.bs.modal', function() {
      $('#myInput').trigger('focus')
   })
   	function get(AC_no) {
		//alert(SA_no);
		location.href = "/Action/get?AC_no="+AC_no;
	}
</script>

<%@include file="../includes/footer.jsp"%>