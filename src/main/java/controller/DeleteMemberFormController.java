package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;

@WebServlet("/DeleteMemberFormController")
public class DeleteMemberFormController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션정보 받아오기
		HttpSession session = request.getSession();
		// 로그인 값 체크
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/LoginFormController");
			return;
		}
		// 로그인 폼 View
		request.getRequestDispatcher("/WEB-INF/view/deleteMemberForm.jsp").forward(request, response);
	}
}
