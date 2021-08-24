<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp"%>
<div class="text_body">
	<div class="top_img">
		<img alt="" src="/resources/img/backgroud_image.png" width="100%">
	</div>
	<div class="content_div">
		<div class="comment">
			<p id="welcome_title">
				<b>환영합니다!</b>
			</p>
			<br>
			<h7>DA 관리 프로그램은 디지털자산 정보 및 단계적 평가(손실 영향 평가)를 통해 자산을 분류하고, <BR>
			이에 맞는 점검 항목으로 평가하는 프로그램입니다.</h7>
			<br> <br> <br> <br> <br>
			<h4 class="message2">
				<b>단계적 보안성 평가는 다음 순으로 진행됩니다.</b>
			</h4>
			<BR> <BR> <BR> <br> <img alt=""
				src="/resources/img/home_content_img.png" width="55%"> <BR>
			<BR> <BR>
			<h7>필수디지털자산이 가지고 있는 SSEP 기능과 설비 내에서의 역할, <BR>
			사고가 발생했을 때 제어시스템 내부에 미치는 침해영향도를 종합한 평가 기준을 바탕으로 <BR>
			자산을 EP DA, BOP DA, Indirect DA로 분류합니다. <BR>
			<BR>
			이렇게 식별한 DA에 차등화된 보안조치를 적용하여 이전보다 효율적으로 자산을 보호할 수 있으며<BR>
			비용이 절감되는 효과로 사업자의 부담을 낮추고 있습니다. </h7>
			<BR> <BR> <br> <br> <BR> <BR> <BR>
			<h4 class="message2">
				<b>DA 관리 프로그램에서는 다음과 같은 기능을 제공하고 있습니다.</b>
			</h4>

		</div>

		<div class="main_div">
			<c:if test="${empty login_id}">
				<div class="card_div">
					<a onclick="pass_login_page()"><div class="card"
							style="width: 18rem;">
							<img src="/resources/img/home1.png" class="card-img-top"
								alt="/resources." style="height: 190px;">
							<div class="card-body">
								<h4>
									<b>DA 정보 관리</b>
								</h4>
								<p class="card-text">회사의 디지털 자산을 등록하고 관리할 수 있습니다.</p>
							</div>
						</div></a> <a onclick="pass_login_page()"><div class="card"
							style="width: 18rem;">
							<img src="/resources/img/home2.png" class="card-img-top"
								alt="/resources." style="height: 190px;">
							<div class="card-body">
								<h4>
									<b>단계적 보안성 평가</b>
								</h4>
								<p class="card-text">등록된 디지털 자산에 대해 단계적 보안성 평가를 진행합니다.</p>
							</div>
						</div></a> <a onclick="pass_login_page()"><div class="card"
							style="width: 18rem;">
							<img src="/resources/img/home3.png" class="card-img-top"
								alt="/resources." style="height: 190px;">
							<div class="card-body">
								<h4>
									<b>통제항목 관리</b>
								</h4>
								<p class="card-text">회사 내에서 공통적으로 사용하는 코드를 관리합니다.</p>
							</div>
						</div></a> <a onclick="pass_login_page()"><div class="card"
							style="width: 18rem;">
							<img src="/resources/img/home4.jpg" class="card-img-top"
								alt="/resources." style="height: 190px;">
							<div class="card-body">
								<h4>
									<b>신규취약점 관리</b>
								</h4>
								<p class="card-text">획득한 신규 취약점 정보를 등록하고 조치를 취할 수 있습니다.</p>
							</div>
						</div></a> <a onclick="pass_login_page()"><div class="card"
							style="width: 18rem;">
							<img src="/resources/img/home5.png" class="card-img-top"
								alt="/resources." style="height: 190px;">
							<div class="card-body">
								<h4>
									<b>취약점 조치 권고</b>
								</h4>
								<p class="card-text">취약점에 영향을 받는 설비에 대해 조치 권고를 발행할 수 있습니다.</p>
							</div>
						</div></a> <a onclick="pass_login_page()">
						<div class="card" style="width: 18rem;">
							<img src="/resources/img/home6.png" class="card-img-top"
								alt="/resources." style="height: 190px;">
							<div class="card-body">
								<h4>
									<b>이행 계획 및 결과</b>
								</h4>
								<p class="card-text">발행된 조치 권고에 대한 이행 계획 및 결과를 관리할 수 있습니다.</p>
							</div>
						</div>
					</a>
				</div>
			</c:if>
			<c:if test="${not empty login_id}">
				<div class="card_div">
					<a href="/DA/DA_list"><div class="card" style="width: 18rem;">
							<img src="/resources/img/home1.png" class="card-img-top"
								alt="/resources." style="height: 190px;">
							<div class="card-body">
								<h4>
									<b>DA 정보 관리</b>
								</h4>
								<p class="card-text">회사의 디지털 자산을 등록하고 관리할 수 있습니다.</p>
							</div>
						</div></a> <a href="/SecurityAssessment/list"><div class="card"
							style="width: 18rem;">
							<img src="/resources/img/home2.png" class="card-img-top"
								alt="/resources." style="height: 190px;">
							<div class="card-body">
								<h4>
									<b>단계적 보안성 평가</b>
								</h4>
								<p class="card-text">등록된 디지털 자산에 대해 단계적 보안성 평가를 진행합니다.</p>
							</div>
						</div></a> <a href="/ControlledItems/CI_manage_list"><div class="card"
							style="width: 18rem;">
							<img src="/resources/img/home3.png" class="card-img-top"
								alt="/resources." style="height: 190px;">
							<div class="card-body">
								<h4>
									<b>통제항목 관리</b>
								</h4>
								<p class="card-text">회사 내에서 공통적으로 사용하는 코드를 관리합니다.</p>
							</div>
						</div></a> <a href="/vulnerability/vul_list"><div class="card"
							style="width: 18rem;">
							<img src="/resources/img/home4.jpg" class="card-img-top"
								alt="/resources." style="height: 190px;">
							<div class="card-body">
								<h4>
									<b>신규취약점 관리</b>
								</h4>
								<p class="card-text">획득한 신규 취약점 정보를 등록하고 조치를 취할 수 있습니다.</p>
							</div>
						</div></a> <a href="/ActionRecommend/list"><div class="card"
							style="width: 18rem;">
							<img src="/resources/img/home5.png" class="card-img-top"
								alt="/resources." style="height: 190px;">
							<div class="card-body">
								<h4>
									<b>취약점 조치 권고</b>
								</h4>
								<p class="card-text">취약점에 영향을 받는 설비에 대해 조치 권고를 발행할 수 있습니다.</p>
							</div>
						</div></a> <a href="/Action/list">
						<div class="card" style="width: 18rem;">
							<img src="/resources/img/home6.png" class="card-img-top"
								alt="/resources." style="height: 190px;">
							<div class="card-body">
								<h4>
									<b>이행 계획 및 결과</b>
								</h4>
								<p class="card-text">발행된 조치 권고에 대한 이행 계획 및 결과를 관리할 수 있습니다.</p>
							</div>
						</div>
					</a>
				</div>
			</c:if>
		</div>

	</div>

</div>

<script type="text/javascript">
	function pass_login_page() {
		alert("먼저 로그인을 한 뒤 서비스를 이용하실 수 있습니다.");
		self.location = "/user/login";
	}
</script>
<%@include file="includes/footer.jsp"%>