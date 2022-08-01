<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lotte.dao.ShowDao"%>
<%@page import="com.lotte.dto.ShowDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금주의 공연 | 롯데월드 어드벤처</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
<%
	String selectDay = (String)request.getAttribute("selectDay");
	String day = (String)request.getAttribute("day");
	int	a = (Integer)request.getAttribute("a");
	String chart = (String)request.getAttribute("chart");
	
	ArrayList<ShowDto> topList = (ArrayList<ShowDto>)request.getAttribute("topList");
	ArrayList<ShowDto> bottomList = (ArrayList<ShowDto>)request.getAttribute("bottomList");
%>
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
		var selectDay = "<%= selectDay %>";
		var day = "<%= day %>";
		var a = <%= a %>;
		var chart = "<%= chart %>";
		
		var date = new Date();
		var dayOfTheWeek = date.getDay();
		
		var selDay;
		
		switch(dayOfTheWeek){
		case 1:	//월
			selDay = 0;
			break;
		case 2:	//화
			selDay = -1;
			break;
		case 3:	//수
			selDay = -2;
			break;
		case 4:	//목
			selDay = -3;
			break;
		case 5:	//금
			selDay = -4;
			break;
		case 6:	//토
			selDay = -5;
			break;
		case 0:	//일
			selDay = -6;
			break;
		}//switch
		
		for(var i = 0; i < 7; i++){
			var reDate = new Date();
			if(selectDay=="null"){
				var id = selDay==0?"id='on'":"id=''";
			}else {
				var id = i==selectDay?"id='on'":"id=''";
			}
			
			reDate.setDate(date.getDate() + selDay++);
			
			var month = reDate.getMonth() + 1;
			var days = reDate.getDate();
			if(month < 10){
				month = "0" + month;
			}
			if(days < 10){
				days = "0" + days;
			}
			
			if(i <= 2){
				$(".dateSrch a").eq(i).append("<div class='mtw' " + id + ">" + month + "/" + days + "</div>");
			}else if(i <= 4){
				$(".dateSrch a").eq(i).append("<div class='tf' " + id + ">" + month + "/" + days + "</div>");
			}else if(i == 5){
				$(".dateSrch a").eq(i).append("<div class='sa' " + id + ">" + month + "/" + days + "</div>");
			}else {
				$(".dateSrch a").eq(i).append("<div class='su' " + id + ">" + month + "/" + days + "</div>");
			}
		}//for
		
		$(".chart > a").eq(a).addClass("on");
		
		$(".dateSrch a").click(function() {
			day = $(this).find("div").attr("class");
			location.href="LotteController?command=ShowMain&selectDay=" + $(this).index() + "&day=" + day + "&a=" + a + "&chart=" + chart;
		});
		$(".chart > a").click(function() {
			location.href="LotteController?command=ShowMain&selectDay=" + selectDay + "&day=" + day + "&a=" + $(this).index() + "&chart=" + $(this).text();
		});
		
		var select = $(".moremenu2box").text();
		var list = $(".moremenu2List");
		for(var i = 0; i <= 3; i++){
			if(list.eq(i).text() == select){
				list.eq(i).css('font-family', 'NotoSans-bold');
				list.eq(i).css('color', '#000');
				break;
			}
		}
		
		$(".perfomancetable .purplebtn").click(function() {
			var index = $(this).parent().parent().index();
			var detailName = $(".perfomancetable tr").eq(index).find("td").eq(0).text();
			location.href="LotteController?command=ShowDetail&name=" + detailName + "&selectDay=" + selectDay + "&day=" + day + "&a=" + a + "&chart=" + chart;
		});
		$(".viewBt").click(function() {
			var detailName = $(this).parent().find(".info").find(".tit").text();
			var time = $(this).parent().find(".info").find(".time").find(".times").find("span").text();
			if(time=="금일휴연"){
				location.href="LotteController?command=ShowDetail&name=" + detailName + "&selectDay=" + selectDay + "&day=" + day + "&a=" + a + "&chart=" + chart + "&time=no";
			}else {
				location.href="LotteController?command=ShowDetail&name=" + detailName + "&selectDay=" + selectDay + "&day=" + day + "&a=" + a + "&chart=" + chart;
			}
		});
		
		$(".menu").load("lotte/Menu.jsp");
		$(".footer").load("lotte/Footer.html");
	});
	</script>
	<style>
	@font-face {
		font-family: "NotoSans-Light";
		src : url(font/NotoSansKR-Light.otf);
	}
	@font-face {
		font-family: "NotoSans-Bold";
		src : url(font/NotoSansKR-Bold.otf);
	}
	@font-face {
		font-family: "NotoSans-Medium";
		src : url(font/NotoSansKR-Medium.otf);
	}
	@font-face {
		font-family: "NotoSans-Regular";
		src : url(font/NotoSansKR-Regular.otf);
	}
	@font-face {
		font-family: "NotoSans-Black";
		src : url(font/NotoSansKR-Black.otf);
	}
	@font-face {
		font-family: "NotoSans-Thin";
		src : url(font/NotoSansKR-Thin.otf);
	}
	#wrapper {
	    position: relative;
	    width: 100%;
	    overflow: hidden;
	}
	*{
		margin: 0;
		padding: 0;
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
	#cBody {
	    position: relative;
	    width: 100%;
	}
	.subWrap {
	    position: relative;
	    padding: 0 0 130px;
	    width: 100%;
	}
	.subVisArea.type2 {
	    height: 480px;
	    background: url(Img/performance_week.jpg) no-repeat 50% 0;
	}
	.lnbArea {
	    position: relative;
	    max-width: 1170px;
	    margin: 0 auto;
	    padding-top: 30px;
	}
	h2.cWhite {
	    padding-top: 90px;
	}
	h2 {
	    font-family: 'NotoSans-Bold';		
	    font-size: 50px;
	    color: #000;
	    text-align: center;
	    padding-top: 40px;
	}
	.h2Txt {
	    font-size: 18px;
	    color: #555;
	    line-height: 30px;
	    text-align: center;
	    margin-top: 28px;
	}
	.cWhite {
	    color: #fff !important;
	}
	.container {
	    position: relative;
	    width: 1170px;
	    margin: 0 auto;
	}
	.enjoyPerfor {
	    padding-top: 80px;
	}
	.enjoyPerfor .dateSrch {
	    width: 735px;
	    margin: auto;
	}
	.enjoyPerfor .dateSrch > a > div{
	    width: 100px;
	    height: 100px;
	    overflow: hidden;
	    margin-right: 5px;
	    padding-top: 35px;
	    box-sizing: border-box;
	    border: 1px solid #e2e2e2;
	    font-size: 24px;
	    color: #000;
	    text-align: center;
	    border-radius: 50px;
	    float:left;
	}
	.enjoyPerfor .dateSrch #on{
		border: 1px solid #691ef3;
	    background: #691ef3;
	    color: #fff;
	    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    font-weight:700;
	}
	.perfomancetable{
		margin-top: 209px;
	    margin-bottom: 130px;
	    border-top: 2px solid #000;
	}
	table{
		border-collapse: collapse;
		width: 100%;
	}
	th{
		font-family: NotoSans-Medium;
		font-weight: bold !important;
	    padding: 22px 0;
	    border-bottom: 1px solid #e1e1e1;
	    border-right: 1px solid #e1e1e1;
	    font-size: 16px;
	    color: #333;
	    text-align: center;
	    font-weight: bold;
	    color: #111;
	    background: #f8f8f8;
	}
	td{
		text-align: center;
	    border-right: 1px solid #e1e1e1;
	    border-bottom: 1px solid #e1e1e1;
	    padding: 21px;
	    font-size: 16px;
	}	   
	tr > td:nth-child(4),
	tr > th:nth-child(4) {
		border-right: none;
	}    
	.puple{
		color: #550adf !important;
		font-family: 'NotoSans-Bold';
	}         
	td a {
	    font-size: 15px;
	    font-weight: bold;
	    padding: 0 33px;
	    height: 38px;
	    line-height: 36px;
	}
	.purplebtn {
	    display: inline-block;
	    padding: 0 33px;
	    height: 40px;
	    line-height: 41px;
	    color: #fff;
	    text-align: center;
	    border-radius: 28px;
	    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		font-size:15px;
	}
	.perforList {
	   padding-top: 80px;
	}
	.chart{
		width: 100%;
	    text-align: center;
	}
	.chart .on{
		font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    font-weight: normal;
	    color: #550adf !important;
	    border-bottom: 4px solid #550adf;
	    font-weight: 700;
	}
	.perforList .chart a {
	    display: inline-block;
	    font-size: 18px;
	    color: #000;
	    margin: 0 13px;
	    padding-bottom: 5px;
	}
	.perforList ul {
	    margin-top: 50px;
	}
	.perforList li {
	    position: relative;
	    width: 100%;
	    height: 378px;
	    margin-bottom: 30px;
	}
	.perforList li .lab {
	    position: absolute;
	    top: 20px;
	    left: 20px;
	    width: ;
	    height: 36px;
	    border-radius: 5px;
	    overflow: hidden;
	    padding: 0 10px;
	}
	.perforList li .lab span.bg {
	    position: absolute;
	    top: 0;
	    left: 0;
	    background: #000;
	    opacity: .5;
	    width: 100%;
	    height: 100%;
	}
	.perforList li .lab span {
	    position: relative;
	    display: inline-block;
	    padding: 10px 0;
	    color: #fff;
	    font-size: 15px;
	    font-family: 'NotoSans-Regular', '맑은 고딕', 'Malgun Gothic', sans-serif;
	}
	.perforList li .img {
	    width: 298px;
	    height: 378px;
	    float: left;
	    overflow: hidden;
	}
	.perforList li .info {
	    height: 378px;
	    padding: 60px;
	    float: left;
	    overflow: hidden;
	    box-sizing: border-box;
	    border-top: 1px solid #e1e1e1;
	    border-bottom: 1px solid #e1e1e1;
	    border-right: 1px solid #e1e1e1;
	}
	.perforList li .info .tit {
	    font-family: 'NotoSans-Black', '맑은 고딕', 'Malgun Gothic', sans-serif;
   		font-weight: normal;
	    color: #000;
	    font-size: 30px;
	    margin-top: 0px;
	}
	.perforList li .info .txt {
	    color: #333;
	    font-size: 18px;
	    margin-top: 20px;
	    line-height: 25px;
	}
	.perforList li .info .time {
	    overflow: hidden;
	    margin-top:50px;
	    height: 20px;
	}
	.perforList li .info .time p {
	    float: left;
	}
	.perforList li .info .time p strong {
	    display: inline-block;
	    font-family: 'NotoSans-Black', '맑은 고딕', 'Malgun Gothic', sans-serif;
    	font-weight: normal;
	    color: #333;
	    font-size: 18px;
	    margin-right: 15px;
	}
	.perforList li .info .time p span:last-child {
	    background: none;
	}
	.perforList li .info .time p span {
	    display: inline-block;
	    font-family: 'NotoSans-Thin', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    font-weight: 100;
	    color: #333;
	    font-size: 18px;
	    background: url(Img/bar1x13.gif) no-repeat right center;
	    padding-right: 12px;
	    margin-right: 8px;
	}
	.perforList li .info .bt {
	    margin-top: 30px;
	}
	 .perforList li .viewBt {
	    display: block;
	    position: absolute;
	    top: 277px;
	    bottom: -15px;
	    right: 1px;
	    width: 100px;
	    height: 57px;
	    padding-top: 43px;
	    text-align: center;
	    background: #e1e1e1;
	    font-size: 15px;
	    color: #000;
	    font-family: 'NotoSans-Medium', '맑은 고딕', 'Malgun Gothic', sans-serif;
	}
	img, fieldset {
	    border: none;
	    vertical-align: top;
	}
	ul, ol, li {
	    list-style: none;
	}
	
	a{
		text-decoration : none;
	}
	.dateSrch > a,
	.viewBt,
	.purplebtn,
	.chart > a {
		cursor: pointer;
	}
	.infoTxt2 {
	    font-size: 15px;
	    color: #000;
	    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
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
	    background: url(https://adventure.lotteworld.com/common/images/btn/w_home_btn.png) no-repeat 0 50%;
	    border-color: rgba(255,255,255,0.3);
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
	    color: #fff;
	    line-height: 28px;
	    background: url(https://adventure.lotteworld.com/common/images/icon/w_lnb_icon.png) no-repeat right 0 top 50%;
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
		background: url(https://adventure.lotteworld.com/common/images/btn/w_share_btn.png) no-repeat 50% 50%;
	}
	.shareimg:hover {
		background: url(https://adventure.lotteworld.com/common/images/btn/share_btn_on.png) no-repeat 50% 50%;
	}
	.print {
		float : left;
		margin-left: 10px;
		background: url(https://adventure.lotteworld.com/common/images/btn/w_print_btn.png) no-repeat 50% 50%;
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
<body>
	<div id ="wrapper">
		<div class="menu"></div>
		<div id = "cBody">
			<div class = "subWrap">
				<div class = "subVisArea type2">
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
								<a class="moremenu2box" href="javascript:void(0)" onclick="view2()">공연</a>
								<div class="moremenu2" style="z-index : 15; display : none;">
									<a href="LotteController?command=Attraction" class="moremenu2List" style="margin-top : 0px;">어트랙션</a>
		 							<a href="LotteController?command=Festival" class="moremenu2List">페스티벌</a>
									<a href="LotteController?command=ShowMain" class="moremenu2List">공연</a>
									<a href="LotteController?command=Restaurant" class="moremenu2List">다이닝/쇼핑</a>
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
					<h2 class = "cWhite">금주의 공연</h2>
					<p class="h2Txt cWhite">신나는 공연, 퍼레이드와 함께 더 재미있는 하루를 만들어요!</p>
				</div>
				<div class = "container">
					<div class=  "enjoyPerfor">
						<div class= "dateSrch">
							<a></a>
							<a></a>
							<a></a>
							<a></a>
							<a></a>
							<a></a>
							<a></a>
							</div>
						</div>
						<div class= "perfomancetable">
							<table>
								<colgroup>
									<col style ="width: 25%;">
									<col style ="width: 25%;">
									<col style ="width: 25%;">
									<col style ="width: 25%;">
								</colgroup>
									<tr>
										<th>공연명</th>
										<th>장소</th>
										<th>시간</th>
										<th>비고</th>
									</tr>
									<%
										for(int i = 0; i < topList.size(); i++) {
									%>
										<tr>
											<td><%= topList.get(i).getName() %></td>
											<td><%= topList.get(i).getLocation() %></td>
											<td class= "puple"><%= topList.get(i).getTime() %></td>
											<td><a href="javascript:void(0)" class= "purplebtn">상세보기</a></td>
										</tr>
									<%
										}
									%>
							</table>
						</div>
						<div class= "perforList">
							 <div class= "chart">
							 	<a class="">전체</a>
							 	<a class="">스테이지</a>
							 	<a class="">퍼레이드</a>
							 	<a class="">기타공연</a>
							</div>
							<ul>
								<%
									for(int i = 0; i < bottomList.size(); i++) {
								%>
								<li class="prfmList">
									<p class="lab">
										<span class="bg"></span>
										<span><%= bottomList.get(i).getCharacteristic() %></span>
									</p>
									<p class="img">
										<img src="Img/<%= bottomList.get(i).getMain_image() %>">
									</p>
									<div class="info" style="width: 872px;">
										<p class="tit"><%= bottomList.get(i).getName() %></p>
										<p class="txt" style="white-space:pre-wrap;"><%= bottomList.get(i).getExplain() %></p>
										<div class="time">
											<p>
												<strong>공연시간</strong>
											</p>
											<p class="times">
											<%
												for(int j = 0; j < bottomList.get(i).getTimeArr().length; j++) {
											%>
												<span><%= bottomList.get(i).getTimeArr()[j] %></span>											
											<%		
												}//for
											%>
											</p>
										</div>
										<div class="time " style="margin-top:20px;">
											<p><strong>공연장소</strong></p>
											<p><span><%= bottomList.get(i).getLocation() %></span></p>
										</div>
										<p class="bt"></p>
									</div>
									<a class="viewBt" href="javascript:void(0)">상세보기</a>
								</li>
								<%
									}//for
								%>
							</ul>
							<p class="infoTxt2">※위 일정은 공연 사정에 따라 변경 또는 취소될 수 있습니다.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="footer"></div>
		</div><!-- wrapper -->
</body>
</html>