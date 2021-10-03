<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<head>
<link rel="stylesheet" type="text/css" href="../../../resources/css/list.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/css/register.css" />
<title>Insert title here</title>
<style>
a {
	text-decoration: none;
	color: black;
}

td.table-light {
width: 80px;
vertical-align: middle;
text-align: center;
}
</style>
</head>
<div class="right-container">
		<h1>
			<b>조치권고 등록 </b>
		</h1>
		<hr>
		<form name=form onsubmit="return checkAll()" id="register"
		action="register" method="post">
		<table class="table table-bordered">
			<tr>
			</tr>
			<tr>
				<td class="table-light" colspan="2">발행부서</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="AR_regDept" placeholder="발행부서"></td>
				<td class="table-light" colspan="2">발행자</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="RegistrarID" placeholder="발행자"></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">자산명</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="AR_daName" value="${da.daname}" readonly></td>
				<td class="table-light" colspan="2">자산번호</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="AR_daID" value="${da.daid}" readonly></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">시스템sw유형</td>
				<td colspan="2"><input type="text"
					class="vulner_register_input" name="AR_daSystemSW" value="${da.daSystemSW}" readonly></td>
					
				<td class="table-light" colspan="2">조치유형</td>
				<td colspan="2">
				<select name="AR_ActionType" onChange="chnQnaType()" id="select1" >
				 <option value="기술적">기술적</option>
				 <option value="운영적">운영적</option>
				</select>
		      	<select  id="schQnaType" name="AR_ActionType">
					</select>
				<!--  input type="text"
					class="vulner_register_input" name="AR_ActionType" placeholder="조치유형검색"></td-->
			</tr>
			<tr>
				<td class="table-light" colspan="2">제목</td>
				<td colspan="6"><input type="text" class="input_width100"
					name="AR_title" placeholder="취약점 내용 입력"></td>
			</tr>
			<tr>
				<td class="table-light" colspan="2">권고사항(조치사항)</td>
				<td colspan="6"><input type="text" class="input_width100"
					name="AR_issue" placeholder="조치 내용 입력"></td>
			</tr>
		</table>

		
		<div class="table_button_group">
			<button type="submit" class="btn btn-danger">등록</button>
			<br><br><br><br><br><br><br><br>
		</div>
		</form>
	</div>
	<script>
	/* select 선택 시 변환 처리  */
	function chnQnaType() {
		var type = document.getElementById("select1");

		type = type.options[type.selectedIndex].value;
		console.log(type);

		$('#schQnaType').empty();

		if (type == '기술적') { // 기술적 
			console.log('기술적');
			$('#schQnaType').append("<option value='1.1' >계정관리</option>'");
			$('#schQnaType').append("<option value='1.2' >접근통제 이행</option>'");
			$('#schQnaType').append("<option value='1.3' >데이터 이동 통제</option>'");
			$('#schQnaType').append("<option value='1.4' >기능의 분리</option>'");
			$('#schQnaType').append("<option value='1.5' >최소 권한</option>'");
			$('#schQnaType').append("<option value='1.6' >접속실패 기록</option>'");
			$('#schQnaType').append("<option value='1.7' >시스템 사용 공지</option>'");
			$('#schQnaType')
					.append("<option value='1.8' >이전 접속기록 공지</option>'");
			$('#schQnaType').append("<option value='1.9' >세션 잠금</option>'");
			$('#schQnaType').append(
					"<option value='1.10' >접근통제 감독 및 검토</option>'");
			$('#schQnaType').append(
					"<option value='1.11' >식별이나 인증 없이 허가된 활동</option>'");
			$('#schQnaType')
					.append("<option value='1.12' >네트워크 접근통제</option>'");
			$('#schQnaType').append(
					"<option value='1.13' >안전하지 않은 프로토콜의 제한</option>'");
			$('#schQnaType').append("<option value='1.14' >무선연결 금지</option>'");
			$('#schQnaType').append(
					"<option value='1.15' >안전하지 않은 연결</option>'");
			$('#schQnaType').append(
					"<option value='1.16' >휴대용 매체 및 모바일 기기 접근 통제</option>'");
			$('#schQnaType').append(
					"<option value='1.17' >특정 프로토콜 가시성</option>'");
			$('#schQnaType')
					.append("<option value='1.18' >제3자 제품 사용</option>'");
			$('#schQnaType')
					.append("<option value='1.19' >외부시스템의 사용</option>'");
			$('#schQnaType').append(
					"<option value='1.20' >사용자 식별 및 인증</option>'");
			$('#schQnaType').append("<option value='1.21' >패스워드 요건</option>'");
			$('#schQnaType')
					.append(
							"<option value='1.22' >인증 불가한 HMI(Human-Manchine Interface) 보안</option>'");
			$('#schQnaType').append(
					"<option value='1.23' >기기 식별 및 인증</option>'");
			$('#schQnaType').append("<option value='1.24' >식별자 관리</option>'");
			$('#schQnaType').append("<option value='1.25' >인증자 관리</option>'");
			$('#schQnaType').append(
					"<option value='1.26' >암호화 모듈 인증에 따라 암호화를 수행</option>'");
			$('#schQnaType').append(
					"<option value='1.27' >불필요한 서비스 및 프로그램 제거</option>'");
			$('#schQnaType')
					.append(
							"<option value='1.28' >호스트기반 침임탐지시스템(HIDS, Host Intrusion Detection System)</option>'");
			$('#schQnaType').append(
					"<option value='1.29' >파일시스템 및 운영체제 변경 승인</option>'");
			$('#schQnaType').append("<option value='1.30' >하드웨어 구성</option>'");
			$('#schQnaType')
					.append(
							"<option value='1.31' >운영체제, 응용프로그램 및 제3자 소프트웨어 설치 및 업데이트</option>'");

		} else if (type == '운영적') { // 운영적 
			console.log('운영적');
			$('#schQnaType').append("<option value='2.1'>결함 제거</option>'");
			$('#schQnaType').append("<option value='2.2'>악성코드 유입 방지</option>'");
			$('#schQnaType').append(
					"<option value='2.3'>모니터링 도구 및 기술</option>'");
			$('#schQnaType').append("<option value='2.4'>보안 경고</option>'");
			$('#schQnaType').append("<option value='2.5'>보안기능 확인</option>'");
			$('#schQnaType').append(
					"<option value='2.6'>소프트웨어 및 정보의 무결성</option>'");
			$('#schQnaType').append("<option value='2.7'>정보의 입력 제한</option>'");
			$('#schQnaType').append("<option value='2.8'>에러에 대한 조치</option>'");
			$('#schQnaType').append(
					"<option value='2.9'>인식제고 및 훈련 범위</option>'");
			$('#schQnaType').append(
					"<option value='2.10'>인식제고 및 훈련 범위</option>'");
			$('#schQnaType').append("<option value='2.11'>기술적 훈련 </option>'");
			$('#schQnaType').append(
					"<option value='2.12'>특화된 사이버보안 훈련</option>'");
			$('#schQnaType').append("<option value='2.13'>교육훈련 피드백</option>'");
			$('#schQnaType').append("<option value='2.14'>유관기관과의 협력</option>'");
		}
	}

	
	</script>
<%@include file="../includes/footer.jsp"%>
