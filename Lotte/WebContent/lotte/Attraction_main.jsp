<%@page import="com.lotte.dto.Attraction_dto"%>
<%@page import="com.lotte.dao.AttractionDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어트랙션 메인페이지</title>

<%
	AttractionDao aDao = new AttractionDao();
	ArrayList<Attraction_dto> list = aDao.Attraction_main_dao();
	int tall = 0;
	
	ArrayList<Attraction_dto> mainList = (ArrayList<Attraction_dto>)request.getAttribute("list1");
	ArrayList<Attraction_dto> alist = (ArrayList<Attraction_dto>)request.getAttribute("list"); // 조건검색 list
	
	String where = (String)request.getAttribute("where");
	String age = (String)request.getAttribute("age");
	String parent = (String)request.getAttribute("parent");
	
	if(request.getAttribute("tall") != null){
		tall = (Integer)request.getAttribute("tall");
	}
	
%>
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
 		.bottom a:hover, .bottom a:focus {
		    box-shadow: 15px 15px 20px 0 rgb(0 0 0 / 20%);
		}
		.bottom a:hover {
			background-color : #6217EC;
			text-decoration: none;
			color : white;
		}
		.bottom a:not(:hover) {
			color: #000;
		}		
		.bottom a:link {
			text-decoration: none;
		}
		#body .bottom img {
			border : none;
			vertical-align : top;
			color : #555;
			position : relative;
			width: 274px;
			height: 245px;
		}
		.name {
			 font-size: 19px;
			 font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
			 font-size: 22px;
			 line-height: 1.4;
			 display: block;
			 margin: 0;
			 padding : 27px 25px 30px 25px;
			 width: 173px;
			 height : 54px;
			 text-decoration : none;
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
			background: rgba(0,0,0,0.5);
			border-radius: 2px;
			z-index : 1;
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
		.bottom a:nth-of-type(1), .bottom a:nth-of-type(2), .bottom a:nth-of-type(3), .bottom a:nth-of-type(4) {
			margin-top: 0px !important; 
		}
		.blockList:after {
		    content: '';
		    display: block;
		    clear: both;
		}
		.sub {
			position : relative;
			max-height: 246px;
    		overflow: hidden;
    		display : block;
    		    top: -1px;
   		    width: 275px; 
		}
		.sub > img {
			width: 275px;
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
		div {
	    	display: block;
		}
		* {
			margin : 0;
			padding : 0;
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
		.top {
		    height: 480px;
		    background: url(https://adventure.lotteworld.com/common/images/icon/attraction_bg1.jpg) no-repeat 50% 0;
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
		    background: url(https://adventure.lotteworld.com/common/images/btn/w_home_btn.png) no-repeat 0 50%;
		    border-color: rgba(255,255,255,0.3);
		}
		.topsub .topsubIn .home {
		    float: left;
		    display: block;
		    width: 36px;
		    height: 30px;
		    border-right: 1px solid #e1e1e1;
		}
		.topsub .topsubIn > div.one {
		    margin-left: 26px;
		}
		.topsub .topsubIn > div {
		    float: left;
		    position: relative;
		    margin-left: 20px;
		}
		.top .topsub .topsubIn > div > a {
		    color: #fff;
		    background: url(https://adventure.lotteworld.com/common/images/icon/w_lnb_icon.png) no-repeat right 0 top 50%;
		    text-decoration : none;
		}
		.topsub .topsubIn > div > a {
		    display: block;
		    padding-right: 42px;
		    height: 30px;
		    font-size: 16px;
		    line-height: 28px;
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
		.moremenu{
			width : 101.797px;
			padding : 25px 25px;
			display : none;
		}
		.moremenulist {
			text-decoration : none;
			color : #555;
			display : block;
			font-size : 16px;
			white-space: nowrap;
	    	margin-top: 17px;
		}
		.moremenulist2 {
			text-decoration : none;
			color : #555;
			display : block;
			font-size : 16px;
			white-space: nowrap;
	    	margin-top: 17px;
		}
		.middle {
			color : #fff !important;
		}
		h2 {
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    font-size: 50px;
		    text-align: center;
		    display: block;
		    font-weight: bold;
		    margin-top : 0px;
		    margin-bottom : 0px;
		}
		h2.middle{
			padding-top : 90px;
		}
		.middlesub{
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
			position : relative;
			width: 1171px;
			margin : 0 auto;
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
			position : absolute;
		    width: 100%;
		    height: 100%;
		    text-align: center;
		    box-shadow: 5px 10px 70px rgb(0 0 0 / 40%);
		    background: rgb(111, 35, 249);
		    background: -ms-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -o-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -moz-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: -webkit-linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
		}
		.centertext {
			display: inline-block;
		    vertical-align: top;
		    padding-left: 50px;
		    height: 100%;
		    font-size: 20px;
		    color: #fff;
		    line-height: 90px;
		    background: url(https://adventure.lotteworld.com/common/images/btn/srch_btn2.png) no-repeat 0 50%;
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
		.fl {
			float:left;
		}
		#search2 {
			display:none;
			position: relative;
			top: -44px;
			height: 426px;
			background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
   			box-shadow: 5px 10px 70px rgb(0 0 0 / 40%);
		}
		#search2 > div.center2 {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			box-shadow: 5px 10px 70px rgb(0 0 0 / 40%);
			background: url("https://adventure.lotteworld.com/common/images/icon/srch_open_bg.jpg") no-repeat 100% 100%;
			background-size: cover;					
		}	
		#search2 > div > a {
			position: absolute;
			top:25px;
			right:25px;
		}
		#search2 > div > a > img {
			width:24px;
			height:24px;
		}
		#search2 #openDivTitle {
   			text-align: center;
			position: absolute;
			width: 100%;
			top: 15px;
		}
		#search2 #openDivTitle p {
		    font-size: 27px;
   			color: #fcdb05;
   			padding-top: 36px;
		}
		#openDivTitle p span {
			font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif !important;
		}
		#search2 #openDivList {
			position:absolute;
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
		    box-shadow: 5px 10px 70px rgb(0 0 0 / 20%);
		    border-radius: 25px;
			z-index: 11;
		}
		.openSelect3 {
			position: relative;
		    width: 250px;
		    height: 50px;
		    background: #fff;
		    box-shadow: 5px 10px 70px rgb(0 0 0 / 20%);
		    border-radius: 25px;
			z-index: 11;
		}
					.openSelect2 {
						position: relative;
					    width: 250px;
					    height: 50px;
					    background: #fff;
					    box-shadow: 5px 10px 70px rgb(0 0 0 / 20%);
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
					    background: url("https://adventure.lotteworld.com/common/images/icon/srch_sel_icon2.png") no-repeat 0 0;
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
					    background: url(https://adventure.lotteworld.com/common/images/icon/srch_chk_icon.png) no-repeat 0 0;
					}
					#body .on:after {
						content: '';
					    position: absolute;
					    top: 50%;
					    right: 10px;
					    margin-top: -15px;
					    width: 30px;
					    height: 30px;
					    background: url(https://adventure.lotteworld.com/common/images/icon/srch_chk_icon_on.png) no-repeat 0 0;
					}
					.openSelect > a {
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
					.openSelect3 input {
						text-align: right;
						box-sizing: border-box;
					    padding: 0 60px 0 30px;
					    width: 100%;
					    height: 100%;
					    border-radius: 25px;
					    background: #fff;
					    color: #550adf;
					    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
					    font-size: 16px;
					    letter-spacing: -0.6px;
					    border: 1px solid #e1e1e1;
					    vertical-align: middle;
					}
					.openSelect3 p {
						position: absolute;
					    right: 0;
					    top: 15px;
					    right: 30px;
					    color: #550adf;
					}
					.openSelect2 > a {
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
						text-align:center;
					}
					#openDivList div.fl > span {
						font-size: 18px;
						height: 18px;
						line-height: 18px;
					    color: #fff;
					    margin-bottom: 20px;
					    display:inline-block;
						letter-spacing: -0.6px;
					}
					#openDivButton {
						margin-top:100px;
						height:50px;
					    position: relative;
    					top: 225px;
					}
					#openDivButton > div {
						width:230px;
						height:50px;
						margin:0 auto;
					}
					#openDivButton > div > div:first-child > button {
						width: 168px;
					    height: 48px;
					    line-height: 48px;
					    font-size: 18px;
					    color: #fff;
					    border: 1px solid #fff;
					    border-radius: 25px;			
					}
					#openDivButton > div > div > button {
					    background: transparent;	
					    border: none;	
					}
					#openDivButton > div > div:nth-child(2) {
						margin-top: -4px;
					}
					#openDivButton > div > div:nth-child(2) > button > img {
						width:50px;
						height:50px;
					}
					.btnClose {
						z-index: 11;
					}
					.listshow {
						display: none;
						position: absolute;
						left: 54px;
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
						left: 324px;
						top: 1px;
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
						#bg_trans {
			display:none;
			position:absolute;
			top:0;
			left:0;
			right:0;
			bottom:0;
			width:100%;
			height:100%;
			background-color:transparent;
			z-index:11;
		}
		.listshow {
			z-index:12;
		}
		
		a {
			text-decoration: none;
			color: #555;
		}
		#wrapper {
		    position: relative;
		    width: 100%;
		    overflow: hidden;
		}
		.openSelect3 input[type="text"].cm {
			width: 250px;
		}
		.send {
			cursor: pointer;
		}
		.searchTextWrap {
			padding-left: 0px;
		    display: inline-block;
		    height: 100%;
		}
		.searchText {
			float: left;
		    padding: 20px 0;
		    overflow: hidden;
		    margin-left: 30px;
		}
		.searchText:nth-of-type(1) {
			margin-left: -77px;
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
		.valuetext1 {
			position: relative;
		    float: left;
		    border: 1px solid #fff;
		    height: 48px;
		    line-height: 46px;
		    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
		    font-size: 16px;
		    color: #fff;
		    text-align: center;
		    border-radius: 25px;
		    margin-left: 20px;
		    padding-right: 20px;
    		width: 154px;
    		font-weight: bold;
		}
		.valuetext1:after {
			content: 'cm';
		    position: absolute;
		    right: 20px;
		    top: 0;
		    color: #fff;
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
		.valuetext2 {
			width: 128px;
		    padding-right: 39px;
		    border: 1px solid #8854e9;
		    color: #8854e9;
		    background: url(https://adventure.lotteworld.com/common/images/icon/srch_open_chk_icon.png) no-repeat right 9px top 50%;
		}
		.valuetext22 {
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
		.valuetext22 {
			width: 128px;
		    padding-right: 39px;
		    border: 1px solid #fff;
		    color: #fff;
		    background: url(https://adventure.lotteworld.com/common/images/icon/srch_open_chk_icon_on.png) no-repeat right 9px top 50%;
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
</style>
<script>
	var cnt = 0;
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
				$(".locationList").css('font-family','Notosans-Light');
				$(this).css('font-family','Notosans-Bold');
				$("#bg_trans").css('display', 'none');
				$(".listshow").css('display', 'none');
			});
			$(".menuList").click(function() {
				var select = $(this).text();
				$(".menubox").text(select);
				$(".menuList").css('font-family','Notosans-Light');
				$(this).css('font-family','Notosans-Bold');
				$("#bg_trans").css('display', 'none');
				$(".listshow2").css('display', 'none');
			});
			$(".groupmeal").click(function() {
				$("#bg_trans").css('display', 'none');
				$(".listshow").css('display', 'none');
				$(".listshow2").css('display', 'none');
			});
		
			$(".center").click(function() {
				$(this).css('display','none');
				$("#search2").css('display','block');
			});
			$("#search2 .btnClose").click(function() {
				$("#search2").css('display','none');
				$(".center:nth-of-type(1)").css('display','block');
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
			
			$(".send").click(function() {
				var where = $(".locationbox").text();
				var age = $(".menubox").text();
				if($(".cm").val() != "") {
					var cm = $(".cm").val();
				} else if($(".cm").val() == ""){
					var cm = 0;
				}
				if($(".openSelect2").attr("class") == 'openSelect2'){
					var parent = 'n';
				} else if($(".openSelect2").attr("class") == 'openSelect2 on'){
					var parent = 'y';
				}
				location.href="LotteController?command=AttractionSearch&where="+where+"&age="+age+"&cm="+cm+"&parent="+parent;
			});
			
			$(".one1").click(function() {
				var name = $(this).find(".name").text();
				location.href = "LotteController?command=detailAttraction&name="+name;
			});
			
			$(".menu").load("lotte/Menu.jsp");
			$(".footer").load("lotte/Footer.html");
		});
	</script>
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
							<a class="second" href="javascript:void(0)" onclick="view2()">어트랙션</a>
							<div class="moremenu2" style="z-index : 15; display : none;">
								<a href="LotteController?command=Attraction" class="moremenulist2" style="margin-top : 0px;">어트랙션</a>
	 							<a href="LotteController?command=Festival" class="moremenulist2">페스티벌</a>
								<a href="LotteController?command=ShowMain" class="moremenulist2">공연</a>
								<a href="LotteController?command=Restaurant" class="moremenulist2">다이닝/쇼핑</a>
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
				</div> 
<!------------------------------------- topsub ------------------------------------------------------------------------------------------------>
				<h2 class="middle">어트랙션</h2>
				<p class="middlesub">언제나 새롭고 즐거운 경험을 주는 롯데월드 어트랙션을 소개합니다!</p>
			</div> <!-- top -->
			<div class="centerbottom">
				<%
					if(alist == null){
				%>
				<div class="center">
					<a class="centerbox">
						<span class="centertext">조건검색</span>
					</a>
				</div> <!-- center -->
				<%
					} else if(alist != null){
				%>
				<div class="center" style="display: block;">
						<a class="centerbox">
							<div class= "searchTextWrap">
							<div class="searchText">
								<span class="centertext1">위치</span>
								<span class="valuetext"><%=where%></span>
							</div>
							<div class="searchText">
								<span class="centertext1">나이</span>
								<span class="valuetext"><%=age%></span>
							</div>
							<div class="searchText">
								<span class="centertext1">키</span>
								<%
									if(tall == 0){
								%>
								<span class="valuetext1" id="groupmealText"></span>
								<%
								} else {
								%>
								<span class="valuetext1" id="groupmealText"><%=tall%></span>
								<%
								}
								%>	
							</div>
							<div class="searchText">
								<span class="centertext1">보호자</span>
								<%
									if(parent.equals("n")){
								%>
								<span class="valuetext2" id="groupmealText">보호자 탑승</span>
								<%
									} else if(parent.equals("y")){
								%>
								<span class="valuetext22" id="groupmealText">보호자 탑승</span>
								<%
									}
								%>
							</div>
							</div>
							<a class="searchBtn">
								<img src="https://adventure.lotteworld.com/common/images/btn/srch_btn2.png"/>
							</a>
							<a class="resetBtn" href="#" onClick="javascript:location.href='LotteController?command=Attraction'">
								<img src="https://adventure.lotteworld.com/common/images/btn/srch_reset2.png"/>
							</a>
						</a>
				</div>
				<%
					}
				%>
				<div id="search2">
					<div class="center2">
						<a class="btnClose">
							<img src="https://adventure.lotteworld.com/common/images/btn/srch_close.png" alt="닫기"/>
						</a>
						<div id="openDivTitle">
							<p><span>나에게 맞는</span> 어트랙션을 찾아보세요!</p>
						</div>
						<div id="openDivList">
							<div style="margin-left: 56px; width:1060px;">
								<div class="fl" style="margin-right:20px;">
									<span>위치</span>
									<div class="openSelect"><a class="locationbox" href="javascript:void(0)">전체</a></div>
									<div class="listshow">
										<a class="locationList" href="javascript:void(0)">전체</a>
										<a class="locationList" href="javascript:void(0)">어드벤처 1층</a>
										<a class="locationList" href="javascript:void(0)">어드벤처 2층</a>
										<a class="locationList" href="javascript:void(0)">어드벤처 3층</a>
										<a class="locationList" href="javascript:void(0)">어드벤처 4층</a>
										<a class="locationList" href="javascript:void(0)">매직아일랜드</a>
										<a class="locationList" href="javascript:void(0)">언더랜드 B1층</a>
										<a class="locationList" href="javascript:void(0)">키디존</a>
										<a class="locationList" href="javascript:void(0)">파크 외 1층</a>
										<a class="locationList" href="javascript:void(0)">파크 외 B3층</a>
									</div>
								</div>
								<div class="fl" style="margin-right:20px;">
									<span>나이</span>
									<div class="openSelect"><a class="menubox" href="javascript:void(0)">전체</a></div>
									<div class="listshow2">
										<a class="menuList" href="javascript:void(0)">0~4세</a>
										<a class="menuList" href="javascript:void(0)">5~64세</a>
										<a class="menuList" href="javascript:void(0)">65세 이상</a>
									</div>
								</div>
								<div class="fl" style="margin-right:20px;">
									<span>키</span>
									<!-- <div class="openSelect"><a class="menubox" href="javascript:void(0)">전체</a></div> -->
									<div class="openSelect3"><input class="cm" type="text" /><p>cm</p></div>
									
								</div>
								<div class="fl">
									<span>보호자</span>
									<div class="openSelect2"><a class="groupmeal" style="z-index: 11;" href="javascript:void(0)">보호자 탑승</a></div>
								</div>
								<div style="clear:both;"></div>
							</div>
						</div>
						<div id="openDivButton" style="z-index:12;">
							<div>
								<div class="fl" style="width:170px; height:50px; margin-right:10px;"><button class="send" type="button">조회하기</button></div>
								<div class="fl" style="width:50px; height:50px;"><button onclick="window.location.reload()" type="button"><img src="https://adventure.lotteworld.com/common/images/btn/srch_reset.png"/></button></div>
								<div style="clear:both;"></div>
							</div>
						</div>	
					</div> <!-- center2 -->
				</div>
				<div class="bottom">
					<!-- <div class = "blockList"> -->
					<%
					if(alist == null){
						for(int i =0; i<= mainList.size()-1; i++){	
					%>	
						<a class ='one1' href ='javascript:void(0)' style="margin-bottom:20px;">
							<div class ='sub'><img src ='IMAGES4/<%=mainList.get(i).getPictureurl()%>'/>
								<span class ="label"><%=mainList.get(i).getSearch()%></span>
							</div>
							<div class ="name">
								<strong><%=mainList.get(i).getName()%></strong>
							</div>
						</a>
					<%
						} // for
					} else if(alist != null){
						if(alist.size()!=0){
							for(int i = 0; i <= alist.size()-1; i++){	
					%>	
						<a class ='one1' href ='javascript:void(0)' style="margin-bottom:20px;">
							<div class ='sub'><img src ='IMAGES4/<%=alist.get(i).getPictureurl()%>'/>
								<span class ="label"><%=alist.get(i).getSearch()%></span>
							</div>
							<div class ="name">
								<strong><%=alist.get(i).getName()%></strong>
							</div>
						</a>
					<%
							} // for
						}else  if(alist.size()==0){
					%>
						<div class='noData'>
							<p class='noDataText'>검색된 어트랙션이 없습니다.</p>
						</div>
					<%
						}
					}
					%>
				</div> <!-- bottom -->
			</div> <!-- centerbottom -->
		</div> <!-- wrap -->
	</div> <!-- body -->
<!----------------------------------------------------  footer---------------------------------------------------------------------------------------------------------------->
	<div class="footer"></div>
	</div>
</body>
</html>