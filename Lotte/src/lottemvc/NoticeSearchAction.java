package lottemvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.NoticeDao;
import com.lotte.dto.NoticeDto;

public class NoticeSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Search = request.getParameter("Search");
		String sel = request.getParameter("sel");
		int startBno = Integer.parseInt(request.getParameter("startBno"));
		int endBno = Integer.parseInt(request.getParameter("endBno"));
		NoticeDao dao = new NoticeDao();
		ArrayList<NoticeDto> dto = new ArrayList<NoticeDto>();

		try {
			dto = dao.getNoticeListStartEnd2(Search, sel, startBno, endBno);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		request.setAttribute("Searchlist", dto);
		request.getRequestDispatcher("lotte/Notice.jsp").forward(request, response);	
		
	}

}
