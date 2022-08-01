package lottemvc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.GiftshopDao;
import com.lotte.dto.GiftshopDto;

public class GiftshopAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GiftshopDao dao = new GiftshopDao();
		ArrayList<GiftshopDto> list = null;
		
		try {
			list = dao.GiftshopMain();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("lotte/GiftShop.jsp").forward(request, response);
	}

}
