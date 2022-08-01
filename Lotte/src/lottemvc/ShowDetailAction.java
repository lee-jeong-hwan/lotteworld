package lottemvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.ShowDetailDao;
import com.lotte.dto.ShowDto;

public class ShowDetailAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String detailName = request.getParameter("name");
		String selectDay = request.getParameter("selectDay");
		String day = request.getParameter("day");
		int a = 0;
		if(request.getParameter("a")!=null){
			a = Integer.parseInt(request.getParameter("a"));
		}
		String chart = request.getParameter("chart");
		String time = request.getParameter("time");
		
		ShowDetailDao dao = new ShowDetailDao();
		ShowDto dto = null;
		
		if(time==null) {
			time = "null";
		}
		dto = dao.showTime(detailName, time);
		
		request.setAttribute("selectDay", selectDay);
		request.setAttribute("day", day);
		request.setAttribute("a", a);
		request.setAttribute("chart", chart);
		request.setAttribute("dto", dto);
		
		request.getRequestDispatcher("lotte/ShowDetail.jsp").forward(request, response);
	}
}
