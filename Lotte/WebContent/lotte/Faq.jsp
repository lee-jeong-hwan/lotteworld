<%@page import="com.lotte.dto.FaqDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lotte.dao.FaqDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FAQ | 롯데월드 어드벤처</title>
<style>
.qnaList a { cursor:pointer;}
.qnaList .hide { display:none;}
</style>
<%
	int realContentMenuIndex = (Integer)request.getAttribute("realContentMenuIndex");	
	String selectContent = (String)request.getAttribute("selectContent");
	int realPageNum = (Integer)request.getAttribute("realPageNum");
	String search = (String)request.getAttribute("search");
	
	ArrayList<FaqDto> list = (ArrayList<FaqDto>)request.getAttribute("list");
	ArrayList<FaqDto> listSize = (ArrayList<FaqDto>)request.getAttribute("listSize");
	
	int pageBun = (int)(listSize.size()/10+1);
	int breakDiv = 5;
	double pagination = (double)pageBun / breakDiv;
	int openDiv = (realPageNum-1)/breakDiv;
%>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
$(function() {
	$(".paging").find("div").css("display","none");
	$(".paging").find("div").eq(<%= openDiv %>).css("display","block");
	
	var search = "";
	<%
		if(search!=null) {
	%>
		search = "<%= search %>";
	<%
		}
	%>
	var contentMenuIndex = <%= realContentMenuIndex %>;
	var selectContent = "<%= selectContent %>";
	var pageNum = <%= realPageNum %>;
	var pageBun = <%= pageBun %>;
	
	if(search!=null){		
		$("#q").val(search);
	}
	
	$(".tabArea .tabBtn.tab6 > a").removeClass("on");
	$(".tabArea .tabBtn.tab6 > a").eq(contentMenuIndex).addClass("on");	
	
	$(".tabArea .tabBtn.tab6 > a").click(function() {
		var index = $(this).index();
		var selectContentText = $(this).text();
		
		if(selectContentText=="전체"){
			location.href="LotteController?command=Faq&contentMenu=" + index + "&select=" + selectContentText;
		}else {
			location.href="LotteController?command=Faq&contentMenu=" + index + "&select=" + selectContentText + "&search=" + search;
		}
	});
	
	$(".menu").load("lotte/Menu.jsp");
	$(".footer").load("lotte/Footer.html");

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
		$(document).on("click", ".listBlock", function() {
			if($(this).find(".tit").attr("class")=="tit on") {
				$(".listBlock").find(".tit").removeClass("on");
				$(".listBlock").parent().find(".hide").removeClass("up");
			}else {
				$(".listBlock").find(".tit").removeClass("on");
				$(this).find(".tit").addClass("on");
				$(".listBlock").parent().find(".hide").removeClass("up");
				$(this).parent().find(".hide").addClass("up");
			}
			
			$(".hide").slideUp();
			$(".hide.up").slideDown();
			
		});
		$(document).on("click", ".bno", function() {
			location.href="LotteController?command=Faq&contentMenu=" + contentMenuIndex + "&select=" + selectContent + "&pageNum=" + $(this).text() + "&search=" + search;
		});
		$(".srchBtn1").click(function() {
			location.href="LotteController?command=Faq&contentMenu=" + contentMenuIndex + "&select=" + selectContent + "&search=" + $("#q").val();
		});
		$(document).on("click", ".first", function() {
			location.href="LotteController?command=Faq&contentMenu=" + contentMenuIndex + "&select=" + selectContent + "&pageNum=1&search=" + search;
		});
		$(document).on("click", ".last", function() {
			location.href="LotteController?command=Faq&contentMenu=" + contentMenuIndex + "&select=" + selectContent + "&pageNum=" + pageBun + "&search=" + search;
		});
		$(document).on("click", ".prev", function() {
			if(pageNum!=1){
				pageNum = pageNum - 1;
			}
			location.href="LotteController?command=Faq&contentMenu=" + contentMenuIndex + "&select=" + selectContent + "&pageNum=" + pageNum + "&search=" + search;
		});
		$(document).on("click", ".next", function() {
			if(pageNum==pageBun){
				location.href="LotteController?command=Faq&contentMenu=" + contentMenuIndex + "&select=" + selectContent + "&pageNum=" + pageNum + "&search=" + search;	
			}else {
				pageNum = pageNum + 1;
				location.href="LotteController?command=Faq&contentMenu=" + contentMenuIndex + "&select=" + selectContent + "&pageNum=" + pageNum + "&search=" + search;
			}
			
		});
});

function view() {
	if($(".moremenu").css("display")=="block"){
		$(".moremenu").slideUp();
	}else {
		$(".moremenu2").slideUp();
		$(".sharesub").slideUp();
		$(".moremenu").slideDown();
	}
}

function view2() {
	if($(".moremenu2").css("display")=="block"){
		$(".moremenu2").slideUp();
	}else {
		$(".moremenu").slideUp();
		$(".sharesub").slideUp();
		$(".moremenu2").slideDown();
	}
}

function shareview() {
	if($(".sharesub").css("display")=="block"){
		$(".sharesub").slideUp();
	}else {
		$(".moremenu").slideUp();
		$(".sharesub").slideDown();
		$(".moremenu2").slideUp();
	}
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
.lnbArea {
    position: relative;
    max-width: 1170px;
    margin: 0 auto;
    padding-top: 30px;
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
body {
    position: relative;
    font-size: 16px;
    color: #555;
    letter-spacing: -0.6px;
    height: 100%;
    -webkit-text-size-adjust: 100%;
    -moz-text-size-adjust: 100%;
    -ms-text-size-adjust: 100%;
    line-height: 1;
    font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
    font-size: 16px;
}
h2 {
    font-size: 50px;
    color: #000;
    text-align: center;
	font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
}

.qnaTop {
    margin-top: 80px;
    padding: 50px 0;
    background: url(Img/qnaTop_bg.jpg) no-repeat center 0;
    color: #fff;
    text-align: center;
}
.qnaTop .txt {
    font-size: 18px;
    line-height: 18px;
    background: url(Img/qna_txt_ico.png) no-repeat center 0;
    padding-top: 67px;
}
.qnaTop .guideBt {
    display: inline-block;
    font-size: 18px;
    color: #fff;
    border: 2px solid #fff;
    border-radius: 30px;
    padding: 14px 58px;
    margin-top: 40px;
    text-decoration : none;
}
.qnaDiv {
    width: 1170px;
    margin: auto;
}
.srchType1 {
    text-align: center;
    margin-top: 80px;
}
.srchType1 > div {
    display: inline-block;
}
.srchType1 .input {
    float: left;
    width: 383px;
    height: 52px;
    border: 1px solid #e1e1e1;
    border-right: 0;
    position: relative;
}
.srchType1 .input input {
    padding: 3px 56px 3px 20px;
    width: 307px;
    height: 46px;
    border: 0;
    font-size: 16px;
  	font-weight: 100;
}
input::placeholder {
  color: #cfcfcf ;  
 }
.srchType1 .input .srchXbt {
    position: absolute;
    top: 17px;
    right: 20px;
    display: none;
}
img, fieldset {
    border: none;
    vertical-align: top;
}
.tabArea {
    margin-top: 100px;
}
.qnaDiv .tabBtn {
    margin-top: 50px;
}

.tabBtn.tab6 a, .tabBtn.tab7 a, .tabBtn.tab8 a, .tabBtn.tab9 a, .tabBtn.tab10 a {
    display: block;
    float: left;
    width: 16.6%;
    position: relative;
}
.tabBtn.tab6 a span, .tabBtn.tab7 a span, .tabBtn.tab8 a span, .tabBtn.tab9 a span, .tabBtn.tab10 a span {
    display: block;
    width: 85%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
.tabBtn a.on {
    border-color: #550adf !important;
    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
    color: #fff;
    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
}
.tabBtn a {
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
.qnaList{
    margin-top: 209px;
    border-top: 2px solid #000;
}
.qnaList li {
    border-bottom: 1px solid #e1e1e1;
}
.qnaList li > a {
    padding: 25px 30px 25px 105px;
    display: block;
    background: url(Img/qna_list_icon.png) no-repeat 30px center;
    height: 50px;
 }
ul, ol, li {
    list-style: none;
}
a {
    text-decoration: none;
    color: #555;
}
#cBody .type1 {
    font-size: 16px;
    color: #555;
    margin-bottom: 8px;
    font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
}
#cBody span.type2{
	float: left;
    font-size: 18px;
    color: #000;
    line-height: 25px;
    word-wrap: break-word;
    white-space:pre-wrap;
    font-family: 'NotoSans-Regular', '맑은 고딕', 'Malgun Gothic', sans-serif
}

.qnaList li .answerDiv {
    padding: 25px 30px 50px 105px;
    background: url(Img/qna_answer_icon.png) no-repeat 30px 30px #f8f8f8;
    color: #555;
    font-size: 16px;
    line-height: 28px;
    border-top: 1px solid #e1e1e1;
    display: block;
	word-wrap: break-word;
	letter-spacing: -1.4px;
	width: 1033px;
}

.qnaList li > a .tit:after {
	float: right;
    content: "";
    display: block;
    width: 18px;
    height: 10px;
    position: relative;
    top: 50%;
    right: 0;
    margin-top: -5px;
    background: url(https://adventure.lotteworld.com/common/images/icon/qna_arrow.png) no-repeat 0 0;
}
.qnaList li > a .tit.on:after {
	content: "";
    display: block;
    width: 18px;
    height: 10px;
    position: relative;
    top: 50%;
    right: 0;
    margin-top: -5px;
	float: right;
    background: url(https://adventure.lotteworld.com/common/images/icon/qna_arrow_on.png) no-repeat 0 0;
}
.qnaList li > a .tit span {
    display: block;
}
.paging {
    position: relative;
    width: 100%;
    text-align: center;
    margin-top: 80px;
}
.paging .first {
    border: 0;
    width: auto;
    height: auto;
    line-height: 12px;
    border-radius: 0;
    background: none;
    margin-top: 19px;
    margin-right: 17px;
}
img, fieldset {
    border: none;
    vertical-align: top;
}
.paging .prev {
    border: 0;
    width: auto;
    height: auto;
    line-height: 12px;
    border-radius: 0;
    background: none;
    margin-top: 19px;
    margin-right: 17px;
}
.paging .bno.active {
    border: 1px solid #5c11e6;
    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
    font-size: 16px;
    color: #fff;
    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
}
.paging a {
    display: inline-block;
    margin-left: 10px;
    width: 48px;
    height: 48px;
    border: 1px solid #dadada;
    line-height: 46px;
    font-weight: 300;
    font-size: 16px;
    color: #555;
    text-align: center;
    vertical-align: top;
    background: #fff;
    border-radius: 25px;
}
.paging .next {
    border: 0;
    width: auto;
    height: auto;
    line-height: 12px;
    border-radius: 0;
    background: none;
    margin-top: 19px;
    margin-left: 27px;
}
.paging .last {
    border: 0;
    width: auto;
    height: auto;
    line-height: 12px;
    border-radius: 0;
    background: none;
    margin-top: 19px;
    margin-left: 17px;
}

dl dt{margin-top:15px;word-break:keep-all;word-wrap:break-word;}
dl dt:first-child{margin-top:0;}
dl dd{margin-top:5px;margin-left:10px;}
table{margin-top:20px;border-top:2px solid #000; width: 1036px;}
table th{padding:20px 0;background:#fff;border-right:1px solid #e1e1e1;border-bottom:1px solid #e1e1e1;}
table td{padding:15px 0;border-right:1px solid #e1e1e1;border-bottom:1px solid #e1e1e1;}
table th:last-child,
table td:last-child{border-right:none;}

		.contentMenu,
		.pagination > a {
			cursor: pointer;
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
		.noData {
		    border-bottom: 1px solid #e1e1e1;
		    padding: 100px 0;
		    text-align: center;
		}
		.noData .txt {
		    background: url(images/no_data_icon.png) no-repeat center 0;
		    color: #777;
		    font-size: 18px;
		    padding-top: 128px;
		}
</style>
</head>
<body>
	<div id = "wrapper">
		<div class="menu"></div>
		<div class="topsub">
				<div class="topsubIn">
					<a href="LotteController?command=lotteMain" class="home"></a>
						<div class="one">
							<a href="javascript:void(0)" onclick="view()" class="moremenuclick">소통서비스</a>
							<div class="moremenu" style="z-index : 15; display : none;">
								<a href="LotteController?command=Attraction" class="moremenulist" style="margin-top : 0px;">즐길거리</a>
								<a href="LotteController?command=Charge" class="moremenulist">요금/우대혜택</a>
	 							<a href="LotteController?command=Performance" class="moremenulist">참여프로그램</a>
								<a href="LotteController?command=Suspension" class="moremenulist">이용가이드</a>
								<a href="LotteController?command=Notice" class="moremenulist">소통서비스</a>
							</div>
						</div>
						<div class="two">
							<a class="moremenu2box" href="javascript:void(0)" onclick="view2()">FAQ</a>
							<div class="moremenu2" style="z-index : 15; display : none;">
								<a href="LotteController?command=Notice" class="moremenu2List" style="margin-top : 0px;">공지사항</a>
	 							<a href="LotteController?command=Faq" class="moremenu2List">FAQ</a>
								<a href="LotteController?command=Inquiry" class="moremenu2List">고객소리함</a>
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
		<div id = "cBody">
			<div class = "subWrap">
				<div class = "lnbArea"></div>
				<h2>FAQ</h2>
				<div class="qnaDiv" data-controller="controller/COCommonController controller/lwf/lwfb/LWFBFaqBoardController" data-type="list">
				<div class="qnaTop">
					<p class="txt">더 궁금하신 사항이 있으면 이용문의를 이용하시기 바랍니다.</p><!-- 2018-04-30 내용 수정 -->
					<a href="LotteController?command=Inquiry" class="guideBt">이용문의 바로가기</a>
				</div>
					<div class="srchType1" style="margin-bottom:-4.5%;">
						<div>
							<div class="input">
								<input type="text" id="q" name="q" value="" placeholder="검색어를 입력해주세요." maxlength="50">
								<a href="javascript:" class="srchXbt" style="display: none;"><img src="Img/srch_x_btn.gif" alt=""></a>
							</div>
							<a href="javascript:" class="srchBtn1" id="btn_search"><img src="Img/srch_btn.gif" alt="검색"></a>
						</div>
					</div>
					<div class="tabArea">					
						<div class="tabBtn tab6">	
							<a class="contentMenu on" style="height: 60px; border-left: 1px solid #e1e1e1;"><span>전체</span></a>				
							<a class="contentMenu" style="height: 60px;"><span>이용정보</span></a>			
							<a class="contentMenu" style="height: 60px;" ><span>우대정보 / 이벤트</span></a>			
							<a class="contentMenu" style="height: 60px;"><span>연간이용</span></a>			
							<a class="contentMenu" style="height: 60px;"><span>온라인예매</span></a>			
							<a class="contentMenu" style="height: 60px;"><span>기타</span></a>			
						</div>
					</div>
				<div class="FAQ">
					<ul class="qnaList">
					<%
						if(listSize.size()==0) {
					%>
						<li>
							<div class="noData"  style="margin-top:inherit;border-top:inherit;">
								<p class="txt">게시물이 없습니다.</p>
							</div>
						</li>
					<%
						}else {
							for(int i = 0; i < list.size(); i++){
					%>
						<li>
							<a href="javascript:" class="listBlock">
								<p class="tit">
									<span class="type1"><%= list.get(i).getCategory() %></span>
									<span class="type2"><%= list.get(i).getContents() %></span>
								</p>
							</a>
							<ul class="hide">
								<div class="answerDiv"><%= list.get(i).getDetail() %></div>
							</ul>
						</li>
					<%
							}//for
					%>
					<div class="paging">
					<%
						int cnt = 1;
						outer : for(int j = 0; j < pagination; j++){
					%>
					<div>
					<%
							if(pageBun>5){
					%>
									<ul class="pagination">
										<a class="first">
											<img src="Img/paging_first.png" alt="처음">
										</a>
										<a class="prev">
											<img src="Img/paging_prev.png" alt="이전">
										</a>
					<%
							} else {	
					%>				
									<ul class="pagination">
					<%
							}
							for(int i = cnt; i <= pageBun; i++){
								if(i==realPageNum){
					%>
										<a class="bno active"><%= i %></a>
					<%
									cnt++;
								}else {
					%>						
										<a class="bno"><%= i %></a>					
					<%
									cnt++;
								}
								
								if((cnt-1)%breakDiv==0){
									break;
								}
							}//inner
							if(pageBun>5){
					%>
										<a class="next">
											<img src="Img/paging_next.png" alt="다음">
										</a>
										<a class="last">
											<img src="Img/paging_last.png" alt="마지막">
										</a>
									</ul>
					<%
							}else {		
					%>
									</ul>
					<%
							}	
					%>
					</div>
					<%
						}//outer
					%>
					</div><!-- paging -->
					<%
						}
					%>
					</ul>
				</div>
			</div>
		</div>
</div>
<div class="footer"></div>
</div><!-- #wrapper -->
</body>
</html>