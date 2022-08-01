<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 | 롯데월드 어드벤처</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
 document.cookie = "safeCookie1=foo; SameSite=Lax"; 
document.cookie = "safeCookie2=foo";  
document.cookie = "crossCookie=bar; SameSite=None; Secure"; 
</script>
<style>

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

h2 {
	font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	font-size: 50px;
	color: #000;
	text-align: center;
	padding-top: 40px;
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

.container {
	position: relative;
	width: 1170px;
	margin: 0 auto;
}

.viewType1 {
	border-top: 1px solid #000;
	margin-top: 80px;
}

.viewType1 .titArea {
	padding: 26px 30px;
	display: table;
	vertical-align: middle;
	overflow: hidden;
}

.viewType1 .titArea .label {
	display: table-cell;
	width: 60px;
	vertical-align: middle;
	padding-right: 20px;
	font-size: 18px;
}

.viewType1 .titArea .tit {
	display: table-cell;
	vertical-align: middle;
	width: 963px;
	padding-right: 20px;
	font-family: 'NotoSans-Medium', '맑은 고딕', 'Malgun Gothic', sans-serif;
	font-size: 20px;
	color: #000;
	line-height: 30px;
}

.viewType1 .titArea .date {
	display: table-cell;
	vertical-align: middle;
	width: 71px;
	font-size: 16px;
	color: #555;
	line-height: 30px;
}

.viewType1 .txtArea {
	padding: 50px 30px 65px;
	border-top: 1px solid #cacaca;
	font-size: 16px;
	color: #555;
	line-height: 28px;
}

img, fieldset {
	border: none;
	vertical-align: top;
}

.viewType1 .fileArea {
	padding: 30px 0;
	overflow: hidden;
}

.viewType1 .prevNext {
	border-top: 1px solid #e1e1e1;
	border-bottom: 1px solid #e1e1e1;
}

.viewType1 .prevNext .prev {
	border-bottom: 1px solid #e1e1e1;
}

.viewType1 .prevNext .prev span:first-child {
	padding-left: 0;
	padding-right: 30px;
	width: 45px;
	font-family: 'NotoSans-Medium', '맑은 고딕', 'Malgun Gothic', sans-serif;
	font-size: 16px;
	color: #000;
	background: url(Img/prev_icon.gif) no-repeat right 0 top 50%;
}

.viewType1 .prevNext .prev span {
	display: inline-block;
	width: calc(100% - 128px);
	padding-left: 50px;
	vertical-align: middle;
	font-size: 16px;
	line-height: 1.5;
	color: #555;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.viewType1 .prevNext>div {
	padding: 22px 30px;
}

.viewType1 .prevNext>div>a {
	display: block;
	width: 100%;
	vertical-align: middle;
}

.viewType1 .prevNext .next span:first-child {
	padding-left: 0;
	padding-right: 30px;
	width: 45px;
	font-family: 'NotoSans-Medium', '맑은 고딕', 'Malgun Gothic', sans-serif;
	font-size: 16px;
	color: #000;
	background: url(Img/next_icon.gif) no-repeat right 0 top 50%;
}

.viewType1 .prevNext .next span {
	display: inline-block;
	width: calc(100% - 128px);
	padding-left: 50px;
	vertical-align: middle;
	font-size: 16px;
	line-height: 1.5;
	color: #555;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.btnArea {
	text-align: center;
	margin-top: 60px;
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
	background: linear-gradient(to bottom right, rgba(111, 35, 249, 1) 0%,
		rgba(85, 10, 223, 1) 100%);
}

a {
	text-decoration: none;
	color: #555;
}
/* footer*/
#footer .container {
	padding: 50px 0px 160px;
}

#footer .container .top {
	padding-bottom: 30px;
	border-bottom: 1px solid #e0e0e0;
	overflow: hidden;
}

#footer .container .top .links {
	float: left;
	overflow: hidden;
}

#footer .container .top .links a:first-child {
	margin-left: 0;
}

#footer .container .top .links a {
	float: left;
	display: inline-block;
	font-size: 16px;
	color: #333;
	line-height: 30px;
	margin-left: 20px;
}

#footer .container .top .sns {
	float: right;
	overflow: hidden;
}

#footer .container .top .sns a:first-child {
	margin-left: 0;
}

#footer .container .top .sns a {
	float: left;
	margin-left: 10px;
}

#footer .container .bottom {
	margin-top: 30px;
	position: relative;
	height: 83px;
}

.hotel {
	position: absolute;
	top: 75px;
	right: 0;
}

.hotel .pc-img {
	display: inline-block;
}

#footer .container .bottom .left {
	float: left;
}

#footer .container .bottom .left .logo {
	float: left;
	margin: 0px 0px 0px 0px;
}

#footer .container .bottom .left div {
	padding-left: 140px;
}

#footer .container .bottom .left div p:first-child {
	margin: 0;
}

#footer .container .bottom .left div p {
	font-size: 15px;
	color: #555;
	margin: 10px 0px 0px 0px;
}

#footer .container .bottom .left div p span:first-child {
	margin-left: 0;
	padding-left: 0;
}

#footer .container .bottom .left div p span {
	display: inline-block;
	position: relative;
	margin-left: 11px;
	padding-left: 11px;
}

#footer .container .bottom .left div p.copyright {
	font-size: 13px;
	color: #777;
	margin-top: 30px;
}

#footer .container .bottom .isms {
	position: absolute;
	bottom: -70px;
	left: 140px;
}

#footer .container .bottom .isms a {
	display: block;
	padding-top: 3px;
	padding-left: 55px;
	height: 37px;
	background: url(Img/isms_icon.png) no-repeat 0 50%;
}

#footer .container .bottom .isms a>p {
	position: relative;
	display: block;
	font-size: 12px;
	color: #333;
	line-height: 16px;
	margin: 0px;
}

#footer .container .bottom .isms a>p span:first-child {
	position: relative;
	padding-right: 9px;
	margin-right: 6px;
}

#footer .container .bottom .isms a>p span:first-child:after {
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

#footer .container .bottom .isms.newST {
	left: 430px;
}

#footer .container .bottom .isms.newST p {
	padding-top: 0;
	padding-left: 68px;
	height: 40px;
	background: url(Img/isms_icon2.jpg) no-repeat 0 50%;
	margin: 0px;
}

#footer .container .bottom .isms.newST p span {
	position: relative;
	display: block;
	font-size: 12px;
	color: #333;
	line-height: 40px;
}

#footer .container .bottom .familySite {
	float: right;
	position: relative;
	width: 210px;
	height: 46px;
}

#footer .container .bottom .familySite>select {
	width: 210px;
	padding-left: 20px;
	height: 45px;
	padding-right: 35px;
	border: 1px solid #e0e0e0;
	font-size: 15px;
	color: #555;
	background: url(Img/sel_icon.png) no-repeat right 17px top 50%;
	font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
	font-size: 15px;
	color: #555;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}
.noticeWrap {
    margin: 0 auto;
    padding: 92px 45px 100px;
    max-width: 800px;
    border: 10px solid #e1e1e1;
    color: #000;
    line-height: 1;
    box-sizing: border-box;
    word-break:keep-all;
}

.noticeTitle {
    position: relative;
    text-align: left;
    font-size: 50px;
    font-weight: bold;
    line-height: 62px;
    color:#222;
}

.noticeTitle::after{
    position: absolute;
    left:0;
    bottom:0;
    content:&#39;&#39;;
    display:inline-block;
    width:78px;
    height:6px;
    background:#111;
}

.noticeCont {
    margin-top: 60px;
    letter-spacing: -0.025em;
    font-size: 18px;
    color:#444;
}
.noticeCont em {
    line-height: 32px;
    font-weight: bold;
    font-style: normal;
    margin-bottom: 20px;
    display: block;
}
.noticeCont p{
    line-height: 32px;
}

.noticeCont > *{
    word-break:keep-all;
    line-height: 32px;
}

.workTime {
    margin-bottom: 40px;
}

.workTime .headTxt {
    font-size: 26px;
    color: #651eec;
    margin: 38px 0 0 0;
    font-weight: bold;
}

.workTime p {
    font-size: 20px;
    color: #651eec;
    font-weight: bold;
}

.workTime span {
    font-size: 16px;
    color: #651eec;
}

.linkWrap{
    padding-top:99px;

}
.linkWrap a{
    display:block;
}
.linkCont {
	padding-top:120px;
}

.linkCont .noticeTitle{
    padding-top:0
}
.linkWrap {
    border-top: 8px solid #f2f2f2;
}
.noticeBtn{
	margin:40px 0;
	padding:0 60px;
	display:inline-block;
	font-size:20px;
	font-weight:700;
	color:#fff;
	line-height:60px;
	background:#651dec;
}

.AnchorBtn{
	margin:40px 0;
	padding:0 60px;
	display:inline-block;
	font-size:20px;
	font-weight:700;
	color:#fff;
	line-height:60px;
	background:#555;
}

.number-list > li {
    margin-bottom:10px;
    padding-left: 20px;
    text-indent: -20px;
}
.number-list > li span {
    display: block;
    padding-left: 12px;
    text-indent: -12px;
}
.fBold {
    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif !important;
}
ul, ol, li {
    list-style: none;
}
body, div, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, p, form, fieldset, table, tr, th, td {
    margin: 0;
    padding: 0;
}
#footer .container .bottom .left div p span:first-child:before{
background: none;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="cBody">
			<div class="subWrap">
				<h2>공지사항</h2>
				<div class="container" data-type="view">
					<div class="viewType1">
						<div class="titArea">
							<div class="label"><p>공지</p></div>
							<p class="tit" style="word-wrap: break-word;">
								코로나19 예방을 위한 롯데월드 어드벤처 종합안내</p>
							<p class="date">
								2020.08.11</p>
						</div>
						<div class="txtArea" style="word-wrap: break-word;">
							<div class="noticeWrap">
								<h1 class="noticeTitle fBold">코로나19 예방을 위한 롯데월드 어드벤처 종합안내</h1>
								<div class="noticeCont">
									<p>안녕하십니까? 롯데월드 어드벤처입니다.</p>
									&nbsp;
									
									<p>롯데월드 어드벤처는 코로나바이러스감염증19(COVID-19)로부터 안전한 테마파크를 만들기 위해 바이러스 확산 방지를 위한 최선의 노력을 다하고 있습니다.</p>
									&nbsp;
									
									<p>롯데월드 어드벤처는 코로나19 감염 예방 대책 수립시 아래의 사항을 최우선의 가치로 두고 있습니다.</p>
									&nbsp;
									
									<ul>
										<li>ㆍ손님과 캐스트를 포함한 파크와 관련된 모든 사람의 건강 및 안전</li>
										<li>ㆍ질병관리본부의 거리두기 지침에 부합하는 운영방침 수립 및 이행</li>
									</ul>
									&nbsp;
									
									<p>손님여러분께서 안심하고 즐기실 수 있도록 롯데월드 어드벤처는 앞으로도 방역 및 예방활동에 최선을 다하겠습니다. 추후에도 코로나19 바이러스 발생 동향에 따라 정부의 지침을 준수하며, 건강과 안전을 위한 대책을 철저히 수립/이행하겠습니다.</p>
									&nbsp;
									
									<p>아래 링크를 통해 롯데월드의 코로나19 예방대책 및 안전한 파크 방문을 위한 이용수칙을 확인하실 수 있습니다.</p>
									&nbsp;
									
									<div class="linkWrap">
										<span class="noticeBtn" style="margin-top: 0px;" target="_blank">예방수칙 자세히 알아보기</span>
										<a href ="LotteController?command=NoticeDetail&num=10" target="_blank"> ▶롯데월드 어드벤처 코로나19 방역 및 예방 활동 현황</a> 
										<a href ="LotteController?command=NoticeDetail&num=7&p=1" target="_blank">▶ 티켓 예매 및 입장 안내</a> 
										<a href ="LotteController?command=NoticeDetail&num=7&p=2" target="_blank">▶ 어트랙션 이용 안내</a> 
										<a href ="LotteController?command=NoticeDetail&num=7&p=3" target="_blank">▶ 공연 및 참여프로그램 이용 안내</a> 
										<a href ="LotteController?command=NoticeDetail&num=7&p=4" target="_blank">▶ 레스토랑, 기프트샵 이용 안내</a>
										<a href ="LotteController?command=NoticeDetail&num=7&p=5" target="_blank">▶ 손님 예방수칙 안내</a>
									</div>
								</div>
							</div>
						</div>
						<div class="fileArea">	</div>
						<div class="prevNext">
							<div class="prev">
								<a href="Notice-06.html">
									<span>이전글</span>
									<span>
										공연참여 프로그램 운영 안내</span>
								</a>
							</div>
							<div class="next">
								<a href="Notice-08.html">
									<span>다음글</span>
									<span> 
										제네바유람선, 호반보트 운영안내</span>
								</a>
							</div>
						</div>
					</div>
					<div class="btnArea">
						<a href="LotteController?command=Notice" class="purpleBtn">목록</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>