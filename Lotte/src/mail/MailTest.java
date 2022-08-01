package mail;


import java.util.Date;
import java.util.Properties;
import java.util.Scanner;
import java.util.logging.Logger;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class MailTest {
	
	public int Email(String urlEmail) {
		int checknumber = ( int)(Math.random()*899999+100000);//인증번호4자리 난수발생 1000~9999
    	
        Properties p = System.getProperties(); //p말고도 prop으로도 쓴다.
        p.put("mail.smtp.starttls.enable", "true");     // gmail은 true 고정 (로그인시 TLS를 사용할것인지 설정 
        p.put("mail.smtp.host", "smtp.naver.com");      // smtp 서버 주소 (이메일 발송을 처리해줄 smtp서버) 
        p.put("mail.smtp.auth","true");                 // gmail은 true 고정
        p.put("mail.smtp.port", "587");                 // 네이버 포트 TLS포트번호 587
           
        Authenticator auth = new MyAuthentication();
        //session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
        String email = null;
        try{   	
            msg.setSentDate(new Date());   //편지보낸시간
            InternetAddress from = new InternetAddress() ;//수신자의 메일을 생성
            from = new InternetAddress("dongi1212@naver.com","롯데월드"); //발신자 아이디 (맨밑에 적은 아이디랑 같은 아이디)
            							//발신자아이디 , 발신자명
            // 이메일 발신자
            msg.setFrom(from);
            // 이메일 수신자
            email = urlEmail;
            
            InternetAddress to = new InternetAddress(""+email+"");//수신자 아이디 
            msg.setRecipient(Message.RecipientType.TO, to);
            
           
            msg.setSubject("롯데월드 인증메일", "UTF-8"); // 이메일 제목
           
            msg.setText("인증번호 : " + checknumber + "", "UTF-8"); // 이메일 내용
            
            // 이메일 헤더
            msg.setHeader("content-Type", "text/html");
            //메일보내기
            javax.mail.Transport.send(msg, msg.getAllRecipients());
            	System.out.println("메일이 발송되었습니다!");
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {//메일계정인증 관련 예외처리
            msg_e.printStackTrace();
        }catch (Exception msg_e) {
            msg_e.printStackTrace();
        }
     
        return checknumber;
	}
}
class MyAuthentication extends Authenticator {
      
    PasswordAuthentication pa;
    public MyAuthentication(){
         
        String id = "dongi1212@naver.com";  //네이버 이메일 아이디
        String pw = "gozldgkwlaktlqkf";       //네이버 비밀번호 이거적어야 메일발송됨.(컨트롤센터)
 
        // ID와 비밀번호를 입력한다.
       
        pa = new PasswordAuthentication(id, pw);
    }
 
    // 시스템에서 사용하는 인증정보
    public PasswordAuthentication getPasswordAuthentication() {
    	
        return pa;
	}
	
} 
  