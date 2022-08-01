package lottemvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.MainDao;
import com.lotte.dto.MainDto;
import com.lotte.dto.ShowDto;

public class LotteMainAction implements Action{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Calendar cal = Calendar.getInstance();
		int dayOfTheWeek = cal.get(Calendar.DAY_OF_WEEK);
		String day = null;
		switch(dayOfTheWeek) {
		case 1:
			day = "su";
			break;
		case 2:
		case 3:
		case 4:
			day = "mtw";
			break;
		case 5:
		case 6:
			day = "tf";
			break;
		case 7:
			day = "sa";
			break;
		}//switch
		
		MainDao dao = new MainDao();
		ArrayList<ShowDto> showList = dao.mainShow(day);
		ArrayList<MainDto> attractionList = dao.mainAttraction();
		
		request.setAttribute("showList", showList);
		request.setAttribute("attractionList", attractionList);
		request.getRequestDispatcher("lotte/LotteMain.jsp").forward(request, response);
	}
}
