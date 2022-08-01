package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.lotte.dao.RestaurantDao;
import com.lotte.dto.RestaurantDto;

@WebServlet("/RestaurantActionServlet")
public class RestaurantActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location = request.getParameter("location");
		String menu = request.getParameter("menu");
		String groupmeal = request.getParameter("groupmeal");
		RestaurantDao dao = new RestaurantDao();
		ArrayList<RestaurantDto> list = null;

		try {
			list = dao.restaurantSearch(location, menu, groupmeal);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONArray array = new JSONArray();
		
		for(RestaurantDto dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("name", dto.getName());
			obj.put("mainurl", dto.getMainurl());
			obj.put("location", dto.getLocation());
			array.add(obj);
		}
		out.println(array);
			
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	}

}
