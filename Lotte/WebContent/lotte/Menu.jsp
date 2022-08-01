<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	function notReady() {
		alert("준비중입니다.");
	}
	function Logout(){
		location.href="LotteController?command=Logout";
	}
	var menuDate = new Date();
	var menuMonth = menuDate.getMonth()+1;
	if(menuMonth<10) {
		menuMonth = "0" + menuMonth;
	}
	var menuDay = menuDate.getDate();
	if(menuDay<10){
		menuDay = "0" + menuDay;
	}
	var menuDayOfTheWeek;
	switch(menuDate.getDay()) {
	case 0:
		menuDayOfTheWeek = "(일)";
		break;
	case 1:
		menuDayOfTheWeek = "(월)";
		break;
	case 2:
		menuDayOfTheWeek = "(화)";
		break;
	case 3:
		menuDayOfTheWeek = "(수)";
		break;
	case 4: 
		menuDayOfTheWeek = "(목)";
		break;
	case 5:
		menuDayOfTheWeek = "(금)";
		break;
	case 6:
		menuDayOfTheWeek = "(토)";
		break;
	}//switch
	$(document).ready(function() {
		$(".inner .leftArea .timeInfo .time .tit .date").text(menuMonth + "." + menuDay + " " + menuDayOfTheWeek);
		
		$("#header .container #gnb > li").on("mouseenter", function() {
			const obj = $(this);
			$(obj).toggleClass('on');
			$(obj).find(".openDiv").css("display", "block");
			$(".blackBg").css({"z-index": "50", "display": "block"});
		});
		$("#header .container #gnb > li").on("mouseleave", function() {
			const obj = $(this);
			$(".openDiv").css("display", "none");
			$(obj).toggleClass('on');
			$(".blackBg").css({"z-index": "", "display": "none"});
		});
		$(".srchBtn").click(function() {
			$(".srchArea").slideToggle();
			if($(".blackBg").css("display")=="block") {
				$("#header .container #gnb > li > a").css({"color": "","cursor": ""});
				$("#header .container #gnb > li").on("mouseenter", function() {
					const obj = $(this);
					$(obj).toggleClass('on');
					$(obj).find(".openDiv").css("display", "block");
					$(".blackBg").css({"z-index": "50", "display": "block"});
				});
				$("#header .container #gnb > li").on("mouseleave", function() {
					const obj = $(this);
					$(".openDiv").css("display", "none");
					$(obj).toggleClass('on');
					$(".blackBg").css({"z-index": "", "display": "none"});
				});
				$(".blackBg").css({"z-index": "", "display": "none"});
				return;
			}
			$("#header .container #gnb > li > a").css({"color": "rgba(0, 0, 0, 0.5)","cursor": "default"});
			
			$("#header .container #gnb > li").off("mouseenter");
			$("#header .container #gnb > li").off("mouseleave");
			$(".blackBg").css({"z-index": "50", "display": "block"});
		});
		$(".closeBtn").click(function() {
			$(".srchArea").slideToggle();
			$("#header .container #gnb > li > a").css({"color": "","cursor": ""});
			$("#header .container #gnb > li").on("mouseenter", function() {
				const obj = $(this);
				$(obj).toggleClass('on');
				$(obj).find(".openDiv").css("display", "block");
				$(".blackBg").css({"z-index": "50", "display": "block"});
			});
			$("#header .container #gnb > li").on("mouseleave", function() {
				const obj = $(this);
				$(".openDiv").css("display", "none");
				$(obj).toggleClass('on');
				$(".blackBg").css({"z-index": "", "display": "none"});
			});
			$(".blackBg").css({"z-index": "", "display": "none"});
		});
		$(".blackBg").click(function() {
			if($(".layerPop.infoPop").css("display")=="block"){
				return;
			}
			$(".srchArea").slideToggle();
			$("#header .container #gnb > li > a").css({"color": "","cursor": ""});
			
			$("#header .container #gnb > li").on("mouseenter", function() {
				const obj = $(this);
				$(obj).toggleClass('on');
				$(obj).find(".openDiv").css("display", "block");
				$(".blackBg").css({"z-index": "50", "display": "block"});
			});
			$("#header .container #gnb > li").on("mouseleave", function() {
				const obj = $(this);
				$(".openDiv").css("display", "none");
				$(obj).toggleClass('on');
				$(".blackBg").css({"z-index": "", "display": "none"});
			});
			$(".blackBg").css({"z-index": "", "display": "none"});
		});
		$(".mainCon1 .boxArea .box-tr .box-td").hover(function() {
			$(this).find("a").find(".tit").css("color","#550bdf");
		}, function() {
			$(this).find("a").find(".tit").css("color", "#000");
		});
		
		var boxHeight = $("#util").height() + $("#header").height(); 
	    //navHeight 의 높이를 구하기
	    
	    $(window).scroll(function(){  // 윈도우 스크롤 기능 작동
	        var rollIt = $(this).scrollTop() > boxHeight;
	        var rol = $(this).scrollTop() <= boxHeight;
		// 스크롤의 정도가 navHeight 의 값을 넘었을 때 == 윈도우 스크롤의 값이 navHeight 의 높이와 같거나 크다

		/*
		scrollTop 은 윈도우에서 스크롤의 위치가 가장 상위에 있다는 의미로 해석
		스크롤의 위치가 화면 아래일수록 == scrollTop 의 값이 커짐
		*/

	    if(rollIt){ 
			//윈도우 스크롤 기능의 값이 navHeight 의 높이와 같거나 크면
				$("#util").css({"display":"none"});
				$("#header").css({"position":"fixed"});
	        }else if(rol){
	        	$("#util").css({"display":"block"});
				$("#header").css({"position":"relative"});
	        }
	    });
	    
	    $(".no").click(function() {
	    	$(".moviepop-dim2").css("display","block");
	    });
	    $(".moviepop-dim2 .moviepop-warap .close-btn").click(function() {
	    	$(".moviepop-dim2").css("display","none");
	    });
	    $("#header .right p.reserBtn").click(function() {
	    	$(".layerPop.infoPop").css("display","block");
	    	$("body .blackBg").css({"display": "block", "z-index": "100"});
	    });
	    $(".layerPop.infoPop .popClose").click(function() {
	    	$(".layerPop.infoPop").css("display","none");
	    	$("body .blackBg").css({"display": "none", "z-index": ""});
	    });
	    $(".mainSearchBtn").click(function() {
	    	var search = $("#mainSearch").val();
	    	location.href = "LotteController?command=search&text="+search;
	    });
	});
</script>
<style>
	@font-face {
		font-family: "NotoSans-Medium";
		src: url("font/NotoSansKR-Medium.otf");
	}
	@font-face {
		font-family: "NotoSans-Light";
		src: url("font/NotoSansKR-Light.otf");
	}
	@font-face {
		font-family: "NotoSans-Bold";
		src: url("font/NotoSansKR-Bold.otf");
	}
	@font-face {
		font-family: "NotoSans-Regular";
		src: url("font/NotoSansKR-Regular.otf");
	}
	* {
		padding: 0;
		margin: 0;
	}
	body {
	    position: relative;
	    font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    font-size: 16px;
	    color: #555;
	    letter-spacing: -0.6px;
	    height: 100%;
	    line-height: 1;
	}
	a {
		text-decoration: none;
		color: #555;
	}
	img {
	    border: none;
	    vertical-align: top;
	}
	ul, ol, li {
	    list-style: none;
	}
	strong {
	    font-weight: normal;
	}
	input[type="text"] {
	    width: 278px;
	    background: #fff;
	    -webkit-appearance: none;
	    box-shadow: none;
	}
	input, select {
	    vertical-align: middle;
	    background: #fff;
	    border: 1px solid #e1e1e1;
	    font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    color: #555;
	    letter-spacing: -0.6px;
	    border-radius: 0;
	    font-size: 16px;
	}
	input {
	    padding: 3px 10px;
	    height: 32px;
	}
	#wrapper {
	    position: relative;
	    width: 100%;
	    overflow: hidden;
	}
	.container {
		position: relative;
		width: 1170px;
		margin: 0 auto;
	}
	#util {
		position: relative;
		border-bottom: 1px solid #e1e1e1;
		background: #f8f8f8;
		z-index: 80;
	}
	#util .container {
		padding: 8px 0 6px;
		width: 1400px;
	}
	#util .container .right .links a:hover {
	    color: #550adf;
	}
	#util .container .right .login a:hover {
	    color: #000;
	}
	#util .container .right .links a {
	    font-size: 15px;
	    color: #000;
	}
	#util .container .family a {
	    position: relative;
	    display: inline-block;
	    padding-left: 21px;
	    margin-left: 20px;
	    height: 32px;
	    font-size: 15px;
	    color: #555;
	    line-height: 28px;
	}
	#util .container .family .sky span {
		padding-left: 27px;
		background: url("images/util1.png") no-repeat 0 50%;
	}
	#util .container .family .aqua span {
	    padding-left: 34px;
		background: url("images/util2.png") no-repeat 0 50%;
	}
	#util .container .family .water span {
		padding-left: 33px;
		background: url("images/util3.png") no-repeat 0 50%;
	}
	#util .container .family .busan span {
		padding-left: 43px;
		background: url("images/util4.png") no-repeat 0 50%;
	}
	#util .container .family a:before {
	    content: '';
	    position: absolute;
	    top: 50%;
	    left: 0;
	    margin-top: -10px;
	    width: 1px;
	    height: 20px;
	    background: #e1e1e1;
	}
	#util .container .family a:first-child:before {
		display: none;
	}
	#util .container .family a span {
		display: inline-block;
		height: 100%;
	}
	#util .container .family {
		float: left;
	}
	#util .container:after {
		content: '';
		display: block;
		clear: both;
	}
	#util .container .right {
		float: right;
	}
	#util .container .right:after {
		content:'';
		display: block;
		clear: both;
	}
	#util .container .right > div {
		float: left;
	}
	#util .container .right > div > a:before {
		content: '';
	    position: absolute;
	    top: 50%;
	    left: 0;
	    margin-top: -6.5px;
	    width: 1px;
	    height: 13px;
	    background: #e1e1e1;
	}
	#util .container .right > div > a {
	    display: inline-block;
	    position: relative;
	    padding-left: 9px;
	    margin-left: 8px;
	    line-height: 26px;
	    color: #000;
	}
	#util .container .right > div > a:first-child:before {
		display: none;
	}
	#util .container .right > div > a:first-child {
		padding-left: 0;
		margin-left: 0;
	}
	#util .container .right .login {
		margin-left: 30px;
	}
	#util .container .right .login a {
	    font-size: 15px;
	    color: #555;
	    font-family: 'NotoSans-Medium', '맑은 고딕', 'Malgun Gothic', sans-serif;
	}
	
	#header {
	    position: relative;
	    top: 0;
	    left: 0;
	    width: 100%;
	    border-bottom: 1px solid #e1e1e1;
	    background: #fff;
	    z-index: 70;
	}
	#header .container {
		width: 1400px;
	}
	#header h1 {
	    float: left;
	    margin-top: 13px;
	}
	img {
	    border: none;
	    vertical-align: top;
	}
	#header #gnb {
	    margin-left: 162px;
	    float: left;
	}
	ul, ol, li {
	    list-style: none;
	}
	#header .container:after {
	    content: '';
	    display: block;
	    clear: both;
	}
	#header #gnb:before {
	    content: '';
	    display: block;
	    clear: both;
	}
	#header #gnb > li:first-child {
	    padding-left: 0;
	}
	#header #gnb > li {
	    padding-left: 62px;
	    float: left;
	}
	#header #gnb > li > a {
	    position: relative;
	    display: block;
	    height: 99px;
	    font-family: 'NotoSans-Medium', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    font-size: 18px;
	    color: #000;
	    line-height: 95px;
	}
	#header #gnb > li.on > a:after {
	    content: '';
	    width: 20px;
	    height: 12px;
	    position: absolute;
	    bottom: 0;
	    left: 50%;
	    margin-left: -10px;
	    background: url(images/gnb_on_icon.png) no-repeat 50% 50%;
	}
	#header #gnb > li .openDiv {
	    position: absolute;
	    top: 97px;
	    left: 50%;
	    width: 5000px;
	    border-top: 2px solid #6f23f9;
	    margin-left: -2500px;
	    background: #fff;
	}
	#header #gnb > li .openDiv .inner {
	    position: relative;
	    width: 1170px;
	    margin: 0 auto;
	    height: 100%;
	    background: url(images/gnb_openDiv_bg.jpg) no-repeat right bottom;
	}
	#header #gnb > li .openDiv .inner {
	    width: 1400px;
	}
	#header #gnb > li .openDiv .inner:after {
	    content: '';
	    display: block;
	    clear: both;
	}
	#header #gnb > li .openDiv .inner .leftArea {
	    float: left;
	}
	#header #gnb > li .openDiv .inner .rightArea {
	    float: right;
	}
	#header #gnb > li .openDiv .inner .leftArea .timeInfo {
	    float: left;
	    width: 222px;
	    margin-top: 50px;
	}
	#header #gnb > li .openDiv .inner .leftArea .twoD {
	    float: left;
	    padding: 50px 0 0 60px;
	    width: 151px;
	    height: 336px;
	    box-sizing: border-box;
	    border-left: 1px solid #e1e1e1;
	}
	#header #gnb > li .openDiv .inner .leftArea .timeInfo .time .tit {
	    background: url(images/gnb_timeInfo_bg.png) no-repeat 0 0;
	    padding-top: 80px;
	    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    font-size: 20px;
	    color: #000;
	    line-height: 30px;
	}
	#header #gnb > li .openDiv .inner .leftArea .timeInfo .time .tit strong {
	    font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    font-size: 16px;
	    color: #888;
	    display: block;
	}
	strong {
	    font-weight: normal;
	}
	#header #gnb > li .openDiv .inner .leftArea .timeInfo .time .tit span {
	    font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
	}
	#header #gnb > li .openDiv .inner .leftArea .timeInfo .time .txt {
	    font-size: 16px;
	    color: #777;
	    margin-top: 30px;
	}
	#header #gnb > li .openDiv .inner .leftArea .timeInfo .time .txt span {
	    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    font-size: 20px;
	    color: #000;
	}
	#header #gnb > li .openDiv .inner .leftArea .twoD li:first-child {
	    margin-top: 0;
	}
	#header #gnb > li .openDiv .inner .leftArea .twoD li {
	    margin-top: 17px;
	    position: relative;
	}
	#header #gnb > li .openDiv .inner .leftArea .twoD li > a {
	    display: block;
	    position: relative;
	    font-size: 18px;
	    color: #000;
	    font-family: 'NotoSans-Medium', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    width: 180px;
	    border-bottom: 1px solid #e1e1e1;
	    padding-bottom: 16px;
	}
	#header #gnb > li .openDiv .inner .leftArea .twoD li .thrD {
	    position: absolute;
	    top: 0;
	    left: 180px;
	    padding-left: 50px;
	    width: 200px;
	    height: 336px;
	    box-sizing: border-box;
	    display: none;
	}
	#header #gnb > li .openDiv .inner .leftArea .twoD li .thrD > a {
	    display: block;
	    font-size: 16px;
	    color: #555;
	    margin-top: 24px;
	}
	#header #gnb > li .openDiv .inner .leftArea .twoD li .thrD > a:first-child {
	    margin-top: 0;
	}
	#header #gnb > li .openDiv .inner .rightArea .appDown {
	    float: left;
	}
	#header #gnb > li .openDiv .inner .rightArea .appDown a {
	    display: block;
	    padding: 30px;
	    width: 270px;
	    height: 336px;
	    box-sizing: border-box;
	    background: url(images/gnb_appDown_bg.png) no-repeat 100% 100%;
	}
	#header #gnb > li .openDiv .inner .rightArea .appDown a .tit {
	    font-size: 22px;
	    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    line-height: 30px;
	    color: #fff;
	}
	#header #gnb > li .openDiv .inner .rightArea .appDown a ul {
	    margin-top: 10px;
	}
	#header #gnb > li .openDiv .inner .rightArea .appDown a .arrowBg {
	    display: block;
	    width: 40px;
	    height: 12px;
	    margin-top: 40px;
	    background: url(images/gnb_appDown_icon.png) no-repeat 0 100%;
	}
	#header #gnb > li .openDiv .inner .rightArea .appDown a .tit span {
	    color: #ffc600;
	}
	#header #gnb > li .openDiv .inner .rightArea .appDown a ul li {
	    position: relative;
	    font-size: 15px;
	    line-height: 22px;
	    font-family: 'NotoSans-Regular', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    color: #fff;
	    padding-left: 13px;
	}
	#header #gnb > li .openDiv .inner .rightArea .appDown a ul li:before {
	    content: "";
	    display: block;
	    width: 3px;
	    height: 22px;
	    position: absolute;
	    top: 0;
	    left: 0;
	    background: url(images/appDown_list_icon.gif) no-repeat center;
	}
	#header .right {
	    float: right;
	    margin-top: 21px;
	}
	#header .right:after {
	    content: '';
	    display: block;
	    clear: both;
	}
	#header .right p:first-child {
	    padding-left: 0;
	}
	#header .right p {
	    float: left;
	    padding-left: 32px;
	}
	#header .right p.reserBtn {
	    padding-left: 38px;
	}
	#header .right p.groupBtn.type2 {
	    padding-left: 36px;
	}
	#header .right p.productBtn {
	    padding-left: 44px;
	}
	#header .right p a {
	    display: inline-block;
	    position: relative;
	}
	#header .right p a span {
	    display: block;
	    color: #550adf;
	}
	#header .right p a span.txt {
	    position: absolute;
	    top: 24px;
	    left: 50%;
	    padding-top: 13px;
	    white-space: nowrap;
	    transform: translate(-50%, 0);
	}
	#header #gnb > li .openDiv .inner .leftArea .twoD li:hover > a, #header #gnb > li .openDiv .inner .leftArea .twoD li:focus > a {
	    font-family: 'NotoSans-bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    color: #5a12e0;
	    border-bottom: 1px solid #5a12e0;
	}
	#header #gnb > li .openDiv .inner .leftArea .twoD li:hover > a:after {
	    content: "";
	    display: block;
	    width: 6px;
	    height: 10px;
	    position: absolute;
	    top: 4px;
	    right: 10px;
	    background: url(images/gnb_twoD_bg.png) no-repeat 0 0;
	}
	#header #gnb > li .openDiv .inner .leftArea .twoD li .thrD > a:hover, #header #gnb > li .openDiv .inner .leftArea .twoD li .thrD > a:focus {
	    color: #550adf;
	}
	#header #gnb > li .openDiv .inner .leftArea .twoD li:hover > a, #header #gnb > li .openDiv .inner .leftArea .twoD li:focus > a {
	    font-family: 'NotoSans-bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    color: #5a12e0;
	    border-bottom: 1px solid #5a12e0;
	}
	a:hover, a:focus, a:active {
	    text-decoration: none;
	}
	#header #gnb > li .openDiv .inner .leftArea .twoD li:hover > .thrD, #header #gnb > li .openDiv .inner .leftArea .twoD li:focus > .thrD {
	    display: block;
	}
	.srchArea {
	    position: absolute;
	    top: 100px;
	    left: 0;
	    padding: 43px 0 41px;
	    width: 100%;
	    background: #fff;
	    text-align: center;
	    display: none;
	}
	.srchArea:after {
	    content: "";
	    display: block;
	    clear: both;
	}
	.srchArea .inputArea {
	    position: relative;
	    display: inline-block;
	    padding: 3px;
	    border-radius: 32px;
	    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
	}
	.srchArea .exArea {
	    text-align: center;
	    overflow: hidden;
	    margin-top: 25px;
	}
	.srchArea .container > .closeBtn {
	    display: block;
	    position: absolute;
	    top: -15px;
	    right: 0;
	    width: 22px;
	    height: 22px;
	    background: url(images/header_srch_close_btn.png) no-repeat center;
	}
	.srchArea .inputArea input {
	    border: 0;
	    padding: 0 77px 0 32px;
	    width: 439px;
	    height: 58px;
	    font-size: 18px;
	    border-radius: 29px;
	}
	input[type="text"] {
	    width: 278px;
	    background: #fff;
	    -webkit-appearance: none;
	    box-shadow: none;
	}
	input, select {
	    vertical-align: middle;
	    background: #fff;
	    border: 1px solid #e1e1e1;
	    font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    color: #555;
	    letter-spacing: -0.6px;
	    border-radius: 0;
	    font-size: 16px;
	}
	input {
	    padding: 3px 10px;
	    height: 32px;
	}
	.srchArea .inputArea a {
	    position: absolute;
	    top: 17px;
	    right: 26px;
	}
	.srchArea .exArea .ex {
	    display: inline-block;
	    vertical-align: top;
	    width: 42px;
	    height: 26px;
	    line-height: 1.2;
	    font-family: 'NotoSans-Medium', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    font-size: 18px;
	    color: #333;
	    text-align: center;
	    background: #e1e1e1;
	    border-radius: 13px;
	}
	.srchArea .exArea div {
	    display: inline-block;
	    overflow: hidden;
	    margin-left: 15px;
	}
	.srchArea .exArea div p {
	    float: left;
	    position: relative;
	    font-size: 18px;
	    color: #555;
	    line-height: 24px;
	    padding-left: 10px;
	    margin-left: 10px;
	}
	.srchArea .exArea div p:first-child {
	    padding-left: 0;
	    margin-left: 0;
	}
	.srchArea .exArea div p:before {
	    content: '';
	    position: absolute;
	    top: 50%;
	    left: 0;
	    margin-top: -7px;
	    width: 1px;
	    height: 16px;
	    background: #e0e0e0;
	}
	.srchArea .exArea div p:first-child:before {
		display: none;
	}
	
	.moviepop-dim2 {
		    display: none;
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    min-height: 100%;
		    background: rgba(0,0,0,.7);
		    z-index: 999999;
		    overflow: hidden;
		}
		.moviepop-warap {
		    position: absolute;
		    z-index: 9999999999;
		    width: 1170px;
		    padding: 80px 93px;
		    background: #fff;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    box-sizing: border-box;
		}
		.moviepop-dim2 .moviepop-warap {
		    max-width: 510px;
		    text-align: center;
		    padding: 50px 30px 30px;
		}
		.close-btn {
		    position: absolute;
		    top: 30px;
		    right: 30px;
		    cursor: pointer;
		}
		.layerPop {
		    width: 800px;
		    position: fixed;
		    top: 50%;
		    left: 50%;
		    z-index: 101;
		    transform: translate(-50%, -50%);
		    background: #fff;
		}
		.layerPop.infoPop {
		    width: 600px;
		    padding-top: 55px;
		    background: none;
		    display: none;
		}
		.layerPop.infoPop .popCon {
		    padding: 50px 50px 0 50px;
		    background: url(images/infoPop_img.jpg) no-repeat center;
		    background-size: cover;
		    text-align: center;
		}
		.layerPop .popClose {
		    display: block;
		    position: absolute;
		    top: 28px;
		    right: 30px;
		}
		.layerPop.infoPop .popClose {
		    top: 0;
		    right: 0;
		}
		.layerPop.infoPop .popCon .txt {
		    font-size: 20px;
		    color: #fff;
		    margin-top: 33px;
		}
		.layerPop.infoPop .popCon .whiteBtn {
		    display: none;
		}
		.layerPop.infoPop .popCon .img {
		    margin-top: 34px;
		}
		
		.blackBg {
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background: rgba(0,0,0,0.5);
		    display: none;
		}
</style>
<body>
<p class="blackBg"></p>
	<div id="util">
			<div class="container">
				<div class="family">
					<a href="https://seoulsky.lotteworld.com/ko/main/index.do" target="_blank" class="sky">
						<span>SEOUL SKY</span>
					</a>
					<a href="http://www.lotteworld.com/aquarium/index.asp" target="_blank" class="aqua">
						<span>롯데월드 아쿠아리움</span>
					</a>
					<a href="http://www.lotteworld.com/waterpark/index.asp" target="_blank" class="water">
						<span>김해롯데워터파크</span>
					</a>
					<a href="https://adventurebusan.lotteworld.com/kor/main/index.do" target="_blank" class="busan">
						<span>롯데월드 어드벤처 부산</span>
					</a>
				</div>
				<div class="right">
					<div class="links">
						<a href="https://adventure.lotteworld.com/museum/main/index.do" target="_blank">민속박물관</a>
						<a href="https://adventure.lotteworld.com/icerink/main/index.do" target="_blank">아이스링크</a>
					</div>
					<%
						session = request.getSession();
						String login = (String)session.getAttribute("name");
						if(login==null) {
					%>
					<div class="login">
						<a href="LotteController?command=SimpleLogin">Login</a>
						<a href="LotteController?command=Signup01">회원가입</a>
					</div>
					<%
						}else {
					%>
					<div class= "login">
						<a href="javascript:" onclick ="Logout()">Logout</a>
						<a href="LotteController?command=Mypage">Mypage</a>
					</div>
					<%
						}
					%>
				</div>
			</div>
		</div><!-- util -->
		<div id="header">
			<div class="container">
				<h1>
					<a href="LotteController?command=lotteMain">
						<img src="images/logo.png"/>
					</a>
				</h1>
				<ul id="gnb">
					<li>
						<a href="javascript:void(0)" class="oneD" target="_self">즐길거리</a>
						<div class="openDiv" style="overflow: hidden; display: none; height: 336px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
							<div class="inner">
								<div class="leftArea">
									<div class="timeInfo">
										<div class="time">
											<p class="tit">
												<strong class="date"></strong>
												<span>오늘의 파크</span>
												<br/>
												운영시간
											</p>
											<p class="txt">
												<span>10:00</span>
												<span>- 21:00</span>
											</p>
										</div>
									</div>
									<ul class="twoD">
										<li>
											<a href="LotteController?command=Attraction" target="_self">어트랙션</a>
											<div class="thrD"></div>
										</li>
										<li>
											<a href="LotteController?command=Festival" target="_self">페스티벌</a>
											<div class="thrD"></div>
										</li>
										<li>
											<a href="LotteController?command=ShowMain" target="_self">공연</a>
											<div class="thrD"></div>
										</li>
										<li>
											<a href="LotteController?command=Restaurant" target="_self">다이닝/쇼핑</a>
											<div class="thrD">
												<a href="LotteController?command=Restaurant" target="_self">레스토랑</a>
												<a href="LotteController?command=Giftshop" target="_self">기프트샵</a>
											</div>
										</li>
									</ul>
								</div>
								<div class="rightArea">
									<div class="appDown">
										<a href="#">
											<p class="tit">
												<span>앱 다운로드</span>로
												<br/>
												더 스마트하게!
											</p>
											<ul>
												<li>모바일 예매</li>
												<li>모바일 티켓발권</li>
												<li>매직패스 예약</li>
											</ul>
											<strong class="arrowBg"></strong> 
										</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<a href="javascript:void(0)" class="oneD" target="_self">요금/우대혜택</a>
						<div class="openDiv" style="overflow: hidden; display: none; height: 336px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
							<div class="inner">
								<div class="leftArea">
									<div class="timeInfo">
										<div class="time">
											<p class="tit">
												<strong class="date"></strong>
												<span>오늘의 파크</span>
												<br/>
												운영시간
											</p>
											<p class="txt">
												<span>10:00</span>
												<span>- 21:00</span>
											</p>
										</div>
									</div>
									<ul class="twoD">
										<li>
											<a href="LotteController?command=Charge" target="_self">이용요금</a>
											<div class="thrD">
												<a href="LotteController?command=Charge" target="_self">티켓요금</a>
												<a href="LotteController?command=MagicPass" target="_self">매직패스 프리미엄</a>
											</div>
										</li>
										<li>
											<a href="LotteController?command=Price" target="_self">연간이용</a>
											<div class="thrD">
												<a href="LotteController?command=Price" target="_self">권종별 기본가격</a>
												<a href="javascript:notReady()" target="_self">할인정보</a>
												<a href="javascript:notReady()" target="_self">특별혜택</a>
											</div>
										</li>
									</ul>
								</div>
								<div class="rightArea">
									<div class="appDown">
										<a href="#">
											<p class="tit">
												<span>앱 다운로드</span>로
												<br/>
												더 스마트하게!
											</p>
											<ul>
												<li>모바일 예매</li>
												<li>모바일 티켓발권</li>
												<li>매직패스 예약</li>
											</ul>
											<strong class="arrowBg"></strong> 
										</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<a href="javascript:void(0)" class="oneD" target="_self">참여프로그램</a>
						<div class="openDiv" style="overflow: hidden; display: none; height: 336px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
							<div class="inner">
								<div class="leftArea">
									<div class="timeInfo">
										<div class="time">
											<p class="tit">
												<strong class="date"></strong>
												<span>오늘의 파크</span>
												<br/>
												운영시간
											</p>
											<p class="txt">
												<span>10:00</span>
												<span>- 21:00</span>
											</p>
										</div>
									</div>
									<ul class="twoD">
										<li>
											<a href="LotteController?command=Performance" target="_self">공연 참여</a>
											<div class="thrD"></div>
										</li>
										<li>
											<a class="no" href="#" target="_self">가든스테이지 좌석예약</a>
											<div class="thrD"></div>
										</li>
									</ul>
								</div>
								<div class="rightArea">
									<div class="appDown">
										<a href="#">
											<p class="tit">
												<span>앱 다운로드</span>로
												<br/>
												더 스마트하게!
											</p>
											<ul>
												<li>모바일 예매</li>
												<li>모바일 티켓발권</li>
												<li>매직패스 예약</li>
											</ul>
											<strong class="arrowBg"></strong> 
										</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<a href="javascript:void(0)" class="oneD" target="_self">이용가이드</a>
						<div class="openDiv" style="overflow: hidden; display: none; height: 336px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
							<div class="inner">
								<div class="leftArea">
									<div class="timeInfo">
										<div class="time">
											<p class="tit">
												<strong class="date"></strong>
												<span>오늘의 파크</span>
												<br/>
												운영시간
											</p>
											<p class="txt">
												<span>10:00</span>
												<span>- 21:00</span>
											</p>
										</div>
									</div>
									<ul class="twoD">
										<li>
											<a href="LotteController?command=Suspension" target="_self">운영/운휴</a>
											<div class="thrD"></div>
										</li>
										<li>
											<a href="LotteController?command=Park" target="_self">파크 이용안내</a>
											<div class="thrD"></div>
										</li>
										<li>
											<a href="LotteController?command=Facility" target="_self">편의시설/제도</a>
											<div class="thrD">
												<a href="javascript:notReady()" target="_self">모바일 APP</a>
												<a href="LotteController?command=Facility" target="_self">편의시설</a>
												<a href="javascript:notReady()" target="_self">매직패스 제도</a>
												<a href="javascript:notReady()" target="_self">장애인 편의제도</a>
											</div>
										</li>
										<li>
											<a href="LotteController?command=Comming" target="_self">오시는 길</a>
											<div class="thrD">
											</div>
										</li>
										<li>
											<a href="LotteController?command=Guidemap" target="_self">가이드맵</a>
											<div class="thrD"></div>
										</li>
									</ul>
								</div>
								<div class="rightArea">
									<div class="appDown">
										<a href="#">
											<p class="tit">
												<span>앱 다운로드</span>로
												<br/>
												더 스마트하게!
											</p>
											<ul>
												<li>모바일 예매</li>
												<li>모바일 티켓발권</li>
												<li>매직패스 예약</li>
											</ul>
											<strong class="arrowBg"></strong> 
										</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<a href="javascript:void(0)" class="oneD" target="_self">소통서비스</a>
						<div class="openDiv" style="overflow: hidden; display: none; height: 336px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
							<div class="inner">
								<div class="leftArea">
									<div class="timeInfo">
										<div class="time">
											<p class="tit">
												<strong class="date"></strong>
												<span>오늘의 파크</span>
												<br/>
												운영시간
											</p>
											<p class="txt">
												<span>10:00</span>
												<span>- 21:00</span>
											</p>
										</div>
									</div>
									<ul class="twoD">
										<li>
											<a href="LotteController?command=Notice" target="_self">공지사항</a>
											<div class="thrD"></div>
										</li>
										<li>
											<a href="LotteController?command=Faq" target="_self">FAQ</a>
											<div class="thrD"></div>
										</li>
										<li>
											<a href="LotteController?command=Inquiry" target="_self">고객소리함</a>
											<div class="thrD">
												<a href="LotteController?command=Inquiry" target="_self">이용문의</a>
												<a href="LotteController?command=Missing" target="_self">분실물 센터</a>
											</div>
										</li>
									</ul>
								</div>
								<div class="rightArea">
									<div class="appDown">
										<a href="#">
											<p class="tit">
												<span>앱 다운로드</span>로
												<br/>
												더 스마트하게!
											</p>
											<ul>
												<li>모바일 예매</li>
												<li>모바일 티켓발권</li>
												<li>매직패스 예약</li>
											</ul>
											<strong class="arrowBg"></strong> 
										</a>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
				<div class="right">
					<p class="srchBtn">
						<a href="javascript:void(0)" class="btnHeaderSrch">
							<span>
								<img src="images/header_srch_btn.png"/>
							</span>
							<span class="txt">검색</span>
						</a>
					</p>
					<p class="reserBtn" id="reserBtn">
						<a href="LotteController?command=Reservation" target="_blank">
							<span>
								<img src="images/reser_btn.png"/>
							</span>
							<span class="txt">예매</span>
						</a>
					</p>
					<p class="groupBtn">
						<a href="https://smartstore.naver.com/lotteworld" target="_blank">
							<span>
								<img src="images/group_btn.png"/>
							</span>
							<span class="txt">단체</span>
						</a>
					</p>
					<p class="groupBtn type2">
						<a href="https://smartstore.naver.com/lotteworld" target="_blank">
							<span>
								<img src="images/company_btn.png"/>
							</span>
							<span class="txt">기업체</span>
						</a>
					</p>
					<p class="productBtn">
						<a href="https://smartstore.naver.com/lotteworld" target="_blank">
							<span>
								<img src="images/product_btn.png"/>
							</span>
							<span class="txt">상품몰</span>
						</a>
					</p>
				</div>
			</div>
			<div class="srchArea">
				<div class="container">
					<div class="inputArea">
						<form name="frmWebTotalSrch" id="frmWebTotalSrch" method="get" action="#">
							<input type="text" style="display:none;" class="notRequired"/>
							<input id="mainSearch" type="text" placeholder="검색어를 입력해주세요." title="검색어" name="totalq" maxlength="30" onkeydown="if(event.keyCode==13){setTotalSrch('frmWebTotalSrch');return false;}"/>
							<a class="mainSearchBtn" href="javascript:void(0)">
								<img src="images/header_srch_btn.gif"/>
							</a>
						</form>
					</div>
					<div class="exArea">
						<p class="ex">ex</p>
						<div class="divSrchExContainer">
							<p>
								<a href="#">어트랙션</a>
							</p>
							<p>
								<a href="#">티켓요금</a>
							</p>
							<p>
								<a href="#">페스티벌</a>
							</p>
						</div>
					</div>
					<a href="javascript:void(0)" class="closeBtn"></a>
				</div>
			</div>
		</div><!-- header -->
		<div class="moviepop-dim2">
				<div class="moviepop-warap">
					<img src="images/210104_Popup_2.gif"/>
					<div class="close-btn">
						<img src="images/pop_close_btn.png"/>
					</div>
				</div>
			</div><!-- 가든스테이지 경고창 -->
			<div class="layerPop infoPop">
				<div class="popCon">
					<p>
						<img src="images/infoPop_tit.png"/>
					</p>
					<p class="txt">모바일 앱으로 티켓 구매하고 롯데월드로 바로 입장하세요!</p>
					<a href="#" class="whiteBtn">롯데월드 어드벤처 앱으로 보기</a>
					<p class="img">
						<img src="images/infoPop_bot_img.png"/>
					</p>
				</div>
				<a href="javascript:" class="popClose">
					<img src="images/popClose_icon3.png"/>
				</a>
			</div><!-- 예매메인 전 창 -->
</body>
</html>