package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
import com.lotte.dao.GiftshopDao;
import com.lotte.dto.GiftshopDto;

@WebServlet("/GiftShopActionServlet")
public class GiftShopActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location = request.getParameter("location");
		Connection conn = DBC.getConnection();

		ArrayList<GiftshopDto> list = new ArrayList<GiftshopDto>();
		GiftshopDao dao = new GiftshopDao();
		try {
			list = dao.searchGiftshop(location);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONArray array = new JSONArray();
		
		for(GiftshopDto dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("name", dto.getName());
			obj.put("location", dto.getLocation());
			obj.put("image2", dto.getImage2());
			
			array.add(obj);
		}
		out.println(array);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
