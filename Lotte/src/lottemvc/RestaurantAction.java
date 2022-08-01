package lottemvc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.RestaurantDao;
import com.lotte.dto.RestaurantDto;

public class RestaurantAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RestaurantDao dao = new RestaurantDao();
		ArrayList<RestaurantDto> list = null;
		
		try {
			list = dao.RestaurantMain();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("lotte/Restaurant.jsp").forward(request, response);
	}

}
