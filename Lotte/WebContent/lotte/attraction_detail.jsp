<%@page import="com.lotte.dao.AttractionDao"%>
<%@page import="com.lotte.dto.Attraction_dto"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link href= "https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<link rel= "stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>

<%
	Attraction_dto aDto = (Attraction_dto)request.getAttribute("dto"); 
%>
<script>
$(function() {
	$('.swiper-container').find('.swiper-pagination').append("<a href='javascript:void(0)' class='playBtn'></a>");
// 메뉴, 풋터 로드----------------------------------------------------------------------------------------

		$(".menu").load("lotte/Menu.jsp");
		$(".footer").load("lotte/Footer.html");

//  지도 줌인, 줌아웃---------------------------------------------------------------------------------
		$("#zoomIn").click(function() {
			$("#map1").css({"position" : "relative", "float" : "left"});
			$("#map1").css('zoom', '1.3');
			$("#map1").css('top', '<%=aDto.getMax_top()%>px');
			$("#map1").css('left', '<%=aDto.getMax_left()%>px');
			$("#map1").css('transform', 'translate(-25%,-25%)');
		});
		$("#zoomOut").click(function() {
			$("#map1").css('zoom', '0.8');
			$("#map1").css('left','25%');
			$("#map1").css('top','50%');
			$("#map1").css('transform','initial');
		});
		
		var select = $(".second").text();
		var list = $('.moremenulist2');
		for(var i = 0; i <= 4; i++){
			if(list.eq(i).text() == select){
				list.eq(i).css('font-family', 'Notosans-Bold');
				list.eq(i).css('color','#000');
				break;
			}
		}
		$(".tags").click(function() {
			var tagName = $(this).text();
			location.href="LotteController?command=search&text=" + tagName;
		});
});
function view() {
	if($(".moremenu").css('display')=='none') {
		if($(".moremenu2").css('display')=='block') {
			$(".moremenu2").slideUp();
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
		if($(".sharesub").css('display')=='block'){
			$(".sharesub").slideUp();
		}
	} else if($(".moremenu2").css('display')=='block'){
	}
		$(".moremenu2").slideToggle();
}




function shareview() {
	if($(".sharesub").css('display')=='none'){
		if($(".moremenu").css('display')=='block'){
			$(".moremenu").slideUp();
		}
		if($(".moremenu2").css('display')=='block'){
			$(".moremenu2").slideUp();
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
	var select = $(".moremenu2box").text();
	var list = $(".moremenu2List");
	for(var i = 0; i <= 3; i++){
		if(list.eq(i).text() == select){
			list.eq(i).css('font-family', 'NotoSans-bold');
			list.eq(i).css('color', '#000');
			break;
		}
	}
</script>

<style>
	@font-face {
		font-family: "NotoSans-Bold";
		src: url("font/NotoSansKR-Bold.otf");	
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
	#wrapper{
		position: relative;
		width: 100%;
		overflow: hidden;
	}
	#cbody{
		position: relative;
		width:100%;
	}
	.subWrap{
		position: relative;
		padding: 0 0 130px;
		width: 100%;
	}
	body {
		font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
		font-size: 16px;
		letter-spacing: -0.6px;
		line-height: 1;
		width:100%;
		margin-left:0px;
	}
	.container {
		position: relative;
		width:1170px; 
		margin:0 auto;
	} 
	h2 {
   	 	font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
   	 	font-size: 50px;
    	color: #000;
    	text-align: center;
    	padding-top: 40px;
    	margin: 0px;
	} 
	.h2txt {
   	    font-size: 18px;
   		color: #555;
   		line-height: 30px;
  		text-align: center;
   		margin-top: 28px;
   		margin-bottom: 0px;
 
	}
	.tagArea{
		text-align: center;
		margin-top:35px;
	}
	.tagArea > div{
		display: inline-block;
		padding-left: 34px;
   		background: url(IMAGES4/tag_icon.png) no-repeat 0 50%;
	}
	.tagArea > div a{
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
	.tagArea > div a:first-child{
		margin-left: 0;
	}
	div.number{
		background-color: #ffffff;
		padding: 40px;
		display: inline-block;
		margin: 0px 0px 20px;
		vertical-align: middle;
		box-shadow: 5px 0 50px 0 rgb(0 0 0 / 10%);
		box-sizing: border-box;
		margin-left: 19px;
		position: relative;	
	}
	
	
	.tag > a{
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
	.width{
		width: 100%;
	}
	p.txt{
		margin: 19px 0px 0px;
	}
	.ride{
		padding: 80px 0px;
		background: url(IMAGES4/rideInfo_bg1.jpg) 50% 50%;
		background-size: cover; 
	}
	.info-container{
		position: relative;
		width: 1170px;
		margin:0 auto;
	}
	.ride .announcement{
		text-align: center;
		margin-top: 80px;
	}
	.swiper-button-next {
		position:absolute;
		background: url(IMAGES4/imgRoll_next.png) no-repeat;
		background-position: center;
		margin-right:22px;
		margin-top:-22px;
		right: 40px;
		top: 50%;
		width: 70px;
		height: 70px;
	}
	.swiper-button-prev {
		position:absolute;
		background: url(IMAGES4/imgRoll_prev.png) no-repeat;
		margin-left:22px;
		margin-top:-22px;
		left: 40px;
		top: 50%;
		width: 70px;
		height: 70px;
	}
	.swiper-button-next::after,
	.swiper-button-prev::after {
		display: none;
	}
	.swiper-container {
		width: 100%;
		position: relative;
		margin-top: 80px;
	}
	.swiper-container .swiper-pagination{
		display: inline-block;
		padding: 15px 64px 15px 31px;
		width: auto;
		height: 11px;
		left: 50%;
		bottom: 50px;
		background: rgba(0,0,0,0.5);
		overflow: hidden;
		border-radius: 20.5px;
		transform: translate(-50%, 0);
	}
	.swiper-pagination .swiper-pagination-bullet {
		vertical-align: top;
	    width: 11px;
	    height: 11px;
	    margin: 0 0 0 10px;
	    background: url(IMAGES4/imgRoll_indi.png) no-repeat 50% 50%;
	}
	.swiper-pagination .swiper-pagination-bullet-active{
		background:url(IMAGES4/imgRoll_indi_on.png)
	}
	.swiper-pagination .playBtn {
	    display: block;
	    width: 41px;
	    height: 41px;
	    position: absolute;
	    top: 0;
	    right: 0;
	    background: url(IMAGES4/play_bt.png) no-repeat 50% 50%;
	}
	.swiper-pagination .playBtn.on {
		background: url("IMAGES4/play_bt_on.png") no-repeat 50% 50%;
	}
	.ride .announcement .number{
	 	display: inline-block;
	 	padding: 30px;
	 	width: 276px;
	 	height: 370px; 
	 	vertical-align: middle;
	 	position: relative;
	 	box-sizing: border-box;
	 	text-align: center;
	 	background: #fff;
	 }
	 .bear{
	 	background:url(IMAGES4/bear.png) no-repeat 50% 0;
	 }
	 .baby{
	 	background:url(IMAGES4/baby.png) no-repeat 50% 0;
	 }
	 .disk {
	 	background:url(IMAGES4/rideInfo_rest_icon4.png) no-repeat 50% 0;
	 }
	 .heart {
	 	background:url(IMAGES4/rideInfo_rest_icon3.png) no-repeat 50% 0;	 
	 }
	 .see {
	 	background:url(IMAGES4/rideInfo_rest_icon5.png) no-repeat 50% 0;	 	 	
	 }
	 .ride .precautions p{
	 	display: inline-block;
	 	padding: 120px 20px 0;
	 	min-width: 100px;
	 	font-size: 16px; 
	 	color:#000; 
	 	text-align: center;
	 }
	 
	 .number2{
	 	font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
	 	font-size: 22px;
	 	margin: 19px 0px 0px;
	 }
	 .number_p{
	 	display: table;
	 	width: 100%;
	 	height: 180px;
	 }
	 .number_p_text{
	 	font-family:'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	 	font-size: 30px;
	 	display: table-cell; 
	 	color: #000;
	 	text-align: center;
	 	vertical-align: middle; 
	 	}
	 	
	 .text1{ 
	 	font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
	 	font-size: 22px;
	 	margin: 19px 0px 0px; 
	 }
	 .infor_text{
	 	display: table;
	 	width: 100%;
	 	height: 180px;
	 }
	 .infor_text2{
	 	font-size: 16px; 
	 	display: table-cell;
	 	color: #000;
	 	vertical-align: middle;
	 	line-height: 26px;
	 	margin-top: 65px;  
	 }
	 .limit{
	 	font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	 	font-size: 28px;
	 	text-align: center;
	 }
	 body, div, h1, h3, h4, h5, h6, ul, ol, li, dl, dt, dd,  form, fieldset, table, tr, th, td {
	    margin: 0;
	    padding: 0;
	}
	 .ride .limit{
	 	margin-top: 80px;
	 	margin-bottom: 0px;
	 }
	 .precautions{
	 	text-align: center;
	 	margin-top: 40px;
	 }
	 .plz{
	 	font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	 	font-size: 28px;
	 	text-align: center;
	 	margin-top: 100px;
	 }
	 .infor2{
	 	border: 1px solid #e1e1e1;
	 	background: #f8f8f8;
	 	padding: 48px 50px 40px;
	 	margin-top: 40px;
	 	text-align: left; 
	 }
	 .schedule{
	 	font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	 	font-size: 28px;
	 	text-align: center;
	 	margin: 100px 0px 0px;
	 }
	.schedule1{
		width: 1170px;
		margin: 40px auto 0;
		text-align: center;
		border-bottom: 1px solid #e1e1e1;
		padding: 0px 0px 100px; 
	}
	.schedule_info{
		border: 1px solid #e1e1e1;
		background-color: #f8f8f8;
		padding: 80px 0;
		margin-top: 40px;
		text-align: center;  
	}
	.schedule_info .schedule_info_1{
		display: inline-block;
		font-size:18px;
		color:#777;
		margin:0;
	}
	.schedule_info .schedule_info_1 span{
		display: inline-block; 
		background:url(IMAGES4/정상운영.png) no-repeat  0;
		padding-left: 110px;
		line-height: 100px;
	}
	.schedule_info_2{
		font-size:16px;
		color:#555;
		line-height:28px;
		margin:30px 0px 0px;	 	
	}
	.link{
		margin: 40px 0px 0px;
	}
	.link a{
		display: inline-block;
		border: 1px solid #e1e1e1;
		padding: 0px 40px;
		font-size: 16px;
		text-align: center;
		border-radius: 25px;
		line-height:46px;
		height:48px;
		background: #f6f6f6; 
	}
	.location{
		font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		font-size:28px;
		color:#000;
		text-align:center;
		margin: 100px 0px 0px;
	}
	.map{
		position:relative;
		border:1px solid #e1e1e1;
		width:1170px;
		height:534px;
		overflow:hidden;
		margin: 40px auto 0px;
	}
	.map .caption{
		position: absolute;
		top:30px;
		left:30px;
		z-index:1;
		padding:0px 0px 0px 31px;
		font-size:18px;
		color:#000;
		line-height:22px;
		background:url(IMAGES4/map_caption_icon.png) no-repeat 0 50%;
		margin:0px;
	}
	.zoomBtn{
		position: absolute;
		bottom: 20px;
		right:20px;
		width: 50px;
	}
	.map .zoombtn{
		display: block;
		margin-top: 10px;
	}
	.btnArea{
		text-align:center;
		margin:60px 0px 0px;
	}
	.purplebtn{
		display: inline-block;
		padding:0px 70px;
		height: 56px;
		line-height:54px;
		font-size:18px;
		color: #fff;
		text-align:center;
		border-radius:28px;
		background:linear-gradient(to bottom right,rgba(111, 35, 249, 1) 0%, rgba(85, 10, 223, 1) 100%);
	}	
	#footer{
		border-top: 1px solid #d9d9d9;
	}
	
	#footer .container{
		padding:50px 0px 160px;
	}
	#footer .container .top{
		padding-bottom: 30px;
		border-bottom: 1px solid #e0e0e0;
		overflow: hidden;
	}
	#footer .container .top .links{
		float: left;
		overflow: hidden;
	}
	#footer .container .top .links a:first-child{
		margin-left: 0;
	}
	#footer .container .top .links a{
		float:left;
		display: inline-block;
		font-size: 16px;
		color: #333;
		line-height:30px;
		margin-left:20px;
	}
	#footer .container .top .sns{
		float: right;
		overflow: hidden;
	}
	#footer .container .top .sns a:first-child{
		margin-left: 0;
	}
	#footer .container .top .sns a{
		float: left;
		margin-left: 10px;
	}
	#footer .container .bottom{
		margin-top:30px;
		position: relative;
		height:83px;
	}
	.hotel{
		position:absolute;
		top:75px;
		right:0;
	}
	.hotel .pc-img{
		display: inline-block;
	}
	#footer .container .bottom .left{
		float: left;
	}
	#footer .container .bottom .left .logo{
		float: left;
		margin: 0px 0px 0px 0px;
	}
	#footer .container .bottom .left div{
		padding-left: 140px;
	}
	#footer .container .bottom .left div p:first-child{
		margin: 0;
	}
	#footer .container .bottom .left div p{
		font-size: 15px;
		color: #555;
		margin:10px 0px 0px 0px;
	}
	#footer .container .bottom .left div p span:first-child{
		margin-left: 0;
		padding-left: 0;
	}
	#footer .container .bottom .left div p span{
		display: inline-block;
		position: relative;
		margin-left: 11px;
		padding-left: 11px;
	}
	#footer .container .bottom .left div p.copyright{
		font-size: 13px;
		color: #777;
		margin-top: 30px;
	}
	#footer .container .bottom .isms{
		position: absolute;
		bottom: -70px;
		left: 140px;
	}
	#footer .container .bottom .isms a {
		display: block;
		padding-top: 3px;
		padding-left: 55px;
		height: 37px;
		background:url(IMAGES4/isms_icon.png) no-repeat 0 50%;
	}
	#footer .container .bottom .isms a > p{
		position: relative; 
		display: block;
		font-size: 12px;
		color: #333;
		line-height: 16px;
		margin:0px;
	}
	#footer .container .bottom .isms a > p span:first-child{
		position: relative;
		padding-right: 9px;
		margin-right: 6px;
	}
	#footer .container .bottom .isms a > p span:first-child:after {
	    content: '';
	    position: absolute;
	    top: 50%;
	    right: 0;
	    margin-top: -5.5px;
	    width: 1px;
	    height: 11px;
	    background: #e1e1e1;
	}
	#footer .container .bottom .left div p span:before {
	    content: '';
	    position: absolute;
	    top: 50%;
	    left: 0;
	    width: 1px;
	    height: 13px;
	    margin-top: -6.5px;
	    background: #e0e0e0;
	}
	#footer .container .bottom .isms.newST{
		left: 430px;
	}
	#footer .container .bottom .isms.newST p {
	    padding-top: 0;
	    padding-left: 68px;
	    height: 40px;
	    background: url(IMAGES4/isms_icon2.jpg) no-repeat 0 50%;
	    margin: 0px;
	}
	#footer .container .bottom .isms.newST p span {
	    position: relative;
	    display: block;
	    font-size: 12px;
	    color: #333;
	    line-height: 40px;
	}
	a {
		 text-decoration: none;
		 color: #555;
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
</style>
</head>
<!------------------------------------------------------------------------------------------------------------------------->
<body>
<div class="menu"></div>
<!-- 메인부분 -->
<div id="wrapper">
	<div id="cbody">
		<div class="subWrap">
	<!-------------------------------상단바----------------------------------  -->
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
										<a class="moremenu2box second" href="javascript:void(0)" onclick="view2()">어트랙션</a>
										<div class="moremenu2" style="z-index : 15; display : none;">
											<a href="LotteController?command=Attraction" class="moremenulist2" style="margin-top : 0px;">어트랙션</a>
				 							<a href="LotteController?command=Festival" class="moremenulist2">페스티벌</a>
											<a href="LotteController?command=ShowMain" class="moremenulist2">공연</a>
											<a href="LotteController?command=Restaurant" class="moremenulist2">다이닝/쇼핑</a>
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
	<!-------------------------------상단바----------------------------------  -->
	<!-------------------------------메인----------------------------------  -->
		<div data-controller="controller/COCommonController controller/lwc/lwca/LWCAAtrnController" data-type="view">
		<h2><%=aDto.getName()%></h2><!-- 어트랙션 이름 -->
		<div class ="container">
			<p class ="h2txt " style ="white-space: pre-wrap;"><%=aDto.getExplanation()%></p> <!-- 어트랙션 설명 -->
			<div class ="tagArea">
				<div>
				<!-- 어트랙션 태그 -->
			<% 
				String[] arr1 = null;
				if(aDto.getTags()!=null){
		   			arr1 = aDto.getTags().split(",");
				}
				if(arr1 != null){
					for(int i =0; i<=arr1.length-1; i++) {
			%>
				<a class="tags" href="#"><%= arr1[i] %></a>
			<%
					}//for
				}else {
			%>
				
			<%
				}
			%>
				</div>
			</div>
		</div>
				
		<div class="swiper-container" style="overflow-x: hidden;">
		  <!-- Additional required wrapper -->
		  <div class="swiper-wrapper">
		    <!-- Slides -->
		    
		    <!-- 어트랙션 슬라이드 이미지 -->
		  	<%
		    String[] arr = aDto.getImage().split("<br/>");
			for(int i =0; i<=arr.length-1; i++) {
				out.println("<div class='swiper-slide'><img src='IMAGES4/" + arr[i] + "' class='width'/></div>");
			}
			%>
		  </div>
		
		  <div class="swiper-pagination"></div>
		  <div class="swiper-button-prev"></div>
		  <div class="swiper-button-next"></div>
		</div>
		<%
			if(aDto.getMoney() == null && aDto.getPerson() == null && aDto.getInformation() == null){
		%>
		<%
			}else {
		%>
		<div class ="ride">
			<div class="info-container">
				<div class="announcement">
					<% 
						if(aDto.getMoney() == null){
							out.println("");
						}else{
							out.println("<div class='number'>"
							+ "<p><img src='IMAGES4/rideInfo_card_icon1.png'></p>"
							+ "<p class='number2'>이용요금</p>"
							+ "<div class='number_p'><p class='number_p_text'>");
							%>
							<%=aDto.getMoney()%>
							<% 
							out.println("</p></div>"
							+ "</div>");
						}
					%>
					<%
						if(aDto.getPerson()!=null){
					%>
					<div class="number">
						<p>
							<img src ="IMAGES4/탑승인원.png"/>
						</p>
						<p class ="number2">탑승인원</p>
						<div class="number_p">
							<p class  ="number_p_text"><%=aDto.getPerson()%></p> <!-- 어트랙션 탑승 인원 -->
						</div>
					</div>
					<%
						}
						if(aDto.getInformation()!=null){
					%>
					<div class ="number">
						<p>
							<img src ="IMAGES4/이용정보.png"/>
						</p>
						<p class ="number2">이용정보</p>
						<div class="infor_text">
							<p class="infor_text2"><%=aDto.getInformation()%></p> <!-- 어트랙션 이용정보 -->
						</div>
					</div>
					<%
						}
						String[] strArr = aDto.getRestrict().split(", ");
						if(strArr != null){
					%>
					<p class="limit">탑승제한</p>
				</div>
				<div class="precautions">
				<%
					for(int i = 0; i < strArr.length; i++) {
						switch(strArr[i]){
						case "음주":
							out.println("<p class='bear'>음주</p>");
							break;
						case "임산부":
							out.println("<p class='baby'>임산부</p>");
							break;
						case "심/혈관계 질환자":
							out.println("<p class='heart'>심/혈관계 질환자</p>");
							break;
						case "디스크 환자":
							out.println("<p class='disk'>디스크 환자</p>");
							break;
						case "시각 제한자":
							out.println("<p class='see'>시각 제한자</p>");
							break;
						}//switch
					}//for
				%>
				</div>
				<%
					}
				%>
			</div>
		</div><!-- ride -->
		<%
			}
		%>
	</div>
	
	
	<div class="container">
	<%
		if(aDto.getPlease() != null) {
	%>
		<p class="plz">꼭 알아두세요</p>
		<div class="infor2"> <!-- 어트랙션 꼭 알아두세요 -->
			<%=aDto.getPlease()%>
		</div>
	<%
		}
	%>
		<p class="schedule">운휴일정</p>
		<div class="schedule1">
			<div class="schedule_info">
				<p class="schedule_info_1">
					<span><%=aDto.getHoliday() %></span>
				</p>
			</div>
			<p class="schedule_info_2">
			<span style="color:#550adf;"><%=aDto.getHoliday2() %></span>
			</p>
			<p class="link">
				<a href="LotteController?command=Suspension">이번 달 운휴 달력 보러가기</a>
			</p>
		</div>
		<p class="location">위치정보</p>
		<div class="map" data-controller="controller/lwc/mapController">
			<p class="caption"><%=aDto.getLocation() %></p>
				<div class="map1">
					<div id="map1" style= "position: relative; float: left; zoom:0.8; left: 25%; top: 50%;" class="ui-draggable">
						<img src="IMAGES4/<%=aDto.getMapurl()%>" id="mapImg" width="836">
							<p id="mapCheck" style="position: absolute; top:<%=aDto.getHeretop()%>px; left:<%=aDto.getHereleft()%>px;">
								<img src="IMAGES4/map_check.png">
							</p>
					</div>
				</div>
			<div class="zoomBtn">
				<a href="javascript:" id="zoomIn" class="zoomIn">
					<img src="IMAGES4/zoomIn_btn.gif" alt="확대">
				</a>
				<a href="javacript:" id ="zoomOut" class="zoomOut">
					<img src="IMAGES4/zoomOut_btn.gif" alt="축소">
				</a>
			</div>
		</div>
				<div class="btnArea">
					<a href="LotteController?command=Attraction" class="purplebtn">목록</a>
				</div>
			</div>
	
		</div>
	</div>

<!-- 메인부분 -->

<!-- 하단 링크부분 ------------------------------------------------------------------------------------------------------------>
	<div class="footer"></div>
</div>
<script>
//스와이퍼 ------------------------------------------------------------------------------------
const swiper = new Swiper('.swiper-container', {
	  speed: 1500,
	  autoplay: {
		delay: 6000,
	  },
	  // Optional parameters
	  direction: 'horizontal',
	  loop: true,
	  // If we need pagination
	  pagination: {
	    el: '.swiper-pagination',
	  },

	  // Navigation arrows
	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  },

	  // And if we need scrollbar
	  scrollbar: {
	    el: '.swiper-scrollbar',
	    hide: true
	  },
});
	  $(function() {
		// 플레이 버튼---------------------------------------------------------------------------------------------	
			$(".playBtn").click(function(){
				var Btn =$(this);
				var play = Btn.attr("class");
				var val ="playBtn";
				
				if(play==val){
					Btn.addClass("on");
					swiper.autoplay.stop();
				}else{
					Btn.removeClass("on");
					swiper.autoplay.start();
				}
			});
	  });

</script>
</body>
</html>