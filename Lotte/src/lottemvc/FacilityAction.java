package lottemvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FacilityAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num;
		if(request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			request.setAttribute("num", num);
		}
	
		request.getRequestDispatcher("lotte/Facility.jsp").forward(request, response);
	}
}
