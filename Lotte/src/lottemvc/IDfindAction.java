package lottemvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.IDfind2Dao;
import com.lotte.dto.MemberDto;
public class IDfindAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("e");
		IDfind2Dao dao = new IDfind2Dao();
		ArrayList<MemberDto> dto = new ArrayList<MemberDto>();
	try {
		dto = dao.getAllBoardList(email);
	} catch (Exception e) {
		e.printStackTrace();
	}	
	
	request.setAttribute("email", dto);
	request.getRequestDispatcher("lotte/IDfind.jsp").forward(request, response);	
	}
}
