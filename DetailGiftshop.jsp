<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lotte.dao.*" %>
<%@ page import="com.lotte.dto.*" %>
<%
	GiftshopDto dto = (GiftshopDto)request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=dto.getName()%></title>
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
    <!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
	<script>
	function abc() {
        $(".mySwiper").find(".swiper-pagination").append(
          "<a href='javascript:go();' class='playBtn'></a>"
        );
      }
      window.onload = abc;
    </script>
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
		h2 {
			font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    font-size: 50px;
		    color: #000;
		    text-align: center;
		    padding-top: 40px;
		}
		.subtitle {
			font-size: 18px;
		    color: #555;
		    line-height: 30px;
		    text-align: center;
		    margin-top: 28px;
		}
		.tag {
			text-align: center;
    		margin-top: 35px;
		}
		.tag div {
			display: inline-block;
		    padding-left: 34px;
		    background: url(https://adventure.lotteworld.com/common/images/icon/tag_icon.png) no-repeat 0 50%;
		}
		.tag > div a:first-child {
		    margin-left: 0;
		}
		.tag > div a {
		    display: inline-block;
		    padding: 0 20px;
		    height: 38px;
		    border: 1px solid #e1e1e1;
		    font-size: 16px;
		    color: #555;
		    line-height: 38px;
		    background: #fff;
		    border-radius: 20px;
		    margin-left: 5px;
		}
		ul, ol, li {
		    list-style: none;
		}
		.main {
			width: 1170px;
    		margin: 80px auto 0;
		}
		.main .explain {
			width: 556px;
		    height: 512px;
		    float: right;
		    border-top: 2px solid #000;
		    padding-top: 42px;
		    box-sizing: border-box;
		}
		.explain {
		    padding: 20px 25px 20px 0;
		}
		.main .explain li:nth-of-type(1) {
		    background: url(https://adventure.lotteworld.com/common/images/icon/dininginfo_icon1.png) no-repeat 0 center;
		}
		.main .explain li:nth-of-type(2) {
		    background: url(https://adventure.lotteworld.com/common/images/icon/dininginfo_icon2.png) no-repeat 0 center;
		}
		.main .explain li:nth-of-type(3) {
		    background: url(https://adventure.lotteworld.com/common/images/icon/dininginfo_icon3.png) no-repeat 0 center;
		}
		.main .explain li:nth-of-type(4) {
		    background: url(https://adventure.lotteworld.com/common/images/icon/dininginfo_icon4.png) no-repeat 0 center;
		}
		.main .explain li {
		    display: table;
		    min-height: 80px;
		    padding-left: 95px;
		    color: #000;
		    margin-bottom: 40px;
		}
		li {
		    /* display: list-item; */
		    text-align: -webkit-match-parent;
		}
		.main .explain li .realexplain {
		    display: table-cell;
		    vertical-align: middle;
		    min-height: 80px;
		}
		.main .explain li .text1 {
		    font-size: 22px;
		}
		.main .explain li .text2 {
		    font-size: 16px;
		    line-height: 26px;
		    margin-top: 12px;
		}
		.main:after {
		    content: "";
		    display: block;
		    clear: both;
		}
		.main2 {
			position: relative;
		    width: 1170px;
		    margin: 0 auto;
		}
		.main2title {
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    font-size: 28px;
		    color: #000;
		    text-align: center;
		    margin-top: 100px;
		}
		.mapArea {
		    position: relative;
		    border: 1px solid #e1e1e1;
		    width: 1170px;
		    height: 534px;
		    overflow: hidden;
		    margin: 40px auto 0;
		}
		.mapArea .location {
		    position: absolute;
		    top: 30px;
		    left: 30px;
		    z-index: 1;
		    padding-left: 31px;
		    font-size: 18px;
		    color: #000;
		    line-height: 22px;
		    background: url(https://adventure.lotteworld.com/common/images/icon/map_caption_icon.png) no-repeat 0 50%;
		}
		.realmap {
		    position: relative;
		    float: left;
		    zoom: 0.8;
		    left: 25%;
		    top: 50%;
		}
		img, fieldset {
		    border: none;
		    vertical-align: top;
		}
		.check {
		    position: absolute;
		    top: 266px;
		    left: 344px;
		}
		.mapArea .zoom {
		    position: absolute;
		    bottom: 20px;
		    right: 20px;
		    width: 50px;
		}
		.mapArea .zoom a {
		    display: block;
		    margin-top: 10px;
		}
		.subArea {
			margin-top: 100px;
		}
		.aroundAttraction {
		    display: table;
		    table-layout: fixed;
		    width: 1170px;
		    /* height: 60px; */
		    /* overflow: hidden; */
		    margin: 80px auto 0;
		}
		.aroundAttraction {
			margin-top: 0px !important;
		}
		.two1, .two2 {
			height: 65px;
			padding: 20px 0;
		    display: table-cell;
		    vertical-align: middle;
		    box-sizing: border-box;
		    border: 1px solid #e1e1e1;
		    border-left: 0;
		    background: #fff;
		    font-size: 18px;
		    color: #000;
		    text-align: center;
		}
		.two1.on, .two2.on {
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
		.aroundAttarction a {
			height: 65px;
		}
		.aroundAttraction a.on {
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
		.aroundAttraction a:nth-child(-n+6) {
		    border-top: 1px solid #e1e1e1;
		}
		.aroundAttraction a:first-child, .aroundAttraction a:nth-child(7) {
		    border-left: 1px solid #e1e1e1;
		}
		.aroundAttraction a {
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
		.aroundAttraction a span {
		    line-height: 21px;
		    word-break: keep-all;
		}
		.blocklist {
			margin-top: 80px !important;
		}
		.blocklist {
			display: block;
		}
		.blocklistwrap {
		    transform: translate3d(0px, 0px, 0px);
		    margin: 0;
		    margin-top: 0px !important;
		}
		.blocklistwrap a:hover .blockbottom, .blocklistwrap a:focus .blockbottom {
		    background: rgb(111, 35, 249);
		    background: -ms-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -o-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -moz-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -webkit-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		}
		.blocklistwrap a:hover .blockbottom .name, .blocklistwrap a:focus .blockbottom .name {
		    color: #fff;
		}
		.blocklistwrap a {
		    width: 276px;
		    margin-right: 22px;
		}
		.blocklistwrap a:first-child, .blocklistwrap a:nth-child(2), .blocklistwrap a:nth-child(3), .blocklistwrap a:nth-child(4) {
		    margin-top: 0;
		}
		.blocklistwrap a {
		    margin: 0;
		    float: none;
		}
		.blocklistwrap a {
		    display: block;
		    float: left;
		    width: 276px;
		    border: 1px solid #e1e1e1;
		    box-sizing: border-box;
		    margin-top: 22px;
		    margin-right: 22px;
		    -moz-transition: .3s ease;
		    -webkit-transition: .3s ease;
		    -ms-transition: .3s ease;
		    -o-transition: .3s ease;
		    transition: .3s ease;
		}
		.blocklistwrap a .blocktop {
		    position: relative;
		    max-height: 246px;
		    overflow: hidden;
		}
		.blocklistwrap a div {
		    display: block;
		}
		.blocklistwrap a .blocktop .label {
		    position: absolute;
		    top: 20px;
		    left: 20px;
		    padding: 0 10px;
		    height: 36px;
		    line-height: 34px;
		    font-size: 15px;
		    color: #fff;
		    text-align: center;
		    background: rgba(0,0,0,0.5);
		    border-radius: 2px;
		}
		.blocklistwrap a .blocktop img {
		    width: 100%;
		}
		.blocklistwrap a .blockbottom {
		    padding: 27px 25px 30px;
		    background: #fff;
		}
		.blocklistwrap a .blockbottom .name {
			display: block;
		    height: 60px;
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    font-size: 22px;
		    line-height: 1.4;
		    color: #000;
		}
		.button {
			margin-top: 20px;
			text-align: center;
		}
		.button a {
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
		.swiper {
			float: left;
	        position: relative;
	        width: 574px;
	        height: auto;
	        overflow: hidden;
      	}

      .swiper-slide {
	      display: block;
	      postion: relative;
	      width: 100%;
	      height: 100%;
      }

      .swiper-slide img {
	      display: block;
	      width: 100%;
	      height: 100%;
	      object-fit: cover;
      }

      .swiper {
	      margin-left: 0 !important;
	      margin-right: auto;
      }

      .swiper-button-next {
	      right: 40px;
	      width: 70px;
	      height: 70px;
	      background: url(https://adventure.lotteworld.com/common/images/btn/imgRoll_next.png)
          	no-repeat 50% 50%;
      }
      .swiper-button-prev {
	      left: 40px;
	      width: 70px;
	      height: 70px;
	      background: url(https://adventure.lotteworld.com/common/images/btn/imgRoll_prev.png)
	        no-repeat 50% 50%;
      }
      .swiper-button-next:after,
      .swiper-button-prev:after {
	  	display: none;
      }
      .swiper-pagination {
        display: inline-block;
        padding: 15px 64px 15px 31px;
        margin: 0 auto;
        width: auto !important;
        height: 11px;
        left: 50% !important;
        bottom: 50px !important;
        background: rgba(0, 0, 0, 0.5);
        overflow: hidden;
        border-radius: 20.5px;
        transform: translate(-50%, 0);
      }

      .swiper-pagination .swiper-pagination-bullet {
        vertical-align: top;
        width: 11px;
        height: 11px;
        margin: 0 0 0 10px;
        background: url(https://adventure.lotteworld.com/common/images/btn/imgRoll_indi.png);
          no-repeat 50% 50%;
      }
      .swiper-pagination .swiper-pagination-bullet-active {
        background: url(https://adventure.lotteworld.com/common/images/btn/imgRoll_indi_on.png);
      }
      .swiper-pagination .playBtn {
		    display: block;
		    width: 41px;
		    height: 41px;
		    position: absolute;
		    top: 0;
		    right: 0;
		    background: url(https://adventure.lotteworld.com/common/images/btn/play_bt.png) no-repeat 50% 50%;
	  }
	  .swiper-pagination .playBtn.on {
	  	background: url(https://adventure.lotteworld.com/common/images/btn/play_bt_on.png) no-repeat 50% 50%;
	  }
	  .solo {
	  	
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
		var select = $(".moremenu2box").text();
		var list = $(".moremenu2List");
		for(var i = 0; i <= 3; i++){
			if(list.eq(i).text() == select){
				list.eq(i).css('font-family', 'NotoSans-bold');
				list.eq(i).css('color', '#000');
				break;
			}
		}
		
		var select2 = $(".moremenu3box");
		var list2 = $(".moremenu3List");
		select2.css({'font-family': 'NotoSans-bold','color': '#000' });
		for(var i = 0; i <= 2; i++){
			if(list2.eq(i).text() == select2.text()){
				list2.eq(i).css('font-family', 'NotoSans-bold');
				list2.eq(i).css('color', '#000');
				break;
			}
		}
		
		$(".topFirst").eq(0).toggleClass('on');
		
		var box = $(".topFirst")
		box.eq(0).click(function() {
			if(box.eq(1).attr("class") == 'topFirst on'){
				box.eq(1).toggleClass('on');
			}
			if(box.eq(2).attr("class") == 'topFirst on'){
				box.eq(2).toggleClass('on')
			}
			if(box.eq(0).attr("class") == 'topFirst'){
				box.eq(0).toggleClass('on');
			}
		});	
		box.eq(1).click(function() {
			if(box.eq(0).attr("class") == 'topFirst on'){
				box.eq(0).toggleClass('on');
			}
			if(box.eq(2).attr("class") == 'topFirst on'){
				box.eq(2).toggleClass('on')
			}	
			if(box.eq(1).attr("class") == 'topFirst'){
				box.eq(1).toggleClass('on');
			}
		});	
		box.eq(2).click(function() {
			if(box.eq(1).attr("class") == 'topFirst on'){
				box.eq(1).toggleClass('on');
			}
			if(box.eq(0).attr("class") == 'topFirst on'){
				box.eq(0).toggleClass('on')
			}
			if(box.eq(2).attr("class") == 'topFirst'){
				box.eq(2).toggleClass('on');
			}
		});
		
		$(".plus").click(function() {
			$(".realmap").css('zoom', '1.3');
			$(".realmap").css('left', '<%=dto.getZoomplusleft()%>');
			$(".realmap").css('top', '<%=dto.getZoomplustop()%>');
		});
		$(".minus").click(function() {
			$(".realmap").css('zoom', '0.8');
			$(".realmap").css('left', '25%');
			$(".realmap").css('top', '50%');
		});
		$(".two1").click(function() {
			if($(this).attr('class') == 'two1'){
				$(".two2").toggleClass('on');
				$(this).toggleClass('on');
				$(".sec").hide();
				$(".fir").show();
			}
		});
		$(".two2").click(function() {
			if($(this).attr('class') == 'two2'){
				$(".two1").toggleClass('on');
				$(this).toggleClass('on');
				$(".fir").hide();
				$(".sec").show();
			}
		});
		$(".tag a").click(function() {
			var name = $(this).text();
			location.href = "LotteController?command=search&text=" + name;
		});
		$(".menu").load("lotte/Menu.jsp");
		$(".footer").load("lotte/Footer.html");
	});
	</script>
</head>
<body>
	<div class="menu"></div>
	<div class="body">
		<div class="wrap">
			<div class="topsub">
				<div class="topsubIn">
					<a href="LotteController?command=lotteMain" class="home"></a>
						<div class="one">
							<a href="javascript:void(0)" onclick="view()" class="moremenuclick">즐길거리</a>
							<div class="moremenu" style="z-index : 15; display : none;">
								<a href="LotteController?command=Attraction" class="moremenulist" style="margin-top : 0px;">즐길거리</a>
								<a href="LotteController?command=Charge" class="moremenulist">요금/우대혜택</a>
	 							<a href="LotteController?command=Performance" class="moremenulist">참여프로그램</a>
								<a href="LotteController?command=Suspension" class="moremenulist">이용가이드</a>
								<a href="LotteController?command=Notice" class="moremenulist">소통서비스</a>
							</div>
						</div>
						<div class="two">
							<a class="moremenu2box" href="javascript:void(0)" onclick="view2()">다이닝/쇼핑</a>
							<div class="moremenu2" style="z-index : 15; display : none;">
								<a href="LotteController?command=Attraction" class="moremenu2List" style="margin-top : 0px;">어트랙션</a>
	 							<a href="LotteController?command=Festival" class="moremenu2List">페스티벌</a>
								<a href="LotteController?command=ShowMain" class="moremenu2List">공연</a>
								<a href="LotteController?command=Restaurant" class="moremenu2List">다이닝/쇼핑</a>
							</div>
						</div>
						<div class="three">
							<a class="moremenu3box" href="javascript:void(0)" onclick="view3()">레스토랑</a>
							<div class="moremenu3" style="z-index : 15; display : none">
								<a class="moremenu3List" href="LotteController?command=Restaurant" style="margin-top : 0px;">레스토랑</a>
	 							<a class="moremenu3List" href="LotteController?command=Giftshop">기프트샵</a>
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
			<h2><%=dto.getName()%></h2>
			<%
			if(!(dto.getContents().equals("null"))){
			%>
			<p class="subtitle"><%=dto.getContents()%></p>
			<%
			} else {
			%>
			
			<%
			}
			%>
			<div class="tag">
				<div>
				<% 
					for(int i = 0; i < dto.getTagArr().length; i++){
				%>
					<a href="javascript:void(0)"><%=dto.getTagArr()[i]%></a>
				<%
					}
				%>
				</div>
			</div>
			<div class="main">
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
					<%
					if(dto.getImageArr().length>1) {
						for(int i = 0; i < dto.getImageArr().length; i++){
					%>
						<div class="swiper-slide">
					<%
					out.println("<img src='images1/"+dto.getImageArr()[i]+"'/>");
					%>
						</div>
					<%	
						}
					%>
					</div>
					<div class='swiper-button-next'></div>
					<div class='swiper-button-prev'></div>
					<div class='swiper-pagination'></div>
				</div>
					<%
					} else {
					%>
						<div class="swiper-slide">
					<%
					out.println("<img src='images1/"+dto.getImageArr()[0]+"'/>");
					%>
						</div>
					</div>
				</div>
					<%
					}
					%>
				 <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 0,
        speed: 800,
        autoplay: {
        	delay: 5000,
        	disableOnInteraction: true
        },
        loop: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev"
        }
      });
      function go() {
    	  $(".playBtn").toggleClass("on");
    		if($(".playBtn").attr("class")== 'playBtn') {
    			swiper.autoplay.start();
    		} else {
    			swiper.autoplay.stop();
    		}
      }
    </script>
				<ul class="explain">
					<li>
						<div class="realexplain">
							<p class="text1">주요상품</p>
							<p class="text2"><%=dto.getMaingift()%></p>
						</div> <!-- realexplain -->					
					</li>
					<%
						if(dto.getPhone() != null){
					%>
					<li>
						<div class="realexplain">
							<p class="text1">전화번호</p>
							<p class="text2">
								<strong><%=dto.getPhone()%></strong>
							</p>
						</div> <!-- realexplain -->					
					</li>
					<%
						}
						if(dto.getGuide() != null){
					%>
					<li>
						<div class="realexplain">
							<p class="text1">이용안내</p>
							<p class="text2">
								<strong><%=dto.getGuide()%></strong>
							</p>
						</div> <!-- realexplain -->					
					</li>
					<%
						}
					%>
				</ul> <!-- explain -->
			</div> <!-- main -->
			<div class="main2">
				<p class="main2title">위치정보</p>
				<div class="mapArea">
					<p class="location"><%=dto.getLocation_id()%></p>
					<div class="map">
						<div class="realmap">
							<img src="images1/<%=dto.getLocationimage()%>"/>
							<p style="top:<%=dto.getTop()%>px; left:<%=dto.getLeft()%>px;"class="check">
								<img src="https://adventure.lotteworld.com/common/images/map_check.png"/>
							</p>
						</div> <!-- realmap -->
					</div> <!-- map -->
					<div class="zoom">
						<a href="javascript:void(0)" class="plus">
							<img src="https://adventure.lotteworld.com/common/images/btn/zoomIn_btn.gif"/>
						</a>
						<a href="javascript:void(0)" class="minus">
							<img src="https://adventure.lotteworld.com/common/images/btn/zoomOut_btn.gif"/>
						</a>
					</div> <!-- zoom -->
				</div> <!-- mapArea -->
				<div class="button">
					<a href="LotteController?command=Giftshop">목록</a>
				</div>
			</div> <!-- main2 -->
		</div> <!-- wrap -->
	</div> <!-- body -->
	<div class="footer"></div>
</body>
</html>