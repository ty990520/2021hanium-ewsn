<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css" />

<link rel="stylesheet" type="text/css"
	href="../../../resources/css/CI_list.css" />
</head>

<style>
a {
	text-decoration: none;
	color: black;
}

.middle {
	text-align: center;
	vertical-align: middle;
}

.table-bordered {
	position: relative;
	top: 35px;
}

.table {
	text-align: left;
}
</style>

<div class="right-container" style="width: 70%">
	<h1>
		<b>사이버통제항목 리스트 등록 </b>
	</h1>
	<hr>
	<br>
	<div class="up">
		<table class="table table-bordered">
			<tr>
				<th style="text-align: center;" colspan='12'>평가 자산 상세 내역</th>
			</tr>
			<tr>
				<td class="table-light" colspan="4">자산</td>
				<td colspan="8"><input type="text" id="input_sear" width="30px"
					class="lookfor_input" placeholder="자산번호를 입력해주세요" title="검색창">
					<button type="button" id="a" class="btn btn-success"
						onclick="location.href='#' ">찾기</button>
			</tr>
			<tr>
				<td class="table-light" colspan="4">자산명</td>
				<td colspan="8">
					<div class="textbox">
						<input type="text" class="lookfor_input" id="daname" readonly>
					</div>
				</td>
			</tr>
			<tr>
				<td class="table-light" colspan="4">자산식별유형</td>
				<td colspan="5"><input type="text" class="lookfor_input"
					id="daIdentifyType" readonly></td>

			</tr>
			<tr>
				<td class="table-light" colspan="4">발전소</td>
				<td colspan="2"><input type="text" class="lookfor_input"
					id="daptype" readonly></td>
				<td class="table-light" colspan="2">발전소 상세</td>
				<td colspan="4"><input type="text" class="lookfor_input"
					id="daPDetailType" readonly></td>
			</tr>

		</table>
		<div class="table_button_group">
			<button type="button" id="btn_toggle" class="btn btn-danger"
				data-toggle="modal" data-target="#staticBackdrop"
				onclick="modal_search()">평가시작</button>
		</div>
	</div>

	<br> <br>


	<div class="down " style="display: none">
		<table class="table table-bordered">
			<tr>
				<th style="text-align: center;" colspan="5">제어봉구동장치 PLC의 보안조치
					적용결과</th>
			</tr>
			<colgroup>

				<col width="15%" />
				<col width="20%" />
				<col width="15%" />
				<col width="45%" />
			</colgroup>
			<tr>

				<th class="middle">통제항목 분류</th>
				<th class="middle">상세분류</th>
				<th class="middle">이행여부</th>
				<th>적용내용</th>
			</tr>
			<tr id="b">

				<td class="middle"><input type="text" value="I"
					<c:out value='${pageMaker.cri.type eq "I"?"selected": "" }'/>>운영적</td>
				<td class="middle">형상관</td>
				<td class="middle"><select name="CI_applyCheck">
						<option value="Y">Y</option>
						<option value="N">N</option>
				</select></td>
				<td><textarea placeholder="내용을 입력해주세요" name="CI_applyContent"></textarea></td>
			</tr>
		</table>
		<div class="table_button_group">
			<button type="button" class="btn btn-danger"
				onclick="location.href='#' ">완료</button>
			<br> <br>
		</div>
	</div>
</div>

<script>
	var datype;
	$(function() {
		$("#btn_toggle").click(function() {
			$(".down").toggle();
		});
	})

	$(function() {
		$("#a").on(
				"click",
				function() {
					var result = $('#input_sear').val();
					console.log(result);
					$.ajax({
						contentType : "application/json; charset=utf-8;",
						dataType : "json",
						type : "GET",
						url : "/ControlledItemsApply/selectAr",
						data : {
							"daid" : result
						},
						success : function(data) {
							if (!data) {
								console.log("data없음");

							}
							console.log(data);
							datype = data.daIdentifyType;
							$("#daname").val(data.daname)
							$("#daptype").val(data.daptype)
							$("#daPDetailType").val(data.daPDetailType)
							$("#daIdentifyType").val(data.daIdentifyType)

						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						}

					});
				});
	})

	
	
	function modal_search() {
		console.log(datype);
		$.ajax({
			contentType : "application/json; charset=utf-8;",
			dataType : "json",
			type : "GET",
			url : "/ControlledItems/search_ci_list",
			data : {
				"type" : datype

			},
			success : function(response) {
				//conlose.log(response);
				console.log(response);
				
				getTag = $("#b").empty();
				
				var insTag ="";
			
				
				
				// 추가할 태그
				for(var i=0; i<response.length; i++){
					insTag += "<tr>";
					//insTag += "onclick='select("+i+",\'"+response[i].daname+"\',\'"+response[i].daImpact+"\')'>";
					
					//insTag += "<td scope='row' style='width: 30px;'>"+(i+1)+"</td>";
					insTag += "<td name='CI_type'>"+response[i].CI_type+"</td>";
					insTag += "<td name='CI_detailType'>"+response[i].CI_detailType+"</td>";
					insTag += "</tr>";
					console.log(insTag);
					
					
				}
				$("#selectDA_modal").html(insTag) ;
		
			}
		});
	}
</script>
<%@include file="../includes/footer.jsp"%>