<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 | 롯데월드 어드벤처</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
function view() {
	if($(".moremenu").css('display')=='none') {
		if($(".moremenu2").css('display')=='block') {
			$(".moremenu2").slideUp();
		}
	} else if($(".moremenu").css('display')=='block'){
	}
	$(".moremenu").slideToggle();
}

	$(document).ready(function(){
		
		$(".ready").click(function(){
			alert("준비중입니다.");
		});
		
		$(".Menu").load("lotte/Menu.jsp");
		$(".Footer").load("lotte/Footer.html");
		
		
	});
</script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
#wrapper {
    position: relative;
    width: 100%;
    overflow: hidden;
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
#wrapper {
    position: relative;
    width: 100%;
    overflow: hidden;
}
#cBody {
    position: relative;
    width: 100%;
}
.subWrap {
    position: relative;
    padding: 0 0 130px;
    width: 100%;
}
.lnbArea {
    position: relative;
    max-width: 1170px;
    margin: 0 auto;
    padding-top: 30px;
}
h2 {
    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
    font-size: 50px;
    color: #000;
    text-align: center;
    padding-top: 40px;
}
.mypageTop {
    margin-top: 80px;
    padding: 80px 0;
    text-align: center;
    background: url(Img/mypage_bg.jpg) no-repeat center 0;
    color: #fff;
}
.container {
    position: relative;
    width: 1170px;
    margin: 0 auto;
}
.mypageTop .txt1 {
    font-size: 34px;
}
.mypageTop .txt1 strong {
    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
}
.mypageTop .txt2 {
    font-size: 18px;
    line-height: 28px;
    margin-top: 25px;
}
.mypageTop .purpleBtn {
    font-size: 18px;
    line-height: 62px;
    height: 64px;
    margin-top: 30px;
    border-radius: 35px;
    box-shadow: 10px 13px 27px 0 rgb(0 0 0 / 20%);
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
    background: rgb(111, 35, 249);
    background: -ms-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
    background: -o-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
    background: -moz-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
    background: -webkit-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
}
a {
    text-decoration: none;
    color: #555;
}
* {
    margin: 0;
    padding: 0;
}
.mypageTop .sTxt {
    font-size: 16px;
    color: rgba(255,255,255,0.8);
    margin-top: 30px;
}
.mypageArea {
    margin-top: 80px;
}
.mypageArea > div:first-child {
    margin-left: 0;
}
.mypageArea > div {
    float: left;
    width: 574px;
    margin-left: 22px;
}
.mypageArea > div .mTit {
    font-size: 28px;
    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
    color: #000;
}
.mypageArea > div .mTit span img {
    vertical-align: bottom;
}
.mypageArea > div .mTit span {
    float: right;
}
.mypageArea .myList {
    width: 574px;
    display: table;
    table-layout: fixed;
    border-collapse: collapse;
    margin-top: 40px;
}

body, div, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, p, form, fieldset, table, tr, th, td {
    margin: 0;
    padding: 0;
}
img, fieldset {
    border: none;
    vertical-align: top;
}
.mypageArea .myList a .tit {
    font-size: 18px;
    color: #000;
    margin-top: 30px;
}
.mypageArea .myList a .arrow {
    background: url(Img/mypage_arrow.png) no-repeat center 0;
    height: 8px;
    margin-top: 53px;
}
.mypageArea .myList a {
    display: table-cell;
    border: 1px solid #e1e1e1;
    padding: 40px;
    text-align: center;
    position: relative;
}
.mypageArea:after {
    content: "";
    display: block;
    clear: both;
}
.mypageArea .myList a:hover .tit, .mypageArea .myList a:focus .tit {
    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
    color: #550adf;
}
.mypageArea .myList a:hover .arrow, .mypageArea .myList a:focus .arrow {
    background: url(Img/mypage_arrow_on.png) no-repeat center 0;
}
.mypageArea .myList a:hover:before, .mypageArea .myList a:focus:before {
    content: "";
    display: block;
    width: calc(100% + 2px);
    height: calc(100% + 2px);
    box-sizing: border-box;
    position: absolute;
    top: -1px;
    left: -1px;
    border: 2px solid #550adf;
}
a {
    text-decoration: none;
    color: #555;
}
a:-webkit-any-link {
    /*color: -webkit-link;*/
    cursor: pointer;
    /*text-decoration: underline;*/
}
/*a:hover, a:focus, a:active {
    text-decoration: none;
}*/
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
    width: 50px;
    height: 50px;
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
.shareprint:after {
	content: '';
    display: block;
    clear: both;
}
.lnbArea:after {
    content: '';
    display: block;
    clear: both;
}
</style>
</head>
<body>
<div id ="wrapper">
	<div class= "Menu"></div>
	<div id="cBody">
		<div class="subWrap">
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
			<h2 class="">마이페이지</h2>
			<div class="mypageTop">
				<div class="container">
					<p class="txt1"><strong>
					<%
						session = request.getSession();
						out.println((session.getAttribute("name")));
					%>   
					</strong>님, 안녕하세요.</p>
					<p class="txt2">롯데월드는 회원님의 모든 정보를 롯데멤버스에서 통합관리하며,<br> 롯데와 관련된 웹사이트를 이용하실 수 있습니다.</p>
					<a href="javascript:void(0)" class="purpleBtn ready" title="새창으로 예매확인/취소 열기">예매 확인/취소</a>
					<p class="sTxt">롯데월드예매사이트로 이동합니다.</p>
				</div>
			</div>
			<div class="container">
				<div class="mypageArea">
					<div>
						<p class="mTit">나의 활동관리</p>
						<div class="myList">
							<a href="javascript:void(0)" class= "ready">
								<p><img src="Img/mypage_icon1.png" alt=""></p>
								<p class="tit">온라인 상담내역</p>
								<p class="arrow"></p>
							</a>
							<a href="javascript:void(0)" class= "ready">
								<p><img src="Img/mypage_icon2.png" alt=""></p>
								<p class="tit">참여/신청내역</p>
								<p class="arrow"></p>
							</a>
						</div>
					</div>
					<div>
						<p class="mTit">회원정보<span><img src="Img/mypage_img.png" alt=""></span></p>
						<div class="myList">
							<a href="javascript:void(0)" class= "ready">
								<p><img src="Img/mypage_icon3.png" alt=""></p>
								<p class="tit">회원정보수정</p>
								<p class="arrow"></p>
							</a>
							<a href="javascript:void(0)" class= "ready">
								<p><img src="Img/mypage_icon4.png" alt=""></p>
								<p class="tit">회원탈퇴</p>
								<p class="arrow"></p>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div><!-- // subWrap -->
	</div>
	<div class= "Footer"></div>
</div>
</body>
</html>