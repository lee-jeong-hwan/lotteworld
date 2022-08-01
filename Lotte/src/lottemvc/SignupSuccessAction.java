package lottemvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lotte.dao.SingupnameDao;
import com.lotte.dto.LotteMemberDto;

public class SignupSuccessAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		SingupnameDao dao = new SingupnameDao();
		ArrayList<LotteMemberDto> dto = new ArrayList<LotteMemberDto>();
		try {
			dto = dao.singup(name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("name", dto);
		request.getRequestDispatcher("lotte/SignupSuccess.jsp").forward(request, response);
	}

}
