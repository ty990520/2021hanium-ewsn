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
p{
margin-top: revert;
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
		<b>조치권고</b>
	</h1>

	<table class="table table-bordered" id="table_fixed">
		<tr>
			<td class="table-light" colspan="2">취약점명</td>
			<td colspan="10">
			<select class="input_width100" id="ac_recommend-select">
					<c:forEach items="${vul}" var="vul" varStatus="status">
					 <option value="${vul.vul_id}">${vul.vulName}</option>
					</c:forEach>
			</select>
		</td>
			<c:forEach items="${vul}" var="vul" varStatus="status">
				<input type="hidden" id="ci${status.index}" value="${vul.vul_ci_id}" />
			</c:forEach>
		</tr>
		<tr>
			<td class="table-light" colspan="2">제조사</td>
			<td colspan="2"><p id="Vul_Manufacturer"></td>
			<td class="table-light" colspan="2">모델</td>
			<td colspan="2"><p id="Val_model"></td>
			<td class="table-light" colspan="2">시스템S/W유형</td>
			<td colspan="2"><p id="Val_systemSW"></td>
		</tr>
		<tr id="vul_Null">
			<td class="table-light" colspan="2">관련통제항목</td>
			<td colspan="10">통제항목이 없습니다.</td>
		</tr>
		<tr id="vul_notNull">
			<td class="table-light" colspan="2">관련 통제항목</td>
			<td colspan="2"><p id="vul_ci_id"></td>
			<td class="table-light" colspan="2">통제항목 분류</td>
			<td colspan="2"><p id="CI_type"></td>
			<td class="table-light" colspan="2">상세분류</td>
			<td colspan="2"><p id="CI_detail_type"></td>
		</tr>
		<tr id="vul_notNull2">
			<td class="table-light" colspan="2">항목내용</td>
			<td colspan="10"><p id="CI_content" ></td>
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
				<th>자산번호</th>
				<th>자산명</th>
				<!-- <th>자산기능</th> -->
				<th>기능유형</th>
				<th>영향성 분석</th>
				<th>설비유형</th>
				<th>설비사용목적</th>
				<th>시스템S/W유형</th>
				<th>통신I/F</th>
				<th>사용여부</th>
			</tr>
		</thead>
		<tbody id="select_ci_list">
			<tr onclick="location.href = 'DA_detail.html' ">
				<td style="width: 30px;">1</td>
				<!-- td>H-01-0001</td>
				<td>PC</td>
				<td>Win 7</td>
				<td>Support</td>
				<td>Support function</td>
				<td>PLC</td>
				<td>발전연관장비</td>
				<td>Windows</td>
				<td>Ethernet</td>
				<td>O</td> -->
			</tr>
		</tbody>
	</table>
	<br> <br>
</div>
<script>
	$(document).ready(function() {
		selectRecommend();
	});

	var selectedIndex = null;
	var ci_detail_id = null;
	
	$("#ac_recommend-select").change(function() {
		//var test = document.getElementById("ac_recommend-select");
		// test 변수에 selectTest란 클래스명을 가진 요소를 저장
	
		var indexNo = $("#ac_recommend-select option").index( $("#ac_recommend-select option:selected") );

		ci_detail_id = $("#ci"+indexNo).val();
		
		//console.log(ci_id);
		selectRecommend();
	});

	function selectRecommend() {
		//selectbox의 리스트에서 선택된 Index를 구하는 방법은 다음과 같다.
		 selectedIndex = $("#ac_recommend-select option:selected").val();
		//var ci_detail_id = $("#ci").val();
		//console.log(selectedIndex, ci_detail_id);
		$.ajax({
			contentType : "application/json; charset=utf-8;",
			dataType : "json",
			type : "GET",
			url : "/ActionRecommend/selectAr",
			data : {
				"Vul_id" : selectedIndex,
				"ci_detail_id" : ci_detail_id
			},
			success : function(data) {
				if (!data) {
					console.log("err");
				}
				console.log(data);
				$("#Vul_Manufacturer").text(data.vul_Manufacturer)
				$("#Val_model").text(data.val_model)
				$("#Val_systemSW").text(data.val_systemSW)
				if(data.vul_ci_id==null){
					$("#vul_Null").show();
					$("#vul_notNull").hide();
					$("#vul_notNull2").hide();
				}
				else{
					$("#vul_Null").hide();
					$("#vul_notNull").show();
					$("#vul_notNull2").show();
					$("#vul_ci_id").text(data.vul_ci_id)
					$("#CI_type").text(data.ci_type)
					$("#CI_detail_type").text(data.ci_detailType)
					$("#CI_content").text(data.ci_content)
				}
				select_ci_list(selectedIndex);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n"
						+ "message:" + request.responseText
						+ "\n" + "error:" + error);
			}
		});
	}
	function select_ci_list(selectedIndex) {
		console.log(selectedIndex);
		//var number = selectedIndex;
		$.ajax({
			contentType : "application/json; charset=utf-8;",
			dataType : "json",
			type : "GET",
			url : "/ActionRecommend/select_ci_number",
			data : {
				"Vul_id" : selectedIndex
			},
			success : function(data) {
				if (!data) {
					alert("null");
				}
				console.log(data);

				var getTag = $("#select_ci_list").empty();

				var insTag = "";

				for (var i = 0; i < data.length; i++) {
					//console.log(data[i]);
					insTag += "<tr class='tr_items'>";
					insTag += "<td id='daid'>" + data[i].daid
							+ "</td>";
					insTag += "<td id='daname'>" + data[i].daname + "</td>";
					/*insTag += "<td id='daFunc'>" + data[i].daFunc
							+ "</td>";*/
					insTag += "<td id='daFuncType'>" + data[i].daFuncType
							+ "</td>";
					insTag += "<td id='daImpact'>" + data[i].daImpact
							+ "</td>";
					insTag += "<td id='daFacilitiesType'>" + data[i].daFacilitiesType
							+ "</td>";
					insTag += "<td id='daFacilitiesPurposeOfUse'>" + data[i].daFacilitiesPurposeOfUse
							+ "</td>";		
					insTag += "<td id='daSystemSW'>" + data[i].daSystemSW
							+ "</td>";
					insTag += "<td id='daReportIF'>" + data[i].daReportIF
							+ "</td>";
					insTag += "<td id='daUse'>" + data[i].daUse
							+ "</td>";
					insTag += "</tr>";
					//console.log(insTag);
				}
				$("#select_ci_list").html(insTag);

				$('.tr_items').each(function(index) {
					$(this).attr('menu-index', index);
				}).click(function() {
					var index = $(this).attr('menu-index');
					//select(index);
					var target = document.getElementsByClassName("tr_items"); 
					var cells = target[index].getElementsByTagName("td");
					alert(cells[0].firstChild.data + "번 설비가 선택되었습니다.");
					//var url = "/ActionRecommend/register?" + encodeURI(cells[0]);
					//console.log(url);
					location.href ="/ActionRecommend/register?daid="+cells[0].firstChild.data;
				});
			},
			error : function(request, status, error) {
				alert("error");

			}
		})
	}
</script>
<%@include file="../includes/footer.jsp"%>