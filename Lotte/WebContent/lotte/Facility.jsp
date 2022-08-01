<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>편의시설</title>
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
		@font-face {
			font-family: "NotoSans-Bold";
			src: url("font/NotoSansKR-Bold.otf");
		}
		@font-face {
			font-family: "NotoSans-Black";
			src: url("font/NotoSansKR-Black.otf");
		}
		@font-face {
			font-family: "NotoSans-Light";
			src: url("font/NotoSansKR-Light.otf");
		}
		@font-face {
			font-family: "NotoSans-Medium";
			src: url("font/NotoSansKR-Medium.otf");
		}
		@font-face {
			font-family: "NotoSans-Regular";
			src: url("font/NotoSansKR-Regular.otf");
		}
		.body {
	    	position: relative;
		    width: 100%;
		}
		div {
  		  	display: block;
		}
		* {
		    margin: 0;
		    padding: 0;
		}
		body {
		    position: relative;
		    font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    font-size: 16px;
		    color: #555;
		    letter-spacing: -1.2px;
		    height: 100%;
		    -webkit-text-size-adjust: 100%;
		    -moz-text-size-adjust: 100%;
		    -ms-text-size-adjust: 100%;
		    line-height: 1;
		}
		.wrap {
			position: relative;
		    padding: 0 0 130px;
		    width: 100%;
		}
		a {
		    text-decoration: none;
		    color: #555;
		}
		a:-webkit-any-link {
		    cursor: pointer;
		}
		.topsubIn a {
			font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
		}
		.topsub {
		    position: relative;
		    max-width: 1170px;
		    margin: 0 auto;
		    padding-top: 30px;
		}
		.topsub:after {
		    content: '';
		    display: block;
		    clear: both;
		}
		.topsub .topsubIn {
		    float: left;
		    padding-top: 10px;
		}
		.topsub .topsubIn:after {
		    content: '';
		    display: block;
		    clear: both;
		}
		.topsub .topsubIn .home {
		    float: left;
		    display: block;
		    width: 36px;
		    height: 30px;
		    border-right: 1px solid #e1e1e1;
		    background: url(https://adventure.lotteworld.com/common/images/btn/home_btn.png) no-repeat 0 50%;
		}
		.topsub .topsubIn > div.one {
		    margin-left: 26px;
		}
		.topsub .topsubIn > div {
		    float: left;
		    position: relative;
		    margin-left: 20px;
		}
		.topsub .topsubIn > div > a {
		    display: block;
		    padding-right: 42px;
		    height: 30px;
		    font-size: 16px;
		    color: #555;
		    line-height: 28px;
		    background: url(https://adventure.lotteworld.com/common/images/icon/lnb_icon.png) no-repeat right 0 top 50%;
		}
		.topsub .topsubIn > div > div {
	    	position: absolute;
		    top: 50px;
		    left: -26px;
		    padding: 25px;
		    border: 1px solid #e1e1e1;
		    background: #fff;
		    display: none
		}
		.topsub .topsubIn > div > div a:first-child {
		    margin-top: 0;
		}
		.topsub .topsubIn > div > div a {
		    display: block;
		    font-size: 16px;
		    color: #555;
		    white-space: nowrap;
		    margin-top: 17px;
		}
		.shareprint {
			float: right;
		}
		.shareprint a {
			display: block;
		    width: 50px;
		    height: 50px;
		}
		.share {
			position: relative;
			float : left;
		}
		.shareimg {
			background: url(https://adventure.lotteworld.com/common/images/btn/share_btn.png) no-repeat 50% 50%;
		}
		.shareimg:hover {
			background: url(https://adventure.lotteworld.com/common/images/btn/share_btn_on.png) no-repeat 50% 50%;
		}
		.print {
			float : left;
			margin-left: 10px;
			background: url(https://adventure.lotteworld.com/common/images/btn/print_btn.png) no-repeat 50% 50%;
		}
		.sharesub {
			position: absolute;
		    top: 50px;
		    left: 0;
		    display: none;
		}
		.sharesub a {
			margin-top: 10px;
		}
		.facebook {
			background: url(https://adventure.lotteworld.com/common/images/btn/facebook_btn.png) no-repeat 50% 50%;
		}
		.facebook:hover {
			background: url(https://adventure.lotteworld.com/common/images/btn/facebook_btn_on.png) no-repeat 50% 50%;
		}
		.twiter {
			background: url(https://adventure.lotteworld.com/common/images/btn/twitter_btn.png) no-repeat 50% 50%;
		}
		.twiter:hover {
			background: url(https://adventure.lotteworld.com/common/images/btn/twitter_btn_on.png) no-repeat 50% 50%;
		}
		.copy {
			background: url(https://adventure.lotteworld.com/common/images/btn/link_btn.png) no-repeat 50% 50%;
		}
		.copy:hover {
			background: url(https://adventure.lotteworld.com/common/images/btn/link_btn_on.png) no-repeat 50% 50%;
		}
		.shareprint:after {
			content: '';
		    display: block;
		    clear: both;
		}
		.title {
			font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    font-size: 50px;
		    color: #000;
		    text-align: center;
		    padding-top: 40px;
		}
		.menulistBox {
			position: relative;
		    width: 1170px;
		    margin: 0 auto;
		    display: table;
		    table-layout: fixed;
		    margin: 80px auto 0;
		}
		.menulistBox a:first-child {
			border-left: 1px solid #e1e1e1;
		}
		.menulistBox a:nth-child(-n+6) {
			border-top: 1px solid #e1e1e1;
		}
		.menulistBox a {
			height: 65px;
			padding: 20px 0;
		    display: table-cell;
		    vertical-align: middle;
		    height: 100%;
		    box-sizing: border-box;
		    border: 1px solid #e1e1e1;
		    border-left: 0;
		    border-top: 0;
		    background: #fff;
		    font-size: 18px;
		    color: #000;
		    text-align: center;
		}
		.menulist1.on {
			border-color: #550adf !important;
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    color: #fff;
		    background: rgb(111, 35, 249);
		    background: -ms-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -o-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -moz-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -webkit-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		}
		.menulist2.on {
			border-color: #550adf !important;
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    color: #fff;
		    background: rgb(111, 35, 249);
		    background: -ms-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -o-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -moz-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -webkit-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		}
		.menulist3.on {
			border-color: #550adf !important;
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    color: #fff;
		    background: rgb(111, 35, 249);
		    background: -ms-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -o-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -moz-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -webkit-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		}
		.menulist4.on {
			border-color: #550adf !important;
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    color: #fff;
		    background: rgb(111, 35, 249);
		    background: -ms-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -o-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -moz-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -webkit-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		}
		.mainwrap {
			margin-top: 80px;
		}
		.main {
			width: 1184px;
    		margin: 0 auto;
		}
		.main:after {
			content: "";
		    display: block;
		    clear: both;
		}
		.main a:first-child, .main a:nth-of-type(2), .main a:nth-of-type(3), .main a:nth-of-type(4) {
			margin-top: 0px;
		}
		.main a {
			display: block;
		    float: left;
		    width: 214px;
		    height: 238px;
		    padding: 50px 30px;
		    margin-right: 22px;
		    margin-top: 22px;
		    text-align: center;
		    position: relative;
		}
		.main a:hover:before {
			display: block;
		    content: "";
		    width: 100%;
		    height: 100%;
		    position: absolute;
		    top: -1px;
		    left: -1px;
		    border: 2px solid #550daf;
		}
		.main a:before {
			display: block;
		    content: "";
		    width: 100%;
		    height: 100%;
		    position: absolute;
		    top: 0;
		    left: 0;
		    border: 1px solid #e1e1e1;
		}
		.main .img {
			display: inline-block;
    		position: relative;
		}
		.main a .icon {
			display: block;
		}
		.main a .hover {
			display: none;	
		}
		.main a .name {
			font-size: 22px;
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    line-height: 30px;
		    color: #000;
		    margin-top: 15px;
		}
		.main a .eng {
			font-size: 16px;
		    line-height: 22px;
		    color: #777;
		}
		.main a .location {
			font-size: 16px;
		    line-height: 24px;
		    padding-left: 30px;
		    text-align: left;
		    background: url(https://adventure.lotteworld.com/common/images/icon/local_icon.png) no-repeat 10px 4px;
		    position: absolute;
		    top: 260px;
		    left: 30px;
		    width: 180px;
		}
		.content {
			position: relative;
		    width: 1170px;
	    	margin: 0 auto;
	    	display: none;
		}
		.top {
			width: 1110px;
		    margin: 80px auto 0;
		    border-top: 2px solid #000;
		    background: #f4f4f4;
		    padding: 30px;
		    text-align: center;
		}
		.top p:first-child {
			width: 80px;
		    height: 80px;
		    margin: 0 auto;
		    border-radius: 40px;
		    box-shadow: 2px 10px 20px rgb(85 85 85 / 10%);
		}
		.top p:first-child img{
			border: none;
    		vertical-align: top;
		}
		.top p:nth-of-type(2) {
			font-size: 28px;
		    font-family: 'NotoSans-Regular', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    line-height: 30px;
		    color: #000;
		    margin-top: 17px;
		}
		.top p:nth-of-type(3) {
			font-size: 16px;
		    line-height: 30px;
		    color: #777;
		    margin-top: 10px;
		}
		.middle {
			margin-top: 50px;
		}
		.middle .subtitle:first-child {
			margin-top: 0;
		}
		.middle .subtitle {
			margin-top: 50px;
			font-size: 22px;
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    line-height: 28px;
		    color: #000;
		    margin-bottom: 10px;
		}
		.middle .subcontent {
			font-size: 16px;
		    line-height: 28px;
		    color: #777;
		}
		ul, li {
			list-style: none;
		}
		.middle ul {
			margin-top: 25px;
		    padding-top: 25px;
		    border-top: 1px dotted #d8d8d8;
		}
		.middle ul li {
			position: relative;
		    padding-left: 15px;
		    line-height: 28px;
		}
		.middle ul li:before {
			display: block;
		    content: "";
		    background: url(https://adventure.lotteworld.com/common/images/icon/dot_list.png) no-repeat 0 center;
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 4px;
		    height: 28px;
		}
		.middle .maptitle {
			margin-top: 50px;
		    font-size: 22px;
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    line-height: 28px;
		    color: #000;
		    margin-bottom: 10px;
		}
		.locationbutton {
		    display: block;
			background: url(https://adventure.lotteworld.com/common/images/icon/map_icon.png) no-repeat 0 7px;
    		color: #555;
    		font-size: 16px;
		    line-height: 30px;
		    padding-left: 24px;
		}
		.locationbutton.on {
			background: url(https://adventure.lotteworld.com/common/images/icon/map_icon_on.png) no-repeat 0 7px;
    		color: #000;
		}
		.map .realmap {
			border: 1px solid #e1e1e1;
    		margin-top: 25px;
    		display: block;
		}
		.realmap img {
		    border: none;
		    vertical-align: top;
		}
		.bottom {
			text-align: center;
    		margin-top: 60px;
		}
		.bottom a {
			display: inline-block;
		    padding: 0 70px;
		    height: 56px;
		    line-height: 54px;
		    font-size: 18px;
		    color: #fff;
		    text-align: center;
		    border-radius: 28px;
		    background: rgb(111, 35, 249);
		    background: -ms-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -o-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -moz-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -webkit-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		}
		.subtel {
			font-size: 16px;
		    line-height: 28px;
		    padding-left: 24px;
		    background: url(https://adventure.lotteworld.com/common/images/icon/tel_icon.gif) no-repeat 0 8px;
		}
		.middle .subbutton {
			padding: 0 20px;
		    line-height: 32px;
		    height: 32px;
		    font-size: 15px;
		    font-family: 'NotoSans-Medium', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    margin-top: 14px;
		}
		.subbutton {
			display: inline-block;
		    padding: 0 68px;
		    height: 52px;
		    line-height: 50px;
		    font-size: 18px;
		    font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    color: #550adf;
		    text-align: center;
		    border: 2px solid #550adf;
		    border-radius: 30px;
		}
		.bold {
			margin-right: 15px;
			font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif !important;
		}
		.redTxt {
		    position: absolute;
		    top: 20px;
		    left: 20px;
		    color: red;
		    font-weight: bold;
		}
	</style>
	<script>
		function view() {
			if($(".moremenu").css('display')=='none') {
				if($(".moremenu2").css('display')=='block') {
					$(".moremenu2").slideUp();
				}
				if($(".moremenu3").css('display')=='block') {
					$(".moremenu3").slideUp();
				}
				if($(".sharesub").css('display')=='block'){
					$(".sharesub").slideUp();
				}
			} else if($(".moremenu").css('display')=='block'){
			}
			$(".moremenu").slideToggle();
		}
		function view2() {
			if($(".moremenu2").css('display')=='none') {
				if($(".moremenu").css('display')=='block') {
					$(".moremenu").slideUp();
				}
				if($(".moremenu3").css('display')=='block') {
					$(".moremenu3").slideUp();
				}
				if($(".sharesub").css('display')=='block'){
					$(".sharesub").slideUp();
				}
			} else if($(".moremenu2").css('display')=='block'){
			}
				$(".moremenu2").slideToggle();
		}
		function view3() {
			if($(".moremenu3").css('display')=='none'){
				if($(".moremenu").css('display')=='block'){
					$(".moremenu").slideUp();
				}
				if($(".moremenu2").css('display')=='block'){
					$(".moremenu2").slideUp();
				}
				if($(".sharesub").css('display')=='block'){
					$(".sharesub").slideUp();
				}
			} else if($(".moremenu3").css('display')=='block'){
			}
			$(".moremenu3").slideToggle();
		}
		function shareview() {
			if($(".sharesub").css('display')=='none'){
				if($(".moremenu").css('display')=='block'){
					$(".moremenu").slideUp();
				}
				if($(".moremenu2").css('display')=='block'){
					$(".moremenu2").slideUp();
				}
				if($(".moremenu3").css('display')=='block'){
					$(".moremenu3").slideUp();
				}
			} else if($(".sharesub").css('display')=='block'){
			}
			$(".sharesub").slideToggle();
		}
		function copy() {
			var url = '';    // <a>태그에서 호출한 함수인 clip 생성
	        var textarea = document.createElement("textarea");  
	        //url 변수 생성 후, textarea라는 변수에 textarea의 요소를 생성
	        
	        document.body.appendChild(textarea); //</body> 바로 위에 textarea를 추가(임시 공간이라 위치는 상관 없음)
	        url = window.document.location.href;  //url에는 현재 주소값을 넣어줌
	        textarea.value = url;  // textarea 값에 url를 넣어줌
	        textarea.select();  //textarea를 설정
	        document.execCommand("copy");   // 복사
	        document.body.removeChild(textarea); //extarea 요소를 없애줌
	        
	        alert("복사되었습니다.")  // 알림창
		}
		$(function() {
			var urlStr = $(location).attr("href");
			const url = new URL(urlStr);
			const urlParam = url.searchParams;
			if(urlParam.get('num')==4){
				$(".main").hide();
				$(".content").eq(4).show();
				$(".content").eq(4).find(".middle").find(".map").find(".locationbutton").eq(0).toggleClass('on');
			}else if(urlParam.get('num')==6) {
				$(".main").hide();
				$(".content").eq(6).show();
				$(".content").eq(6).find(".middle").find(".map").find(".locationbutton").eq(0).toggleClass('on');
			}
			
			var select = $(".moremenu2box").text();
			var list = $(".moremenu2List");
			for(var i = 0; i <= 4; i++){
				if(list.eq(i).text() == select){
					list.eq(i).css('font-family', 'NotoSans-bold');
					list.eq(i).css('color', '#000');
					break;
				}
			}
			
			var select2 = $(".moremenu3box");
			var list2 = $(".moremenu3List");
			select2.css({'font-family': 'NotoSans-bold','color': '#000' });
			for(var i = 0; i <= 3; i++){
				if(list2.eq(i).text() == select2.text()){
					list2.eq(i).css('font-family', 'NotoSans-bold');
					list2.eq(i).css('color', '#000');
					break;
				}
			}
			
			$(".menulist2").toggleClass('on');
			
			$(".listbox").hover(function() {
				$(this).find(".icon").css('display', 'none');
				$(this).find(".hover").css('display','block')
			}, function() {
				$(this).find(".hover").css('display','none')
				$(this).find(".icon").css('display','block')
			});
			<%
				if(request.getAttribute("num") != null) {
					int num = (Integer)request.getAttribute("num");
			%>
				$(".main").hide();
				$(".content").eq(<%= num %>).show();
				$(".content").eq(<%= num %>).find(".middle").find(".map").find(".locationbutton").eq(0).toggleClass('on');
			<%
				}
			%>
			$(".listbox").eq(0).click(function() {
				$(".main").hide();
				$(".content").eq(0).show();
				$(".content").eq(0).find(".middle").find(".map").find(".locationbutton").eq(0).toggleClass('on');
			});
			$(".listbox").eq(1).click(function() {
				$(".main").hide();
				$(".content").eq(1).show();
				$(".content").eq(1).find(".middle").find(".map").find(".locationbutton").eq(0).toggleClass('on');
			});
			$(".listbox").eq(2).click(function() {
				$(".main").hide();
				$(".content").eq(2).show();
				$(".content").eq(2).find(".middle").find(".map").find(".locationbutton").eq(0).toggleClass('on');
			});
			$(".listbox").eq(3).click(function() {
				$(".main").hide();
				$(".content").eq(3).show();
				$(".content").eq(3).find(".middle").find(".map").find(".locationbutton").eq(0).toggleClass('on');
			});
			$(".listbox").eq(4).click(function() {
				$(".main").hide();
				$(".content").eq(4).show();
				$(".content").eq(4).find(".middle").find(".map").find(".locationbutton").eq(0).toggleClass('on');
			});
			$(".listbox").eq(5).click(function() {
				$(".main").hide();
				$(".content").eq(5).show();
				$(".content").eq(5).find(".middle").find(".map").find(".locationbutton").eq(0).toggleClass('on');
			});
			$(".listbox").eq(6).click(function() {
				$(".main").hide();
				$(".content").eq(6).show();
				$(".content").eq(6).find(".middle").find(".map").find(".locationbutton").eq(0).toggleClass('on');
			});
			$(".listbox").eq(7).click(function() {
				$(".main").hide();
				$(".content").eq(7).show();
				$(".content").eq(7).find(".middle").find(".map").find(".locationbutton").eq(0).toggleClass('on');
			});
			$(".listbox").eq(8).click(function() {
				$(".main").hide();
				$(".content").eq(8).show();
				$(".content").eq(8).find(".middle").find(".map").find(".locationbutton").eq(0).toggleClass('on');
			});
			$(".listbox").eq(9).click(function() {
				$(".main").hide();
				$(".content").eq(9).show();
				$(".content").eq(9).find(".middle").find(".map").find(".locationbutton").eq(0).toggleClass('on');
			});
			$(".listbox").eq(10).click(function() {
				$(".main").hide();
				$(".content").eq(10).show();
				$(".content").eq(10).find(".middle").find(".map").find(".locationbutton").eq(0).toggleClass('on');
			});
			$(".listbox").eq(11).click(function() {
				$(".main").hide();
				$(".content").eq(11).show();
				$(".content").eq(11).find(".middle").find(".map").find(".locationbutton").eq(0).toggleClass('on');
			});
				
			$(".realbutton").click(function() {
				$(".content").hide();
				$(".main").show();
			});
			
			$(".locationbutton").click(function() {
				var num = $(this).index();
				for(var i = 0; i <= 4; i++){
					if(i == num){
						$(this).parent().find(".realmap").eq(i).show();	
						$(this).parent().find(".locationbutton").eq(i).addClass('on');	
					} else {
						$(this).parent().find(".realmap").eq(i).hide();
						if($(this).parent().find(".locationbutton").eq(i).attr("class")== "locationbutton on"){
							$(this).parent().find(".locationbutton").eq(i).toggleClass('on');	
						}
					}
				}
			});
			$(".menu").load("lotte/Menu.jsp");
			$(".footer").load("lotte/Footer.html");
		});
	</script>
</head>
<body>
	<div id="wrapper">
	<div class="menu"></div>
	<div class="body">
		<div class="wrap">
			<div class="topsub">
				<div class="topsubIn">
					<a href="LotteController?command=lotteMain" class="home"></a>
						<div class="one">
							<a href="javascript:void(0)" onclick="view()" class="moremenuclick">이용가이드</a>
							<div class="moremenu" style="z-index : 15; display : none;">
								<a href="LotteController?command=Attraction" class="moremenulist" style="margin-top : 0px;">즐길거리</a>
								<a href="LotteController?command=Charge" class="moremenulist">요금/우대혜택</a>
	 							<a href="LotteController?command=Performance" class="moremenulist">참여프로그램</a>
								<a href="LotteController?command=Suspension" class="moremenulist">이용가이드</a>
								<a href="LotteController?command=Notice" class="moremenulist">소통서비스</a>
							</div>
						</div>
						<div class="two">
							<a class="moremenu2box" href="javascript:void(0)" onclick="view2()">편의시설/제도</a>
							<div class="moremenu2" style="z-index : 15; display : none;">
								<a href="LotteController?command=Suspension" class="moremenu2List" style="margin-top : 0px;">운영/운휴</a>
	 							<a href="LotteController?command=Park" class="moremenu2List">파크 이용안내</a>
								<a href="LotteController?command=Facility" class="moremenu2List">편의시설/제도</a>
								<a href="LotteController?command=Comming" class="moremenu2List">오시는 길</a>
								<a href="LotteController?command=Guidemap" class="moremenu2List">가이드맵</a>
							</div>
						</div>
						<div class="three">
							<a class="moremenu3box" href="javascript:void(0)" onclick="view3()">편의시설</a>
							<div class="moremenu3" style="z-index : 15; display : none">
								<a class="moremenu3List" href="javascript:notReady()" style="margin-top : 0px;">모바일 APP</a>
	 							<a class="moremenu3List" href="LotteController?command=Facility">편의시설</a>
		 						<a class="moremenu3List" href="javascript:notReady()">매직패스 제도</a>
		 						<a class="moremenu3List" href="javascript:notReady()">장애인 편의제도</a>
							</div>
						</div>
				</div> <!-- topsubIn -->
				<div class="shareprint">
					<div class="share">
					<a href="javascript:void(0)" onclick="shareview()"class="shareimg"></a>
						<div class="sharesub" style="z-index:15; display:none;">
							<a href="https://www.facebook.com/login.php?skip_api_login=1&api_key=966242223397117&signed_next=1&next=https%3A%2F%2Fwww.facebook.com%2Fsharer%3Fu%3Dhttps%253A%252F%252Fadventure.lotteworld.com%252Fkor%252Fenjoy%252Frestaurant%252Flist.do&cancel_url=https%3A%2F%2Fwww.facebook.com%2Fdialog%2Fclose_window%2F%3Fapp_id%3D966242223397117%26connect%3D0%23_%3D_&display=popup&locale=ko_KR" class="facebook" target="_blank"></a>
							<a href="https://twitter.com/intent/tweet?text=&url=https%3A%2F%2Fadventure.lotteworld.com%2Fkor%2Fenjoy%2Frestaurant%2Flist.do" class="twiter" target="_blank"></a>
							<a href="javascript:void(0)" onclick="copy()" class="copy"></a>
						</div>
					</div> <!-- share -->
					<a href="javascript:void(0)" onclick="window.print()" class="print"></a>
				</div> <!-- shareprint -->
			</div> <!-- topsub -->
			<h2 class="title">편의시설/제도</h2>
			<div class="menulistBox">
				<a href="javascript:notReady()" class="menulist1">
					<span>모바일 APP</span>
				</a>
				<a href="Facility.html" class="menulist2">
					<span>편의시설</span>
				</a>
				<a href="javascript:notReady()" class="menulist3">
					<span>매직패스 제도</span>
				</a>
				<a href="javascript:notReady()" class="menulist4">
					<span>장애인 편의제도</span>
				</a>
			</div> <!-- menulistBox -->
			<div class="mainwrap">
				<div class="main">
					<a class="listbox" href="javascript:void(0)">
						<p class="img">
							<img class="icon" src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon2.png"/>
							<span class="hover">
								<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon2_hover.png"/>
							</span>
						</p>
						<p class="name">손님상담실</p>
						<p class="eng">(Guest Relations)</p>
						<p class="location">어드벤처 1층<br/>
						(만남의광장 안쪽)
						</p>
					</a>
					<a class="listbox" href="javascript:void(0)">
						<p class="img">
							<img class="icon" src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon3.png"/>
							<span class="hover">
								<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon3_hover.png"/>
							</span>
						</p>
						<p class="name">유모차 대여소</p>
						<p class="eng">(Stroller Rentals)</p>
						<p class="location">어드벤처 1층<br/>
						(손님상담실)
						</p>
					</a>
					<a class="listbox" href="javascript:void(0)">
						<p class="img">
							<img class="icon" src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon4.png"/>
							<span class="hover">
								<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon4_hover.png"/>
							</span>
						</p>
						<p class="name">휠체어 대여소</p>
						<p class="eng">(Wheelchair Rentals)</p>
						<p class="location">어드벤처 1층<br/>
						(손님상담실)
						</p>
					</a>
					<a class="listbox" href="javascript:void(0)">
						<p class="img">
							<img class="icon" src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon5.png"/>
							<span class="hover">
								<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon5_hover.png"/>
							</span>
						</p>
						<p class="name">의무실</p>
						<p class="eng">(First Aid)</p>
						<p class="location">어드벤처 1층<br/>
						(손님상담실 맞은편) 외 2곳
						</p>
					</a>
					<a class="listbox" href="javascript:void(0)">
						<p class="img">
							<img class="icon" src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon6.png"/>
							<span class="hover">
								<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon6_hover.png"/>
							</span>
						</p>
						<p class="redTxt">* 신분증 인증 필요</p>
						<p class="name">흡연실</p>
						<p class="eng">(Smoking Area)</p>
						<p class="location">자이로스윙 입구 좌측<br/>
						(석촌호수변)
						</p>
					</a>
					<a class="listbox" href="javascript:void(0)">
						<p class="img">
							<img class="icon" src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon7.png"/>
							<span class="hover">
								<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon7_hover.png"/>
							</span>
						</p>
						<p class="name">유아휴게실</p>
						<p class="eng">(Baby Care Center)</p>
						<p class="location">어드벤처 1층<br/>
						(만남의광장 안쪽) 외 2곳
						</p>
					</a>
					<a class="listbox" href="javascript:void(0)">
						<p class="img">
							<img class="icon" src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon8.png"/>
							<span class="hover">
								<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon8_hover.png"/>
							</span>
						</p>
						<p class="name">미아보호소</p>
						<p class="eng">(Lost Children)</p>
						<p class="location">어드벤처 1층<br/>
						(손님상담실)
						</p>
					</a>
					<a class="listbox" href="javascript:void(0)">
						<p class="img">
							<img class="icon" src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon9.png"/>
							<span class="hover">
								<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon9_hover.png"/>
							</span>
						</p>
						<p class="name">현금지급기</p>
						<p class="eng">(ATM)</p>
						<p class="location">어드벤처 1층<br/>
						(민속박물관 엘리베이터 앞) 외 4곳
						</p>
					</a>
					<a class="listbox" href="javascript:void(0)">
						<p class="img">
							<img class="icon" src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon10.png"/>
							<span class="hover">
								<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon10_hover.png"/>
							</span>
						</p>
						<p class="name">분실물 센터</p>
						<p class="eng">(Lost & Found)</p>
						<p class="location">어드벤처 1층<br/>
						(손님상담실)
						</p>
					</a>
					<a class="listbox" href="javascript:void(0)">
						<p class="img">
							<img class="icon" src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon11.png"/>
							<span class="hover">
								<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon11_hover.png"/>
							</span>
						</p>
						<p class="name">물품보관함</p>
						<p class="eng">(Locker Rentals)</p>
						<p class="location">어드벤처 지하 1층 언더랜드 외 9곳
						</p>
					</a>
					<a class="listbox" href="javascript:void(0)">
						<p class="img">
							<img class="icon" src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon12.png"/>
							<span class="hover">
								<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon12_hover.png"/>
							</span>
						</p>
						<p class="name">보조배터리 대여 장소</p>
						<p class="eng">(CELL PHONE POWER<br/>
						BANK STATION)</p>
						<p class="location">어드벤처 1층<br/>
						거울미로 외 3곳
						</p>
					</a>
					<a class="listbox" href="javascript:void(0)">
						<p class="img">
							<img class="icon" src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon14.png"/>
							<span class="hover">
								<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon14_hover.png"/>
							</span>
						</p>
						<p class="name">파크 내 티켓 키오스크</p>
						<p class="eng">(Ticket Kiosk)</p>
						<p class="location">총 4개소
						</p>
					</a>
				</div> <!-- main -->
			</div> <!-- mainwrop -->
			<div class="content">
				<div class="top">
					<p>
						<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon2_on.png"/>
					</p>
					<p>손님상담실 (Guest Relations)</p>
					<p>불편하신 점이나 파크 이용에 대해 궁금하신 점이 있으시다면 도움을 드립니다.</p>
				</div>
				<div class="middle">
					<p class="subtitle">제공 서비스</p>
					<p class="subcontent">손님상담실에서는 아래와 같은 서비스를 제공하고 있습니다.</p>
					<ul>
						<li>각종 분실물 접수</li>
						<li>미아접수 및 보호</li>
						<li>불편사항 접수 및 상담</li>
						<li>티켓 관련 안내</li>
						<li>기타 기본 서비스 : 가이드맵 제공, 공연시간 안내, 어트랙션 및 주요 편의시설 위치 안내 등</li>
					</ul>
					<p class="maptitle">위치</p>
					<div class="map">
						<a class="locationbutton" href="javascript:void(0)">어드벤처 1층 만남의광장 안쪽</a>
						<div class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img2.jpg"/>
						</div> <!-- realmap -->
					</div> <!-- map -->
				</div> <!-- middle -->
				<div class="bottom">
					<a class="realbutton" href="javascript:void(0)">목록</a>
				</div> <!-- bottom -->
			</div> <!-- content -->
			<div class="content">
				<div class="top">
					<p>
						<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon3_on.png"/>
					</p>
					<p>유모차 대여소(Stroller Rentals)</p>
					<p>가족 손님께 파크 내에서 사용 가능한 유모차를 대여해 드리고 있습니다.</p>
				</div>
				<div class="middle">
					<p class="subtitle">이용기준</p>
					<p class="subcontent">유모차는 36개월 미만 어린이만 이용하실 수 있습니다.</p>
					<p class="subtitle">이용문의</p>
					<p class="subtel">02-411-2111</p>
					<p class="maptitle">위치</p>
					<div class="map">
						<a class="locationbutton" href="javascript:void(0)">어드벤처 1층 손님상담실(만남의광장 안쪽)</a>
						<div class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img2.jpg"/>
						</div> <!-- realmap -->
					</div> <!-- map -->
				</div> <!-- middle -->
				<div class="bottom">
					<a class="realbutton" href="javascript:void(0)">목록</a>
				</div> <!-- bottom -->
			</div> <!-- content -->
			<div class="content">
				<div class="top">
					<p>
						<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon4_on.png"/>
					</p>
					<p>휠체어 대여소(Wheelchair Rentals)</p>
					<p>몸이 불편하신 손님께 파크 내에서 사용 가능한 휠체어를 대여해 드리고 있습니다.</p>
				</div>
				<div class="middle">
					<p class="subtitle">이용기준</p>
					<p class="subcontent">보행이 어려운 손님을 대상으로 선착순으로 대여해 드리고 있습니다.<br/>
						별도로 개인 휠체어와 함께 파크에 입장하실 수도 있습니다.</p>
					<p class="subtitle">장애인 편의제도</p>
					<p class="subcontent">롯데월드 어드벤처는 이 외에도 다양한 장애인 편의제도를 시행하고 있습니다.</p>
					<a href="www.com" class="subbutton">장애인 편의제도 안내 바로가기</a>
					<p class="maptitle">위치</p>
					<div class="map">
						<a class="locationbutton" href="javascript:void(0)">어드벤처 1층 손님상담실(만남의광장 안쪽)</a>
						<div class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img2.jpg"/>
						</div> <!-- realmap -->
					</div> <!-- map -->
				</div> <!-- middle -->
				<div class="bottom">
					<a class="realbutton" href="javascript:void(0)">목록</a>
				</div> <!-- bottom -->
			</div> <!-- content -->
			<div class="content">
				<div class="top">
					<p>
						<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon5_on.png"/>
					</p>
					<p>의무실(First Aid)</p>
					<p>몸이 아프시거나 이상이 있어 도움이 필요하시다면 의무실을 방문해 주세요.</p>
				</div>
				<div class="middle">
					<p class="subtitle">제공 서비스</p>
					<p class="subcontent">증상에 따라 간단한 응급처치 및 상담을 해드리고 있습니다.<br/>
					약이 필요하시다면 준비된 약품에 한해 지급해 드리고 있으며, 휴식이 필요하시면 침상을 이용할 수도 있습니다.<br/>
					의무실까지 걷지 못할 경우에는 주변의 캐스트에게 도움을 요청하시면 휠체어 등을 통해 의무실로 이동하실 수 있도록 도와드립니다.</p>
					<p class="subtitle">응급상황 발생 시</p>
					<p class="subcontent">가까운 병원으로 이동하실 수 있도록 119 신고를 도와드리고 있습니다.<br/>
					파크 내 의무실에는 자동심장충격기(AED)가 마련되어 있습니다.</p>
					<p class="subtitle">이용문의</p>
					<p class="subtel">02-411-3482(어드벤처)</p>
					<p class="subtel">02-411-3484(매직아일랜드)</p>
					<p class="subtel">02-411-4802(아이스링크)</p>
					<p class="maptitle">위치</p>
					<div class="map">
						<a class="locationbutton" href="javascript:void(0)">어드벤처 1층 손님상담실(만남의광장 안쪽)</a>
						<a class="locationbutton" href="javascript:void(0)">매직아일랜드 제네바유람선 옆</a>
						<a class="locationbutton" href="javascript:void(0)">아이스링크 옆</a>
						<div class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img2.jpg"/>
						</div> <!-- realmap -->
						<div style="display:none;" class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img5_2.jpg"/>
						</div>
						<div style="display:none;" class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img5_3.jpg"/>
						</div>
					</div> <!-- map -->
				</div> <!-- middle -->
				<div class="bottom">
					<a class="realbutton" href="javascript:void(0)">목록</a>
				</div> <!-- bottom -->
			</div> <!-- content -->
			<div class="content">
				<div class="top">
					<p>
						<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon6_on.png"/>
					</p>
					<p>흡연실 (Smoking Area)</p>
					<p>모든 손님들의 쾌적한 파크 이용을 위하여 흡연은 지정된 흡연실에서만 가능합니다.</p>
				</div>
				<div class="middle">
					<p class="subtitle">유의사항</p>
					<p class="subcontent">흡연은 흡연실에서만 가능하며, 미성년자의 흡연은 금지되어 있습니다.<br/>
					흡연실 입장 시 신분증인증기(주민등록증, 운전면허증, 외국인등록증)로 성인 확인 후 이용 가능합니다.</p>
					<p class="maptitle">위치</p>
					<div class="map">
						<a class="locationbutton" href="javascript:void(0)">자이로스윙 입구 좌측(석촌호수변)</a>
						<div class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img6.jpg"/>
						</div> <!-- realmap -->
					</div> <!-- map -->
				</div> <!-- middle -->
				<div class="bottom">
					<a class="realbutton" href="javascript:void(0)">목록</a>
				</div> <!-- bottom -->
			</div> <!-- content -->
			<div class="content">
				<div class="top">
					<p>
						<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon7_on.png"/>
					</p>
					<p>유아휴게실(Baby Care Center)</p>
					<p>기저귀 교환, 아기 식사 등 우리의 베이비 손님들이 편안하게 이용할 수 있는 공간입니다.</p>
				</div>
				<div class="middle">
					<p class="subtitle">제공 서비스</p>
					<p class="subcontent">유아휴게실에서는 아래와 같은 서비스를 제공하고 있습니다.</p>
					<ul>
						<li>기저귀 교환대</li>
						<li>프라이버시가 지켜질 수 있는 수유 공간</li>
						<li>전자레인지, 정수기, 싱크대</li>
					</ul>
					<p class="subtitle">기저귀 교환만 필요한 경우</p>
					<p class="subcontent">다수의 화장실 내부에도 기저귀 교환대가 마련되어 있으니 기저귀 교환만 필요한 손님께서는 인근 화장실을 찾아주세요.</p>
					<p class="subtitle">이용문의</p>
					<p class="subtel">02-211-2111</p>
					<p class="maptitle">위치</p>
					<div class="map">
						<a class="locationbutton" href="javascript:void(0)">어드벤처 1층 만남의광장 안쪽</a>
						<a class="locationbutton" href="javascript:void(0)">어드벤처 1층(키즈토리아 내)>키즈토리아 이용 손님만 이용가능</a>
						<a class="locationbutton" href="javascript:void(0)">매직아일랜드 의무실(제네바유람선 옆)</a>
						<div class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img2.jpg"/>
						</div> <!-- realmap -->
						<div style="display:none;" class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img7_2.jpg"/>
						</div> <!-- realmap -->
						<div style="display:none;" class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img7_3.jpg"/>
						</div> <!-- realmap -->
					</div> <!-- map -->
				</div> <!-- middle -->
				<div class="bottom">
					<a class="realbutton" href="javascript:void(0)">목록</a>
				</div> <!-- bottom -->
			</div> <!-- content -->
			<div class="content">
				<div class="top">
					<p>
						<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon8_on.png"/>
					</p>
					<p>미아보호소(Lost Children)</p>
					<p>아이를 잃어버리신 경우, 찾아드리거나 보호하고 있으니 미아보호소를 방문해 주세요.</p>
				</div>
				<div class="middle">
					<p class="subtitle">캐스트가 먼저 아이를 발견한 경우</p>
					<p class="subcontent">아이가 보호자를 잃어버린 경우, 인근 캐스트 혹은 시큐리티 직원들이 아이와 함께 미아보호소를 찾게 되어 있습니다.<br/>
					혹시 아이를 잃어버리셨다면 이미 미아보호소에 있을 수 있으니 미아보호소를 방문해 주세요.</p>
					<p class="subtitle">미아보호소에 아이가 없는 경우</p>
					<p class="subcontent">걱정하지 마세요.<br/>
					아이의 인상착의를 알려주시면 무전을 통해 파크 전체에 있는 캐스트와 직원들이 아이를 찾도록 바로 도와드립니다.</p>
					<p class="subtitle">아이가 있다면 미아방지 팔찌를 해보세요</p>
					<p class="subcontent">아이와 함께 방문하셨다면 입장 후 게이트 인근 혹은 안내데스크에서 미아방지 팔찌를 채워주세요.<br/>
					혹시 아이와 헤어지게 되면 보다 빠르게 보호자를 찾아드리는 데 도움이 됩니다.</p>
					<p class="subtitle">이용문의</p>
					<p class="subtel">02-211-2111</p>
					<p class="maptitle">위치</p>
					<div class="map">
						<a class="locationbutton" href="javascript:void(0)">어드벤처 1층 손님상담실(만남의광장 안쪽)</a>
						<div class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img2.jpg"/>
						</div> <!-- realmap -->
					</div> <!-- map -->
				</div> <!-- middle -->
				<div class="bottom">
					<a class="realbutton" href="javascript:void(0)">목록</a>
				</div> <!-- bottom -->
			</div> <!-- content -->
			<div class="content">
				<div class="top">
					<p>
						<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon9_on.png"/>
					</p>
					<p>현금지급기(ATM)</p>
					<p>현금이 필요하시다면 가까운 현금지급기를 이용해주세요.</p>
				</div>
				<div class="middle">
					<p class="subtitle">유의사항</p>
					<p class="subcontent">다양한 카드를 통해 현금을 인출하실 수 있습니다. 단, 수수료가 발생할 수 있습니다.<br/>
					환전이 필요한 손님은 정문 게이트 앞에 있는 매표소에서 환전 서비스를 제공하고 있으니 참고하시기 바랍니다.</p>
					<p class="maptitle">위치</p>
					<div class="map">
						<a class="locationbutton" href="javascript:void(0)">어드벤처 1층(민속박물관 엘리베이터 앞)</a>
						<a class="locationbutton" href="javascript:void(0)">어드벤처 1층 의무실 인근(만남의광장 안쪽)</a>
						<a class="locationbutton" href="javascript:void(0)">어드벤처 2층(매직아일랜드 입구 앞)</a>
						<a class="locationbutton" href="javascript:void(0)">매직아일랜드 매직캐슬 1층</a>
						<a class="locationbutton" href="javascript:void(0)">민속박물관 매표소 앞</a>
						<div class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img9_1.jpg"/>
						</div> <!-- realmap -->
						<div style="display:none;" class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img9_3.jpg"/>
						</div> <!-- realmap -->
						<div style="display:none;" class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img9_2.jpg"/>
						</div> <!-- realmap -->
						<div style="display:none;" class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img9_4.jpg"/>
						</div> <!-- realmap -->
						<div style="display:none;" class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img9_5.jpg"/>
						</div> <!-- realmap -->
					</div> <!-- map -->
				</div> <!-- middle -->
				<div class="bottom">
					<a class="realbutton" href="javascript:void(0)">목록</a>
				</div> <!-- bottom -->
			</div> <!-- content -->
			<div class="content">
				<div class="top">
					<p>
						<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon10_on.png"/>
					</p>
					<p>분실물센터 (Lost & Found)</p>
					<p>파크 내에서 잃어버린 물건이 있으시다면 분실물 센터를 찾아주세요.</p>
				</div>
				<div class="middle">
					<p class="subtitle">잃어버린 나의 소중한 물건이 있는지 확인해 보세요.</p>
					<p class="subcontent">현재 보관 중인 분실물을 확인하실 수 있습니다.<br/>
					분실물 센터를 직접 방문할 수도 있고, 홈페이지 내 분실물 게시판을 통해 확인하실 수도 있습니다.</p>
					<a href="www.com" class="subbutton">분실물 게시판 바로가기</a>
					<p class="subtitle">귀가 후에 잃어버린 물건이 생각나셨나요?</p>
					<p class="subcontent">파크에서 즐거운 시간을 보내고 귀가하신 후에 잃어버린 물건이 생각나셨다면 분실물센터로 연락주시기 바랍니다.<br/>
					습득된 물건이 없을 수도 있으나, 손님의 소중한 물건을 찾고자 최선을 다하겠습니다.</p>
					<ul>
						<li><span class="bold">전화번호</span> (02) 411-3434</li>
					</ul>
					<p class="maptitle">위치</p>
					<div class="map">
						<a class="locationbutton" href="javascript:void(0)">어드벤처 1층 손님상담실(만남의광장 안쪽)</a>
						<div class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img2.jpg"/>
						</div> <!-- realmap -->
					</div> <!-- map -->
				</div> <!-- middle -->
				<div class="bottom">
					<a class="realbutton" href="javascript:void(0)">목록</a>
				</div> <!-- bottom -->
			</div> <!-- content -->
			<div class="content">
				<div class="top">
					<p>
						<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon11_on.png"/>
					</p>
					<p>물품보관함 (Locker Rentals)</p>
					<p>물품보관함에 물건을 맡기고 보다 편하게 파크를 즐기세요.</p>
				</div>
				<div class="middle">
					<p class="subtitle">이용안내</p>
					<p class="subcontent">물품보관함 크기에 따라 이용요금이 상이합니다.<br/>
					소형 1,500원(가방, 의류 보관 가능)<br/>
					대형 2,000원(큰 가방, 캐리어 보관 가능)</p>
					<p class="subtitle">유의사항</p>
					<p class="subcontent">파크 외부에 위치한 물품보관함은 12시간 기준이며, 초과 시 추과 과금됩니다.<br/>
					파크 내부에 위치한 물품보관함은 파크 운영시간에만 사용할 수 있으며, 파크 운영시간 이후에는 물건을 찾으실 수 없습니다.</p>
					<p class="subtitle">이용문의</p>
					<p class="subtel">02-411-3475</p>
					<p class="maptitle">위치</p>
					<div class="map">
						<a class="locationbutton" href="javascript:void(0)">어드벤처 지하 1층 언더랜드 (메인게이트 입장 후 좌측 50m,와일드윙 앞)</a>
						<a class="locationbutton" href="javascript:void(0)">어드벤처 1층 (남문 앞,매직써클 입구 옆,손님상담실 앞,신밧드의모험 인근,트리블하우스(설빙) 인근,플라이벤처 내)</a>
						<a class="locationbutton" href="javascript:void(0)">어드벤처 2층(후렌치 레볼루션 앞)</a>
						<a class="locationbutton" href="javascript:void(0)">매직아일랜드(매직캐슬 안)</a>
						<div class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img11_1.jpg"/>
						</div> <!-- realmap -->
						<div style="display: none;" class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img11_2.jpg"/>
						</div> <!-- realmap -->
						<div style="display: none;" class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img11_3.jpg"/>
						</div> <!-- realmap -->
						<div style="display: none;" class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img11_4.jpg"/>
						</div> <!-- realmap -->
					</div> <!-- map -->
				</div> <!-- middle -->
				<div class="bottom">
					<a class="realbutton" href="javascript:void(0)">목록</a>
				</div> <!-- bottom -->
			</div> <!-- content -->
			<div class="content">
				<div class="top">
					<p>
						<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon12_on.png"/>
					</p>
					<p>보조배터리 대여 장소(CELL PHONE POWER BANK STATION)</p>
					<p>휴대폰 배터리가 없으시면 보조배터리 대여 서비스를 이용하시고 파크를 더 오랫동안 즐기세요.</p>
				</div>
				<div class="middle">
					<p class="subtitle">이용요금</p>
					<p class="subcontent">1시간당 1,500원 입니다.</p>
					<p class="maptitle">위치</p>
					<div class="map">
						<a class="locationbutton" href="javascript:void(0)">어드벤처 1층 거울미로 입구</a>
						<a class="locationbutton" href="javascript:void(0)">어드벤처 2층 바르셀로나 광장</a>
						<a class="locationbutton" href="javascript:void(0)">지하1층 와일드밸리 입구</a>
						<a class="locationbutton" href="javascript:void(0)">매직아일랜드 매직캐슬 안</a>
						<div class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img12_01.jpg"/>
						</div> <!-- realmap -->
						<div style="display:none;" class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img12_02.jpg"/>
						</div> <!-- realmap -->
						<div style="display:none;" class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img12_03.jpg"/>
						</div> <!-- realmap -->
						<div style="display:none;" class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img12_04.jpg"/>
						</div> <!-- realmap -->
					</div> <!-- map -->
				</div> <!-- middle -->
				<div class="bottom">
					<a class="realbutton" href="javascript:void(0)">목록</a>
				</div> <!-- bottom -->
			</div> <!-- content -->
			<div class="content">
				<div class="top">
					<p>
						<img src="https://adventure.lotteworld.com/common/images/icon/guideArea2_icon14_on.png"/>
					</p>
					<p>파크 내 티켓 키오스크 (Ticket Kiosk)</p>
					<p>베이비 손님을 위한 시설이용권이 필요하다면 이 곳을 방문해 주세요.</p>
				</div>
				<div class="middle">
					<p class="subtitle">판매권종</p>
					<p class="subcontent">베이비시설이용권, 어린이 종합/파크이용권</p>
					<p class="maptitle">위치</p>
					<div class="map">
						<a class="locationbutton" href="javascript:void(0)">만남의 광장 안내데스크,키즈토리아 입구,드래곤 와일드슈팅 입구,매직캐슬</a>
						<div class="realmap">
							<img src="https://adventure.lotteworld.com/common/images/icon/guest_local_img15.jpg"/>
						</div> <!-- realmap -->
					</div> <!-- map -->
				</div> <!-- middle -->
				<div class="bottom">
					<a class="realbutton" href="javascript:void(0)">목록</a>
				</div> <!-- bottom -->
			</div> <!-- content -->
		</div> <!-- wrap -->
	</div> <!-- body -->
	<div class="footer"></div>
	</div><!-- wrapper -->
</body>
</html>