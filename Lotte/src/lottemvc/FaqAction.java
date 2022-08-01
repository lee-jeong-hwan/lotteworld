package lottemvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.FaqDao;
import com.lotte.dto.FaqDto;

public class FaqAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String contentMenuIndex = request.getParameter("contentMenu");
		int realContentMenuIndex = 0;
		if(contentMenuIndex!=null) {
			realContentMenuIndex = Integer.parseInt(contentMenuIndex);
		}
		
		String selectContent = request.getParameter("select");
		if(selectContent==null){
			selectContent = "전체";
		}
		
		String pageNum = request.getParameter("pageNum");
		int realPageNum = 1;
		if(pageNum!=null) {
			realPageNum = Integer.parseInt(pageNum);
		}
		
		String search;
		if(request.getParameter("search")==null || request.getParameter("search").equals("")) {
			search = null;
		}else {
			search = request.getParameter("search");
		}
		
		String search2 = null;
		if(search!=null && search.charAt(0)>=97 && search.charAt(0)<=122) {
			search2 = "" + (char)(search.charAt(0) - 32);
		}else if(search!=null && search.charAt(0)>=65 && search.charAt(0)<=90) {
			search2 = "" + (char)(search.charAt(0) + 32);
		}
		
		FaqDao dao = new FaqDao();
		ArrayList<FaqDto> listSize = null;
		ArrayList<FaqDto> list = null;
		
		if(selectContent.equals("전체") && search!=null) {
			listSize = dao.selectAll(search, search2);
			list = dao.selectAll(realPageNum, search, search2);
		}else if(search!=null) {
			listSize = dao.select(selectContent, search, search2);
			list = dao.select(selectContent, realPageNum, search, search2);
		}else if(selectContent.equals("전체")) {
			listSize = dao.selectAll();
			list = dao.selectAll(realPageNum);
		}else {
			listSize = dao.select(selectContent);
			list = dao.select(selectContent, realPageNum);
		}
		
		request.setAttribute("realContentMenuIndex", realContentMenuIndex);
		request.setAttribute("selectContent", selectContent);
		request.setAttribute("realPageNum", realPageNum);
		request.setAttribute("search", search);
		request.setAttribute("list", list);
		request.setAttribute("listSize", listSize);
		
		request.getRequestDispatcher("lotte/Faq.jsp").forward(request, response);
	}
}
