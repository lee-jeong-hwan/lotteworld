package lottemvc;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.GiftshopDao;
import com.lotte.dto.GiftshopDto;

public class DetailGiftshopAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		
		GiftshopDao dao = new GiftshopDao();
		GiftshopDto dto = null;
		try {
			dto = dao.giftshopDetail(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("lotte/DetailGiftshop.jsp").forward(request, response);
		
		
	}

}
