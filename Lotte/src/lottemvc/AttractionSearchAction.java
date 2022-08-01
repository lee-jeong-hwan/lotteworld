package lottemvc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.AttractionDao;
import com.lotte.dto.Attraction_dto;

public class AttractionSearchAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location = request.getParameter("where");
		String age = request.getParameter("age");
		int tall = Integer.parseInt(request.getParameter("cm"));
		String parent = request.getParameter("parent");
		
		AttractionDao dao = new AttractionDao();
		ArrayList<Attraction_dto> list = null;
		try {
			list = dao.attractionSearch(location, age, tall, parent);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("where", location);
		request.setAttribute("age", age);
		request.setAttribute("tall", tall);
		request.setAttribute("parent", parent);
		request.setAttribute("list", list);
		request.getRequestDispatcher("lotte/Attraction_main.jsp").forward(request, response);
	}

}
