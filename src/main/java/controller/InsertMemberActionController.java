package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;

@WebServlet("/InsertMemberActionController")
public class InsertMemberActionController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request 값세팅
		request.setCharacterEncoding("UTF-8");
		String memberId=request.getParameter("memberId");
		String memberPw=request.getParameter("memberPw");
		String memberName=request.getParameter("memberName");
		int resultRow  = 0;

		// 디버깅
		System.out.println(memberId+"<-- AddMemberActionController.doPost.memberId");

		// 모델 호출
		MemberService memberService = new MemberService();
		resultRow = memberService.insertMember(memberId, memberPw, memberName);

		if(resultRow !=0) {
			// 가입성공
			response.sendRedirect(request.getContextPath()+"/HomeController");
			return;
		}
		response.sendRedirect(request.getContextPath() + "/InsertMemberFormController");
	}
}