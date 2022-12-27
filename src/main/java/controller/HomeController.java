package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.Member;

@WebServlet("/HomeController")
public class HomeController extends HttpServlet {
	private MemberService memberService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션정보 받아오기
		HttpSession session = request.getSession(); 
		// 로그인 값 체크 로그인 전/후: loginMember -> null /  not null
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그인정보없을시
			response.sendRedirect(request.getContextPath()+"/LoginFormController");
			return;
		}
		session.setAttribute("loginMember", loginMember);
		// 홈 View
		request.getRequestDispatcher("/WEB-INF/view/home.jsp").forward(request, response);
	}
}
