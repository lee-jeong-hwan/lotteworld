<%@page import="com.lotte.dto.MainDto"%>
<%@page import="com.lotte.dao.MainDao"%>
<%@page import="com.lotte.dto.ShowDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	ArrayList<ShowDto> showList = (ArrayList<ShowDto>)request.getAttribute("showList");
	ArrayList<MainDto> attractionList = (ArrayList<MainDto>)request.getAttribute("attractionList"); 
%>
	<meta charset="UTF-8">
	<title>롯데월드 어드벤처</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
	<script>
		$(function() {
			$(".mySwiper").find(".swiper-pagination").append("<a href='javascript:' class='playBtn'></a>");

		    $(".mainCon2 .rollArea .mySwiper2 .swiper-wrapper .swiper-slide > a").click(function() {
		    	$(".mainCon2 .rollArea .mySwiper2 .swiper-wrapper .swiper-slide > a .tit").css("display", "block");
		    	$(".mainCon2 .rollArea .mySwiper2 .swiper-wrapper .swiper-slide .openArea").css("display", "none");
		    	$(".mainCon2 .rollArea .mySwiper2 .swiper-wrapper .swiper-slide").css({"margin-right": "22px", "left": "0px", "top": "-10px", "height": "350px", "width": "276px"});
		    	const slide = $(this).parent();	
		    	$(this).find(".tit").css("display", "none");
		    	slide.css({"margin-right": "22px", "left": "-10px", "top": "-48px", "height": "446px", "width": "334px"});
		    	slide.find(".openArea").css("display", "block");
		    });
		    $(".mainCon2 .rollArea .mySwiper2 .swiper-wrapper .swiper-slide .openArea .closeBt").click(function() {
		    	const slide = $(this).parent().parent();
		    	slide.find("a").find(".tit").css("display", "block");
		    	slide.find(".openArea").css("display", "none");
		    	slide.css({"margin-right": "22px", "left": "0px", "top": "-10px", "height": "350px", "width": "276px"});
		    });
		    $(".btnAtract").click(function() {
		    	$(".btnAtract").removeClass("on");
		    	$(this).addClass("on");
		    	
		    	var value = $(this).data("cd");
		    	
		    	$("li.mainCon3ListContainer").css("display", "none");
		    	
		    	$("."+value).css("display", "list-item");
		    	
		    });
		    $(".mainCon3 .mainCon3List li a").mouseenter(function() {
		    	$(this).find(".txtArea").find(".tit").css("color","#fff");
		    	$(this).find(".txtArea").find(".txt").css("color","#fff");
		    });
		    $(".mainCon3 .mainCon3List li a").mouseleave(function() {
		    	$(this).find(".txtArea").find(".tit").css("color","#000");
		    	$(this).find(".txtArea").find(".txt").css("color","#000");
		    });
		    $(".mainCon4 .mainNews .top ul li a").mouseenter(function() {
		    	$(this).find(".img").css("box-shadow","20px 25px 40px 0 rgb(0 0 0 / 20%)");
		    	$(this).find(".tit").css({"color":"rgb(85, 11, 223)", "font-family": "'NotoSans-Bold'"});
		    });
		    $(".mainCon4 .mainNews .top ul li a").mouseleave(function() {
		    	$(this).find(".img").css("box-shadow","");
		    	$(this).find(".tit").css({"color": "#000", "font-family": "'NotoSans-Light'"});
		    });
		    $(".goAtr").click(function() {
		    	var Aname = $(this).find(".txtArea").find(".tit").text();
		    	location.href="LotteController?command=detailAttraction&name=" + Aname;
		    });
		    $(".menu").load("lotte/Menu.jsp");
		    $(".footer").load("lotte/Footer.html");		    
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
		#cBody {
		    position: relative;
		    width: 100%;
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
		.mySwiper {
		    position: relative;
		    width: 100%;
		    height: auto;
		    overflow: hidden;
		}
		.mySwiper .swiper-wrapper .swiper-slide {
		    display: block;
		    position: relative;
		    width: 100%;
		    height: 100%;
		}
		.mySwiper .swiper-button-next {
		    right: 40px;
		    width: 70px;
		    height: 70px;
		    background: url(images/imgRoll_next.png) no-repeat 50% 50%;
		    filter: opacity(0.6);
		}
		.mySwiper .swiper-button-prev {
		    left: 40px;
		    width: 70px;
		    height: 70px;
		    background: url(images/imgRoll_prev.png) no-repeat 50% 50%;
		    filter: opacity(0.6);
		}
		.mySwiper .swiper-button-next:hover,
		.mySwiper .swiper-button-prev:hover {
			filter: opacity(100);
		}
		.mySwiper .swiper-button-next:after,
		.mySwiper .swiper-button-prev:after {
			display: none;
		}
		.mySwiper .swiper-pagination {
		    display: inline-block;
		    padding: 15px 65px 15px 31px;
		    width: auto;
		    height: 11px;
		    left: 50%;
		    bottom: 50px;
		    background: rgba(0,0,0,0.5);
		    overflow: hidden;
		    border-radius: 20.5px;
		    transform: translate(-50%, 0);
		}
		.mySwiper .swiper-pagination .swiper-pagination-bullet:first-child {
		    margin: 0;
		}
		.mySwiper .swiper-pagination .swiper-pagination-bullet {
		    vertical-align: top;
		    width: 11px;
		    height: 11px;
		    margin: 0 0 0 10px;
		    background: url(images/imgRoll_indi.png) no-repeat 50% 50%;
		}
		.mySwiper .swiper-pagination .swiper-pagination-bullet-active {
		    background: url(images/imgRoll_indi_on.png) no-repeat 50% 50%;
		}
		.mySwiper .swiper-pagination .playBtn {
		    display: block;
		    width: 41px;
		    height: 41px;
		    position: absolute;
		    top: 0;
		    right: 0;
		    background: rgba(0,0,0,0.2) url(images/play_bt.png) no-repeat 50% 50%;
		    border-radius: 20.5px;
		}
		.mySwiper .swiper-pagination .playBtn.onSwiper {
		    background: rgba(0,0,0,0.2) url(images/play_bt_on.png) no-repeat 50% 50%; 
		}
		.mainTodayArea {
		    position: relative;
		    top: 150px;
		    opacity: 0;
		    width: 1170px;
		    max-width: 1170px;
		    margin: 0 auto;
		    padding: 30px 0;
		    border-bottom: 1px solid #e1e1e1;
		    overflow: hidden;
		    text-align: center;
		}
		.mainTodayArea .tit {
		    display: inline-block;
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    font-size: 20px;
		    color: #000;
		    padding-left: 50px;
		    position: relative;
		}
		.mainTodayArea .txt {
		    display: inline-block;
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    font-size: 20px;
		    color: #000;
		    margin-left: 30px;
		}
		.mainTodayArea .tit:before {
		    content: '';
		    display: block;
		    width: 31px;
		    height: 31px;
		    background: url(images/mainTodayArea_tit_icon.png) no-repeat center center;
		    position: absolute;
		    top: 50%;
		    left: 0;
		    transform: translate(0,-50%);
		}
		.mainCon {
		    padding: 120px 0;
		}
		.mainCon1 {
		    position: relative;
		    width: 1170px;
		    margin: 0 auto;
		}
		.mainTit {
		    position: relative;
		    top: 150px;
		    opacity: 0;
		    font-size: 40px;
		    color: #000;
		    text-align: center;
		    line-height: 1.3;
		}
		.mainTxt {
		    position: relative;
		    top: 150px;
		    opacity: 0;
		    font-size: 18px;
		    color: #555;
		    text-align: center;
		    margin-top: 30px;
		}
		.mainCon1 .boxArea {
		    position: relative;
		    top: 150px;
		    opacity: 0;
		    display: table;
		    table-layout: fixed;
		    border-collapse: collapse;
		    vertical-align: middle;
		    width: 100%;
		    margin-top: 60px;
		}
		.mainTit span {
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		}
		.mainCon1 .boxArea {
		    position: relative;
		    top: 150px;
		    opacity: 0;
		    display: table;
		    table-layout: fixed;
		    border-collapse: collapse;
		    vertical-align: middle;
		    width: 100%;
		    margin-top: 60px;
		}
		.mainCon1 .boxArea .box-tr {
		    display: table-row;
		}
		.mainCon1 .boxArea .box-tr .box-td {
		    display: table-cell;
		    vertical-align: middle;
		    box-sizing: border-box;
		    border: 1px solid #dedede;
		}
		.mainCon1 .boxArea .box-tr .box-td a {
		    display: block;
		    position: relative;
		    padding: 30px 30px 40px 30px;
		}
		.mainCon1 .boxArea .box-tr .box-td a:before {
		    content: '';
		    position: absolute;
		    top: -1px;
		    left: -1px;
		    width: calc(100% + 2px);
		    height: calc(100% + 2px);
		    box-sizing: border-box;
		    border: 2px solid rgba(0,0,0,0);
		    transition: .3s ease;
		    z-index: 5;
		}
		.mainCon1 .boxArea .box-tr .box-td .img {
		    display: block;
		    text-align: center;
		    max-width: 231px;
		    height: 190px;
		    max-height: 190px;
		    overflow: hidden;
		}
		.mainCon1 .boxArea .box-tr .box-td .price {
		    display: block;
		    font-size: 18px;
		    color: #550adf;
		    margin-top: 30px;
		}
		.mainCon1 .boxArea .box-tr .box-td .tit {
		    display: block;
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    font-size: 22px;
		    color: #000;
		    line-height: 1;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    margin-top: 20px;
		}
		.mainCon1 .boxArea .box-tr .box-td .img img {
		    max-width: 100%;
		}
		.mainCon1 .boxArea .box-tr .box-td a:hover:before {
			content: '';
		    box-shadow: 20px 20px 40px 0 rgb(0 0 0 / 20%);
		    border: 2px solid #550bdf;
		}
		.mainCon1 .btnArea {
		    position: relative;
		    top: 150px;
		    opacity: 0;
		}
		.btnArea {
		    text-align: center;
		    margin-top: 60px;
		}
		.mainCon1 .btnArea .purpleBtn {
		    padding: 0 50px;
		}
		.purpleBtn {
		    display: inline-block;
		    padding: 0 70px;
		    height: 56px;
		    line-height: 54px;
		    font-size: 18px;
		    color: #fff;
		    text-align: center;
		    border-radius: 28px;
		    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		}
		.mainCon2 {
		    background: url(images/mainCon2_bg_20220103.jpg) no-repeat 50% 50%;
		    background-size: cover;
		}
		.mainCon2 .mainTit,
		.mainCon2 .mainTxt {
		    color: #fff;
		}
		.mainTit span {
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		}
		.mainCon2 .rollArea {
		    position: relative;
		    top: 150px;
		    opacity: 0;
		    padding: 0 22px;
		    margin-top: 120px;
		}
		.mainCon2 .btnArea {
		    position: relative;
		    top: 150px;
		    opacity: 0;
		}
		.mainCon2 .mySwiper2 {
		    width: 100%;
		    overflow: visible;
		}
		.mainCon2 .mySwiper2 .swiper-wrapper {
		    height: 350px;
		}
		.mainCon2 .mySwiper2 .swiper-slide {
		    width: 276px;
		    height: 350px;
		}
		.mainCon2 .mySwiper2 .swiper-slide > a {
		    display: block;
		    position: relative;
		    width: 100%;
		    height: 100%;
		    transition: .3s ease;
		}
		.mainCon2 .mySwiper2 .swiper-slide > a:after {
		    content: "";
		    display: block;
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background: linear-gradient(-180deg, rgba(0,0,0,0) 0%, rgba(0,0,0,0.8) 100%);
		}
		.mainCon2 .mySwiper2 .swiper-slide > a .img {
		    display: block;
		    width: 100%;
		    height: 100%;
		    overflow: hidden;
		}
		.mainCon2 .mySwiper2 .swiper-slide > a .tit {
		    position: absolute;
		    z-index: 1;
		    bottom: 30px;
		    left: 30px;
		    display: block;
		    max-width: calc(100% - 60px);
		    font-size: 20px;
		    color: #fff;
		    line-height: 28px;
		}
		.mainCon2 .mySwiper2 .swiper-slide > .openArea {
		    display: none;
		    position: absolute;
		    top: 50%;
		    left: 50%;
		    width: 100%;
		    height: 100%;
		    padding: 60px 40px 30px 40px;
		    box-shadow: 20px 20px 50px 0 rgb(0 0 0 / 30%);
		    box-sizing: border-box;
		    transform: translate(-50%, -50%);
		    background: rgba(0,0,0,0.8);
		}
		.mainCon2 .mySwiper2 .swiper-slide > .openArea .tit {
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    font-size: 20px;
		    color: #fff;
		}
		.mainCon2 .mySwiper2 .swiper-slide > .openArea .txt {
		    font-size: 16px;
		    color: #fff;
		    line-height: 24px;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: normal;
		    height: 72px;
		    word-wrap: break-word;
		    display: -webkit-box;
		    -webkit-line-clamp: 3;
		    -webkit-box-orient: vertical;
		    margin-top: 15px;
		}
		.mainCon2 .mySwiper2 .swiper-slide > .openArea .time {
		    width: 254px;
		    margin-top: 25px;
		}
		.mainCon2 .mySwiper2 .swiper-slide > .openArea .link {
		    position: absolute;
		    bottom: 30px;
		    left: 40px;
		    padding-top: 30px;
		    width: calc(100% - 80px);
		    border-top: 1px solid rgba(255,255,255,0.4);
		}
		.mainCon2 .mySwiper2 .swiper-slide > .openArea .closeBt {
		    display: block;
		    position: absolute;
		    top: 30px;
		    right: 30px;
		    width: 20px;
		    height: 20px;
		    background: url(images/mainCon2_close_btn.png) no-repeat 50% 50%;
		}
		.mainCon2 .mySwiper2 .swiper-slide > .openArea .time p {
		    display: inline-block;
		    padding: 0 11px;
		    border: 1px solid #fff;
		    height: 32px;
		    line-height: 30px;
		    font-size: 18px;
		    color: #fff;
		    margin-right: 10px;
		    margin-bottom: 10px;
		    border-radius: 17px;
		}
		.mainCon2 .mySwiper2 .swiper-slide > .openArea .link a {
		    display: block;
		    font-size: 18px;
		    color: #fff;
		    background: url(images/mainCon2_link_icon.png) no-repeat right 0 top 50%;
		}
		.mainCon2 .mySwiper2 .swiper-scrollbar {
		    position: relative;
		    bottom: 0;
		    left: 50%;
		    margin-left: -75px;
		    width: 150px;
		    height: 26px;
		    background: none;
		    margin-top: 120px;
		}
		.mainCon2 .mySwiper2 .swiper-scrollbar:before {
		    content: '';
		    position: absolute;
		    top: 50%;
		    left: 0;
		    margin-top: -2px;
		    width: 100%;
		    height: 4px;
		    background: #fff;
		    border-radius: 2px;
		}
		.mainCon2 .mySwiper2 .swiper-scrollbar .swiper-scrollbar-drag {
		    position: relative;
		    height: 26px;
		    border-radius: 13px;
		    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		}
		.mainCon2 .mySwiper2 .swiper-scrollbar .swiper-scrollbar-drag:before {
		    content: '';
		    position: absolute;
		    top: 50%;
		    left: 10px;
		    margin-top: -3px;
		    width: 3px;
		    height: 6px;
		    background: url(images/mainCon2_scroll_bg1.png) no-repeat 50% 50%;
		}
		.mainCon2 .mySwiper2 .swiper-scrollbar .swiper-scrollbar-drag:after {
		    content: '';
		    position: absolute;
		    top: 50%;
		    right: 10px;
		    margin-top: -3px;
		    width: 3px;
		    height: 6px;
		    background: url(images/mainCon2_scroll_bg2.png) no-repeat 50% 50%;
		}
		.mainCon2 .btnArea .whiteBtn {
		    padding: 0 49px;
		}
		.whiteBtn {
		    display: inline-block;
		    padding: 0 70px;
		    height: 56px;
		    line-height: 54px;
		    font-size: 18px;
		    color: #550adf;
		    text-align: center;
		    border-radius: 28px;
		    background: #fff;
		}
		.mainCon2 .btnArea .bWhiteBtn {
		    padding: 0 39px;
		    margin-left: 19px;
		}
		.bWhiteBtn {
		    display: inline-block;
		    padding: 0 68px;
		    height: 52px;
		    line-height: 50px;
		    font-size: 18px;
		    font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    color: #fff;
		    text-align: center;
		    border: 2px solid #fff;
		    border-radius: 30px;
		}
		.mainCon2 .mySwiper2 .swiper-slide > a:hover {
		    box-shadow: 20px 20px 50px 0 rgb(0 0 0 / 20%);
		}
		.mainCon2 .mySwiper2 .swiper-slide > a:hover .tit {
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		}
		.mainCon3 {
		    background: url(images/mainCon3_bg.jpg) no-repeat 50% 50%;
		    background-size: cover;
		}
		.mainCon3 .inner {
		    max-width: 1170px;
		    margin: 0 auto;
		}
		.mainCon3 .mainCon3Tab {
		    position: relative;
		    top: 150px;
		    opacity: 0;
		    text-align: center;
		    margin-top: 40px;
		}
		.mainCon3 .mainCon3List {
		    position: relative;
		    top: 150px;
		    opacity: 0;
		    margin-top: 60px;
		}
		.mainCon3 .mainCon3Tab > div {
		    position: relative;
		    vertical-align: top;
		}
		.mainCon3 .mainCon3Tab > div ul {
		    display: inline-block;
		    position: relative;
		    margin: 0 auto;
		    white-space: nowrap;
		}
		.mainCon3 .mainCon3Tab > div ul li:first-child {
		    padding-left: 0;
		}
		.mainCon3 .mainCon3Tab > div ul li {
		    display: inline-block;
		    vertical-align: top;
		    padding: 0 7.5px;
		}
		.mainCon3 .mainCon3Tab > div a {
		    display: inline-block;
		    padding: 0 20px;
		    height: 44px;
		    line-height: 42px;
		    border: 1px solid #c4c4c4;
		    font-size: 16px;
		    color: #555;
		    border-radius: 23px;
		}
		.mainCon3 .mainCon3Tab > div a.on {
		    padding: 0 19px;
		    height: 42px;
		    line-height: 42px;
		    border: 2px solid #550adf;
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    color: #550adf;
		}
		.mainCon3 .mainCon3List:after {
		    content: '';
		    display: block;
		    clear: both;
		}
		.mainCon3 .mainCon3List li {
		    float: left;
		    width: 276px;
		    margin-right: 22px;
		}
		.mainCon3 .mainCon3List li.long {
		    width: 574px;
		}
		.mainCon3 .mainCon3List li a {
		    display: block;
		    transition: .3s ease;
		}
		.mainCon3 .mainCon3List li a span {
		    display: block;
		}
		.mainCon3 .mainCon3List li a .img {
		    position: relative;
		    width: 100%;
		    max-height: 246px;
		    overflow: hidden;
		}
		.mainCon3 .mainCon3List li a .txtArea {
		    position: relative;
		    padding: 25px 30px;
		    background: #fff;
		}
		.mainCon3 .mainCon3List li a .txtArea .tit {
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    font-size: 22px;
		    color: #000;
		}
		.mainCon3 .mainCon3List li a .txtArea .txt {
		    font-size: 16px;
		    color: #555;
		    margin-top: 15px;
		}
		.mainCon3 .mainCon3List li.mc3List3, .mainCon3 .mainCon3List li.mc3List6 {
		    margin-right: 0;
		}
		.mainCon3 .mainCon3List li.mc3List4, .mainCon3 .mainCon3List li.mc3List5, .mainCon3 .mainCon3List li.mc3List6 {
		    margin-top: 22px;
		}
		.mainCon3 .btnArea .purpleBtn {
		    padding: 0 43px;
		}
		.mainCon3 .btnArea .bPurpleBtn {
		    padding: 0 43px;
		}
		.bPurpleBtn {
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
		.btnArea a:nth-child(2) {
		    margin-left: 10px;
		}
		.mainCon3 .mainCon3List li a:hover {
		    box-shadow: 20px 25px 40px 0 rgb(0 0 0 / 20%);
		}
		.mainCon3 .mainCon3List li a:hover .txtArea {
		    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		}
		.mainCon4 {
		    position: relative;
		    width: 1170px;
		    margin: 0 auto;
		}
		.mainCon4 .mainNews {
		    position: relative;
		    top: 150px;
		    opacity: 0;
		    padding-top: 50px;
		    border-top: 1px solid #d9d9d9;
		    margin-top: 60px;
		}
		.mainCon4 .mainNews .top {
		    position: relative;
		}
		.mainCon4 .mainNews .bottom {
		    position: relative;
		    top: 150px;
		    opacity: 0;
		    overflow: hidden;
		    margin-top: 50px;
		}
		.mainCon4 .mainNews .mainCon4Tit {
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    font-size: 22px;
		    color: #000;
		}
		.mainCon4 .mainNews .top ul {
		    margin-top: 40px;
		}
		.mainCon4 .mainNews .top ul:after {
		    content: '';
		    display: block;
		    clear: both;
		}
		.mainCon4 .mainNews .top ul li {
		    float: left;
		    margin-left: 22px;
		}
		.mainCon4 .mainNews .top ul li:first-child {
		    margin-left: 0;
		}
		.mainCon4 .mainNews .top ul li a {
		    display: block;
		}
		.mainCon4 .mainNews .top ul li a span {
		    display: block;
		    transition: .3s ease;
		}
		.mainCon4 .mainNews .top ul li a span.tit {
		    font-size: 20px;
		    color: #000;
		    margin-top: 30px;
		}
		.mainCon4 .mainNews .bottom .newsDiv {
		    float: left;
		    position: relative;
		    padding: 40px;
		    width: 492px;
		    height: 174px;
		    border: 1px solid #d9d9d9;
		}
		.mainCon4 .mainNews .bottom .rollDiv {
		    float: left;
		    position: relative;
		    width: 574px;
		    background: #000;
		    overflow: hidden;
		    margin-left: 22px;
		}
		.mainCon4 .mainNews .bottom .newsDiv ul {
		    margin-top: 15px;
		}
		.mainCon4 .mainNews .bottom .newsDiv .mainMoreBt {
		    position: absolute;
		    top: 40px;
		    right: 40px;
		}
		.mainMoreBt {
		    display: block;
		    padding-right: 30px;
		    height: 20px;
		    font-size: 15px;
		    color: #555;
		    line-height: 18px;
		    background: url(images/main_more_icon.png) no-repeat right 0 top 50%;
		}
		.mainCon4 .mainNews .bottom .newsDiv ul li a {
		    display: block;
		    overflow: hidden;
		}
		.mainCon4 .mainNews .bottom .newsDiv ul li a .tit {
		    float: left;
		    width: 320px;
		    font-size: 18px;
		    color: #000;
		    line-height: 36px;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		}
		.mainCon4 .mainNews .bottom .newsDiv ul li a .date {
		    float: right;
		    font-size: 16px;
		    color: #555;
		    line-height: 36px;
		}
		.mainCon4 .mainNews .bottom .newsDiv ul li a .tit:hover {
			text-decoration: underline;
		}
	</style>
</head>
<body>
	<div id="wrapper">
		<div class="menu"></div>
		<div id="cBody">
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<a href="#" class="swiper-slide">
						<img src="images/202206020530475200.jpg" style="width: 100%"/>
					</a>
					<a href="#" class="swiper-slide">
						<img src="images/202205250402341500.jpg" style="width: 100%"/>
					</a>
					<a href="#" class="swiper-slide">
						<img src="images/202205300209180230.jpg" style="width: 100%"/>
					</a>
					<a href="#" class="swiper-slide">
						<img src="images/202205300208109600.jpg" style="width: 100%"/>
					</a>
					<a href="#" class="swiper-slide">
						<img src="images/202205100949158580.jpg" style="width: 100%"/>
					</a>
				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-pagination"></div>
			</div>
			<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
			<script>
				var swiper = new Swiper(".mySwiper", {
	        		slidesPerView: 1,
	        		spaceBetween: 0,
	        		loop: true,
	        		speed: 800,	//넘어가는 속도 조절
	        		autoplay: {     //자동슬라이드 (false-비활성화)
	                	delay: 5000, // 시간 설정
	                	disableOnInteraction: true, // false-스와이프 후 자동 재생
	                },	
	        		pagination: {
		          		el: ".swiper-pagination",
	          			clickable: true,
	        		},
	        		navigation: {
		          		nextEl: ".swiper-button-next",
	          			prevEl: ".swiper-button-prev",
	        		},
	      		});
				$(function() {
	        		$(".playBtn").click(function() {
	        			var element = $(this);
	        			var elementClass = element.attr("class");
	        			var val = "playBtn";
	        			
	        			if(elementClass==val){
	        				element.addClass("onSwiper");
	        				swiper.autoplay.stop();
	        			} else {
	        				element.removeClass("onSwiper");
	        				swiper.autoplay.start();
	        			}
	        		});
				});
			</script>
			<div class="mainTodayArea" style="opacity: 1; top: 0px;">
				<div class="time">
					<a href="#">
						<p class="tit">오늘의 파크 운영시간</p>
						<p class="txt">10:00 - 21:00</p>
					</a>
				</div>
			</div>
			<div class="mainCon mainCon1">
				<p class="mainTit" style="opacity: 1; top: 0px;">
					<span>나에게 꼭 맞는 혜택</span>
					알아볼까요?
				</p>
				<p class="mainTxt" style="opacity: 1; top: 0px;">현재 진행 중인 할인혜택을 알아보세요.</p>
				<div class="boxArea" style="opacity: 1; top: 0px;">
					<div class="box-tr">
						<div class="box-td">
							<a href="javascript:notReady()">
								<span class="img">
									<img src="images/202204211112219010_231.jpg"/>
								</span>
								<span class="price">31,000원</span>
								<span class="tit">롯데월드카드(삼성카드) 는 4인까지 할인!</span>
							</a>
						</div>
						<div class="box-td">
							<a href="javascript:notReady()">
								<span class="img">
									<img src="images/202205220525225560_231.jpg"/>
								</span>
								<span class="price">31,000원</span>
								<span class="tit">롯데월드 제휴카드 온라인 프로모션</span>
							</a>
						</div>
						<div class="box-td">
							<a href="javascript:notReady()">
								<span class="img">
									<img src="images/202204211026383460_231.jpg"/>
								</span>
								<span class="price">31,000원</span>
								<span class="tit">삼성카드로 결제하면 누구나 할인!</span>
							</a>
						</div>
						<div class="box-td">
							<a href="javascript:notReady()">
								<span class="img">
									<img src="images/202204211120147310_231.jpg"/>
								</span>
								<span class="price">27,000원</span>
								<span class="tit">카카오뱅크 mini카드 우대</span>
							</a>
						</div>
					</div>
					<div class="box-tr">
						<div class="box-td">
							<a href="javascript:notReady()">
								<span class="img">
									<img src="images/202205261018420560_231.jpg"/>
								</span>
								<span class="price">31,000원</span>
								<span class="tit">엄빠와 방과 후 월드에 가보리!</span>
							</a>
						</div>
						<div class="box-td">
							<a href="javascript:notReady()">
								<span class="img">
									<img src="images/202206020338585490_231.jpg"/>
								</span>
								<span class="price">32,500원</span>
								<span class="tit">무너~야호! 롯데월드 패키지(무너 피규어 증정)</span>
							</a>
						</div>
						<div class="box-td">
							<a href="javascript:notReady()">
								<span class="img">
									<img src="images/202205240451366880_231.jpg"/>
								</span>
								<span class="price">35,000원</span>
								<span class="tit">포꾸포꾸 월드</span>
							</a>
						</div>
						<div class="box-td">
							<a href="javascript:notReady()">
								<span class="img">
									<img src="images/202205220513499880_231.jpg"/>
								</span>
								<span class="price">31,000원</span>
								<span class="tit">제휴카드 현장 프로모션</span>
							</a>
						</div>
					</div>
				</div>
				<div class="btnArea" style="opacity: 1; top: 0px;">
					<a href="javascript:notReady()" class="purpleBtn">더 많은 혜택 보기</a>
				</div>
			</div>
			<!-- mainCon1 -->
			<div class="mainCon mainCon2">
				<p class="mainTit" style="opacity: 1; top: 0px;">
					다양한 공연 및 퍼레이드 <span>정보를 한눈에!</span>
				</p>
				<p class="mainTxt" style="opacity: 1; top: 0px;">다양한 공연정보를 확인해보세요.</p>
				<div class="rollArea" style="opacity: 1; top: 0px;">
					<div class="swiper mySwiper2">
				    	<div class="swiper-wrapper">
				    	<%
				    		for(int i = 0; i < showList.size(); i++) {
				    	%>
				        	<div class="swiper-slide">
				        		<a href="javascript:void(0)" class="prfmList">
				        			<span class="img" style="background:url('IMAGES4/<%= showList.get(i).getMain() %>') no-repeat 50% 50%; background-size:cover;"></span>
				        			<span class="tit"><%= showList.get(i).getName() %></span>
				        		</a>
				        		<div class="openArea">
				        			<p class="tit"><%= showList.get(i).getName() %></p>
				        			<p class="txt"><%= showList.get(i).getExplain() %></p>
			        			<%
			        				if(!(showList.get(i).getTime().equals("금일휴연"))) {
			        			%>
				        			<div class="time">
			        				<%
			        					for(int j = 0; j < showList.get(i).getTimeArr().length; j++) {
			        				%>
				        				<p><%= showList.get(i).getTimeArr()[j] %></p>
				        			<%
			        					}//for
				        			%>
				        			</div>
			        			<%
			        				}
			        			%>
				        			<div class="link">
				        			<%
				        				if(showList.get(i).getTime().equals("금일휴연")) {
				        			%>
				        				<a href="LotteController?command=ShowDetail&name=<%= showList.get(i).getName() %>&time=no">자세히 보기</a>
				        			<%
				        				}else {
				        			%>
				        				<a href="LotteController?command=ShowDetail&name=<%= showList.get(i).getName() %>">자세히 보기</a>
				        			<%
				        				}
				        			%>
				        			</div>
				        			<a href="javascript:void(0)" class="closeBt"></a>
				        		</div>
				        	</div>
			        	<%
				    		}//for
			        	%>
				    	</div>
				      		<div class="swiper-scrollbar">
				      			<div class="swiper-scrollbar-drag"></div>
				      		</div>
				    </div>
				    <script>
						var swiper2 = new Swiper(".mySwiper2", {
							slidesPerView : 'auto',
							scrollbar: {
								el: '.mySwiper2 .swiper-scrollbar',
								draggable: true,
								snapOnRelease: false,
								dragSize: 46
							},
							spaceBetween : 22,
							mousewheel:false,
							breakpoints: {
								758: {
									scrollbar: {
										el: '.mySwiper2 .swiper-scrollbar',
										draggable: true,
										snapOnRelease: true,
										dragSize: 46
									}
								}
							}
						});
				    </script>
				</div>
				<div class="btnArea" style="opacity: 1; top: 0px;">
					<a href="LotteController?command=ShowMain" class="whiteBtn">더 많은 공연 보기</a>
					<a href="LotteController?command=Performance" class="bWhiteBtn">참여 프로그램 보기</a>
				</div>
			</div>
			<!-- mainCon2 -->
			<div class="mainCon mainCon3">
				<div class="inner">
					<p class="mainTit" style="opacity: 1; top: 0px;">
						재미있고 즐거운 <span>다양한 어트랙션!</span>
					</p>
					<div class="mainCon3Tab" style="opacity: 1; top: 0px;">
						<div class="mainTouchTab">
							<ul>
								<li>
									<a href="javascript:void(0)" class="btnAtract on" data-cd="01">아이와 함께</a>
								</li>
								<li>
									<a href="javascript:void(0)" class="btnAtract" data-cd="02">야외에서 신나게</a>
								</li>
								<li>
									<a href="javascript:void(0)" class="btnAtract" data-cd="03">실내에서 쾌적하게</a>
								</li>
							</ul>
						</div>
					</div>
					<ul class="mainCon3List" style="opacity: 1; top: 0px;">
					<%
						int cnt = 0;
						for(int i = 1; i <= 3; i++) {
							for(int j = 1; j <= 6; j++) {
								if(i==1) {
									if(j==1 || j==6) {
										out.println("<li style=\"display: list-item;\" class=\"mainCon3ListContainer mc3List" + j + " long 0" + i + "\">");	
									}else {
										out.println("<li style=\"display: list-item;\" class=\"mainCon3ListContainer mc3List" + j + " 0" + i + "\">");
									}	
								}else {
									if(j==1 || j==6) {
										out.println("<li style=\"display: none;\" class=\"mainCon3ListContainer mc3List" + j + " long 0" + i + "\">");
									}else {
										out.println("<li style=\"display: none;\" class=\"mainCon3ListContainer mc3List" + j + " 0" + i + "\">");
									}
								}
								out.println("	<a class='goAtr' href=javascript:void(0) target=\"_self\">");
								out.println("	<span class=\"img\">");
								out.println("		<img src=\"images/" + attractionList.get(cnt).getImage() + "\" style=\"display: inline;\"/>");
								out.println("	</span>");
								out.println("	<span class=\"txtArea\">");
								out.println("		<span class=\"tit\">" + attractionList.get(cnt).getName() + "</span>");
								out.println("		<span class=\"txt\">" + attractionList.get(cnt).getTitle() + "</span>");
								out.println("	</span>");
								out.println("	</a>");
								out.println("</li>");
								cnt++;
							}//inner
						}//outer
					%>
					</ul>
					<div class="btnArea" style="opacity: 1; top: 0px;">
						<a href="LotteController?command=Attraction" class="purpleBtn">더 많은 어트랙션 보기</a>
						<a href="LotteController?command=Suspension" class="bPurpleBtn">운휴 정보 보러가기</a>
					</div>
				</div>
			</div>
			<!-- mainCon3 -->
			<div class="mainCon mainCon4">
				<p class="mainTit" style="opacity: 1; top: 0px;">
					롯데월드를 좀 더 <br/>
					<span>특별하게 즐기고 싶다면!</span>
				</p>
				<p class="mainTxt" style="opacity: 1; top: 0px;">오늘 롯데월드의 소식을 만나보세요.</p>
				<div class="mainNews" style="opacity: 1; top: 0px;">
					<div class="top">
						<p class="mainCon4Tit">특별한 경험</p>
						<ul>
							<li>
								<a href="LotteController?command=NoticeDetail&num=12">
									<span class="img">
										<img src="images/mainCon4_img_hotel.jpg" class="lazy" style="display: inline;"/>
									</span>
									<span class="tit">롯데호텔 월드 로티로리룸</span>
								</a>
							</li>
							<li>
								<a href="LotteController?command=detailGiftshop&name=샤론캣 프리미엄라운지">
									<span class="img">
										<img src="images/mainCon4_img3_20211231.jpg" class="lazy" style="display: inline;"/>
									</span>
									<span class="tit">샤론캣 프리미엄라운지</span>
								</a>
							</li>
							<li>
								<a href="javascript:notReady()">
									<span class="img">
										<img src="images/mainCon4_img2.jpg" class="lazy" style="display: inline;"/>
									</span>
									<span class="tit">롯데월드 어드벤처 선물권</span>
								</a>
							</li>
							<li>
								<a href="LotteController?command=Price">
									<span class="img">
										<img src="images/mainCon4_img1.jpg" class="lazy" style="display: inline;"/>
									</span>
									<span class="tit">연간이용안내</span>
								</a>
							</li>
						</ul>
					</div>
					<div class="bottom" style="opacity: 1; top: 0px;">
						<div class="newsDiv">
							<p class="mainCon4Tit">롯데월드 소식</p>
							<ul>
								<li>
									<a href="LotteController?command=NoticeDetail&num=12">
										<span class="tit">롯데호텔 월드 로티 로리 룸 안내</span>
										<span class="date">2022.05.16</span>
									</a>
								</li>
								<li>
									<a href="LotteController?command=NoticeDetail&num=11">
										<span class="tit">개인정보처리방침 변경안내</span>
										<span class="date">2022.04.19</span>
									</a>
								</li>
								<li>
									<a href="LotteController?command=NoticeDetail&num=7">
										<span class="tit">롯데월드 어드벤처 코로나19 방역 및 예방 활동 현황</span>
										<span class="date">2022.04.18</span>
									</a>
								</li>
								<li>
									<a href="LotteController?command=NoticeDetail&num=9">
										<span class="tit">이용요금 조정 안내</span>
										<span class="date">2022.03.18</span>
									</a>
								</li>
							</ul>
							<a href="LotteController?command=Notice" class="mainMoreBt">더보기</a>
						</div>
						<div class="rollDiv">
							<a href="javascript:notReady()" target="_self">
								<img src="images/201912060405241830.jpg"/>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- mainCon4 -->
		</div><!-- cBody -->
		<div class="footer"></div>
	</div>
</body>
</html>