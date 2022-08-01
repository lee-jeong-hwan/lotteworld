package ajax;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lotte.dao.DBC;
import com.lotte.dto.MemberDto;


@WebServlet("/IDfind_email")
public class IDfind_email extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Connection conn = DBC.getConnection();
		String sql = "select count(*) from member where name = ? and email = ?";

		int n = 0;
		MemberDto dto = null;
		PreparedStatement pstmt;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,email);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				n = rs.getInt(1);
				if(n==1) {
					String sql2 = "select * from member where name = ?";
					PreparedStatement pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, name);
					ResultSet rs2 = pstmt2.executeQuery();
					while(rs2.next()) {
						dto = new MemberDto();
						dto.setEmail(rs2.getString("email"));
					}
						
				}
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		obj.put("result", dto.getEmail());
		
		
		out.println(obj);
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
