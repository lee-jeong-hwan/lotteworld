package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import mail.MailTest;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url ="jdbc:oracle:thin:@192.168.1.14:1521:xe"; 
		String dbId = "lotte"; 
		String dbPw = "7!7!7!7!";
		
		int n = 0;
		Connection conn = null; 
		
		try { 
			Class.forName(driver); 
			conn = DriverManager.getConnection(url, dbId, dbPw);
			
			String sql = "select count(*) from member where email=? and pw = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()){ 
				n = rs.getInt(1);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		response.setContentType("application/json");
		
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		obj.put("Loginchk", n);
		
		if(n==0) {
			obj.put("Loginchk",n);
		}
		
		out.println(obj);

	}
}
