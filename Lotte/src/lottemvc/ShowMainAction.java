package lottemvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.ShowDao;
import com.lotte.dto.ShowDto;

public class ShowMainAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShowDao dao = new ShowDao();
		int a = 0;

		String selectDay = request.getParameter("selectDay");
		String day = request.getParameter("day");
		if(request.getParameter("a")!=null){
			a = Integer.parseInt(request.getParameter("a"));
		}
		String chart = request.getParameter("chart");

		if(day==null || day.equals("null")){
			Calendar cal = Calendar.getInstance();
			int dayOfTheWeek = cal.get(Calendar.DAY_OF_WEEK);
			
			switch(dayOfTheWeek){
			case 1:	//일
				day = "su";
				break;
			case 2:	//월
			case 3:	//화
			case 4:	//수
				day = "mtw";
				break;
			case 5:	//목
			case 6:	//금
				day = "tf";
				break;
			case 7:	//토
				day = "sa";
				break;
			}//switch
		}
		if(chart==null || chart.equals("null")){
			chart = "전체";
		}
		
		ArrayList<ShowDto> topList = null;
		ArrayList<ShowDto> bottomList = null;
		
		if(chart.equals("전체")){
			topList = dao.doSelectAll(day);
			bottomList = dao.selectAll(day);
		}else {
			topList = dao.doSelectAll(day, chart);
			bottomList = dao.selectAll(day, chart);
		}
		request.setAttribute("selectDay", selectDay);
		request.setAttribute("day", day);
		request.setAttribute("a", a);
		request.setAttribute("chart", chart);
		request.setAttribute("topList", topList);
		request.setAttribute("bottomList", bottomList);
		
		request.getRequestDispatcher("lotte/Show.jsp").forward(request, response);
	}
}
