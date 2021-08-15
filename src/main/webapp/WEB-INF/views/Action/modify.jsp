<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
    	<div class="right-container">
		<h1>
			<b>이행계획 리스트 출력</b>
		</h1>
		<hr>
			<form name=form action="modify" method="post">
		<table class="table table-bordered" style="width: 800px; margin: auto">
			<tr>
				<!-- <th style="text-align: center;">이행계획</th>  -->
				<td colspan="7" style="text-align: center"><b>이행계획</b></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">조치구분</td>
				<td colspan="2"><c:out value='${action.AC_type}'/></td>
				<td class="table-light" colspan="2">조치부서</td>
				<td colspan="2"><c:out value='${action.AC_dept}'/></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">조치계획</td>
				<td colspan="2"><c:out value='${action.AC_plan}'/></td>
				<td class="table-light" colspan="2">조치예상일자</td>
				<td colspan="2"><c:out value='${action.AC_expectedDate}'/></td>
			</tr>
			<tr>
				<td colspan="7" style="text-align: center"><b>이행결과</b></td>
			</tr>
			<tr>
			  <td class="table-light" colspan="2" style="height:80px; text-align: center">조치불가사유</td>
			  <td colspan="2"><c:out value='${ai.AI_impossibleReason}'/></td>
			  <td class="table-light" colspan="2" style=" height:80px; text-align: center">대안조치</td>
			  <td colspan="2"><c:out value='${ai.AI_AlterMeasures}'/></td>
			</tr>
			<tr>
			  <td class="table-light" colspan="2" style=" height:80px; text-align: center">이행결과</td>
			  <td colspan="2"><c:out value='${ai.AI_result}'/></td>
			  <td class="table-light" colspan="2" style=" height:80px; text-align: center">이행완료일자</td>
			  <td colspan="2"><c:out value='${ai.AI_finishDate}'/></td>
			</tr>
		</table>
				<div class="table_button_group">
						<button type="submit" class="btn  btn-secondary"
				onclick="modifyBtn('<c:out value="${ai.AI_no}" />')" >수정</button>	
			</div>
		</form>
	</div>

	
			<br><br><br><br><br>
		<br><br><br><br><br>