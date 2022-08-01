package lottemvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.NoticeDetailDao;
import com.lotte.dao.NoticeNextDao;
import com.lotte.dao.NoticePrevDao;
import com.lotte.dto.NoticeDto;
import com.lotte.dto.NoticeTitleDto;

public class NoticeDetailAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		NoticeDetailDao dao = new NoticeDetailDao();
		ArrayList<NoticeDto> dto = new ArrayList<NoticeDto>();
		
		int prev = Integer.parseInt(request.getParameter("num"));
		NoticePrevDao dao2 = new NoticePrevDao();
		ArrayList<NoticeTitleDto> dto2 = new ArrayList<NoticeTitleDto>();
		
		int next = Integer.parseInt(request.getParameter("num"));
		NoticeNextDao dao3 = new NoticeNextDao();
		ArrayList<NoticeTitleDto> dto3 = new ArrayList<NoticeTitleDto>();
		
		try {
			dto = dao.getNoticeListDetail(num);
			dto2 = dao2.getNoticeListPrev(prev);
			dto3 = dao3.getNoticeListNext(next); 
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		request.setAttribute("Detail", dto);
		request.setAttribute("Prev",dto2);
		request.setAttribute("Next",dto3 );
		request.getRequestDispatcher("lotte/Notice_detail.jsp").forward(request, response);	
	}

}
