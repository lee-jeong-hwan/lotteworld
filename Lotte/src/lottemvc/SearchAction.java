package lottemvc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.SearchDao;
import com.lotte.dto.Attraction_dto;
import com.lotte.dto.GiftshopDto;
import com.lotte.dto.RestaurantDto;
import com.lotte.dto.ShowDto;

public class SearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("text");
		SearchDao dao = new SearchDao();
		ArrayList<Attraction_dto> alist = null;
		ArrayList<RestaurantDto> rlist = null;
		ArrayList<GiftshopDto> glist = null;
		ArrayList<ShowDto> slist = null;
		try {
			alist = dao.searchAttraction(search);
			rlist = dao.searchRestaurant(search);
			glist = dao.searchGiftshop(search);
			slist = dao.finalSearchShow(search);			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("search", search);
		request.setAttribute("alist", alist);
		request.setAttribute("rlist", rlist);
		request.setAttribute("glist", glist);
		request.setAttribute("slist", slist);
		request.getRequestDispatcher("lotte/SearchPage.jsp").forward(request, response);
	}

}
