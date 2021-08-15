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
				<td colspan="8"><input type="text" class="lookfor_input"
					placeholder="검색어를 입력해주세요" title="검색창">
					<button type="button" class="btn btn-success"
						onclick="location.href='#' ">찾기</button>
			</tr>
			<tr>
				<td class="table-light" colspan="4">버전</td>
				<td colspan="8">
					<div class="textbox">
						<input type="text" class="lookfor_input" placeholder="버전을 입력하세요"
							title="검색창">
					</div>
				</td>
			</tr>
			<tr>
				<td class="table-light" colspan="4">점검일자</td>
				<td colspan="8"><input type="date"></td>
			</tr>
			<tr>
				<td class="table-light" colspan="4">발전소</td>
				<td colspan="2">수력</td>
				<td class="table-light" colspan="2">발전소 위치</td>
				<td colspan="4">한강</td>
			</tr>
			<tr>
				<td class="table-light" colspan="4">자산번호</td>
				<td colspan="2">H-01-0001</td>
				<td class="table-light" colspan="4">자산식별 상세 유형</td>
				<td colspan="2">DP-DA</td>
			</tr>
		</table>
		<div class="table_button_group">
			<button type="button" id="btn_toggle" class="btn btn-danger"
				data-toggle="modal" data-target="#staticBackdrop">평가시작</button>
		</div>
	</div>

	<br> <br>


	<div class="down " style="display: none">
		<table class="table table-bordered">
			<tr >
				<th style="text-align: center;" colspan="5">제어봉구동장치 PLC의 보안조치
					적용결과</th>
			</tr>
			<colgroup>
				<col width="10%" />
				<col width="15%" />
				<col width="20%" />
				<col width="10%" />
				<col width="45%" />
			</colgroup>
			<tr >
				<th class="middle">분야번호</th>
				<th class="middle">통제항목 분류</th>
				<th class="middle">상세분류</th>
				<th class="middle">이행여부</th>
				<th>적용내용</th>
			</tr>
			<tr>
				<td class="middle">1</td>
				<td class="middle">기술적</td>
				<td class="middle">접근통제</td>
				<td class="middle"><select name="Y/N">
						<option value="">Y</option>
						<option value="">N</option>
				</select></td>
				<td><textarea placeholder="내용을 입력해주세요"></textarea></td>

			</tr>
			<tr>
				<td class="middle">1</td>
				<td class="middle">기술</td>
				<td class="middle">감사 및 책임</td>
				<td class="middle"><select name="Y/N">
						<option value="">Y</option>
						<option value="">N</option>
				</select></td>
				<td><textarea placeholder="내용을 입력해주세요"></textarea></td>
			</tr>
			<tr>
				<td class="middle">1</td>
				<td class="middle">기술</td>
				<td class="middle">시스템 통신의 보호</td>
				<td class="middle"><select name="Y/N">
						<option value="">Y</option>
						<option value="">N</option>
				</select></td>
				<td><textarea placeholder="내용을 입력해주세요"></textarea></td>

			</tr>
			<tr>
				<td class="middle">2</td>
				<td class="middle">운영적</td>
				<td class="middle">형상관</td>
				<td class="middle"><select name="Y/N">
						<option value="">Y</option>
						<option value="">N</option>
				</select></td>
				<td><textarea placeholder="내용을 입력해주세요"></textarea></td>
			</tr>
		</table>
		<div class="table_button_group">
			<button type="button" class="btn btn-danger"
				onclick="location.href='#' ">수정</button>
			<button type="button" class="btn btn-danger"
				onclick="location.href='#' ">삭제</button>
			<br> <br>
		</div>
	</div>
</div>

	<script>
			$(function() {
				$("#btn_toggle").click(function() {
					$(".down").toggle();
				});
			})
		</script>
<%@include file="../includes/footer.jsp"%>