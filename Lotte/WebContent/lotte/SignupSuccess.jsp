<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료 < 회원가입 < L.POINT</title>
<script src="js/jquery-3.6.0.min.js"></script>
<%
	String name = request.getParameter("name");
%> 
 <script>
		$(document).ready(function () {
		 	$("#first").click(function (){
				$(".one").show();	
				$(".two").hide();
			});
		 	
			$("#second").click(function (){
				$(".two").show();		
				$(".one").hide();
			});
			
			$('html').click(function(e) {   
				if(!$(e.target).hasClass("")) {
					$(".one").hide();
					$(".two").hide();
				}
			}); 
		});
 </script>
 
 <style>
 
 body {
    font-weight: 400;
    font-size: 15px;
    letter-spacing: -0.05em;
    word-break: keep-all;
    text-size-adjust: none;
    -webkit-text-size-adjust: none;
}
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
    margin: 0;
    padding: 0;
    font-style: normal;
    font-weight: inherit;
    border: 0;
    vertical-align: baseline;
}
input, button, select, textarea {
    margin: 0;
    padding: 0;
    font: inherit;
    border: 0;
    appearance: none;
    -moz-appearance: none;
    -webkit-appearance: none;
    border-radius: 0;
    -moz-border-radius: 0;
    -webkit-border-radius: 0;
}
 	#KOR{
   font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕','Apple SD Gothic Neo',AppleGothic,Dotum,'돋움',sans-serif;
}
	#mast-head {
    height: 80px;
    border-bottom: 1px solid #ebebeb;
	}
  	#mast-head .container{
  		position: relative;
  		margin : 0 auto;
  		max-width: 1100px;
  	}
  	#mast-head .bi {
    font-size: 16px;
    height: 80px;
    line-height: 80px;
    background: url(Img/ico-with.png) no-repeat 90px 53%;
	}	
	#mast-head .bi a{
		float : left;
	}
	#mast-head .bi a:first-child img {
    height: 18px;
	}
	#mast-head .bi a img {
    max-height: 50px;
    width: auto;
	}
	#mast-head .bi img {
    vertical-align: middle;
	}
	img {
    border: 0;
    vertical-align: top;
	}
	#mast-body .container {
    margin: 0 auto;
    padding: 40px 0 100px 0;
    max-width: 1100px;
}
	
	#mast-head .bi > a:nth-child(2) {
    margin-left: 38px;
	}
	#mast-head .bi a {
    float: left;
	}
	a {
    color: #555;
    text-decoration: none;
	}
	
	#mast-head .bi a img {
    max-height: 50px;
    width: auto;
	}
	#mast-head .bi img {
    vertical-align: middle;
	}		
	
  .title {
    margin-bottom: 38px;
    padding: 8px 0;
    font-weight: 100;
    font-size: 28px;
    line-height: 32px;
    color: #000;
    word-break: break-all;
}

.step-desc{
    font-weight: 100;
    padding: 30px 0 0;
    font-size: 35px;
    line-height: 1.22;
    margin-bottom: 36px;
}
.d{
	position: relative;
    padding: 15px 0px 23px 493px;
    border-bottom: 1px solid #ebebeb;
    word-spacing : 119px;
}
.c{
	position: relative;
    padding: 15px 0px 23px 493px;
    border-bottom: 1px solid #ebebeb;
    word-spacing : 30px;
}
.agree{
	 position: relative;
    padding: 15px 50px 23px 0;
    border-bottom: 1px solid #ebebeb;
}
.agree2 {
    position: absolute;
    right: 0;
    color: #0092fa;
    padding: 0;
    font-size: inherit;
}
  .check {
    position: absolute;
    right: 0;
    color: #8a8a8a;
    padding: 0;
    font-size: inherit;
    font-weight: 400;
  
}
.k{
	padding: 20px 0px;
	color: #8a8a8a;
	margin-top: -4px;

}
.k2{
	padding: 20px 0px;
	border-bottom : 1px solid #d0d0d0;
	
}
.line{
	border-bottom : 1px solid black;
	font-weight: 400;
	margin-top: 52px;
}
.Img_1{
	width:60px;
	margin-top: -18px;
}
.log{
	float: left;
    margin-top: 76px;
}

 </style>
</head>
<body id ="KOR" data-device="0" oncontextmenu="return false" onselectstart="return false" ondragstart ="return false">
	<div id = "mast-head">
		<div class = "container"> 
		 	<h1 class = "bi">
			 	<a href = "https://www.lpoint.com/" onclike="return fnWintdowOpen(this.href);"
			 	target="_blank">
			 		<img src = "Img/bi-lpoint-new.png" alt ="L.POINT">
			 	</a>
			 	<a href = "https://adventure.lotteworld.com" onclike = "return fnWidowOpen(this.href);"
			 	target="_blank">
			 		<img src = "Img/img_1040.png" alt = "롯데월드">
			 	</a>
		 	</h1>
		 </div>
	</div>
		<div id ="mast-body">
			<div class ="container">
				<h2 class ="title">
					회원가입
				</h2>
			<img src = "Img/icon_success.png" class = "Img_0"/>
			<div class = "step-desc"><span style = "color : #0092fa"><%=name %> </span>님 환영합니다. <br/>
				서비스 이용을 위해<br/>다시 로그인을 해주세요.
			</div>
			<div class ="line">선택약관동의결과(2022년4월12일)</div>
			<div class = "k">
				<span>L.POINT</span>
				<div class =  "agree">개인정보의 선택적인 사항에 대한 수집 이용 동의
					<span class =  "agree2">동의</span>
				</div>
				<div class ="agree">개인정보의 선택적인 제3자 제공에 대한 동의
					<span class = "agree2">동의</span></div>
			</div>
			<div class = "k">
				<span>롯데월드</span>
				<div class = "agree">선택입력정보 수집/이용 동의서
					<span class = "agree2">동의</span>
				</div>
			</div>
			<div class = "line">마케팅정보수신동의결과(2022년4월12일)</div>
			<div class = "k">
				<div class = "c">&nbsp;E-mail &nbsp; SMS &nbsp; TM &nbsp; DM
				</div>
				<div class =  "agree" style = "color : black">L.POINT<span class = "d">X X - -</span><!-- 파라미터로 체크확인 마지막두개는 무조건X -->
					</div>
				<div class = "agree" style = "color : black">롯데월드 <span class = "d">X X - -</span></div>
			</div>
			<div style = "color: #8a8a8a;">-L.POINT 서비스 관련 문의사항은 L.POINT 홈페이지 또는 고객센터(1899-8900)으로 문의해주세요.
			</div>
			<a href = "LotteController?command=lotteMain"><span class= "log">로그인<img src="Img/하기.png" class = "Img_1"></span></a>
			</div>
		</div>
		
	<!-- footer -->
<style>
#mast-foot {
	margin-top: 84px;
	padding: 30px 0;
	border-top: 1px solid #d0d0d0;
}

#mast-foot>.container {
	position: relative;
}

#mast-head>.container, #mast-foot>.container {
	margin: 0 auto;
	max-width: 1100px;
}

#mast-foot .utility .item {
	display: inline-block;
}

#mast-foot .utility .item>a {
	font-size: 13.905px;
	color: #8a8a8a;
}

a {
	color: #555;
	text-decoration: none;
}

span{
	cursor : pointer;
}

#mast-foot .utility .item:before {
	content: '·';
	display: inline;
	margin: 0 5px;
	color: #b8b8b8;
}

#mast-foot .utility .item:first-child:before {
	display: none;
}

#mast-foot .utility .item>a {
	font-size: 13.905px;
	color: #8a8a8a;
}

.__point-color {
	color: #0092fa;
}

#mast-foot .com-address {
	margin: 10px 0 0 0;
	font-size: 13.905px;
	color: #8a8a8a;
}

#mast-foot .com-address span {
	white-space: nowrap;
}

#mast-foot .com-address span:not(:last-child):after {
	content: '|';
	display: inline;
	margin: 0 5px;
	color: #b7b7b7;
}

#mast-foot .copyright {
	margin: 10px 0 10px;
	font-size: 13.905px;
	color: #000;
}

#mast-foot .friendly {
	position: absolute;
	right: 0;
	top: 0;
}

#mast-foot .site-linker {
	position: relative;
	display: inline-block;
	margin: 0 2px;
	width: 150px;
	font-size: 12.855px;
	background-color: #fff;
}

#mast-foot .site-linker>button {
	width: 100%;
	height: 34px;
	color: #333;
	text-indent: -26px;
	border: 1px solid #b7b7b7;
}

#mast-foot .site-linker>button:before {
	content: '';
	position: absolute;
	top: 50%;
	right: 10px;
	margin: -2px 0 0;
	width: 0;
	height: 0;
	vertical-align: middle;
	border: 1px solid transparent;
	border-top-color: #333;
	border-width: 4px 4px 0;
}

#mast-foot .site-linker>ul {
	display: none;
	position: absolute;
	left: 0;
	right: 0;
	bottom: 33px;
	padding: 10px 0;
	max-height: 200px;
	border: 1px solid #b7b7b7;
	background-color: #fff;
	overflow: hidden;
	overflow-y: auto;
	overflow-scrolling: touch;
	-webkit-overflow-scrolling: touch;
}

ul, ol, dl, li {
	list-style: none;
}

#mast-foot .site-linker>ul li>a {
	display: block;
	padding: 2px 10px;
	font-size: inherit;
	color: #8a8a8a;
}

#mast-foot .site-linker {
	position: relative;
	display: inline-block;
	margin: 0 2px;
	width: 150px;
	font-size: 12.855px;
	background-color: #fff;
}

#mast-foot .site-linker>button {
	width: 100%;
	height: 34px;
	color: #333;
	text-indent: -26px;
	border: 1px solid #b7b7b7;
}
</style>			
	<div id="mast-foot">
		<div class="container">
			<div class="utility">
				<div class="item">
					<a href="http://www.lottemembers.com/">회사소개<!-- 회사소개 --></a>
				</div>
				<div class="item">
					<a href="https://m.lpoint.com/app/center/LWDE100100.do">고객센터<!-- 고객센터 --></a>
				</div>
				<div class="item">
					<a href="https://m.lpoint.com/app/center/LWDD100100.do">이용약관<!-- 이용약관 --></a>
				</div>
				<div class="item">
					<a href="https://m.lpoint.com/app/center/LWDD100100.do?popup=4"><em
						class="__point-color">개인정보처리방침<!-- 개인정보처리방침 --></em></a>
				</div>
			</div>
			<div class="com-address">
				<address>
					<span>서울시 중구 통일로 2길 16 AIA타워 14층<!-- 서울시 중구 통일로 2길 16 AIA타워 14층 --></span>
					<span>회사명 롯데멤버스(주)<!-- 회사명 롯데멤버스(주) --></span> <span>대표이사
						전형식<!-- 대표이사 강승하 -->
					</span> <span>사업자등록번호 104-86-58491<!-- 사업자등록번호 104-86-58491 --></span> <span>고객센터
						1899-8900<!-- 고객센터 1899-8900 -->
					</span>
				</address>
			</div>
			<div class="copyright">© LOTTE MEMBERS CO.,LTD.</div>
			<div class="friendly">
				<div class="site-linker">
					<button type="button" role="button" id = "first">
						Service Site
						<!-- Service Site -->
					</button>
					<ul class= "one">
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="https://www.lpoint.com">L.POINT<!-- L.POINT --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="https://www.lpay.com">L.pay<!-- L.pay --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="https://www.lime-in.co.kr">라임<!-- 라임 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="https://partners.lpoint.com">L.POINT 파트너스<!-- L.POINT 파트너스 --></a></li>
					</ul>
				</div>
				<div class="site-linker">
					<button type="button" role="button" id = "second">
						Family Site
						<!-- Family Site -->
					</button>
					<ul class= "two">
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotte.co.kr">롯데그룹<!-- 롯데그룹 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottetown.com">롯데타운<!-- 롯데타운 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotte.com/">롯데닷컴<!-- 롯데닷컴 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottemart.com/">롯데마트<!-- 롯데마트 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.vic-market.com/vicmarket/main.do">롯데빅마켓<!-- 롯데빅마켓 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.toysrus.co.kr/to/main.do">토이저러스<!-- 토이저러스 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottesuper.co.kr/">롯데슈퍼<!-- 롯데슈퍼 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotteimall.com/main/Index.jsp">롯데홈쇼핑<!-- 롯데홈쇼핑 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.7-eleven.co.kr/">바이더웨이<!-- 바이더웨이 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.7-eleven.co.kr/">세븐일레븐<!-- 세븐일레븐 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.himart.co.kr/">하이마트<!-- 하이마트 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.fujifilm.co.kr/">한국후지필름<!-- 한국후지필름 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lohbs.co.kr/main.do">LOHB's<!-- LOHB's --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.ellotte.com/">롯데백화점<!-- 롯데백화점 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://kr.lottedfs.com/main">롯데면세점<!-- 롯데면세점 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottefitin.com">롯데피트인<!-- 롯데피트인 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://gimpoairport.lottemall.co.kr">롯데몰 김포공항점<!-- 롯데몰 김포공항점 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lwt.co.kr">롯데월드몰<!-- 롯데월드몰 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://store.lotteshopping.com/handler/Main-Start?subBrchCd=021&amp;gubun=2">롯데영플라자<!-- 롯데영플라자 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://store.lotteshopping.com/handler/Main-Start?subBrchCd=057">롯데아울렛<!-- 롯데아울렛 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://store.lotteshopping.com/handler/Main-Start?subBrchCd=054&amp;gubun=1">롯데프리미엄아울렛<!-- 롯데프리미엄아울렛 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.mujikorea.net/">무인양품<!-- 무인양품 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.uniqlo.kr/">유니클로<!-- 유니클로 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotteria.com/">롯데리아<!-- 롯데리아 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.angelinus.co.kr/">엔제리너스커피<!-- 엔제리너스커피 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.tgif.co.kr/">T.G.I FRIDAY'S<!-- T.G.I FRIDAY'S --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.natuur.co.kr/">나뚜루POP<!-- 나뚜루POP --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.krispykreme.co.kr/">크리스피크림도넛<!-- 크리스피크림도넛 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.boulangerie.co.kr/">보네스뻬<!-- 보네스뻬 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottecinema.co.kr/">롯데시네마<!-- 롯데시네마 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotteworld.com/">롯데월드 어드벤처<!-- 롯데월드 어드벤처 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotteworld.com/aquarium/index.asp">롯데월드
								아쿠아리움<!-- 롯데월드 아쿠아리움 -->
						</a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotteworld.com/waterpark/index.asp">롯데 워터파크<!-- 롯데 워터파크 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.giantsclub.com/">롯데자이언츠<!-- 롯데자이언츠 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottejtb.com/">롯데제이티비<!-- 롯데제이티비 --></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>