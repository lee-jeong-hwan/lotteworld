<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mail.MailTest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 비밀번호 입력 < 비밀번호찾기 < L.POINT</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap" rel="stylesheet">
<script src = "js/jquery-3.6.0.min.js"></script>
 <script>
 <%
 	String e = request.getParameter("e");
 %>
 $(document).ready(function() {
	 $("#email").hide();
	 var email = $("#email").val();
 	$(".tooltip-trigger").click(function(){
	 		$(".tooltip-content").toggle();
	 		
 	});
 	
	$('html').click(function(e) {   
		if(!$(e.target).hasClass("")) {
			$(".one").hide();
			$(".two").hide();
		}
	}); 
 
 	$("#first").click(function (){
		$(".one").show();	
		$(".two").hide();
	});
	$("#second").click(function (){
		$(".two").show();		
		$(".one").hide();
	});
	
	$(".ui-input").change(function() {
		if($(this).find("input").val() == ''){
			$(this).removeClass("active");
		} else {
			$(this).addClass("active");
		}
	});
	
	$('.row').hover(function(){  
     	$(this).find(".col-md >label").css('color','black');    
	},function() {    
		$(this).find(".col-md >label").css('color','#8a8a8a');  
	});
	
	$("#nextBtn").click(function(){
		var i = 0;
			i++
			switch(i){
			case 1 :
				if ($("input[id=user-pwd]").val()=='') {
					alert("비밀번호를 입력해주세요.");
					break;
				}
			case 2:
				var PW =$("input[id=user-pwd]").val();
				var PWchk =$("input[id=user-pwd-check]").val();
				
				if(PW==PWchk){
				
					var sameChar = 0;
					var continuePass01 = 0;
					var continuePass02 = 0;
					
					var passChar0;
					var passChar1;
					var passChar2;
					
					 var pw = $("#user-pwd").val();
					 var num = pw.search(/[0-9]/g);
					 var eng = pw.search(/[a-z]/ig);
					 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
					
					 for(var i=0;i <pw.length;i++){
						
						passChar0 = pw.charAt(i);
						passChar1 = pw.charAt(i+1);
						passChar2 = pw.charAt(i+2);
						
						if(pw.length < 8 || pw.length > 15){
							  alert("비밀번호는8자이상 15자 이하로 입력해주세요.");
							  return false;
							 }else if(num < 0 || eng < 0 || spe < 0 ){
							  alert("비밀번호는 영문자,숫자,특수문자 3가지가 포함되어야합니다.")
							  return false;
							 }
							 
						if(passChar0 == passChar1){
							sameChar=sameChar+1;
						}
						
						if(sameChar > 2){
							alert("동일문자를 3번이상 사용할 수 없습니다.");
							return false;
						}
						
						if(passChar0.charCodeAt(0)-passChar1.charCodeAt(0)==1 && passChar1.charCodeAt(0)-passChar2.charCodeAt(0)==1) {
							continuePass01=continuePass01+1;
						}
						
						if(passChar0.charCodeAt(0)-passChar1.charCodeAt(0)==-1 && passChar1.charCodeAt(0)-passChar2.charCodeAt(0)==-1) {
							continuePass02=continuePass02+1;
						}
						
						if(continuePass01>1||continuePass02>1){
							alert("연속된 문자를 3자 이상 사용할 수 없습니다.");
							return false;
						}
					}
				}else{
					alert("비밀번호가 서로 일치하지 않습니다.");
					break;
				}
			case 3 :
				var PW =$("#user-pwd").val();
				email = $("#email").val();
				$.ajax({
					type: "get",
					url: "ChangePW",
					data: {"PW":PW , "email":email},
					datatype: "json",
					success : function(data){//얘가 서블렛에서 보내주는 값
						if(data.result== 1){
							location.href= "LotteController?command=NewPw2";
						}
					},
					error : function(r,s,e){
						alert("에러");
					}
				});
				break;
			}//switch
	});//function
	
 });//document
</script>
<style>
#KOR{
   font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕','Apple SD Gothic Neo',AppleGothic,Dotum,'돋움',sans-serif;
}
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
    margin: 0;
    padding: 0;
    font-style: normal;
    font-weight: inherit;
    border: 0;
    vertical-align: baseline;
}
* {
    box-sizing: border-box;
}
*:before, *:after {
    box-sizing: border-box;
}
body {
    font-weight: 400;
    font-size: 15px;
    letter-spacing: -0.05em;
    word-break: keep-all;
}
body {
    text-size-adjust: none;
    -webkit-text-size-adjust: none;
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
}
.step.__2:before {
    background: url(Img/img-step.png) no-repeat 0 0;
    width: 50px;
    height: 26px;
    background-position: 0 -7px;
    background-size: 50px;
}

.step:before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    width: 100px;
    height: 7px;
}
.step {
	position: relative;
	padding: 10px 0 0;
	color: #8a8a8a;
}
.step-desc {
    font-weight: 100;
    padding: 30px 0 0;
    font-size: 42px;
    line-height: 1.22;
    color: #000;
}

.__half {
	margin: 0 0 70px !important;
}
.subject.__underline {
    border-bottom: 1px solid #000;
}

.subject {
    font-size: 17px;
    color: #000;
    padding-bottom: 5px;
}
.subject > em, .subject > span.description {
    display: inline-block;
}
.subject > em .__require-info {
    display: inline-block;
    margin-left: 6px;
}

.__point-color {
    color: #0092fa;
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
.section > .row > .col-md:first-child {
    width: 160px;
    color: #8a8a8a;
}

.section > .row > .col-md, .section > .row .col-md .row > .col-md {
    color: #8a8a8a;
}
.row .col-md, .row .col-md-1, .row .col-md-2, .row .col-md-3, .row .col-md-4, .row .col-md-5, .row .col-md-6, .row .col-md-7, .row .col-md-8, .row .col-md-9, .row .col-md-10, .row .col-md-11, .row .col-md-12 {
    display: table-cell;
    vertical-align: top;
}
.section > .row > .col-md > label {
    line-height: 34px;
}

.section .row > .col-md:first-child > label em.__point-color {
    position: relative;
    top: 3px;
    margin-right: 3px;
}
.form-wrap.__normal .ui-input {
    margin: 0 6px 0 0;
    max-width: 462px;
    width: 100%;
}

.ui-input {
    position: relative;
    display: inline-block;
    vertical-align: top;
    background-color: #f0f0f0;
}
.ui-input.active > input {
    opacity: 1;
    background: none;
}
.ui-input > input {
    position: relative;
    padding: 0 10px;
    width: 100%;
    height: 34px;
    font-size: 14px;
    line-height: 34px;
    border: 0;
    background-color: #fff;
    opacity: 0;
    z-index: 1;
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
.ui-input > input:focus + .placeholder, .ui-input > input.__focus + .placeholder, .ui-input.active > .placeholder {
    display: none;
}
.ui-input > input:focus, .ui-input > input.__focus, .ui-select:focus, .ui-select.__focus, .ui-radio > input:focus + label, .ui-check > input:focus + label{
	outline: 1px solid #0092fa;
	background-color : #fff;
	opacity: 1;
}
.form-wrap > .inner {
    margin: 10px 0 0;
}
.ui-input > .placeholder {
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    padding: 0 10px;
    font-size: 13.125px;
    line-height: 34px;
    color: #8a8a8a;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}
.__normal.__x1 {
    white-space: nowrap;
}
.form-wrap.__x1 .ui-input {
    width: 382px;
}
.ui-button.__black {
    color: #fff;
    background-color: #333;
}

.ui-button.__square-small {
    padding: 0 2px;
    min-width: 70px;
    height: 34px;
    font-size: 13px;
    line-height: 34px;
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
.tooltip-container {
    position: relative;
    display: inline-block;
}
.ui-input > #timer {
    position: absolute;
    right: 3px;
    top: 50%;
    height: 28px;
    margin-top: -14px;
    padding: 0 10px;
    font-size: 13px;
    line-height: 28px;
    color: #0092fa;
    z-index: 5;
}
.tooltip-trigger {
    position: relative;
    top: 6px;
    z-index: 0;
    display: inline-block;
    height: 25px;
    width: 14px;
    margin: -2px 0 0 2px;
    text-indent: -1000px;
    vertical-align: middle;
    background: url(Img/ico-inform.png) no-repeat 0 0;
    overflow: hidden;
    cursor : pointer;
}

.tooltip-content {
    display: none;
    position: absolute;
    left: -42px;
    top: 30px;
    padding: 30px;
    width: 360px;
    line-height: 1.5;
    color: #fff;
    background-color: #0092fa;
    z-index: 100;
}
.tooltip-content b {
    color: #ffec00;
}
.form-wrap > .inner:first-child {
    margin: 0;
}
.form-wrap.__mobile .ui-select, .form-wrap.__mobile .ui-input {
    width: 108px;
}
.ui-select {
    position: relative;
    padding: 0 5px;
    height: 34px;
    line-height: 32px;
    font-size: 13.905px;
    color: #000;
    border: 1px solid #f0f0f0;
    border-radius: 0;
    background-color: #f0f0f0;
}
select {
    background: url(Img/ui-select.png) no-repeat 100% center;
    background-size: 30px 30px;
}
.form-wrap.__mobile .ui-select, .form-wrap.__mobile .ui-input {
    width: 108px;
}

.ui-select + .ui-select {
    margin: 0 0 0 7px;
}
.form-wrap.__mobile .ui-input input {
    text-align: center;
}
.form-wrap.__mobile .ui-input + .ui-input:before {
    content: '-';
    position: absolute;
    left: -10px;
    width: 10px;
    line-height: 32px;
    color: #8a8a8a;
    text-align: center;
}
.form-wrap.__mobile .ui-input {
    margin-left: 7px;
}
.form-wrap.__date .ui-select:first-child {
    margin: 0;
}

.form-wrap.__date .ui-select {
    margin: 0 0 0 7px;
    width: 108px;
}
.subject > em, .subject > span.description {
    display: inline-block;
}
.section > .subject + .__toggle {
    display: block;
    margin: 29px 0 0;
    padding: 0 0 23px;
    border-bottom: 1px solid #d0d0d0;
}
input[type="checkbox"] {
    visibility: hidden;
}
.ui-check > label {
    display: inline-block;
    padding: 0 0 0 25px;
    min-height: 18px;
    line-height: 18px;
    vertical-align: top;
    cursor: pointer;
}
.ui-check > label:before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    width: 18px;
    height: 18px;
    background: #fff url(Img/ui-input.png) no-repeat 0 0;
    background-size: 90px 18px;
    overflow: hidden;
}
.section.__expiry .row {
    padding: 0;
}
.section > .subject + .__toggle + .row > .col-md {
    width: auto;
}
.form-wrap.__agreement .row:first-child {
    border: none;
}

.section.__expiry .__agreement .row {
    padding: 27px 0 25px;
}
.section > .subject + .__toggle + .row .row > .col-md:first-child {
    width: 160px;
}
.form-wrap.__agreement .row > .col-md:first-child {
    width: 160px;
    color: #8a8a8a;
}
.ui-check {
    position: relative;
    display: inline-block;
    margin: 0 20px 0 0;
}
.ui-check > input {
    position: absolute;
    left: 1px;
    top: 1px;
    width: 14px;
    height: 14px;
}
.__none .__none:after, .__none:before {
     display: none !important; 
}
.section.__expiry .__agreement .row {
    padding: 27px 0 25px;
}

.form-wrap.__agreement .row {
    padding: 15px 0;
    border-top: 1px solid #eeeeee;
}
.description > p:first-child {
    margin: 0;
}
.description > p {
    position: relative;
    margin: 10px 0 0;
    padding: 0 0 0 10px;
}
.description {
    font-size: 15px;
    line-height: 1.2;
    color: #8a8a8a;
    word-break: break-all;
    padding: 10px 0 0 0;
}
.description > p:before {
    position: absolute;
    left: 0;
    top: 0;
    content: '- ';
}
.section.__expiry .row {
    padding: 0;
}
.ui-radio {
    position: relative;
    display: inline-block;
    margin: 0 20px 0 0;
}
.ui-radio > input {
    position: absolute;
    left: 1px;
    top: 1px;
    width: 14px;
    height: 14px;
}
.ui-radio > label {
    display: inline-block;
    padding: 0 0 0 25px;
    min-height: 18px;
    line-height: 18px;
    font-size: inherit;
    vertical-align: top;
    cursor: pointer;
}
.ui-radio > label:before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    width: 18px;
    height: 18px;
    background: #fff url(Img/ui-input.png) no-repeat 0 0;
    background-size: 90px 18px;
    overflow: hidden;
}
.ui-radio:last-child {
    margin: 0;
}
.__center {
    text-align: center;
}
.ui-button.__black {
    color: #fff;
    background-color: #333;
}

.ui-button.__square-large {
    padding: 0 10px;
    min-width: 9.375em;
    height: 40px;
    line-height: 40px;
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
    cursor: pointer;
}
.ui-button.__point-color {
    color: #fff;
    background-color: #0092fa;
}
.ui-check > input:checked + label:before {
    background-position: -69px 0;
}
.ui-radio > input:checked + label:before {
    background-position: -46px 0;
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
</style>
</head>
<body id ="KOR">
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
			<h2 class="title">비밀번호 찾기 </h2> <!-- 비밀번호 찾기 -->
			<div class="headline">
				새로운 비밀번호를<br>입력해주세요. <!-- 새로운 비밀번호를<br>입력해주세요. -->
			</div>
		</div>
		<!-- //toparea -->

		<!-- contents -->
		<div class="contents">
			<!-- section -->
			<div class="section __half">
				<h3 class="subject __underline"></h3>
				<!-- 비밀번호 -->
				<div class="row">
					<div class="col-md">
						비밀번호 <!-- 비밀번호 -->
						<!-- SSO페이지 수정 비밀번호규칙 안내문구 추가 MYENG 3.26 -->
						<div class="tooltip-container">
			              <button type="button" class="tooltip-trigger" >설명보기</button>
			              <div class="tooltip-content">
			                <p class="tooltip-title"><b>비밀번호 입력 시 아래 규칙을 참고해주세요!</b></p>
			                <p>1. 비밀번호는 영문자,숫자,특수기호의 조합으로 <b>8~15자리</b>를 사용해야합니다.</p>
			                <p>2. 특수기호는 <b>! @ # $ % ^ * ? _ ~</b> 만 사용 가능합니다.</p>
			                <p>3. 연속된 문자열을 <b>3자 이상</b> 사용할 수 없습니다.</p>
			                <p>4. 동일한 문자열을 <b>3자 이상</b> 사용할 수 없습니다.</p>
			              </div>
			            </div>
					</div>
					<div class="col-md">
						<div class="form-wrap __normal">
							<div class="inner">
								<div class="ui-input">
									<input type="password" id="user-pwd" maxlength="20" title="비밀번호를 입력해주세요." class="">
									<span class="placeholder">
										비밀번호를 입력해주세요.<!-- 비밀번호를 입력해주세요. -->
									</span>
								</div>
							</div>
							<span class="__point-color">
								<small>
									8-15자리의 영문/숫자/특수문자를 함께 입력해주세요.	<!-- 8-15자리의 영문/숫자/특수문자를 함께 입력해주세요 -->
								</small>
							</span>
						</div>
					</div>
				</div>
				<!-- 비밀번호 확인 -->
				<div class="row">
					<div class="col-md">
						비밀번호 확인<!-- 비밀번호 확인 -->
					</div>
					<div class="col-md">
						<div class="form-wrap __normal">
							<div class="inner">
								<div class="ui-input">
									<input type="password" id="user-pwd-check" maxlength="20" title="입력하신 비밀번호를 다시 한번 입력해주세요.">
									<span class="placeholder">
										입력하신 비밀번호를 다시 한번 입력해주세요.	<!-- 입력하신 비밀번호를 다시 한번 입력해주세요. -->
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- btn -->
			<div class="btn-area __center">
				<a href = "javascript:history.back();"><button type="button" class="ui-button __square-large __black" >취소 </button></a>
				<button type="button" class="ui-button __square-large __point-color" id="nextBtn">다음 </button>
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
.modal-dimmed {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-color: rgba(0,0,0,.8);
    z-index: 100;
}
</style>
	<div id="mast-foot">
		<div class="container">
			<div class="utility">
				<div class="item">
					<a href="http://www.lottemembers.com/">회사소개<!-- 회사소개 --></a>
				</div>
				<div class="item">
					<a href="https://m.lpoint.com/app/center/LWDE100100.do">고객센터<!-- 고객센터 --></a>
				</div>
				<div class="item">
					<a href="https://m.lpoint.com/app/center/LWDD100100.do">이용약관<!-- 이용약관 --></a>
				</div>
				<div class="item">
					<a href="https://m.lpoint.com/app/center/LWDD100100.do?popup=4"><em
						class="__point-color">개인정보처리방침<!-- 개인정보처리방침 --></em></a>
				</div>
			</div>
			<div class="com-address">
				<address>
					<span>서울시 중구 통일로 2길 16 AIA타워 14층<!-- 서울시 중구 통일로 2길 16 AIA타워 14층 --></span>
					<span>회사명 롯데멤버스(주)<!-- 회사명 롯데멤버스(주) --></span> <span>대표이사
						전형식<!-- 대표이사 강승하 -->
					</span> <span>사업자등록번호 104-86-58491<!-- 사업자등록번호 104-86-58491 --></span> <span>고객센터
						1899-8900<!-- 고객센터 1899-8900 -->
					</span>
				</address>
			</div>
			<div class="copyright">© LOTTE MEMBERS CO.,LTD.</div>
			<div class="friendly">
				<div class="site-linker">
					<button type="button" role="button" id = "first">
						Service Site
						<!-- Service Site -->
					</button>
					<ul class= "one">
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="https://www.lpoint.com">L.POINT<!-- L.POINT --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="https://www.lpay.com">L.pay<!-- L.pay --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="https://www.lime-in.co.kr">라임<!-- 라임 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="https://partners.lpoint.com">L.POINT 파트너스<!-- L.POINT 파트너스 --></a></li>
					</ul>
				</div>
				<div class="site-linker">
					<button type="button" role="button" id = "second">
						Family Site
						<!-- Family Site -->
					</button>
					<ul class= "two">
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotte.co.kr">롯데그룹<!-- 롯데그룹 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottetown.com">롯데타운<!-- 롯데타운 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotte.com/">롯데닷컴<!-- 롯데닷컴 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottemart.com/">롯데마트<!-- 롯데마트 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.vic-market.com/vicmarket/main.do">롯데빅마켓<!-- 롯데빅마켓 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.toysrus.co.kr/to/main.do">토이저러스<!-- 토이저러스 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottesuper.co.kr/">롯데슈퍼<!-- 롯데슈퍼 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotteimall.com/main/Index.jsp">롯데홈쇼핑<!-- 롯데홈쇼핑 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.7-eleven.co.kr/">바이더웨이<!-- 바이더웨이 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.7-eleven.co.kr/">세븐일레븐<!-- 세븐일레븐 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.himart.co.kr/">하이마트<!-- 하이마트 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.fujifilm.co.kr/">한국후지필름<!-- 한국후지필름 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lohbs.co.kr/main.do">LOHB's<!-- LOHB's --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.ellotte.com/">롯데백화점<!-- 롯데백화점 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://kr.lottedfs.com/main">롯데면세점<!-- 롯데면세점 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottefitin.com">롯데피트인<!-- 롯데피트인 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://gimpoairport.lottemall.co.kr">롯데몰 김포공항점<!-- 롯데몰 김포공항점 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lwt.co.kr">롯데월드몰<!-- 롯데월드몰 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://store.lotteshopping.com/handler/Main-Start?subBrchCd=021&amp;gubun=2">롯데영플라자<!-- 롯데영플라자 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://store.lotteshopping.com/handler/Main-Start?subBrchCd=057">롯데아울렛<!-- 롯데아울렛 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://store.lotteshopping.com/handler/Main-Start?subBrchCd=054&amp;gubun=1">롯데프리미엄아울렛<!-- 롯데프리미엄아울렛 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.mujikorea.net/">무인양품<!-- 무인양품 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.uniqlo.kr/">유니클로<!-- 유니클로 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotteria.com/">롯데리아<!-- 롯데리아 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.angelinus.co.kr/">엔제리너스커피<!-- 엔제리너스커피 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.tgif.co.kr/">T.G.I FRIDAY'S<!-- T.G.I FRIDAY'S --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.natuur.co.kr/">나뚜루POP<!-- 나뚜루POP --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.krispykreme.co.kr/">크리스피크림도넛<!-- 크리스피크림도넛 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.boulangerie.co.kr/">보네스뻬<!-- 보네스뻬 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottecinema.co.kr/">롯데시네마<!-- 롯데시네마 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotteworld.com/">롯데월드 어드벤처<!-- 롯데월드 어드벤처 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotteworld.com/aquarium/index.asp">롯데월드
								아쿠아리움<!-- 롯데월드 아쿠아리움 -->
						</a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotteworld.com/waterpark/index.asp">롯데 워터파크<!-- 롯데 워터파크 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.giantsclub.com/">롯데자이언츠<!-- 롯데자이언츠 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottejtb.com/">롯데제이티비<!-- 롯데제이티비 --></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<input type ="text" id = "email" value="<%=e %>" />
</body>
</html>