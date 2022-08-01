package lottemvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.lotte.dao.LoginDao;
import com.lotte.dao.MainDao;
import com.lotte.dto.LotteMemberDto;
import com.lotte.dto.MainDto;
import com.lotte.dto.ShowDto;

public class LoginAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		LoginDao dao = new LoginDao();
		String dto = null;
		
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
		
		MainDao lotteDao = new MainDao();
		ArrayList<ShowDto> showList = lotteDao.mainShow(day);
		ArrayList<MainDto> attractionList = lotteDao.mainAttraction();
	
		try {
			dto = dao.LoginDao(email);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		HttpSession session = request.getSession();
        session.setAttribute("name", dto);	//name을 세션에 저장
        request.setAttribute("showList", showList);
		request.setAttribute("attractionList", attractionList);
		request.getRequestDispatcher("lotte/LotteMain.jsp").forward(request, response);	
		
	}
}


