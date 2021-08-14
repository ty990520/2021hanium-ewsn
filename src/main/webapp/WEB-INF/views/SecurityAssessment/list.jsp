<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />
<link rel="stylesheet" href="../../../resources/css/alert.css">
<style>
.assess_btn {
	float: right;
}

#selectDA_modal tr:hover {
	background-color: rgba(0, 0, 0, .075);
}

.h5box {
	border: 0.2rem solid;
	border-color: #d6d6d661;
	padding-bottom: 1rem;
	padding-top: 1.5rem;
	border-radius: 5px;
	color: #7c7c7c;
}

.notify {
	z-index: 1051;
}

.selectDA_modal_div {
	overflow-y: auto;
	height: 300px;
}
</style>

</head>
<div class="notify">
	<span id="notifyType" class=""></span>
</div>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">DA 단계적 보안성 평가
					시작하기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="h5box">
					<h6>
						<b>단계적 보안성 평가를 진행할 DA를 선택해주세요.</b>
					</h6>
				</div>
				<br>
				<form class="center_form">
					<div style="float: right;">
						<select name="type" id="modal_type">
							<option value="N">자산명</option>
							<option value="I">자산번호</option>
							<option value="IMP">영향성분석</option>
						</select> <input type="text" name="keyword" id="modal_keyword" />
						<button type="button" name="button"
							class="btn btn-outline-secondary" onclick="modal_search()">검색</button>
					</div>
				</form>
				<br> <br>
				<div class="selectDA_modal_div">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col" style="width: 30px;">Id</th>
								<th scope="col">자산번호</th>
								<th scope="col">자산명</th>
								<th scope="col">영향성분석</th>

							</tr>
						</thead>
						<tbody id="selectDA_modal">
							<c:forEach items="${undecide}" var="da" varStatus="status">
								<tr class="modal_items"
									onclick="select(<c:out
								value="${status.index}" />, '<c:out value="${da.daid}" />', '<c:out value="${da.daImpact}" />')">
									<td scope="row" style="width: 30px;"><c:out
											value="${status.count}" /></td>
									<td><c:out value="${da.daid}" /></td>
									<td><c:out value="${da.daname}" /></td>
									<td><c:out value="${da.daImpact}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>


			<div class="modal-footer">
				<br> <b><span style="color: #dc3545;" id="select_da">평가할
						자산을 선택해주세요.</span></b>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-danger" id="start"
					onclick="assessStart()" disabled="disabled">평가시작</button>
			</div>
		</div>
	</div>
</div>
<div class="right-container">
	<h1>
		<b>DA 단계적 보안성 평가</b>
		<div class="assess_btn">
			<button type="button" class="btn btn-danger" data-toggle="modal"
				data-target="#staticBackdrop">단계적 보안성 평가 시작하기</button>
		</div>
	</h1>
	<hr>
	<form id="searchForm" action="/SecurityAssessment/list" method="get">
		<select name="type">
			<option value="I"
				<c:out value='${pageMaker.cri.type eq "I"?"selected": "" }'/>
				selected="selected">자산번호</option>
			<option value="N"
				<c:out value='${pageMaker.cri.type eq "N"?"selected": "" }'/>>자산명</option>
			<option value="T"
				<c:out value='${pageMaker.cri.type eq "T"?"selected": "" }'/>>상세유형분류</option>
		</select> <input type="text" name="keyword" class="kw"
			value="<c:out value='${pageMaker.cri.keyword}'/>" /> <input
			type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" /> <input
			type="hidden" name="amount" value="${pageMaker.cri.amount}" />
		<button class="btn btn-outline-secondary">검색</button>
	</form>
	<p>보안성 평가가 완료된 자산 정보를 확인할 수 있습니다.</p>
	<br>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col" style="width: 30px;">Id</th>
				<th scope="col">자산번호</th>
				<th scope="col">자산명</th>
				<th scope="col">발전소 구분</th>
				<th scope="col">발전소 상세 구분</th>
				<th scope="col">식별상세유형</th>
				<th scope="col">평가일자</th>
			</tr>
		</thead>
		<tbody id="table_body">
			<c:forEach items="${decide}" var="da" varStatus="status">
				<tr
					onclick="SA_detail(<c:out value="${status.index}"/>,<c:out value="${da.SA_no}"/>)">
					<td scope="row" style="width: 30px;"><c:out
							value="${(pageMaker.cri.amount*(pageMaker.cri.pageNum-1))+status.count}" /></td>
					<td><c:out value="${da.SA_daID}" /></td>
					<td><c:out value="${da.daname}" /></td>
					<td><c:out value="${da.daptype}" /></td>
					<td><c:out value="${da.daPDetailType}" /></td>
					<td><c:out value="${da.SA_IdentifyType}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${da.SA_date}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<nav class="pagination_nav" aria-label="...">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li class="page-item disabled"><a class="page-link"
					href="${pageMaker.startPage -1}" tabindex="-1" aria-disabled="true">이전</a></li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }">
				<c:if test="${pageMaker.cri.pageNum == num}">
					<li class="page-item active" aria-current="page"><a
						class="page-link" href="#">${num}</a></li>
				</c:if>
				<c:if test="${pageMaker.cri.pageNum != num}">
					<li class="page-item"><a class="page-link"
						onclick="pageAction(${num})">${num}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="page-item"><a class="page-link"
					href="${pageMaker.endPage +1}">다음</a></li>
			</c:if>
		</ul>
	</nav>

	<form id='actionForm' action="/SecurityAssessment/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>

</div>

<script>
	/* 단계적 보안성 평가 모달창 띄우는 코드 */
	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').trigger('focus')
	})

	
	/* 식별상세유형 판별해서 디테일 페이지 링크 연결 */
	function SA_detail(val, SA_no) {
		//alert(SA_no);
		var rows = document.getElementById("table_body").getElementsByTagName("tr");
		
		var str = [];

		for (var i = 0; i < rows.length; i++) {
			var row = rows[i].getElementsByTagName("td");
			str[i] = row[5].firstChild.data; // 이름
			//console.log(str[i]);
			//console.log(str[i]);
		}
		if (str[val] == "EP DA") {
			location.href = "/SecurityAssessment/ep_detail?epNo="+SA_no;
		} else if (str[val] == "BOP DA") {
			location.href = "/SecurityAssessment/bop_detail?bopNo="+SA_no;
		} else if (str[val] == "Indirect DA") {
			location.href = "/SecurityAssessment/indirect_detail?indirectNo="+SA_no;
		} else{
			alert("Direct DA정보는 제공되지 않습니다.");
		}

	}
	
	var daId;
	var flag=0;	//평가 루트 1:ep부터, 2:bop부터, 3:indirect부터 
	
	function select(val, daname, daImpact){
		console.log(val+", "+daname+", "+daImpact)
		var target = document.getElementsByClassName("modal_items");
		daId=daname;
		
		if(daImpact=="Emergency Preparedness Function"){
			flag = 1;
		}else if(daImpact=="Important to Safety"){
			flag = 2;
		}else{
			flag = 3;
		}
		target[val].style.backgroundColor = "rgb(146 171 198 / 25%)";
		 $( '#select_da' ).text( daname+"자산을 평가합니다." );
		 $("#start").attr("disabled", false);
		for(var i=0 ;i<target.length ; i++ ){
			if(i!=val)
				target[i].style.backgroundColor = "transparent";
		}
	}
	
	function select_search(val, daname, daImpact){
		console.log(val+", "+daname+", "+daImpact)
		var target2 = document.getElementsByClassName("modal_items2");
		console.log(target2[val]);
		daId=daname;
		
		if(daImpact=="Emergency Preparedness Function"){
			flag = 1;
		}else if(daImpact=="Important to Safety"){
			flag = 2;
		}else{
			flag = 3;
		}
		
		target2[val].style.backgroundColor = "rgb(146 171 198 / 25%)";
		 $( '#select_da' ).text( daname+"자산을 평가합니다." );
		 $("#start").attr("disabled", false);
		for(var i=0 ;i<target2.length ; i++ ){
			if(i!=val)
				target2[i].style.backgroundColor = "transparent";
		}
	}
	
	function assessStart(){
		document.getElementById("notifyType").innerHTML = daId+"의 단계적 보안성 평가를 시작합니다.";
		$(".notify").toggleClass("active");
		  $("#notifyType").toggleClass("success");

		  setTimeout(function(){
		    $(".notify").removeClass("active");
		    $("#notifyType").removeClass("success");
		  },1600);
		  
		  
		  if(flag==1){
			  setTimeout(function(){location.href = "/SecurityAssessment/assessEP?daid="+daId;},1800);
			}else if(flag==2){
				setTimeout(function(){location.href = "/SecurityAssessment/assessBOP?daid="+daId;},1800);
			}else{
				setTimeout(function(){location.href = "/SecurityAssessment/assessIndirect?daid="+daId;},1800);
			}

	}
	
	function pageAction(pageNum){
		var actionForm = $('#actionForm');
		console.log('click');
		actionForm.find('input[name="pageNum"]').val(pageNum);
		actionForm.submit();
	}
	
	
	 
     
	function modal_search(){
		var type = $("#modal_type option:selected").val();
		console.log(type);
		var keyword = $('#modal_keyword').val();
		console.log(keyword);
		
		$.ajax({
			contentType : "application/json; charset=utf-8;",
			dataType:"json",
			type : "GET",
			url : "/SecurityAssessment/search_keyword",
			data : {
				"type" : type,
				"keyword" : keyword
			},
			success : function(response) {
				//conlose.log(response);
				console.log(response);
				
				var getTag = $("#selectDA_modal").html() ;
				 
				getTag = $("#selectDA_modal").empty();
				
				var insTag ="";
			
				
				
				// 추가할 태그
				for(var i=0; i<response.length; i++){
					insTag += "<tr class='modal_items2'>";
					//insTag += "onclick='select("+i+",\'"+response[i].daname+"\',\'"+response[i].daImpact+"\')'>";
					
					insTag += "<td scope='row' style='width: 30px;'>"+(i+1)+"</td>";
					insTag += "<td name='mdaid'>"+response[i].daid+"</td>";
					insTag += "<td name='mdaname'>"+response[i].daname+"</td>";
					insTag += "<td name='mdaImpact'>"+response[i].daImpact+"</td>";
					insTag += "</tr>";
					console.log(insTag);
					
					
				}
				$("#selectDA_modal").html(insTag) ;
				
				
				$('.modal_items2').each(function(index){ 
					$(this).attr('menu-index', index);
				}).click(function(){
				    var index = $(this).attr('menu-index');
				    select_search(index, response[index].daname, response[index].daImpact);
				});
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}
	
</script>
<%@include file="../includes/footer.jsp"%>
