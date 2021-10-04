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

tbody#ci_apply {
	text-align: center;
}

td {
	vertical-align: middle !important;
}
</style>

<div class="right-container" style="width: 70%">
	<form method="post" action="register" id="form"
		onsubmit="return false;">
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
					<td colspan="8"><input type="text" id="input_sear"
						width="30px" name="CI_daID" class="lookfor_input"
						placeholder="자산번호를 입력해주세요" title="검색창">
						<button type="button" id="a" class="btn btn-success"
							onclick="location.href='#' ">찾기</button>
				</tr>
				<tr>
					<td class="table-light" colspan="4">자산명</td>
					<td colspan="8">
						<div class="textbox">
							<input type="text" class="lookfor_input" id="daname"
								name="CI_daname" readonly>
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
					onclick="modal_search()" disabled>평가시작</button>
			</div>
		</div>

		<br> <br>

		<div class="down " style="display: none">
			<table class="table table-bordered">
				<tr>
					<th style="text-align: center;" colspan="5">보안조치 적용</th>
				</tr>
				<tr>
					<th style="text-align: center;">버전명</th>
					<td colspan="4"><input type="text" name="CI_apply_version"
						placeholder="버전명 입력" style="width: -webkit-fill-available;"></td>
				</tr>
				<colgroup>
					<col width="12%" />
					<col width="12%" />
					<col width="15%" />
					<col width="10%" />
					<col width="60%" />
				</colgroup>
				<tr>
					<th class="middle">통제항목번호</th>
					<th class="middle">통제항목 분류</th>
					<th class="middle">상세분류</th>
					<th class="middle">이행여부</th>
					<th>적용내용</th>
				</tr>
				<tbody id="ci_apply">
				</tbody>

			</table>
			<div class="table_button_group">
				<button type="button" class="btn btn-danger" id="apply">완료</button>
				<br> <br>
			</div>
		</div>
	</form>
</div>

<script>
	
	var datype;
	var ciarr = [];
	var ciid = [];
	var ciid_val = [];
	var selectid = [];
	var contentid = [];
	var selectid_val = [];
	var contentid_val = [];
	var len = 0;

	
	$(function() {
		$("#btn_toggle").click(function() {
			$(".down").toggle();
		});
	})

	$(function() {
		$("#a").on("click", function() {
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
					$("#btn_toggle").attr("disabled", false);
				},
				error : function(request, status, error) {
					$("#daname").val('')
					$("#daptype").val('')
					$("#daPDetailType").val('')
					$("#daIdentifyType").val('')
					alert("입력한 자산번호가 존재하지 않습니다.");
					$("#btn_toggle").attr("disabled", true);
					$(".down ").hide();
				}

			});
		});
	})

	function modal_search() {
		console.log(datype);
		$
				.ajax({
					contentType : "application/json; charset=utf-8;",
					dataType : "json",
					type : "GET",
					url : "/ControlledItems/search_ci_list",
					data : {
						"type" : datype

					},
					success : function(response) {
						$("#ci_apply").empty();
						var insTag = "";
						len = response.length;

						// 추가할 태그
						for (var i = 0; i < response.length; i++) {
							insTag += "<tr title='"+response[i].ci_content+"'>";
							insTag += "<td >"
									+ "<input type='hidden' name='CI_applyDetail_id' id='ci"+i+ "' value='"+response[i].ci_detail_id+"'>"
									+ response[i].ci_detail_id + "</td>";
							insTag += "<td>" + response[i].ci_type + "</td>";
							insTag += "<td>" + response[i].ci_detailType
									+ "</td>";
							insTag += "<td><select name='CI_applyCheck' id='select"+i+ "'><option value='Y'>Y</option><option value='N'>N</option></select></td>";
							insTag += "<td><textarea id='content"+i+ "' placeholder='해당 통제항목에 대한 보안 조치 내용을 작성해주세요.'></textarea></td>";
							insTag += "</tr>";
							ciid[i] = "ci" + i;
							selectid[i] = "select" + i;
							contentid[i] = "content" + i;
							//$("input[name=checkitems]").eq(i).attr("value","Y");

						}
						$("#ci_apply").html(insTag);
						console.log(ciarr);
					}
				});
	}

	$('#apply').on('click', function() {
		for (var i = 0; i < len; i++) {
			/*document.getElementById(ciid[i]).value = $("#" + ciid[i]).text();
			document.getElementsByName("CI_applyDetail_id")[i].value = $("#" + ciid[i]).text();
			//$("#" + ciid[i]).val($("#" + ciid[i]).text()); */

			//$("#" + ciid[i]).val($("#" + ciid[i]).text()); 
			//selectid_val[i] = $("#" + selectid[i] + " option:selected").val();
			//$("#" + selectid[i] + " option:selected").attr('name', "CI_applyCheck");
			contentid_val[i] = $("#" + contentid[i]).val();
			$("#" + contentid[i]).attr('name', "CI_applyContent");

		}

		if (confirm("해당 디지털자산의 관리 통제항목에 대한 내용을 등록하시겠습니까?") == true) {
			alert("등록이 완료되었습니다.");
			document.getElementById('form').submit();
			return true;
		} else
			return false;
	});
</script>
<%@include file="../includes/footer.jsp"%>