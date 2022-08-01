<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "com.lotte.dto.*" %>
<%@ page import = "com.lotte.dao.*" %>
<%@ page import ="java.util.*" %>
<%
	int cnt=0;
	int pageNum =1;
	String Search = "null";
	String sel =null;
	try{
		pageNum = (Integer)request.getAttribute("page");
	} catch(Exception e) {}
	try {
		cnt = Integer.parseInt(request.getParameter("cnt"));
	} catch(Exception e) {}
	try {
		Search = request.getParameter("Search");
		if(Search==null){
			System.out.println("오브젝트 " + Search);
		}else  if(Search.equals("null")){
			System.out.println("문자열 " + Search);
		}
	} catch(Exception e) {}
	try{
		sel = request.getParameter("sel");
	}catch(Exception e) {}
	
	int startBno = pageNum * 10 - 9;
	int endBno = pageNum * 10;
	
%>
<%
	NoticeDao nDao = new NoticeDao();
	ArrayList<NoticeDto> listBoard = nDao.getNoticeListStartEnd(startBno, endBno);
	ArrayList<NoticeDto> Searchlist = (ArrayList<NoticeDto>)request.getAttribute("Searchlist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 | 롯데월드 어드벤처</title>
<script src="js/jquery-3.6.0.min.js"></script>
	<script>
		var pageNum = <%=pageNum%>;
		var cnt=0;
		var Search = null;
	    var sel = "<%=sel%>";
	    var startBno = pageNum * 10 - 9;
	    var endBno = pageNum * 10;
			 function test() {	//엔터칠때
		
			 Search = $("#q").val();
			  if(sel==null){
				  $(".select").text("전체");  
			  }else {
				  sel = $(".select").text();
			  }
			  
			
			 cnt++;
			  location.href="LotteController?command=NoticeSearch&Search=" +Search + "&cnt=" + cnt + "&sel=" + sel + "&startBno=" + startBno + "&endBno=" +endBno;
			 }
			//minihead
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
		$(document).ready(function() {
			
			  $(".srchSel").click(function(){
				  $(".srchSel > a").toggleClass("on");
			  	  $(".srchSel > div").slideToggle();  
			  });
			  
			 
			  if(sel=="null"){
				  $(".select").text("전체");  
			  }else {
				  sel = $(".select").text(sel);
			  }
			  
			  $(".searchSel").click(function() {
				  $(".select").text($(this).text());
			  });
			  
			  $("#btn_search").click(function(){
				 Search = $("#q").val();
				  if(sel==null){
					  $(".select").text("전체");  
				  }else {
					  sel = $(".select").text();
				  }
				  
				 cnt++;
				 location.href="LotteController?command=NoticeSearch&Search=" +Search + "&cnt=" + cnt + "&sel=" + sel + "&startBno=" + startBno + "&endBno=" +endBno;
				});
			 
			$(".one").click(function(){
				
				if(pageNum==1){
					location.href = "LotteController?command=Notice&page=" + pageNum;
				}else{
					location.href = "LotteController?command=Notice&page=" + (pageNum-1);
				}
			});
			
			$(".two").click(function(){
				if(pageNum==2){
					location.href = "LotteController?command=Notice&page="+pageNum;
				}else{
					location.href = "LotteController?command=Notice&page=" +(pageNum+1);
				}
			});
			
		if(pageNum==1){
			$('.one' ).addClass( 'active' );
		}else{
			$('.two' ).addClass( 'active' );
		}
		
		$(".Menu").load("lotte/Menu.jsp");
		$(".Footer").load("lotte/Footer.html");
		
		
		
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
			for(var i = 0; i <= 2; i++){
				if(list2.eq(i).text() == select2.text()){
					list2.eq(i).css('font-family', 'NotoSans-bold');
					list2.eq(i).css('color', '#000');
					break;
				}
			}
	});
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
a{
	text-decoration : none;
	color : black;
	cursor : pointer;
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
.container {
    position: relative;
    width: 1170px;
    margin: 0 auto;
}
.srchType1{
	text-align : center;
	margin-top : 80px;
}
.menu select {
	width: 200px;
	height: 54px;
	padding-left : 20px;
	font-family: inherit;
	background: url(Img/arrow.png) no-repeat 95% 50%;
	border-radius: 0px; 
	appearance: none;
	border : 1px solid #e1e1e1;
	line-height: 40px;
	padding-top: 4px;
	font-size: 16px;
}
select::-ms-expand {  
	display: none;
}
.srchType1 input{
	border: 1px solid #e1e1e1;
    padding: 6px 56px 0px 20px;
    width: 307px;
    height: 46px;
}
.srchType1 img{
	width:54px;
	height:54px;
	position: absolute;
	margin-left:0px;
}
.noticeboard{
	border-top: 2px solid #000;
    margin-top: 50px;
}
.noticeboard .listHead{
	
    display: table;
    width: 100%;
    padding: 18px 0;
    border-bottom: 1px solid #cacaca;
}
.listHead p{
    display: table-cell;
    position: relative;
    font-size: 16px;
    color: #000;
    text-align: center;
    vertical-align: middle;
    font-family: 'Noto Sans KR', sans-serif;
}
.noticeboard .listHead p:before {
    content: '';
    position: absolute;
    top: 50%;
    left: 0;
    margin-top: -2px;
    width: 4px;
    height: 4px;
    background: #b2b2b2;
    border-radius: 2px;
}
.listType1 ul li .title a {
    line-height: 1.2;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
 .listHead p:first-child:before {
    display: none;
} 
.listHead .num {
    width: 127px;
}
.listHead .type {
    width: 132px;
}
.listHead .title {
    width: 619px;
}
.listHead .regist {
    width: 146px;
}
.noticeboard ul li .num {
    width: 127px;
    color: #555;
}
.noticeboard ul li .type {
    width: 132px;
    color: #555;
}
.noticeboard ul li .title {
    padding-left: 55px;
    width: 564px;
    max-width: 564px;
    text-align: left;
	font-family: 'Noto Sans KR', sans-serif;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
	font-weight: 400;
    font-size: 18px;
}
.noticeboard ul li .regist {
    width: 146px;
    color: #555;
}
.noticeboard ul li {
    display: table;
    width: 100%;
    padding: 17px 0;
    border-bottom: 1px solid #e1e1e1;
    overflow: hidden;
    min-height: 30px;
}
.noticeboard ul li p {
    display: table-cell;
    font-size: 16px;
    color: #000;
    text-align: center;
    vertical-align: middle;
}
.paging {
    position: relative;
    width: 100%;
    text-align: center;
    margin-top: 80px;
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
.paging .active {
    border: 1px solid #5c11e6;
    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
    font-size: 16px;
    color: #fff;
    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, 
    rgba(85,10,223,1) 100%);
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
}

input[type="text"] {
    width: 278px;
    background: #fff;
    -webkit-appearance: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
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
.srchType1 .srchBtnNotice {
    float: left;
}

a {
    text-decoration: none;
    color: #555;
}
.srchType1 > div {
    display: inline-block;
}
.srchType1 .srchSel {
    float: left;
}

.srchSel {
    position: relative;
    width: 170px;
    height: 54px;
    margin-right: 10px;
    z-index: 10;
}
.srchSel > a {
    display: block;
    padding-left: 20px;
    border: 1px solid #e1e1e1;
    line-height: 52px;
    font-size: 16px;
    color: #000;
    text-align: left;
    background: url(Img/srch_sel_icon.gif) no-repeat right 20px top 50%;
}
.srchSel > div {
    display: none;
    position: absolute;
    top: 53px;
    left: 0;
    padding: 15px 0 20px;
    width: calc(100% - 2px);
    border: 1px solid #e1e1e1;
    background: #fff;
}
.srchSel > div a.active {
    color: #000;
}
.srchSel > div a:first-child {
    margin-top: 0;
}

.srchSel > div a {
    display: block;
    padding-left: 20px;
    font-size: 16px;
    color: #555;
    text-align: left;
    line-height: 30px;
}
.srchSel > a.on  div  {
    display: block;
    position: absolute;
    top: 53px;
    left: 0;
    padding: 15px 0 20px;
    width: calc(100% - 2px);
    border: 1px solid #e1e1e1;
    background: #fff;
}
.noData .text {
    background: url(Img/no_data_icon.png) no-repeat center 0;
    color: #777;
    font-size: 18px;
    padding-top: 128px;
}
.noData {
    margin-top: 50px;
    border-top: 2px solid #000;
    border-bottom: 1px solid #e1e1e1;
    padding: 100px 0;
    text-align: center;
}
</style>
</head>
<body>
	<div id ="wrapper">
		<div class ="Menu"></div>
		<div class="topsub">
			<div class="topsubIn">
				<a href="LotteController?command=lotteMain" class="home"></a>
				<div class="first">
					<a href="javascript:void(0)" onclick="view()" class="moremenuclick">소통서비스</a>
					<div class="moremenu" style="z-index : 15; display : none;">
						<a href="LotteController?command=Attraction" class="moremenulist" style="margin-top : 0px;">즐길거리</a>
						<a href="LotteController?command=Charge" class="moremenulist">요금/우대혜택</a>
						<a href="LotteController?command=Performance" class="moremenulist">참여프로그램</a>
						<a href="LotteController?command=Suspension" class="moremenulist">이용가이드</a>
						<a href="LotteController?command=Notice" class="moremenulist">소통서비스</a>
					</div>
				</div>
				<div class="thrid">
					<a class="moremenu3box" href="javascript:void(0)" onclick="view3()">공지사항</a>
					<div class="moremenu3" style="z-index : 15; display : none">
						<a class="moremenu3List" href="LotteController?command=Notice" style="margin-top : 0px;">공지사항</a>
						<a class="moremenu3List" href="LotteController?command=Faq">FAQ</a>
 						<a class="moremenu3List" href="LotteController?command=Inquiry">고객소리함</a>
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
		<div id ="cBody">
			<div class= "subWrap">
				<h2>공지사항</h2>
				<div class = "container">
				<div class="srchType1">
					<div>
						<div class="srchSel">
							<a class="select" href="javascript:">
							<%=sel%></a>
							<div>
							<a href="javascript:" class="searchSel " data-cd="">전체</a>
							<a href="javascript:" class="searchSel " data-cd="ANNOUNCE_01">공지</a>
							<a href="javascript:" class="searchSel " data-cd="ANNOUNCE_03">뉴스</a>
							<a href="javascript:" class="searchSel " data-cd="ANNOUNCE_04">이벤트</a>
							</div>
						</div>
						<div class="input">
							<input type="text" id="q" onkeyup="if(window.event.keyCode==13){test()}" />
							<a href="javascript:" class="srchXbt" style="display: none;"><img src="Img/srch_x_btn.gif" alt=""></a>
						</div>
						<a href="javascript:" class="srchBtnNotice" id="btn_search"><img src="Img/srch_btn.gif" alt="s검색"></a>
					</div>
				</div>
					<div class= "first">
						<div class=  "noticeboard">
							<div class = "listHead">
								<p class = "num">번호</p>
								<p class = "type">구분</p>
								<p class = "title">제목</p>
								<p class = "regist">등록일</p>
							</div>
							<ul style = "margin-top: 1px;">
							
							<% 
								if(cnt==0){
									for(NoticeDto board : listBoard){
							%>
								<li>
									<p class="num"><%=board.getBno()%></p>
									<p class="type">
										<span class="notice">
											<%=board.getCategory()%></span>
									</p>
									<p class="title">
										<a href="LotteController?command=NoticeDetail&num=<%=board.getBno()%>&pageNum=<%=pageNum%>">
											<%=board.getTitle()%>
										</a>
									</p>
									<p class="regist">
										<%=board.getRegistrationdate() %></p>
								</li>
								
				 			<%
									}
							%>
								<div class = "paging">
									<ul class="pagination">
										<a class= "one">1</a>
										<a class= "two"><span>2</span>
										</a>
									</ul>
								</div>
								<%		
								}else{
									
									if(Searchlist.size()>=10){
										for(int i =0; i<Searchlist.size(); i++){
											%>
											<li>
											<p class="num"><%=Searchlist.get(i).getBno()%></p>
											<p class="type">
												<span class="notice">
													<%=Searchlist.get(i).getCategory()%></span>
											</p>
											<p class="title">
												<a href="LotteController?command=NoticeDetail&num=<%=Searchlist.get(i).getBno()%>&pageNum=<%=pageNum%>">
													<%=Searchlist.get(i).getTitle()%>
												</a>
											</p>
											<p class="regist">
												<%=Searchlist.get(i).getRegistrationdate() %>
											</p>
										</li>
										<%
										}
										%>
										<div class = "paging">
											<ul class="pagination">
												<a class= "one">1</a>
												<a class= "two">2</a>
											</ul>
										</div>
										<%
											}else if(10>Searchlist.size() && Searchlist.size()>=1){
												for(int i =0; i<Searchlist.size(); i++){
													%>
													<li>
													<p class="num"><%=Searchlist.get(i).getBno()%></p>
													<p class="type">
														<span class="notice">
															<%=Searchlist.get(i).getCategory()%></span>
													</p>
													<p class="title">
														<a href="LotteController?command=NoticeDetail&num=<%=Searchlist.get(i).getBno()%>&pageNum=<%=pageNum%>">
															<%=Searchlist.get(i).getTitle()%>
														</a>
													</p>
													<p class="regist">
														<%=Searchlist.get(i).getRegistrationdate() %>
													</p>
												</li>
												<%
												}
												%>
												<div class = "paging">
													<ul class="pagination">
														<a class= "one">1</a>
													</ul>
												</div>
												<%
												
											}else{
												
										%>
										<div class="noData" style="margin-top:inherit;border-top:inherit;">
											<p class="text">게시물이 없습니다.</p>
										</div>
										<% 
											}
										%>
										<%
											}
										%>
									</ul>
								</div>
									
						</div>
					</div>
			    </div>
			</div>
		<div class= "Footer"></div>
		</div>
</body>
</html>