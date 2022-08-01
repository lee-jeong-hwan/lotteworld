package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.lotte.dao.DBC;
import com.lotte.dto.RestaurantDto;

@WebServlet("/RestaurantServlet")
public class RestaurantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pagenum = Integer.parseInt(request.getParameter("page"));
		int startnum = pagenum * 12 - 11;
		int endnum = pagenum * 12;
		
		Connection conn = DBC.getConnection();
		
		ArrayList<RestaurantDto> list = new ArrayList<RestaurantDto>();
		
		String sql = "select *"
				+ " from (select rownum rnum, s1.*"
				+ " from (SELECT * FROM restaurant ORDER BY name DESC) s1) s2"
				+ " where rnum>=? and rnum<=?";
		
		PreparedStatement pstmt;
		RestaurantDto dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startnum);
			pstmt.setInt(2, endnum);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new RestaurantDto();
				dto.setName(rs.getString("name"));
				dto.setMainurl(rs.getString("mainurl"));
				dto.setLocation(rs.getString("location"));
				list.add(dto);
			}
			pstmt.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONArray array = new JSONArray();
		
		for(RestaurantDto dto1 : list) {
			JSONObject obj = new JSONObject();
			
			obj.put("name", dto1.getName());
			obj.put("mainurl", dto1.getMainurl());
			obj.put("location", dto1.getLocation());
			
			array.add(obj);
		}
		out.println(array);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
