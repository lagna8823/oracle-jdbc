package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;

@WebServlet("/DeleteMemberActionController")
public class DeleteMemberActionController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request 값세팅
		request.setCharacterEncoding("UTF-8");
		String memberId=request.getParameter("memberId");
		String memberPw=request.getParameter("memberPw");
		int resultRow  = 0;
		
		// 모델 호출
		MemberService memberService = new MemberService();
		resultRow = memberService.deleteMember(memberId, memberPw);
		
		if(resultRow !=0) {
		request.getSession().invalidate();  // 받아온 세션값을 완전히 삭제.
		response.sendRedirect(request.getContextPath()+"/LoginFormController");
		return;
		}
		response.sendRedirect(request.getContextPath() + "/DeleteMemberFormController");
	}
}
