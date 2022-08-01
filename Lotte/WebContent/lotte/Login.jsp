<%@page import="ajax.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 롯데월드 어드벤처</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		
		$("#btn_lgn").click(function(){
			if($("#loginid").val()==''){
				alert("아이디를 입력해주세요.");
			}else if($("#pw").val()==''){
				alert("비밀번호를 입력해주세요.");
			}else{
				var email = $("#loginid").val();
				var pw = $("#pw").val();
				var form = $("#login_frm").serialize();
				
				//자바스크립트내에서 form을 만들어서 post방식으로 보내는법.
				function send_post(path, command, email, pw) {
				       var form = document.createElement("form");
				       form.setAttribute("method", "post");
				       form.setAttribute("action", path);
				
				       var hiddenField = document.createElement("input");
				       hiddenField.setAttribute("type", "hidden");
				       hiddenField.setAttribute("name", "command");
				       hiddenField.setAttribute("value", command);
				       form.appendChild(hiddenField);
				
				       hiddenField = document.createElement("input");
				       hiddenField.setAttribute("type", "hidden");
				       hiddenField.setAttribute("name", "email");
				       hiddenField.setAttribute("value", email);
				       form.appendChild(hiddenField);
				
				       hiddenField = document.createElement("input");
				       hiddenField.setAttribute("type", "hidden");
				       hiddenField.setAttribute("name", "pw");
				       hiddenField.setAttribute("value", pw);
				       form.appendChild(hiddenField);
				
				       document.body.appendChild(form);
				       form.submit();
				   }

				  $.ajax({
					type: "post",
					url: "Login",
					data: form,
					datatype: "json",
					success : function(data){//얘가 서블렛에서 보내주는 값
					 	if(data.Loginchk == 1){
							//post방식으로 파라미터를 넘기고싶다...ㅎㅎㅎㅎㅎㅎㅎㅎㅎ
							send_post("LotteController", "LoginCheck", email);
						} else {
							alert("아이디, 비밀번호가 일치하지 않습니다. ")
							$("#pw").val('');
						}
					},
					error : function(r,s,e){
						alert("에러");
					}
				}); 
			}
		});
		
		
		 var key = getCookie("key");
	    $("#loginid").val(key); 
	     
	    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	    if($("#loginid").val() != ""){ 
	        $("#idsave").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idsave").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idsave").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#loginid").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#loginid").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idsave").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#loginid").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });

		// 쿠키 저장하기 
		// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
		function setCookie(cookieName, value, exdays) {
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value)
					+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
			document.cookie = cookieName + "=" + cookieValue;
		}
	
		// 쿠키 삭제
		function deleteCookie(cookieName) {
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires="
					+ expireDate.toGMTString();
		}
	     
		// 쿠키 가져오기
		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if (start != -1) { // 쿠키가 존재하면
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
					end = cookieData.length;
	                console.log("end위치  : " + end);
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		} 
		
		$(".Menu").load("lotte/Menu.jsp");
		$(".Footer").load("lotte/Footer.html");
		
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
	* {
  	  margin: 0;
  	  padding: 0;
	}
	h2 {
	    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    font-size: 50px;
	    color: #000;
	    text-align: center;
	    padding-top: 40px;
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
	.container {
	    position: relative;
	    width: 1170px;
	    margin: 0 auto;
	
	}
	input {
    padding: 3px 10px;
    height: 32px;
	}
	.loginDiv {
    margin-top: 80px;
    padding-top: 80px;
    border-top: 1px solid #e1e1e1;
	}
	.loginDiv .txt1 {
    font-size: 18px;
    color: #000;
    text-align: center;
	}
	.loginDiv .txt1 img {
    margin-right: 15px;
    }
    .loginDiv .formDiv {
    margin: 50px auto 0;
    width: 562px;
	}
	.loginDiv .formDiv p:first-child input[type="text"] {
    border-bottom: 0;
	}
	.loginDiv .formDiv input[type="text"] {
	    width: calc(100% - 62px);
	    height: 18px;
	    padding: 30px;
	}
	input[type="text"] {
	    width: 278px;
	    background: #fff;
	    -webkit-appearance: none;
	    -webkit-box-shadow: none;
	    -moz-box-shadow: none;
	    box-shadow: none;
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
	input::placeholder {
  		color:#cfcfcf;
	}
	.loginDiv .formDiv input[type="password"] {
	    width: calc(100% - 62px);
	    height: 18px;
	    padding: 30px;
	}
	input[type="password"] {
	    height: 40px;
	    border: 1px solid #e1e1e1;
	    color: #999;
	    background: #fff;
	    -webkit-appearance: none;
	    -webkit-box-shadow: none;
	    -moz-box-shadow: none;
	    box-shadow: none;
	}
	.loginDiv .formDiv .loginUtil {
	    margin-top: 22px;
	}
	.loginDiv .formDiv .loginUtil .check {
	    float: left;
	    font-size: 16px;
	    margin-top: 0;
	}
	.check {
	    text-align: right;
	    margin-top: 18px;
	}
.check input[type="checkbox"]:checked {
    background: url(Img/check_icon_on.gif) no-repeat 0 0;
}
	.check input[type="checkbox"] {
	display: inline-block;
	width: 20px;
	height: 20px;
	vertical-align: middle;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 0;
	border: 0;
	margin: 0;
	margin-right: 5px;
	padding: 0;
	cursor: pointer;
	background: url(Img/check_icon.gif) no-repeat 0 0;
}
	
	.check label {
	    font-size: 16px;
	    line-height: 20px;
	    font-family: 'NotoSans-Light', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    color: #555;
	    vertical-align: middle;
	}
	input[type="radio"], input[type="checkbox"] {
	    border: 0;
	    padding: 0;
	    height: auto;
	    -webkit-box-shadow: none;
	    -moz-box-shadow: none;
	    box-shadow: none;
	}
	.loginDiv .formDiv .loginUtil .findArea {
	    float: right;
	}
	.loginDiv .formDiv .loginUtil .findArea a {
	    font-size: 16px;
	    line-height: 24px;
	}
	.loginDiv .formDiv .loginUtil .findArea a:first-child:after {
	    content: "";
	    display: inline-block;
	    vertical-align: middle;
	    width: 1px;
	    height: 15px;
	    background: #e1e1e1;
	    margin: 0 15px;
	}
	a {
	    text-decoration: none;
	    color: #555;
	}
	.loginDiv .formDiv .loginUtil:after {
	    content: "";
	    display: block;
	    clear: both;
	}
	a{
		text-decoration: none;
	}
	.loginDiv .btnArea {
    	margin-top: 45px;
	} 
	.btnArea {
	    text-align: center;
	    margin-top: 60px;
	}
	
	.loginDiv .btnArea .purpleBtn {
   		padding: 0 130px;
	}		
	.purpleBtn {
	    display: inline-block;
	    padding: 0 70px;
	    height: 66.58px;
	    line-height: 67px;
	    font-size: 18px;
	    color: #fff;
	    text-align: center;
	     border-radius: 4px; 
	    background: linear-gradient(to bottom right, rgba(111,35,249,1) 0%, rgba(85,10,223,1) 100%);
	}
	.loginDiv .grayBox {
	    width: 420px;
	    padding: 40px 70px;
	    margin: 200px auto 0;
	    border: 1px solid #e1e1e1;
	    background: #f6f6f6;
	    text-align: center;
	}	
	.loginDiv .grayBox p {
	    font-size: 16px;
	    line-height: 26px;
	}
		
	.loginDiv .grayBox p span {
	    font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;
	    color: #009bfa;
	}
	.loginDiv .grayBox p br {
	    display: none;
	}
	.loginDiv .grayBox .bBlueBtn {
	    display: inline-block;
	    height: 46px;
	    padding: 0 53px;
	    border: 2px solid #009bfa;
	    border-radius: 25px;
	    margin-top: 35px;
	    font-size: 18px;
	    color: #009bfa;
	    line-height: 44px;
	}
		.loginDiv .txt2 {
	    font-size: 16px;
	    line-height: 27px;
	    text-align: center;
	    margin-top: 35px;
	}
	.loginDiv .txt2 br {
	    display: none;
	}
	.loginDiv .txt2 span {
	    display: block;
	}
	#kakao{
	    width: 307.89px;
	    height: auto;
	    position: absolute;
	    top: 477px;
	    right: 432px;
	}
	#naver_id_login a img{
	    top: 556px;
	    width: 307.89px;
	    height: auto;
	    position: absolute;
	    right: 434px;
	}
/* footer*/
	#footer .container{
		padding:50px 0px 160px;

	}
	#footer .container .top{
		padding-bottom: 30px;
		border-bottom: 1px solid #e0e0e0;
		overflow: hidden;
	}
	#footer .container .top .links{
		float: left;
		overflow: hidden;
	}
	#footer .container .top .links a:first-child{
		margin-left: 0;
	}
	#footer .container .top .links a{
		float:left;
		display: inline-block;
		font-size: 16px;
		color: #333;
		line-height:30px;
		margin-left:20px;
	}
	#footer .container .top .sns{
		float: right;
		overflow: hidden;
	}
	#footer .container .top .sns a:first-child{
		margin-left: 0;
	}
	#footer .container .top .sns a{
		float: left;
		margin-left: 10px;
	}
	#footer .container .bottom{
		margin-top:30px;
		position: relative;
		height:83px;
	}
	.hotel{
		position:absolute;
		top:75px;
		right:0;
	}
	.hotel .pc-img{
		display: inline-block;
	}
	
	#footer .container .bottom .left{
		float: left;
	}
	#footer .container .bottom .left .logo{
		float: left;
		margin: 0px 0px 0px 0px;
	}
	#footer .container .bottom .left div{
		padding-left: 140px;
	}
	#footer .container .bottom .left div p:first-child{
		margin: 0;
	}
	#footer .container .bottom .left div p{
		font-size: 15px;
		color: #555;
		margin:10px 0px 0px 0px;
	}
	#footer .container .bottom .left div p span:first-child{
		margin-left: 0;
		padding-left: 0;
	}
	#footer .container .bottom .left div p span{
		display: inline-block;
		position: relative;
		margin-left: 11px;
		padding-left: 11px;
	}
	#footer .container .bottom .left div p.copyright{
		font-size: 13px;
		color: #777;
		margin-top: 30px;
	}
	#footer .container .bottom .isms{
		position: absolute;
		bottom: -70px;
		left: 140px;
	}
	#footer .container .bottom .isms a {
		display: block;
		padding-top: 3px;
		padding-left: 55px;
		height: 37px;
		background:url(Img/isms_icon.png) no-repeat 0 50%;
	}
	#footer .container .bottom .isms a > p{
		position: relative; 
		display: block;
		font-size: 12px;
		color: #333;
		line-height: 16px;
		margin:0px;
	}
	#footer .container .bottom .isms a > p span:first-child{
		position: relative;
		padding-right: 9px;
		margin-right: 6px;
	}
	#footer .container .bottom .isms a > p span:first-child:after {
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
	#footer .container .bottom .isms.newST{
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
	#footer .container .bottom .familySite > select {
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
	a{
		cursor:pointer;
	}
	subWrap {
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
	.lnbArea .shareArea {
	    float: right;
	}
	.lnbArea .shareArea .print {
	    float: left;
	    margin-left: 10px;
	}
	.lnbArea .shareArea .print a {
	    background: url(https://adventure.lotteworld.com/common/images/btn/print_btn.png) no-repeat 50% 50%;
	}
	.lnbArea .shareArea a {
	    display: block;
	    width: 50px;
	    height: 50px;
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
		<div id ="cBody">
			<div class= "subWrap">
				<div class="lnbArea">
					<div class="shareArea">
						<div class="print">
							<a href="javascript:" class="snsSharing" data-gb="print" data-type-gb="view"></a>
						</div>
					</div><!-- // shareArea -->
				</div>
				<h2>로그인</h2>
				<div class="container" >
					<form id="login_frm" name="login_frm" method="post" action = "LotteController?command=LoginCheck">
						<input type="hidden" name="returnurl" id="returnurl" value="http://adventure.lotteworld.com" title="리턴URL" class="notRequired">
						<input type="hidden" name="acesTkn" id="acesTkn">
						<input type="hidden" name="ssoTkn" id="ssoTkn">
					
						<div class="loginDiv">
							<p class="txt1"><img src="Img/login_lpoint.gif" alt="L.POINT">회원아이디와 비밀번호로 로그인하세요.</p>
							<div class="formDiv">
								<p><input type="text" placeholder="아이디" name="email" id="loginid" title="아이디" maxlength="30"></p>
								<p><input type="password" placeholder="비밀번호" class="notRequired" name="pw" id="pw" title="비밀번호" maxlength="30"></p>
								<div class="loginUtil">
									<p class="check"><input type="checkbox" id="idsave" name="idsave" title="아이디 저장" value="Y" class="notRequired"><label for="idsave">아이디 저장</label></p>
									<div class="findArea">
										<a href="LotteController?command=IDmissing">아이디 찾기</a>
										<a href="LotteController?command=PWmissing">비밀번호 찾기</a>
									</div>
								</div>
							</div>
							<p class="btnArea">
								<a class="purpleBtn" title="작성된 정보로 로그인 됩니다." id="btn_lgn">로그인</a>
							</p>
							<div class="grayBox">
								<p><span>L.POINT</span> 회원으로 가입하시면<br> 동일한 아이디와 비밀번호로 모든<br> <span>L.POINT</span> 사이트의 서비스를 안전하게<br> 이용하실 수 있습니다.</p>
								<a href="LotteController?command=Signup01" class="bBlueBtn" title="아이디와 패스워드가 없으시면 회원가입 버튼을 클릭하세요.">회원가입</a>
							</div>
							<p class="txt2">회원정보와 관련된 문의사항이 있으시면<br> 고객만족센터에 연락하세요.<span>고객만족센터 : 1899-8900</span></p>
							
							<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
							<!-- 네이버 로그인 버튼 노출 영역 -->
							<div id="naver_id_login"></div>
							<!-- //네이버 로그인 버튼 노출 영역 -->
							<!-- 네이버아디디로로그인 초기화 Script -->
							<script type="text/javascript">
								var naver_id_login = new naver_id_login("B_VcihxK7P1xVO6poL4s", "http://localhost:9090/Lotte/lotte/naver_callback.html");
								var state = naver_id_login.getUniqState();
								naver_id_login.setButton("green", 11,40);
								naver_id_login.setDomain(".service.com");
								naver_id_login.setState(state);
 								naver_id_login.setPopup();
								naver_id_login.init_naver_id_login();
							
							</script>
							<!-- // 네이버 로그인 초기화 Script -->
							<!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
							<script type="text/javascript">
								// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
							
							</script>
							
							<!-- 카카오 스크립트 -->
							<li onclick="kakaoLogin();">
						      <a href="javascript:void(0)">
						          <span ><img src=  "https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" id = "kakao"/></span>
						      </a>
							</li>
							<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
							<script>
							//카카오로그인
							  function kakaoLogin() {
								Kakao.init('60b605fba3c58a94fcaed25c7be294ac'); //발급받은 키 중 javascript키를 사용해준다.
							            window.Kakao.Auth.login({
							                scope: 'account_email, profile_nickname', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
							                success: function(response) {
							                    console.log(response) // 로그인 성공하면 받아오는 데이터
							                    window.Kakao.API.request({ // 사용자 정보 가져오기 
							                        url: '/v2/user/me',
							                        success: (res) => {
							                            const kakao_account = res.kakao_account;
							                            console.log(kakao_account);
							                       	    var email = (res.kakao_account.email);
							                       	 	location.href="LotteController?command=LoginCheck&email="+email;
							                        }
							                    });
							                   
							                },
							                fail: function(error) {
							                    console.log(error);
							                }
							            });
							        }
							</script>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class= "Footer"></div>
	</div>
</body>
</html>