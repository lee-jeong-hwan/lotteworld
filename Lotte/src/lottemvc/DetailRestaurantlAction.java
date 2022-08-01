package lottemvc;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.RestaurantDao;
import com.lotte.dto.RestaurantDto;

public class DetailRestaurantlAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		RestaurantDao dao = new RestaurantDao();
		RestaurantDto dto = null;
		try {
			dto = dao.restaurantDetail(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("lotte/DetailRestaurant.jsp").forward(request, response);
	}
	
}
