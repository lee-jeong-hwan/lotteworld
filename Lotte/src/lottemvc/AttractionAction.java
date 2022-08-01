package lottemvc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.AttractionDao;
import com.lotte.dto.Attraction_dto;

public class AttractionAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		ArrayList<Attraction_dto> list = null;
		AttractionDao dao = new AttractionDao();
		
		try {
			list = dao.attractionMain();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("list1", list);
		request.getRequestDispatcher("lotte/Attraction_main.jsp").forward(request, response);
	}
	
}
