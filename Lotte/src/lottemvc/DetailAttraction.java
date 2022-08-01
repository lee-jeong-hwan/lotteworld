package lottemvc;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.AttractionDao;
import com.lotte.dto.Attraction_dto;

public class DetailAttraction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		AttractionDao dao = new AttractionDao();
		Attraction_dto dto = null;
		
		try {
			dto = dao.attractionDetail(name);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("lotte/attraction_detail.jsp").forward(request, response);
		
	}

}
