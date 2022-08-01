package lottemvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lotte.dao.MainDao;
import com.lotte.dto.MainDto;
import com.lotte.dto.ShowDto;

public class LogoutAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 //request 객체에서 session을 가져옴
        HttpSession session = request.getSession();
        
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

        // 해당 session을 날려버림
        session.invalidate();
        request.setAttribute("showList", showList);
		request.setAttribute("attractionList", attractionList);
        //다시 login.jsp 페이지로 응답
        request.getRequestDispatcher("lotte/LotteMain.jsp").forward(request, response);
	}

}
