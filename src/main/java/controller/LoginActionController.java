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

@WebServlet("/LoginActionController")
public class LoginActionController extends HttpServlet {
	private MemberService memberService;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 전에만 진입가능
		HttpSession session = request.getSession(); 
		// request 값세팅
		request.setCharacterEncoding("UTF-8");
		String memberId=request.getParameter("memberId");
		String memberPw=request.getParameter("memberPw");
		// 디버깅
		System.out.println(memberId+"님의 아이디로 로그인이 시도되었습니다.");
		
		Member member = new Member(); // request 파라미터값으로 바인딩
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		
		// 모델 호출
		this.memberService = new MemberService();
		Member returnMember = memberService.login(member);
	   
	   if(returnMember == null){ 
	         // 뷰가 있따!
	         response.sendRedirect(request.getContextPath() + "/LoginFormController");
	         return;
	      }
	   
	   session.setAttribute("loginMember", returnMember);
	   response.sendRedirect(request.getContextPath() + "/HomeController");
	}
}
