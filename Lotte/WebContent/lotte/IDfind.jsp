<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기완료 < 아이디찾기 < L.POINT</title>
<script src="js/jquery-3.6.0.min.js"></script>
	<%
		String e = request.getParameter("e");
	%>
<script>
	$(document).ready(function() {
		 $("#hhh").hide();	
		 var OriginData = $("#hhh").val();
		 var findMasking = "*";
		 var ContentsData;
		 var len;
		 
		 var emailsArray = OriginData.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);
		 
        if(emailsArray== null || emailsArray =="")
        {
            ContentsData = OriginData;
        }
        else
        {
            len = emailsArray.toString().split('@').length;
            ContentsData = OriginData.toString().replace(new RegExp('.(?=.{0,' + (len+4) + '}@)', 'g'), '*');
            
            
            document.getElementById("div-tBody").innerHTML=ContentsData;
        
        
        }
		//footer
		$("#first").click(function (){
			$(".one").show();	
			$(".two").hide();
		});
		$("#second").click(function (){
			$(".two").show();		
			$(".one").hide();
		});
		
		$('html').click(function(e) {   
			if(!$(e.target).hasClass("")) {
				$(".one").hide();
				$(".two").hide();
			}
		}); 
		
		$(".Footer").load("Footer.html");
	});
</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap" rel="stylesheet">
<style>

@font-face {
	font-family: "NotoSans-Light";
	src: url(font/NotoSansKR-Light.otf);
}

@font-face {
	font-family: "NotoSans-Bold";
	src: url(font/NotoSansKR-Bold.otf);
}

@font-face {
	font-family: "NotoSans-Medium";
	src: url(font/NotoSansKR-Medium.otf);
}

@font-face {
	font-family: "NotoSans-Regular";
	src: url(font/NotoSansKR-Regular.otf);
}

@font-face {
	font-family: "NotoSans-Black";
	src: url(font/NotoSansKR-Black.otf);
}

@font-face {
	font-family: "NotoSans-Thin";
	src: url(font/NotoSansKR-Thin.otf);
}
@font-face {
	font-family: "NotoSans-Light";
	src: url(font/NotoSansKR-Light.otf);
}

@font-face {
	font-family: "NotoSans-Bold";
	src: url(font/NotoSansKR-Bold.otf);
}

@font-face {
	font-family: "NotoSans-Medium";
	src: url(font/NotoSansKR-Medium.otf);
}

@font-face {
	font-family: "NotoSans-Regular";
	src: url(font/NotoSansKR-Regular.otf);
}

@font-face {
	font-family: "NotoSans-Black";
	src: url(font/NotoSansKR-Black.otf);
}

@font-face {
	font-family: "NotoSans-Thin";
	src: url(font/NotoSansKR-Thin.otf);
}
#KOR{
    font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕','Apple SD Gothic Neo',AppleGothic,Dotum,'돋움',sans-serif;
}

body {
	font-weight: 400;
	font-size: 15px;
	letter-spacing: -0.05em;
	word-break: keep-all;
	text-size-adjust: none;
	-webkit-text-size-adjust: none;
}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	font-style: normal;
	font-weight: inherit;
	border: 0;
	vertical-align: baseline;
}

input, button, select, textarea {
	margin: 0;
	padding: 0;
	font: inherit;
	border: 0;
	appearance: none;
	-moz-appearance: none;
	-webkit-appearance: none;
	border-radius: 0;
	-moz-border-radius: 0;
	-webkit-border-radius: 0;
}

button {
	margin: 0;
	padding: 0;
	border: none;
	background: none;
	cursor: pointer;
}

* {
	box-sizing: border-box;
}

:root { -
	-swiper-navigation-size: 44px;
}

#mast-head {
	height: 80px;
	border-bottom: 1px solid #ebebeb;
}

#mast-head .container {
	position: relative;
}

#mast-head>.container, #mast-foot>.container {
	margin: 0 auto;
	max-width: 1100px;
}

#mast-head .bi {
	font-size: 16px;
	height: 80px;
	line-height: 80px;
	background: url(Img/ico-with.png) no-repeat 90px 53%;
}

#mast-head .bi a {
	float: left;
}

a {
	color: #555;
	text-decoration: none;
}

#mast-head .bi a:first-child img {
	height: 18px;
}

#mast-head .bi a img {
	max-height: 50px;
	width: auto;
}

#mast-head .bi img {
	vertical-align: middle;
}

img {
	border: 0;
	vertical-align: top;
}

#mast-head .bi>a:nth-child(2) {
	margin-left: 38px;
}

#mast-head .bi a {
	float: left;
}

#mast-head .bi:after {
	content: '';
	display: block;
	clear: both;
}

#mast-body .container {
	margin: 0 auto;
	padding: 40px 0 100px 0;
	max-width: 1100px;
}

#mast-body .toparea {
	margin-bottom: 65px;
}

.title {
	margin-bottom: 38px;
	padding: 8px 0;
	font-weight: 100;
	font-size: 28px;
	line-height: 32px;
	color: #000;
	word-break: break-all;
	font-family: "NotoSans-Thin";
}
.headline {
    margin: 0 0 10px;
    font-weight: 100;
    font-size: 42px;
    line-height: 54px;
    color: #000;
    letter-spacing: -0.05em;
    word-break: break-all;
}
.subject.__underline {
    border-bottom: 1px solid #000;
}

.subject {
    font-size: 17px;
    color: #000;
    padding-bottom: 5px;
}
.section > .row {
    padding: 20px 0;
    border-bottom: 1px solid #d0d0d0;
}
.row {
    display: table;
    width: 100%;
    table-layout: fixed;
}
.__high {
    margin: 0 0 80px !important;
}

.__none, .__none:after, .__none:before {
    display: none !important;
}
.normal-table {
    margin: 0 0 -20px;
    width: 100%;
}

table {
    border-collapse: collapse;
    border-spacing: 0;
}
.__hidden, table caption, legend {
    display: inline-block;
    position: absolute;
    clip: rect(0,0,0,0);
    width: 1px !important;
    height: 1px !important;
    margin-left: 1px !important;
    overflow: hidden !important;
    font-size: medium;
    line-height: normal;
    white-space: nowrap;
    opacity: 0 !important;
    filter: alpha(opacity=0);
    -ms-filter: 'progid:DXImageTransform.Microsoft.Alpha(opacity=0)';
    z-index: -10;
}
.normal-table thead th {
    color: #8a8a8a;
    text-align: left;
}

.normal-table th, .normal-table td {
    padding: 10px 0 23px;
}
.normal-table tbody {
    color: #333;
    text-align: left;
}
.normal-table th, .normal-table td {
    padding: 10px 0 23px;
}
.description {
    font-size: 15px;
    line-height: 1.2;
    color: #8a8a8a;
    word-break: break-all;
    padding: 10px 0 0 0;
}
.description > p:first-child {
    margin: 0;
}

.description > p {
    position: relative;
    margin: 10px 0 0;
    padding: 0 0 0 10px;
}
.description > p:before {
    position: absolute;
    left: 0;
    top: 0;
    content: '- ';
}
.__half {
    margin: 0 0 70px !important;
}
.subject.__underline + #section-certify-way .item-wrap {
    padding-top: 40px;
}

#section-certify-way .item-wrap {
    width: 100%;
    overflow: hidden;
    padding: 0 0 10px 0;
    border-bottom: 1px solid #d0d0d0;
}
#section-certify-way .item-wrap > li.el .brand {
    margin-top: 8px;
    color: #333;
	margin-left:10px;
}
.ui-button.__dot > em {
    position: relative;
    display: inline-block;
    width: 50px;
    height: 50px;
    color: #fff;
    vertical-align: top;
}
.ui-button.__dot {
    position: relative;
    line-height: 50px;
    height: 50px;
    color: #333;
    z-index: 1;
}

.ui-button {
    display: inline-block;
    font-weight: inherit;
    font-size: inherit;
    text-align: center;
    vertical-align: top;
    border: none;
    border-radius: 2px;
    background: transparent;
    overflow: hidden;
}
.ui-button.__dot > em:before {
    content: '';
    position: absolute;
    left: 0;
    top: 50%;
    margin: -25px 0 0;
    width: 50px;
    height: 50px;
    text-align: center;
    border-radius: 100%;
    background-color: #0092fa;
    z-index: -1;
}
</style>
</head>
<body id="KOR">
	<div id="mast-head">
		<div class="container">
			<h1 class="bi">
				<a href="https://www.lpoint.com/"
					onclick="return fnWindowOpen(this.href);" target="_blank"> <img
					src="Img/bi-lpoint-new.png" alt="L.POINT"></a> 
				<a href="http://adventure.lotteworld.com"
					onclick="return fnWindowOpen(this.href);" target="_blank" class="">
					<img src="Img/img_1040.png" alt="롯데월드" id="ccoLogo">
				</a>
			</h1>
		</div>
	</div>
	<div id="mast-body">
	<div class="container">
		<!-- toparea -->
		<div class="toparea">
			<h2 class="title">
				아이디 찾기
			</h2>
			<!-- 아이디 찾기 -->
			<div class="headline">
				<!-- 입력하신 정보와<br>일치하는 아이디 정보입니다. -->
				입력하신 정보와<br>일치하는 아이디 정보입니다.
			</div>
		</div>
		<!-- //toparea -->

		<!-- contents -->
		<div class="contents">
			<!-- section : 결과(공통) -->
			<div class="section __high">
				<h3 class="subject __underline">
					<!-- <em>아이디 찾기 결과</em> -->
					<em class="idResultTitle">아이디 찾기 결과</em> 
				</h3>
				<div class="row" id="div-idCstNm1">
					<table class="normal-table">
						<caption>
							아이디
						</caption>
						<colgroup>
							<col>
						</colgroup>
						<thead>
							<tr>
								<th scope="col">L.POINT ID</th>
								<!-- L.POINT ID -->
							</tr>
						</thead>
						<tbody id="div-tBodyId">
							<tr>
								<td id ="div-tBody"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="row __none" id="div-idCstNm2">
					<table class="normal-table">
						<caption>
							아이디
						</caption>
						<colgroup>
							<col>
						</colgroup>
						<thead>
						</thead>
						<tbody id="div-tBodyCstNm">
						</tbody>
					</table>
				</div>				
				<div class="description" id="div-desc1">
					<!-- <p>개인정보보호를 위해 아이디 뒷자리는 ***로 표시됩니다.</p> -->
					<p>
						개인정보보호를 위해 아이디 뒷자리는 ***로 표시됩니다.
					</p>
				</div>
				<div class="description __none" id="div-desc2">
					<!-- <p>아이디를 등록해주세요.</p> -->
					<p>
						아이디를 등록해주세요.
					</p>
				</div>				
			</div>

			<!-- btn -->
			<div class="btn-area" id="div-lgnBtn1">
				<a href = "LotteController?command=SimpleLogin"><button class="ui-button __dot" ><em>확인</em><!-- <em>확인</em> --></button></a>
			</div>
		</div>
		<!-- //contents -->
	</div>
</div>
	<!-- footer -->
	<style>
#mast-foot {
	padding: 30px 0;
	border-top: 1px solid #d0d0d0;
}

#mast-foot>.container {
	position: relative;
}

#mast-head>.container, #mast-foot>.container {
	margin: 0 auto;
	max-width: 1100px;
}

#mast-foot .utility .item {
	display: inline-block;
}

#mast-foot .utility .item>a {
	font-size: 13.905px;
	color: #8a8a8a;
}

a {
	color: #555;
	text-decoration: none;
}

#mast-foot .utility .item:before {
	content: '·';
	display: inline;
	margin: 0 5px;
	color: #b8b8b8;
}

#mast-foot .utility .item:first-child:before {
	display: none;
}

#mast-foot .utility .item>a {
	font-size: 13.905px;
	color: #8a8a8a;
}

.__point-color {
	color: #0092fa;
}

#mast-foot .com-address {
	margin: 10px 0 0 0;
	font-size: 13.905px;
	color: #8a8a8a;
}

#mast-foot .com-address span {
	white-space: nowrap;
}

#mast-foot .com-address span:not(:last-child):after {
	content: '|';
	display: inline;
	margin: 0 5px;
	color: #b7b7b7;
}

#mast-foot .copyright {
	margin: 10px 0 10px;
	font-size: 13.905px;
	color: #000;
}

#mast-foot .friendly {
	position: absolute;
	right: 0;
	top: 0;
}

#mast-foot .site-linker {
	position: relative;
	display: inline-block;
	margin: 0 2px;
	width: 150px;
	font-size: 12.855px;
	background-color: #fff;
}

#mast-foot .site-linker>button {
	width: 100%;
	height: 34px;
	color: #333;
	text-indent: -26px;
	border: 1px solid #b7b7b7;
}

#mast-foot .site-linker>button:before {
	content: '';
	position: absolute;
	top: 50%;
	right: 10px;
	margin: -2px 0 0;
	width: 0;
	height: 0;
	vertical-align: middle;
	border: 1px solid transparent;
	border-top-color: #333;
	border-width: 4px 4px 0;
}

#mast-foot .site-linker>ul {
	display: none;
	position: absolute;
	left: 0;
	right: 0;
	bottom: 33px;
	padding: 10px 0;
	max-height: 200px;
	border: 1px solid #b7b7b7;
	background-color: #fff;
	overflow: hidden;
	overflow-y: auto;
	overflow-scrolling: touch;
	-webkit-overflow-scrolling: touch;
}

ul, ol, dl, li {
	list-style: none;
}

#mast-foot .site-linker>ul li>a {
	display: block;
	padding: 2px 10px;
	font-size: inherit;
	color: #8a8a8a;
}

#mast-foot .site-linker {
	position: relative;
	display: inline-block;
	margin: 0 2px;
	width: 150px;
	font-size: 12.855px;
	background-color: #fff;
}

#mast-foot .site-linker>button {
	width: 100%;
	height: 34px;
	color: #333;
	text-indent: -26px;
	border: 1px solid #b7b7b7;
}
</style>
	<input type ="text" id ="hhh" value="<%=e%> "/>		
	<div class= "Footer"></div>
</body>
</html>