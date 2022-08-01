<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lotte.dto.*" %>
<%@ page import="java.util.*" %>
<%
	ArrayList<RestaurantDto> rlist = (ArrayList<RestaurantDto>)request.getAttribute("rlist");
	ArrayList<GiftshopDto> glist = (ArrayList<GiftshopDto>)request.getAttribute("glist");
	ArrayList<Attraction_dto> alist = (ArrayList<Attraction_dto>)request.getAttribute("alist");
	ArrayList<ShowDto> slist = (ArrayList<ShowDto>)request.getAttribute("slist");
	String search = (String)request.getAttribute("search");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="js/jquery-3.6.0.min.js"></script>
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
		body {
			position: relative;
		    font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    font-size: 16px;
		    color: #555;
		    letter-spacing: -0.6px;
		    height: 100%;
		    -webkit-text-size-adjust: 100%;
		    -moz-text-size-adjust: 100%;
		    -ms-text-size-adjust: 100%;
		    line-height: 1;
		}
		#body {
			position: relative;
    		width: 100%;
		}
		* {
		    margin: 0;
		    padding: 0;
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
		.container1 {
			position: relative;
		    width: 1192px;
		    margin: 0 auto;
		}
		.searchArea {
		    position: static;
		    padding: 80px 0 0 0;
		    width: 100%;
		    background: #fff;
		    text-align: center;
		    display: block;
		}
		.searchArea {
		    top: 100px;
		    left: 0;
		}
		.inputArea {
			position: relative;
		    display: inline-block;
		    padding: 3px;
		    border-radius: 32px;
		    background: rgb(111, 35, 249);
		    background: -ms-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -o-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -moz-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -webkit-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		}
		.input {
			position: relative;
		}
		.inputArea .input input {
			font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
    		color: #550adf;
		}
		.inputArea .input input {
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
		    -webkit-box-shadow: none;
		    -moz-box-shadow: none;
		    box-shadow: none;
		}
		.xbtn {
			display: inline-block;
			position: absolute;
		    top: 20px;
		    right: 65px;
		    cursor: pointer;
		}
		img, fieldset {
		    border: none;
		    vertical-align: top;
		}
		.searchBox {
			cursor: pointer;
			position: absolute;
		    top: 17px;
		    right: 26px;
		}
		.resultArea {
			margin-top: 40px;
		    color: #555;
		    font-size: 18px;
		}
		.resultArea span {
			font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
    		color: #550adf;
		}
		.searchArea:after {
			content: "";
		    display: block;
		    clear: both;
		}
		input {
		    padding: 3px 10px;
		    height: 32px;
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
		.resultList {
			margin-top: 80px;
		}
		.resiltList .resultListWrap:last-child {
		    margin-bottom: 0;
		}
		.resultCategory {
			margin-bottom: 40px;
		    padding-bottom: 29px;
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    color: #000;
		    font-size: 22px;
		    border-bottom: 2px solid #000
		}
		.item {
			margin-bottom: 40px;
		}
		.boxs {
			margin: 0;
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
		.blocklistwrap a:hover {
			box-shadow: 15px 15px 20px 0 rgb(0 0 0/ 20%);
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
		.noData {
			margin-top: 50px;
		    border-top: 2px solid #000;
		    border-bottom: 1px solid #e1e1e1;
		    padding: 100px 0;
		    text-align: center;
		}
		.noDataText {
			background: url(https://adventure.lotteworld.com/common/images/icon/no_data_icon.png) no-repeat center 0;
		    color: #777;
		    font-size: 18px;
		    padding-top: 128px;
		}
	</style>
	<script>
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
		$(function () {
			$(".searchBox").click(function() {
				var text = $("#totalq").val();
				location.href = "LotteController?command=search&text="+text;
			});
			$(".xbtn").click(function() {
				$("#totalq").val('');
			});
			$(".ADetail").click(function() {
				var Aname = $(this).find(".blockbottom").find(".name").text();
				location.href="LotteController?command=detailAttraction&name=" + Aname;
			});
			$(".RDetail").click(function() {
				var Rname = $(this).find(".blockbottom").find(".name").text();
				location.href="LotteController?command=detailRestaurant&name=" + Rname;
			});
			$(".GDetail").click(function() {
				var Gname = $(this).find(".blockbottom").find(".name").text();
				location.href="LotteController?command=detailGiftshop&name=" + Gname;
			});
			$(".SDetail").click(function() {
				var Sname = $(this).find(".blockbottom").find(".name").text();
				var Stime = $(this).find(".blockbottom").find(".time").val();
				if(Stime=="금일휴연"){
					location.href="LotteController?command=ShowDetail&name=" + Sname + "&time=no";	
				}else {
					location.href="LotteController?command=ShowDetail&name=" + Sname;	
				}
			});
			$(".menu").load("lotte/Menu.jsp");
			$(".footer").load("lotte/Footer.html");
		});
		
	</script>
</head>
<body>
	<div id="body">
	<div class="menu"></div>
		<div class="wrap">
			<div class="topsub">
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
			<h2></h2>
			<div class="container1">
				<form name="totalSearch" id="frm_search" method="get">
					<input type="hidden" name="pageIndex" id="pageIndex" value="1">
					<input type="hidden" name="gb" value="RSTNT">
					<div class="main">
						<div class="searchArea">
							<div class="inputArea">
								<div class="input">
									<input type="text" name="totalq" id="totalq" value="<%=search%>">
									<a class="xbtn">
										<img src="https://adventure.lotteworld.com/common/images/btn/reset_btn.gif"/>
									</a>
								</div>
								<a class="searchBox">
									<img src="https://adventure.lotteworld.com/common/images/btn/header_srch_btn.gif">
								</a>
							</div>
							<div class="resultArea">
								<span>'<%=search%>'</span>에 대한 검색결과
							</div>
						</div> <!-- searchArea -->
						<div class="resultList">
							<div class="resultListWrap">
								<%
								if(alist == null && rlist == null && glist == null && slist == null){
								%>
								<div class="noData">
									<p class="noDataText">검색결과가 없습니다.</p>
								</div>
								<div style="clear:both;"></div>
								<%
								}
								if(alist != null){
								%>
								<div style="display:block; position:relative; margin-top:60px;">
									<p class="resultCategory">어트렉션 (<%=alist.size()%>)</p>
									<div class="item">
										<div class="boxs">
											<div class="blocklist">
												<div class="blocklistwrap">
												<%
												for(int i = 0; i < alist.size(); i++){
												%>
													<a class="ADetail">
														<div class="blocktop">
															<span class="label"><%=alist.get(i).getSearch()%></span>
															<img src="images1/<%=alist.get(i).getPictureurl()%>"/>
														</div>
														<div class="blockbottom">
															<span class="name"><%=alist.get(i).getName()%></span>
														</div>
													</a>
												<%
												}
												%>
												</div> <!-- blocklistwrap -->
											</div> <!-- blocklist -->
										</div> <!-- boxs -->
									</div> <!-- item -->
								</div>
								<div style="clear:both;"></div>
								<%	
								} else if(alist == null){
								%>
								
								<%	
								}
								if(rlist != null){
								%>
								<div style="display:block; position:relative; margin-top:60px;">
									<p class="resultCategory">레스토랑 (<%=rlist.size()%>)</p>
									<div class="item">
										<div class="boxs">
											<div class="blocklist">
												<div class="blocklistwrap">
												<%
												for(int i = 0; i < rlist.size(); i++){
												%>
													<a class="RDetail">
														<div class="blocktop">
															<span class="label"><%=rlist.get(i).getLocation()%></span>
															<img src="images1/<%=rlist.get(i).getMainurl()%>"/>
														</div>
														<div class="blockbottom">
															<span class="name"><%=rlist.get(i).getName()%></span>
														</div>
													</a>
												<%
												}
												%>
												</div> <!-- blocklistwrap -->
											</div> <!-- blocklist -->
										</div> <!-- boxs -->
									</div> <!-- item -->
								</div>
								<div style="clear:both;"></div>
								<%
								} else if(rlist == null){
								%>
								
								<%
								}
								
								if(glist != null){
								%>
								<div style="display:block; position:relative; margin-top:60px;">
									<p class="resultCategory">기프트샵 (<%=glist.size()%>)</p>
									<div class="item">
										<div class="boxs">
											<div class="blocklist">
												<div class="blocklistwrap">
												<%
												for(int i = 0; i < glist.size(); i++){
												%>
													<a class="GDetail">
														<div class="blocktop">
															<span class="label"><%=glist.get(i).getLocation()%></span>
															<img src="images1/<%=glist.get(i).getImage2()%>"/>
														</div>
														<div class="blockbottom">
															<span class="name"><%=glist.get(i).getName()%></span>
														</div>
													</a>
												<%
												}
												%>
												</div> <!-- blocklistwrap -->
											</div> <!-- blocklist -->
										</div> <!-- boxs -->
									</div> <!-- item -->
								</div>
								<div style="clear:both;"></div>
								<%
								} else if(glist == null) {
								%>
								
								<%
								}
								
								if(slist != null){
								%>
								<div style="display:block; position:relative; margin-top:60px;">
									<p class="resultCategory">공연 (<%=slist.size()%>)</p>
									<div class="item">
										<div class="boxs">
											<div class="blocklist">
												<div class="blocklistwrap">
												<%
												for(int i = 0; i < slist.size(); i++){
												%>
													<a class="SDetail">
														<div class="blocktop">
															<span class="label"><%=slist.get(i).getLocation()%></span>
															<img src="IMAGES4/<%=slist.get(i).getMain()%>"/>
														</div>
														<div class="blockbottom">
															<span class="name"><%=slist.get(i).getName()%></span>
															<input class="time" type="hidden" value="<%= slist.get(i).getTime() %>"/>
														</div>
													</a>
												<%
												}
												%>
												</div> <!-- blocklistwrap -->
											</div> <!-- blocklist -->
										</div> <!-- boxs -->
									</div> <!-- item -->
								</div>
								<%
								} else if(slist == null) {
								%>
								
								<%
								}
								%>
								<div style="clear:both;"></div>		
							</div> <!-- resultListWrap -->
						</div> <!-- resultList -->
					</div> <!-- main -->
				</form>
			</div> <!-- container -->
		</div> <!-- wrap -->
		<div class="footer"></div>
	</div> <!-- body -->
</body>
</html>