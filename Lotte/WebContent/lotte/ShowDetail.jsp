<%@page import="com.lotte.dao.ShowDetailDao"%>
<%@page import="com.lotte.dto.ShowDto"%>
<%@page import="com.lotte.dao.DBC"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href= "https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="js/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>

<%
	String selectDay = (String)request.getAttribute("selectDay");
	String day = (String)request.getAttribute("day");
	int a = (Integer)request.getAttribute("a");	
	String chart = (String)request.getAttribute("chart");
	
	ShowDto dto = (ShowDto)request.getAttribute("dto");	
%>
</head>
<script>
	function golist() {
		location.href="LotteController?command=ShowMain&selectDay=<%= selectDay %>&day=<%= day %>&a=<%= a %>&chart=<%= chart %>";
	}
	
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

$(function() {
	$('.swiper-container').find('.swiper-pagination').append("<a href='javascript:void(0)' class='playBtn'></a>");
// 메뉴, 풋터 로드----------------------------------------------------------------------------------------

		$(".Menu").load("lotte/Menu.jsp");
		$(".Footer").load("lotte/Footer.html");

//  지도 줌인, 줌아웃---------------------------------------------------------------------------------
		$("#zoomIn").click(function() {
			$("#map1").css({"zoom" : "1.3", "top" : "<%= dto.getZoomTop() %>px", "left" : "<%= dto.getZoomLeft() %>px"});
		});
		$("#zoomOut").click(function() {
			$("#map1").css({"zoom" : "0.8", "left" : "25%", "top" : "50%"});
		});
// 즐길거리, 어트랙션, sns---------------------------------------------------------------------------
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
		$(".tagSearch").click(function() {
			var name = $(this).text();
			location.href="LotteController?command=search&text=" + name;
		});
});
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
	#Wrapper{
		position: relative;
		width: 100%;
		overflow: hidden;
	}
	#cbody{
		position: relative;
		width: 100%;
	}
	.subwrap{
		position: relative;
		padding: 0 0 130px;
		width: 100%;
	}
	h2 {
   	 	font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
   	 	font-size: 50px;
    	color: #000;
    	text-align: center;
    	padding-top: 40px;
    	margin: 0px;
	} 
	.h2Txt {
   	    font-size: 18px;
   		color: #555;
   		line-height: 30px;
  		text-align: center;
   		margin-top: 28px;
   		margin-bottom: 0px;
 
	}
	.width{
		width :100%;
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
	.swiper-pagination .swiper-pagination-bullet {
		vertical-align: top;
	    width: 11px;
	    height: 11px;
	    margin: 0 0 0 10px !important;
	    background: url(images/imgRoll_indi.png) no-repeat 50% 50%;
	}
	.swiper-pagination .swiper-pagination-bullet-active{
		background:url(IMAGES4/imgRoll_indi_on.png)
	}
	.rideInfo.type2 {
	    padding: 80px 0;
	    background: url(IMAGES4/performInfo_bg1_220110.jpg) no-repeat 50% 50%;
	    background-size: cover;
	}
	.container {
	    position: relative;
	    width: 1170px;
	    margin: 0 auto;
	}
	.rideInfo .reserArea {
	    text-align: center;
	}
	.rideInfo .cardArea {
	    text-align: center;
	    margin-top: 80px;
	}
	.rideInfo .cardArea .card:first-child {
	    margin-left: 0;
	}
	.rideInfo .cardArea .card {
	    display: inline-block;
	    vertical-align: middle;
	    position: relative;
	    box-sizing: border-box;
	    padding: 30px;
	    width: 276px;
	    height: 370px;
	    text-align: center;
	    background: #fff;
	    box-shadow: 5px 0 50px 0 rgb(0 0 0 / 10%);
	    margin-left: 19px;
    }
    .card {
	    margin: 0 auto;
	}
	img, fieldset {
	    border: none;
	    vertical-align: top;
	}
	.rideInfo .cardArea .card .txt {
	    font-size: 22px;
	    color: #000;
	    margin-top: 19px;
	}
	.rideInfo .cardArea .card .boldDiv {
	    display: table;
	    width: 100%;
	    height: 180px;
	}
	.rideInfo .cardArea .card .boldTxt2 {
	    display: table-cell;
	    vertical-align: middle;
	    width: 100%;
	    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    font-weight: bold;
	    color: #000;
	    font-size: 19px;
	    line-height: 26px;
	    text-align: center;
	}
	.rideInfo .cardArea .card .boldTxt2 strong {
	    display: inline-block;
	    width: 216px;
	    text-align: center;
	}
	* {
	    margin: 0;
	    padding: 0;
	}
	.rideInfo .cardArea .card .boldTxt2 span {
	    display: inline-block;
	    width: 100%;
	    text-align: center;
	}
	.rideInfo .cardArea .card .boldTxt {
	    display: table-cell;
	    vertical-align: middle;
	    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    font-size: 30px;
	    color: #000;
	    text-align: bold;
	}
	.rideInfo .cardArea:after {
	    content: '';
	    display: block;
	    clear: both;
	}
	.container {
	    position: relative;
	    width: 1170px;
	    margin: 0 auto;
	}
	.sibTit {
	    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    font-size: 28px;
	    color: #000;
	    text-align: center;
	    margin-top: 100px;
	    font-weight: bold;
	}
	.mapArea {
	    position: relative;
	    border: 1px solid #e1e1e1;
	    width: 1170px;
	    height: 534px;
	    overflow: hidden;
	    margin: 40px auto 0;
	}
	.mapArea .caption {
	    position: absolute;
	    top: 30px;
	    left: 30px;
	    z-index: 1;
	    padding-left: 31px;
	    font-size: 18px;
	    color: #000;
	    line-height: 22px;
	    background: url(IMAGES4/map_caption_icon.png) no-repeat 0 50%;
    }
    .mapArea .zoomBtn {
	    position: absolute;
	    bottom: 20px;
	    right: 20px;
	    width: 50px;
	}
	.mapArea .zoomBtn a {
	    display: block;
	    margin-top: 10px;
	}
	.btnArea.type2 {
 	   margin-top: 110px;
 	   text-align: center;
	}
	.btnArea.type2 .purpleBtn:first-child {
	    margin-left: 0;
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
	a{
		text-decoration: none;
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
	.tagArea {
	    text-align: center;
	    margin-top: 35px;
	}
	.tagArea > div {
	    display: inline-block;
	    padding-left: 34px;
	    background: url(IMAGES4/tag_icon.png) no-repeat 0 50%;
	}
	.tagArea > div a {
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
	.tagArea > div a:first-child {
	    margin-left: 0;
	}
	.subTit {
	    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    font-size: 28px;
	    color: #000;
	    text-align: center;
	    margin-top: 100px;
	}
	.rideInfo2 {
	    border: 1px solid #e1e1e1;
	    background: #f8f8f8;
	    padding: 48px 50px 40px;
	    margin-top: 40px;
	}
	.rideInfo2 strong {
	    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	}
</style>
<body>
<div class="Menu"></div>
<div id="Wrapper">
	<div id="cbody">
		<div class="subwrap">
			<div class="topsub">
				<div class="topsubIn">
					<a href="LotteController?command=lotteMain" class="home"></a>
						<div class="one">
							<a href="javascript:void(0)" onclick="view()" class="moremenuclick">즐길거리</a>
							<div class="moremenu" style="z-index : 15; display : none;">
								<a href="www.com" class="moremenulist" style="margin-top : 0px;">즐길거리</a>
								<a href="www.com" class="moremenulist">요금/우대혜택</a>
	 							<a href="www.com" class="moremenulist">참여프로그램</a>
								<a href="www.com" class="moremenulist">이용가이드</a>
								<a href="www.com" class="moremenulist">소통서비스</a>
							</div>
						</div>
						<div class="two">
							<a class="moremenu2box" href="javascript:void(0)" onclick="view2()">공연</a>
							<div class="moremenu2" style="z-index : 15; display : none;">
								<a href="www.com" class="moremenu2List" style="margin-top : 0px;">어트랙션</a>
	 							<a href="www.com" class="moremenu2List">페스티벌</a>
								<a href="LotteController?command=ShowMain" class="moremenu2List">공연</a>
								<a href="www.com" class="moremenu2List">다이닝/쇼핑</a>
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
			<!--  -->
			<h2><%= dto.getName() %></h2>
			<p class="h2Txt"><%= dto.getExplain() %></p>
			<%
				if(dto.getTag()!=null){
			%>
			<div class="tagArea">
				<div>
					<%
						for(int i = 0; i < dto.getTag().length; i++){
					%>
							<a class="tagSearch" href="#"><%= dto.getTag()[i] %></a>	
					<%
						}//for
					%>
				</div>
			</div>
			<%
				}
				if(dto.getImage().length==1) {
			%>
				<img src="IMAGES4/<%= dto.getImage()[0] %>" class="width" style="margin-top: 80px;"/>
			<%
				} else {
			%>
			<div class="swiper-container" style="overflow-x: hidden;">
		  <!-- Additional required wrapper -->
		  		<div class="swiper-wrapper">
		    <!-- Slides -->
		    		<%
		    			for(int i = 0; i < dto.getImage().length; i++){
		    		%>
		   			<div class="swiper-slide"><img src="IMAGES4/<%= dto.getImage()[i] %>"class="width"/></div>
		   			<%
		    			}//for
		   			%>
		  		</div>
		 		 <div class="swiper-pagination"></div>
		  		<div class="swiper-button-prev"></div>
		  		<div class="swiper-button-next"></div>
			</div>
			<%
				}
			%>
		  		<div class="rideInfo type2">
		  			<div class="container">
		  				<div class="reserArea"></div>
		  				<div class="cardArea">
		  				<!-- 카드 1 -->
		  					<div class="card">
		  						<p class="icon">
		  							<img src="IMAGES4/performInfo_card_icon1.png">
		  						</p>
		  						<p class="txt">공연기간</p>
		  						<div class="boldDiv">
		  							<p class="boldTxt2">
		  								<strong><%= dto.getPeriod() %></strong>
		  							</p>
		  						</div>
		  					</div>
		  					<!-- 카드 2 -->
		  					<div class="card">
		  						<p class="icon">
		  							<img src="IMAGES4/performInfo_card_icon2.png">
		  						</p>
		  						<p class="txt">공연시간</p>
		  						<div class="boldDiv">
		  							<p class="boldTxt2">
		  								<span><%= dto.getTime() %></span>
		  							</p>
		  						</div>
		  					</div>
		  					<!-- 카드 3 -->
		  					<div class="card">
		  						<p class="icon">
		  							<img src="IMAGES4/performInfo_card_icon3.png">
		  						</p>
		  						<p class="txt">소요시간</p>
		  						<div class="boldDiv">
		  							<p class="boldTxt"><%= dto.getLeadtime() %></p>
		  						</div>
		  					</div>
		  				</div>
		  			</div>
		  		</div><!-- rideInfo type2 -->
		  		<div class="container">
		  		<%
		  			if(dto.getSurely()!=null){
		  		%>
			  		<p class="subTit">꼭 알아두세요</p>
			  		<div class="rideInfo2"><%= dto.getSurely() %></div>
			  	<%
		  			}
			  	%>
		  			<p class="sibTit">공연장소</p>
		  			<div class="mapArea">
		  				<p class ="caption"><%= dto.getLocation() %></p>
		  				<div class="map" data-controller="controller/lwc/mapController">
							<p class="caption"></p>
								<div class="map1">
									<div id="map1" style= "position: relative; float: left; zoom:0.8; left: 25%; top: 50%;" class="ui-draggable">
										<img src="IMAGES4/<%= dto.getLocation_image() %>" id="mapImg" width="836">
											<p id="mapCheck" style="position: absolute; top:<%= dto.getTop() %>px; left:<%= dto.getLeft() %>px;">
												<img src="IMAGES4/<%= dto.getHere() %>">
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
		  			</div>
		  		</div>
		  		<!--  -->
		  		<div class="btnArea type2">
					<a href="javascript:golist()" class="purpleBtn">목록</a>
				</div>
		</div>
	</div>
</div>
<div class="Footer"></div>
<script>
//스와이퍼 ------------------------------------------------------------------------------------
const swiper = new Swiper('.swiper-container', {
	  speed: 800,
	  autoplay: {
		delay: 5000,
	  },
	  loop: true,
	  // If we need pagination
	  pagination: {
	    el: '.swiper-pagination',
	    clickable: true,
	  },

	  // Navigation arrows
	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
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