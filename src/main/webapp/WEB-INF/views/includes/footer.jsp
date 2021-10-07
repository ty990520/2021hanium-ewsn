<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="footer">
	<p>Copyright © DA Management Program All Rights Reserved.</p>
	<br> <span>Mento | 김인수 멘토님</span> 
	<span>Development team | 박태영 • 김혜진 • 박민지</span> <span>Algorithm
		team | 김은지 • 이지은</span>
	<span style="font-size: medium;">Develop by team EWSN</span>

</div>
</body>
<style>
.content_div {
	width: 100%;
	height: 1600px;
}

.comment {
	padding: 80px 0 70px 0;
	text-align: center;
}

#welcome_title {
	font-size: -webkit-xxx-large;
}

.message2 {
	color: #464646;
}

.main_div {
	display: flex;
	justify-content: space-around;
}

.card_div {
	width: 70%;
	flex-wrap: wrap;
	flex-direction: row;
	justify-content: space-around;
	display: flex;
	flex-direction: row;
	color: black;
}

.card_div>a {
	color: black;
}

.card {
	margin: 30px;
}

.card:hover {
	box-shadow: 1px 1px 20px #ddd;
	display: flex;
	align-items: center;
	-webkit-transition: all 0.4s ease;
	transition: all 0.4s ease;
}

.footer {
	width: 100%;
	height: 150px;
	font-size: small;
	background-color: gray;
	color: white;
	text-align: center;
	display: flex;
	flex-direction: column-reverse;
}
</style>
</html>