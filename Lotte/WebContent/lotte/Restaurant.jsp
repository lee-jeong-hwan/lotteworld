<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lotte.dto.*" %>
<%@ page import="com.lotte.dao.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	
	RestaurantDao rmDao = new RestaurantDao();
	ArrayList<RestaurantDto> list = rmDao.restaurantMain();
	ArrayList<RestaurantDto> list2 = new ArrayList<RestaurantDto>();
	int cnt = rmDao.restaurantCnt();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레스토랑</title>
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

#body .bottom a:hover, #body .bottom a:focus {
	box-shadow: 15px 15px 20px 0 rgb(0 0 0/ 20%);
}

#body .bottom a:hover {
	background-color: #6217EC;
	text-decoration: none;
	color: white;
}

#body .bottom a:not(:hover) {
	color: #000;
}

#body .bottom a:link {
	text-decoration: none;
}

img {
	border: none;
	vertical-align: top;
}

.wrap img {
	border: none;
	vertical-align: top;
	color: #555;
	position: relative;
}

.name {
	font-size: 19px;
	font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	font-size: 22px;
	line-height: 1.4;
	display: block;
	margin: 0;
	padding: 27px 25px 30px 25px;
	width: 171px;
	height: 54px;
	text-decoration: none;
}

.label {
	position: absolute;
	top: 20px;
	left: 20px;
	padding: 0 10px;
	height: 36px;
	line-height: 34px;
	font-size: 15px;
	color: #fff;
	text-align: center;
	background: rgba(0, 0, 0, 0.5);
	border-radius: 2px;
	z-index: 1;
}

.bottom a {
	display: block;
	float: left;
	width: 277px;
	border: 1px solid #e1e1e1;
	box-sizing: border-box;
	margin-top: 22px;
	margin-right: 21px;
	-moz-transition: .3s ease;
	-webkit-transition: .3s ease;
	-ms-transition: .3s ease;
	-o-transition: .3s ease;
	transition: .3s ease;
}

.bottom a:nth-child(4n+0) {
	margin-right: 0;
}

.bottom > a:nth-of-type(1), .bottom > a:nth-of-type(2), .bottom > a:nth-of-type(3), .bottom > a:nth-of-type(4) {
	margin-top: 0px !important;
}

.blockList:after {
	content: '';
	display: block;
	clear: both;
}
.sub {
	position: relative;
	max-height: 246px;
	overflow: hidden;
	display: block;
	top: -1px;
	width: 275px;
}

.sub>img {
	width: 275px;
}

div {
	display: block;
}

* {
	margin: 0;
	padding: 0;
}

#Body {
	position: relative;
	width: 100%;
}

.wrap {
	position: relative;
	padding: 0 0 130px;
	width: 100%;
}

#body .top {
	height: 480px;
	background:
		url(images1/enjoy_bg3.jpg)
		no-repeat 50% 0;
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

.top .topsub .topsubIn .home {
	background:
		url(images1/w_home_btn.png)
		no-repeat 0 50%;
	border-color: rgba(255, 255, 255, 0.3);
}

.topsub .topsubIn .home {
	float: left;
	display: block;
	width: 36px;
	height: 30px;
	border-right: 1px solid #e1e1e1;
}

.topsub .topsubIn>div.one {
	margin-left: 26px;
}

.topsub .topsubIn>div {
	float: left;
	position: relative;
	margin-left: 20px;
}

.top .topsub .topsubIn>div>a {
	color: #fff;
	background:
		url(images1/w_lnb_icon.png)
		no-repeat right 0 top 50%;
	text-decoration: none;
}

.topsub .topsubIn>div>a {
	display: block;
	padding-right: 42px;
	height: 30px;
	font-size: 16px;
	line-height: 28px;
}

.topsub .topsubIn>div>div {
	position: absolute;
	top: 50px;
	left: -26px;
	padding: 25px;
	border: 1px solid #e1e1e1;
	background: #fff;
	display: none
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
	float: left;
}

.shareimg {
	background:
		url(images1/w_share_btn.png)
		no-repeat 50% 50%;
}

.shareimg:hover {
	background:
		url(images1/share_btn_on.png)
		no-repeat 50% 50%;
}

.print {
	float: left;
	margin-left: 10px;
	background:
		url(images1/w_print_btn.png)
		no-repeat 50% 50%;
}

.moremenu {
	width: 101.797px;
	padding: 25px 25px;
	display: none;
}

.moremenulist {
	text-decoration: none;
	color: #555;
	display: block;
	font-size: 16px;
	white-space: nowrap;
	margin-top: 17px;
}
.middle {
	color: #fff !important;
}

h2 {
	font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	font-size: 50px;
	text-align: center;
	display: block;
	font-weight: bold;
	margin-top: 0px;
	margin-bottom: 0px;
}

h2.middle {
	padding-top: 90px;
}

.middlesub {
	font-size: 18px;
	line-height: 30px;
	text-align: center;
	margin-top: 28px;
}

p {
	color: #fff;
	display: block;
}

.centerbottom {
	position: relative;
	width: 1171px;
	margin: 0 auto;
}

.center {
	position: relative;
	width: 100%;
	height: 90px;
	text-align: center;
	margin-top: -45px;
	z-index: 10;
}

.center .centerbox {
	display: block;
	position: absolute;
	width: 100%;
	height: 100%;
	text-align: center;
	box-shadow: 5px 10px 70px rgb(0 0 0/ 40%);
	background: rgb(111, 35, 249);
	background: -ms-linear-gradient(to bottom right, rgba(111, 35, 249, 1)
		0%, rgba(85, 10, 223, 1) 100%);
	background: -o-linear-gradient(to bottom right, rgba(111, 35, 249, 1) 0%,
		rgba(85, 10, 223, 1) 100%);
	background: -moz-linear-gradient(to bottom right, rgba(111, 35, 249, 1)
		0%, rgba(85, 10, 223, 1) 100%);
	background: -webkit-linear-gradient(to bottom right, rgba(111, 35, 249, 1)
		0%, rgba(85, 10, 223, 1) 100%);
	background: linear-gradient(to bottom right, rgba(111, 35, 249, 1) 0%,
		rgba(85, 10, 223, 1) 100%);
}

.centertext {
	display: inline-block;
	vertical-align: top;
	padding-left: 50px;
	height: 100%;
	font-size: 20px;
	color: #fff;
	line-height: 90px;
	background:
		url(images1/srch_btn2.png)
		no-repeat 0 50%;
}

.bottom {
	margin-top: 80px;
}

.bottom:after {
	content: '';
	display: block;
	clear: both;
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
	background:
		url(images1/facebook_btn.png)
		no-repeat 50% 50%;
}

.facebook:hover {
	background:
		url(images1/facebook_btn_on.png)
		no-repeat 50% 50%;
}

.twiter {
	background:
		url(images1/twitter_btn.png)
		no-repeat 50% 50%;
}

.twiter:hover {
	background:
		url(images1/twitter_btn_on.png)
		no-repeat 50% 50%;
}

.copy {
	background:
		url(images1/link_btn.png)
		no-repeat 50% 50%;
}

.copy:hover {
	background:
		url(images1/link_btn_on.png)
		no-repeat 50% 50%;
}

.shareprint:after {
	content: '';
	display: block;
	clear: both;
}

.fl {
	float: left;
}

#search2 {
	display: none;
	position: relative;
	top: -44px;
	height: 426px;
	background: linear-gradient(to bottom right, rgba(111, 35, 249, 1) 0%,
		rgba(85, 10, 223, 1) 100%);
	box-shadow: 5px 10px 70px rgb(0 0 0/ 40%);
}

#search2>div.center2 {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	/* padding: 50px 0; */
	box-shadow: 5px 10px 70px rgb(0 0 0/ 40%);
	background:
		url(images1/srch_open_bg.jpg)
		no-repeat 100% 100%;
	background-size: cover;
}

#search2>div>a {
	position: absolute;
	top: 25px;
	right: 25px;
}

#search2>div>a>img {
	width: 24px;
	height: 24px;
}

#search2 #openDivTitle {
	text-align: center;
	position: absolute;
	width: 100%;
	top: 15px;
}

#search2 #openDivTitle p {
	font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic',
		sans-serif !important;
	font-size: 27px;
	color: #fcdb05;
	padding-top: 36px;
}

#search2 #openDivList {
	position: absolute;
	top: 135px;
	width: 100%;
}

#search2 #openDivList>div {
	width: 790px;
	height: 92px;
	margin: 0 auto;
}

.openSelect {
	position: relative;
	width: 250px;
	height: 50px;
	background: #fff;
	box-shadow: 5px 10px 70px rgb(0 0 0/ 20%);
	border-radius: 25px;
	z-index: 11;
}

.openSelect2 {
	position: relative;
	width: 250px;
	height: 50px;
	background: #fff;
	box-shadow: 5px 10px 70px rgb(0 0 0/ 20%);
	border-radius: 25px;
	z-index: 11;
}

.openSelect:after {
	content: '';
	position: absolute;
	top: 50%;
	right: 20px;
	margin-top: -3px;
	width: 10px;
	height: 6px;
	background:
		url(images1/srch_sel_icon2.png)
		no-repeat 0 0;
	z-index: 11;
}

.openSelect2:after {
	content: '';
	position: absolute;
	top: 50%;
	right: 10px;
	margin-top: -15px;
	width: 30px;
	height: 30px;
	background:
		url(images1/srch_chk_icon.png)
		no-repeat 0 0;
}

.openSelect2.on:after {
	content: '';
	position: absolute;
	top: 50%;
	right: 10px;
	margin-top: -15px;
	width: 30px;
	height: 30px;
	background:
		url(images1/srch_chk_icon_on.png)
		no-repeat 0 0;
}

.openSelect>a {
	display: block;
	text-decoration: none;
	text-align: left;
	padding-left: 30px;
	height: 100%;
	line-height: 48px;
	font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	font-size: 16px;
	color: #550adf;
}

.openSelect2>a {
	display: block;
	text-decoration: none;
	text-align: left;
	padding-left: 30px;
	height: 100%;
	line-height: 48px;
	font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	font-size: 16px;
	color: #550adf;
}

#openDivList div.fl {
	text-align: center;
}

#openDivList div.fl>span {
	font-size: 18px;
	height: 18px;
	line-height: 18px;
	color: #fff;
	margin-bottom: 20px;
	display: inline-block;
	letter-spacing: -0.6px;
}

#openDivButton {
	margin-top: 100px;
	height: 50px;
	position: relative;
	top: 225px;
}

#openDivButton>div {
	width: 230px;
	height: 50px;
	margin: 0 auto;
}

#openDivButton>div>div:first-child>button {
	width: 168px;
	height: 48px;
	line-height: 48px;
	font-size: 18px;
	color: #fff;
	border: 1px solid #fff;
	border-radius: 25px;
}

#openDivButton>div>div>button {
	background: transparent;
	border: none;
}

#openDivButton>div>div:nth-child(2) {
	margin-top: -4px;
}

#openDivButton>div>div:nth-child(2)>button>img {
	width: 50px;
	height: 50px;
}

.btnClose {
	z-index: 11;
	cursor: pointer;
}

.listshow {
	display: none;
	position: absolute;
	left: 191px;
	top: -119px;
	width: 251px;
	border: 1px solid black;
	border-radius: 25px;
	padding: 17px 0;
	background: white;
}

.listshow2 {
	display: none;
	position: absolute;
	left: 460px;
	top: -93px;
	width: 251px;
	border: 1px solid black;
	border-radius: 25px;
	padding: 17px 0;
	background: white;
	z-index: 12;
}

.locationList {
	display: block;
	font-size: 16px;
	color: #550adf;
	line-height: 30px;
	text-align: left !important;
	padding: 0 30px;
	text-decoration: none;
	z-index: 11;
}

.menuList {
	display: block;
	font-size: 16px;
	color: #550adf;
	line-height: 30px;
	text-align: left !important;
	padding: 0 30px;
	text-decoration: none;
	z-index: 11;
}
.moremenulist2 {
    text-decoration: none;
    color: #555;
    display: block;
    font-size: 16px;
    white-space: nowrap;
    margin-top: 17px;
}
</style>
<script>
	var pageNum = 2;
	var g_d;
	var stop = 13;
	var search = 0;
		function request_one_page() {
			$.ajax({
				type: 'get',
				url: 'RestaurantServlet',
				data: {"page":pageNum},
				datatype: "json",
				success: function(d) {
					console.log(stop);
					g_d = d; // 서버로부터 받음
					for(var i = 0; i < d.length; i++) {
						console.log(i);	// 콘솔창에 sysout 하는거임
						var name = d[i].name;
						var mainurl = d[i].mainurl;
						var location = d[i].location;
						var str = 
							"<a class='listbox1' href='LotteController?command=detailRestaurant&name="+name+"'>"
							+"<div class='sub'>"
							+"<img src='images1/"+mainurl+"'>"
							+"<span class='label'>"+location+"</span>"
							+"</div>"
							+"<div class='name'>"+name+"</div>"
							+"</a>"
						$(".bottom").append(str);
					}
					stop += 12;
					pageNum += 1;
				},
				error: function(r, s, e) {
					alert("에러!");
				}
			});
			
		}
		
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
			$("#bg_trans").click(function() {
				$("#bg_trans").css('display', 'none');
				$(".listshow").css('display', 'none');
				$(".listshow2").css('display', 'none');
			});
			$(".locationbox").click(function() {
				$(".listshow2").css('display', 'none');
				$("#bg_trans").css('display', 'block');
				$(".listshow").css('display', 'block');
			});
			$(".menubox").click(function() {
				$(".listshow").css('display', 'none');
				$("#bg_trans").css('display', 'block');
				$(".listshow2").css('display', 'block');
			});
			$(".locationList").click(function() {
				var selected = $(this).text();   // ex. "매직아일랜드" 
				$(".locationbox").text(selected);
				$(".locationList").css('font-family','NotoSans-Light');
				$(this).css('font-family','NotoSans-Bold');
				$("#bg_trans").css('display', 'none');
				$(".listshow").css('display', 'none');
			});
			$(".menuList").click(function() {
				var select = $(this).text();
				$(".menubox").text(select);
				$(".menuList").css('font-family','NotoSans-Light');
				$(this).css('font-family','NotoSans-Bold');
				$("#bg_trans").css('display', 'none');
				$(".listshow2").css('display', 'none');
			});
			$(".groupmeal").click(function() {
				$("#bg_trans").css('display', 'none');
				$(".listshow").css('display', 'none');
				$(".listshow2").css('display', 'none');
			});
			$(".submit").click(function() {
				var location = $(".locationbox").text();
 				var menu = $(".menubox").text();
 				if($(".openSelect2").attr("class") == 'openSelect2 on'){
	 				var groupmeal = 'O';
 				} else {
 					var groupmeal = null;
 				}
				$.ajax ({
					type: "get",
					url: "RestaurantActionServlet",
					data: {"location": location, "menu": menu, "groupmeal" : groupmeal},
					datatype: "json",
					success : function(d){
						$(".bottom > a").remove();
						$(".bottom > div").remove();
						if(d.length != 0){
							for(var i = 0; i < d.length; i++){
								console.log(d[i].name);
								var name = d[i].name;
								var mainurl = d[i].mainurl;
								var location = d[i].location;
								var str = 
									"<a class='listbox1' href='LotteController?command=detailRestaurant&name="+name+"'>"
									+"<div class='sub'>"
									+"<img src='images1/"+mainurl+"'>"
									+"<span class='label'>"+location+"</span>"
									+"</div>"
									+"<div class='name'>"+name+"</div>"
									+"</a>"
								$(".bottom").append(str);
							} // for
						} else {
							var strNo = "<div class='noData'>"
								+"<p class='noDataText'>검색된 레스토랑이 없습니다.</p>"
								+"</div>";
							$(".bottom").append(strNo);
						}
					}, error(r, s, e) {
						alert("에러");
					}
				});

				
			});
			$(".submit").click(function() {
				$("#search2").css('display', 'none');
				$(".center:nth-of-type(1)").css('display', 'none');
				$(".center:nth-of-type(2)").css('display', 'block');
				var location = $(".locationbox").text();
				var menu = $(".menubox").text();
				$(".searchText:nth-of-type(1)").find(".valuetext").text(location);
				$(".searchText:nth-of-type(2)").find(".valuetext").text(menu);
				if($(".openSelect2").attr("class") == 'openSelect2 on'){
					$(".valuetext2").addClass('on');
				}
				if($(".openSelect2").attr("class") == 'openSelect2'){
					if($(".valuetext2").attr("class") == 'valuetext2 on'){
						$(".valuetext2").removeClass('on');
					}
				}	
				
				search++;
			});
			$(".center").click(function() {
				$(this).css('display','none');
				$("#search2").css('display','block');
			});
			$("#search2 .btnClose").click(function() {
				$("#search2").css('display','none');
				$(".center:nth-of-type(1)").css('display','block');
				$(".center:nth-of-type(2)").css('display','none');
			});

			if($(".listshow").css('display')=='block'){
				$(".locationlist").click(function() {
					$(".listshow").css('display', 'none');
				});
			}
			if($(".listshow2").css('display')=='block'){
				$(".locationlist").click(function() {
					$(".listshow2").css('display', 'none');
				});
			}

			$(".groupmeal").click(function() {
				$(".openSelect2").toggleClass('on');
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
			var select = $(".third").text();
			var list = $('.moremenulist3');
			for(var i = 0; i <= 1; i++){
				if(list.eq(i).text() == select){
					list.eq(i).css('font-family', 'Notosans-Bold');
					list.eq(i).css('color', '#000');
					break;
				}
			}
			$(".menu").load("lotte/Menu.jsp");
			$(".footer").load("lotte/Footer.html");
			
				
				$(window).scroll(function() {
						if($(window).scrollTop() + $(window).height() >= $(document).height()){
							if(search == 0){
								if(stop < <%=cnt%>){
									request_one_page();
								} else {
									
								}	
							}
						}
						
				});
			$(".listbox1").click(function() {
				var a = $(this).find(".name").text();
				location.href="LotteController?command=detailRestaurant&name="+a;
			});
		
		});
	</script>
<style>
#bg_trans {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
	background-color: transparent;
	z-index: 11;
}

.listshow {
	z-index: 12;
}

#wrapper {
	position: relative;
	width: 100%;
	overflow: hidden;
}
.moremenulist3 {
    text-decoration: none;
    color: #555;
    display: block;
    font-size: 16px;
    white-space: nowrap;
    margin-top: 17px;
}
.searchText {
	float: left;
    padding: 20px 0;
    overflow: hidden;
    margin-left: 30px;
}
.centertext1 {
	float: left;
    font-size: 18px;
    color: #fff;
    line-height: 48px;
}
.valuetext {
	position: relative;
    float: left;
    border: 1px solid #fff;
    width: 168px;
    height: 48px;
    line-height: 46px;
    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
    font-size: 16px;
    color: #fff;
    text-align: center;
    border-radius: 25px;
    margin-left: 20px;
}
.valuetext2 {
	position: relative;
    float: left;
    border: 1px solid #fff;
    width: 168px;
    height: 48px;
    line-height: 46px;
    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
    font-size: 16px;
    color: #fff;
    text-align: center;
    border-radius: 25px;
    margin-left: 20px;
}
.searchBtn {
	position: absolute;
    top: 50%;
    right: 70px;
    -ms-transform: translate(0, -50%);
    -webkit-transform: translate(0, -50%);
    -moz-transform: translate(0, -50%);
    -o-transform: translate(0, -50%);
    transform: translate(0, -50%);
}
.resetBtn {
	position: absolute;
    top: 50%;
    right: 30px;
    -ms-transform: translate(0, -50%);
    -webkit-transform: translate(0, -50%);
    -moz-transform: translate(0, -50%);
    -o-transform: translate(0, -50%);
    transform: translate(0, -50%);
}
.center, .centertext {
	cursor: pointer;
}
.noData {
	margin-top: 50px;
    border-top: 2px solid #000;
    border-bottom: 1px solid #e1e1e1;
    padding: 100px 0;
    text-align: center;
}
.noDataText {
	background: url(images1/no_data_icon.png) no-repeat center 0;
    color: #777;
    font-size: 18px;
    padding-top: 128px;
}
.searchTextWrap {
	padding-left: 50px;
    display: inline-block;
    height: 100%;
}
.valuetext2 {
	width: 128px;
    padding-right: 39px;
    border: 1px solid #8854e9;
    color: #8854e9;
    background: url(images1/srch_open_chk_icon.png) no-repeat right 9px top 50%;
}
.valuetext2.on {
	border: 1px solid #fff;
    color: #fff;
    background: url(images1/srch_open_chk_icon_on.png) no-repeat right 9px top 50%;
}
</style>
</head>
<body>
	<div id="bg_trans"></div>
	<div id="wrapper">
		<div class="menu"></div>
		<div id="body">
			<div class="wrap">
				<div class="top">
					<div class="topsub">
						<div class="topsubIn">
							<a href="LotteController?command=lotteMain" class="home"></a>
							<div class="one">
								<a href="javascript:void(0)" onclick="view()"
									class="moremenuclick">즐길거리</a>
								<div class="moremenu" style="z-index: 15; display: none;">
									<a href="LotteController?command=Attraction" class="moremenulist" style="margin-top: 0px;">즐길거리</a>
									<a href="LotteController?command=Charge" class="moremenulist">요금/우대혜택</a> 
									<a href="LotteController?command=Performance" class="moremenulist">참여프로그램</a> 
									<a href="LotteController?command=Suspension" class="moremenulist">이용가이드</a>
									<a href="LotteController?command=Notice" class="moremenulist">소통서비스</a>
								</div>
							</div>
							<div class="two">
								<a class="second" href="javascript:void(0)" onclick="view2()">다이닝/쇼핑</a>
								<div class="moremenu2" style="z-index: 15; display: none;">
									<a href="LotteController?command=Attraction" class="moremenulist2" style="margin-top: 0px;">어트랙션</a>
									<a href="LotteController?command=Festival" class="moremenulist2">페스티벌</a> 
									<a href="LotteController?command=ShowMain" class="moremenulist2">공연</a> 
									<a href="LotteController?command=Restaurant" class="moremenulist2">다이닝/쇼핑</a> 
								</div>
							</div>
							<div class="three">
								<a class="third" href="javascript:void(0)" onclick="view3()"style="font-family: Notosans-Bold">레스토랑</a>
								<div class="moremenu3" style="z-index: 15; display: none">
									<a href="LotteController?command=Restaurant" class="moremenulist3" style="margin-top: 0px;">레스토랑</a>
									<a href="LotteController?command=Giftshop" class="moremenulist3">기프트샵</a>
								</div>
							</div>
						</div>
						<!-- topsubIn -->
						<div class="shareprint">
							<div class="share">
								<a href="javascript:void(0)" onclick="shareview()"
									class="shareimg"></a>
								<div class="sharesub" style="z-index: 15; display: none;">
									<a
										href="https://www.facebook.com/login.php?skip_api_login=1&api_key=966242223397117&signed_next=1&next=https%3A%2F%2Fwww.facebook.com%2Fsharer%3Fu%3Dhttps%253A%252F%252Fadventure.lotteworld.com%252Fkor%252Fenjoy%252Frestaurant%252Flist.do&cancel_url=https%3A%2F%2Fwww.facebook.com%2Fdialog%2Fclose_window%2F%3Fapp_id%3D966242223397117%26connect%3D0%23_%3D_&display=popup&locale=ko_KR"
										class="facebook" target="_blank"></a> <a
										href="https://twitter.com/intent/tweet?text=&url=https%3A%2F%2Fadventure.lotteworld.com%2Fkor%2Fenjoy%2Frestaurant%2Flist.do"
										class="twiter" target="_blank"></a> <a
										href="javascript:void(0)" onclick="copy()" class="copy"></a>
								</div>
							</div>
							<!-- share -->
							<a href="javascript:void(0)" onclick="window.print()"
								class="print"></a>
						</div>
						<!-- shareprint -->
					</div>
					<!-- topsub -->
					<h2 class="middle">레스토랑</h2>
					<p class="middlesub">맛있는 휴식 ,달콤한 상상! 가족ㆍ친구ㆍ연인과 함께 즐겨보세요!</p>
				</div>
				<!-- top -->
				<div class="centerbottom">
					<div class="center">images1
						<a class="centerbox"> <span class="centertext">조건검색</span>
						</a>
					</div>
					<div class="center" style="display: none;">
						<a class="centerbox">
							<div class= "searchTextWrap">
							<div class="searchText">
								<span class="centertext1">위치</span>
								<span class="valuetext"></span>
							</div>
							<div class="searchText">
								<span class="centertext1">매뉴</span>
								<span class="valuetext"></span>
							</div>
							<div class="searchText">
								<span class="centertext1">단체 식사</span>
								<span class="valuetext2" id="groupmealText">단체 식사 가능</span>
							</div>
							</div>
							<a class="searchBtn">
								<img src="images1/srch_btn2.png"/>
							</a>
							<a class="resetBtn" href="#" onClick="top.location='javascript:location.reload()'">
								<img src="images1/srch_reset2.png"/>
							</a>
						</a>
					</div>
					<!-- center -->
					<form name="search2" id="search2">
						<div class="center2">
							<a class="btnClose"> 
							<img src="images1/srch_close.png" alt="닫기" />
							</a>
							<div id="openDivTitle">
								<p>레스토랑을 찾아보세요!</p>
							</div>
							<div id="openDivList">
								<div>
									<div class="fl" style="margin-right: 20px;">
										<span>위치</span>
										<div class="openSelect">
											<a class="locationbox" href="javascript:void(0)">전체</a>
										</div>
										<div class="listshow">
											<a class="locationList" href="javascript:void(0)">전체</a> <a
												class="locationList" href="javascript:void(0)">어드벤처 1층</a> <a
												class="locationList" href="javascript:void(0)">어드벤처 2층</a> <a
												class="locationList" href="javascript:void(0)">어드벤처 3층</a> <a
												class="locationList" href="javascript:void(0)">어드벤처 4층</a> <a
												class="locationList" href="javascript:void(0)">매직아일랜드</a> <a
												class="locationList" href="javascript:void(0)">언더랜드 B1층</a>
											<a class="locationList" href="javascript:void(0)">파크 외 1층</a>
											<a class="locationList" href="javascript:void(0)">쇼핑몰 B1층</a>
											<a class="locationList" href="javascript:void(0)">파크 외
												B3층</a> <a class="locationList" href="javascript:void(0)">저자거리</a>
										</div>
									</div>
									<div class="fl" style="margin-right: 20px;">
										<span>메뉴</span>
										<div class="openSelect">
											<a class="menubox" href="javascript:void(0)">전체</a>
										</div>
										<div class="listshow2">
											<a class="menuList" href="javascript:void(0)">전체</a> <a
												class="menuList" href="javascript:void(0)">한식</a> <a
												class="menuList" href="javascript:void(0)">양식</a> <a
												class="menuList" href="javascript:void(0)">중식</a> <a
												class="menuList" href="javascript:void(0)">일식</a> <a
												class="menuList" href="javascript:void(0)">분식</a> <a
												class="menuList" href="javascript:void(0)">패스트푸드</a> <a
												class="menuList" href="javascript:void(0)">간식</a> <a
												class="menuList" href="javascript:void(0)">뷔페&푸드 코트</a>
										</div>
									</div>
									<div class="fl">
										<span>단체식사</span>
										<div class="openSelect2">
											<a class="groupmeal" style="z-index: 11;"
												href="javascript:void(0)">단체 식사 가능</a>
										</div>
									</div>
									<div style="clear: both;"></div>
								</div>
							</div>
							<div id="openDivButton" style="z-index: 11;">
								<div>
									<div class="fl" style="width: 170px; height: 50px; margin-right: 10px;">
										<button class="submit" style="cursor: pointer;" type="button">조회하기</button>
									</div>
									<div class="fl" style="width: 50px; height: 50px;">
										<button onclick="window.location.reload()" type="button" style="cursor: pointer;">
											<img src="images1/srch_reset.png" />
										</button>
									</div>
									<div style="clear: both;"></div>
								</div>
							</div>
						</div>
						<!-- center2 -->
					</form>
					<div class="bottom">
						<!-- <div class = "blockList"> -->
						<%
							for(int i = 0; i <= 3; i++){
						%>
						<a class="listbox1" href="javascript:void(0)">
							<div class="sub">
								<img src="images1/<%=list.get(i).getMainurl()%>"/>
								<span class="label"><%=list.get(i).getLocation()%></span>
							</div>
							<div class="name">
								<strong><%=list.get(i).getName()%></strong>
							</div>
						</a> 
						<%
							}
						%>
						<%
							for(int i = 4; i < 12; i++){
						%>
						<a class="listbox1" href="javascript:void(0)">
							<div class="sub">
								<img src="images1/<%=list.get(i).getMainurl()%>"/>
								<span class="label"><%=list.get(i).getLocation()%></span>
							</div>
							<div class="name"><%=list.get(i).getName()%></div>
						</a> 
						<%
							}
						%>
					</div>
					<!-- bottom -->
				</div>
				<!-- centerbottom -->
			</div>
		</div>
		<div class="footer"></div>
	</div>
</body>
</html>