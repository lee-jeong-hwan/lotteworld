<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.lotte.dto.NoticeDto" %>
<%@ page import = "com.lotte.dao.NoticeDetailDao" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.lotte.dao.NoticePrevDao" %>
<%@ page import = "com.lotte.dto.NoticeTitleDto" %>
<%@ page import = "com.lotte.dao.NoticeNextDao" %>
<!DOCTYPE html>
<%
	int num=0;
	int p =0;
	try{
		num= Integer.parseInt(request.getParameter("num"));
		p = Integer.parseInt(request.getParameter("p"));
	} catch(Exception e) {}
	
	int prev = num-1;
	int next = num+1;
	
	ArrayList<NoticeDto> Detail = (ArrayList<NoticeDto>)request.getAttribute("Detail");
	ArrayList<NoticeTitleDto> Prev = (ArrayList<NoticeTitleDto>)request.getAttribute("Prev");
	ArrayList<NoticeTitleDto> Next = (ArrayList<NoticeTitleDto>)request.getAttribute("Next");
%>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 | 롯데월드 어드벤처</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
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
	document.cookie = "safeCookie1=foo; SameSite=Lax"; 
	document.cookie = "safeCookie2=foo";  
	document.cookie = "crossCookie=bar; SameSite=None; Secure";
	var num = <%=num%>
	var prev = <%=prev%>
	var next = <%=next%>
	var p =<%=p%>
	
	switch(num){
	
	case 1 : 
		$("#detail").load("lotte/notice/Notice-01.html .txtArea");
		break;
		
	case 2: 
		$("#detail").load("lotte/notice/Notice-02.html .txtArea");
		break;
		
	case 3: 
		$("#detail").load("lotte/notice/Notice-03.html .txtArea");
		break;
		
	case 4: 
		$("#detail").load("lotte/notice/Notice-04.html .txtArea");
		break;
		
	case 5: 
		$("#detail").load("lotte/notice/Notice-05.html .txtArea");
		break;
		
	case 6: 
		$("#detail").load("lotte/notice/Notice-06.html .txtArea");
		break;
		
	case 7: 
		$("#detail").load("lotte/notice/Notice-07.jsp .txtArea");
		break;
		
	case 8: 
		$("#detail").load("lotte/notice/Notice-08.html .txtArea");
		break;
		
	case 9: 
		$("#detail").load("lotte/notice/Notice-09.html .txtArea");
		break;
		
	case 10: 
		$("#detail").load("lotte/notice/Notice-10.html .txtArea");
		break;
	
	case 11: 
		$("#detail").load("lotte/notice/Notice-11.html .txtArea");
		break;
	
	case 12: 
		$("#detail").load("lotte/notice/Notice-12.html .txtArea");
		break;
	}
	
		
	switch(p){
		
		case 1 :
			$(".label").load("lotte/notice/Notice_detail1.html .label");
			$(".tit").load("lotte/notice/Notice_detail1.html .tit");
			$(".date").load("lotte/notice/Notice_detail1.html .date");
			$("#detail").load("lotte/notice/Notice_detail1.html .txtArea");
			break;
	
		case 2 :
			$(".label").load("lotte/notice/Notice_detail2.html .label");
			$(".tit").load("lotte/notice/Notice_detail2.html .tit");
			$(".date").load("lotte/notice/Notice_detail2.html .date");
			$("#detail").load("lotte/notice/Notice_detail2.html .txtArea");
			break;
		
		case 3 :
			$(".label").load("lotte/notice/Notice_detail3.html .label");
			$(".tit").load("lotte/notice/Notice_detail3.html .tit");
			$(".date").load("lotte/notice/Notice_detail3.html .date");
			$("#detail").load("lotte/notice/Notice_detail3.html .txtArea");
			break;
	
		case 4 :
			$(".label").load("lotte/notice/Notice_detail4.html .label");
			$(".tit").load("lotte/notice/Notice_detail4.html .tit");
			$(".date").load("lotte/notice/Notice_detail4.html .date");
			$("#detail").load("lotte/notice/Notice_detail4.html .txtArea");
			break;
			
		case 5 :
			$(".label").load("lotte/notice/Notice_detail5.html .label");
			$(".tit").load("lotte/notice/Notice_detail5.html .tit");
			$(".date").load("lotte/notice/Notice_detail5.html .date");
			$("#detail").load("lotte/notice/Notice_detail5.html .txtArea");
			break;
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
	body, div, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd, p, form, fieldset, table, tr, th, td {
    margin: 0;
    padding: 0;
	}
	* {
	    margin: 0;
	    padding: 0;
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
	.viewType1 .titArea .tit {
	    display: table-cell;
	    vertical-align: middle;
	    width: 963px;
	    padding-right: 20px;
	    font-family: 'NotoSans-Medium', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    font-size: 20px;
	    color: #000;
	    line-height: 30px;
	    word-wrap: break-word;
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
	.viewType1 .prevNext > div {
	    padding: 22px 30px;
	}
	.viewType1 .prevNext > div > a {
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
	    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
	}
	a {
	    text-decoration: none;
	    color: #555;
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
	.notice_policyDiv {
	    width: 100%;
	    margin: 0 auto;
	}
	
	.notice_policyDiv table {
	    border-top: 2px solid #000;
	    margin-top: 20px;
	    width: 100%;
	}
	
	.notice_policyDiv table th {
	    font-size: 16px;
	    color: #333;
	    background: #f8f8f8;
	    line-height: 60px;
	    border-right: 1px solid #e1e1e1;
	    border-bottom: 1px solid #e1e1e1;
	    text-align: center;
	}
	
	.notice_policyDiv table td {
	    padding: 16px 14px;
	    font-size: 14px;
	    text-align: left;
	    line-height: 1.4;
	    border-right: 1px solid #e1e1e1;
	    border-bottom: 1px solid #e1e1e1;
	}
	
	.notice_policyDiv table th:last-child,
	.notice_policyDiv table td:last-child {
	    border-right: 0;
	}
	
	.notice_policyDiv table td.fBold {
	    color: #333;
	    text-align: center;
	}
	
	.notice_policyDiv .taC td {
	    text-align: center;
	}
	
	.notice_policyTxt h3 {
	    text-align: center;
	    font-size: 50px;
	    font-weight: bold;
	    line-height: 1;
	    color: #000;
	}
	
	.notice_policyTxt p {
	    text-align: center;
	    font-size: 16px;
	    margin-top: 20px;
	    color: #000;
	}
	
	.modifi {
	    color: #550adf !important;
	}
	
	.bPurpleBtn.inTd {
	    height: 30px;
	    padding: 0 20px;
	    line-height: 30px;
	    font-size: 15px;
	
	}
	
	.tableWrap {
	    overflow-x: auto;
	    width: 100%;
	}
	
	.symbol {
	    position: relative;
	}
	
	.symbol span {
	    display: none;
	
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
	.viewType1 .prevNext > div {
	    padding: 22px 30px;
	}
	.viewType1 .prevNext > div > a {
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
	.bPurpleBtn {
	    display: inline-block;
	    padding: 0 68px;
	    height: 52px;
	    line-height: 50px;
	    font-size: 18px;
	    font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    color: #550adf;
	    text-align: center;
	    border: 2px solid #550adf;
	    border-radius: 30px;
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
		table.priceTable{
		border-top: 2px solid #000;
		border-bottom: 1px solid #e1e1e1;
		width: 100%;
		display: table;
		box-sizing: border-box;
		background-color: white;
		padding:0; border-spacing:0px; border-collapse:collapse;
		font-family: &#39;NotoSans-Light&#39;, &#39;맑은 고딕&#39;, &#39;Malgun Gothic&#39;, sans-serif;
		letter-spacing: -0.025em;
		font-size: 16px;
	}
	table.priceTable thead {
		background: #550adf;
		color: #fff;
	}
	table.priceTable tr th, td {
		text-align: center;
		padding: 10px 0px;
		font-size: 16px;
		color: #555;
		border-right: 1px solid #e1e1e1;
	}
	table.priceTable tr td:last-child{
		border-right: 0;
	}
	table.priceTable th{
		background: #f8f8f8;
		font-family: &#39;NotoSans-Bold&#39;, &#39;맑은 고딕&#39;, &#39;Malgun Gothic&#39;, sans-serif!important;
		color: #333;
		font-weight: bold;
	}
	table.priceTable th:last-child{
		border-right: 0;
	}
	table.priceTable tr {
		border-top: 1px solid #e1e1e1;
	}
	
	table.priceTable tbody tr th {
		background: #fff;
		color: #550adf;
		font-size: 16px;
		font-weight: bold;
	}
	.priceCh{color: #550adf!important; font-weight: bold!important;}

	ul, ol, li {
   	 	list-style: none;
	}
	</style>
</head>
<body>
	<div id = "wrapper">
		<div class= "Menu"></div>
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
		<div id = "cBody">
			<div class = "subWrap">
				<h2>공지사항</h2>
				<div class="container" data-type="view">
					<div class="viewType1">
						<div class="titArea">
						<% 
							for(int i =0; i<Detail.size(); i++){
						%>
							<div class="label">
								<p><%=Detail.get(i).getCategory() %></p>
							</div>
							<p class="tit" style="word-wrap: break-word;">
								<%=Detail.get(i).getTitle() %>
							</p>
							<p class="date">
								<%=Detail.get(i).getRegistrationdate() %>
							</p>
						<%
							}
						%>
						</div>
						<div id = "detail"></div>
						<div class="fileArea"></div>
						<div class="prevNext">
							<div class="prev">
							<%
								if(num==1){
							%>
									<span>이전글</span>
									<span>이전글이 없습니다.</span>	
							<%	
								}else{
									for(int i =0; i<Prev.size(); i++){
							%>
									<a href ="LotteController?command=NoticeDetail&num=<%=Prev.get(i).getBno()%>">
									<span>이전글</span>
									<span>
										<%=Prev.get(i).getTitle()%>
									</span>
							<%
									}
								}
							%>
								</a>
							</div>
							
							<div class="next">
							<%
								if(num==12){
							%>
									<span>다음글</span>
									<span>다음글이 없습니다.</span>
							<%
								}else{
									for(int i =0; i<Next.size(); i++){
										
							%>
								<a href ="LotteController?command=NoticeDetail&num=<%=Next.get(i).getBno()%>">
									<span>다음글</span>
									<span> 
										<%=Next.get(i).getTitle()%>
									</span>
								</a>
							</div>
							<%
									}
								}
							%>
							
							
						</div>
					</div>
					<div class="btnArea">
						<a href="LotteController?command=Notice" class="purpleBtn">목록</a>
					</div>
				</div>
			</div>
		</div>
	<div class= "Footer"></div>
	</div>
</body>
</html>