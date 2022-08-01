package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lotte.dao.DBC;

@WebServlet("/RegisterMember")
public class RegisterMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String news = request.getParameter("news");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		
		int result = 0;
		try {
			Connection conn = DBC.getConnection();
			
			String sql = "insert into member values(?,?,?,?,?,?)";
			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);		
			pstmt.setString(2,email);
			pstmt.setString(3,pw);
			pstmt.setString(4,news);
			pstmt.setString(5,phone);
			pstmt.setString(6,birth);
			pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.setContentType("application/json");
		
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		obj.put("result", result);
		
		if(result==0) {
			obj.put("result", result);
		}
		
		out.println(obj);
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
