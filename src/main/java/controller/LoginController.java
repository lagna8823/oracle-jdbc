package controller;
	
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.Member;

@WebServlet("/member/login")
public class LoginController extends HttpServlet {
	private MemberService memberService;
	
	// 로그인 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW -> /WEB-INF/view/member/login.jsp	
		 */
		// 로그인 전에만 진입가능
		HttpSession session = request.getSession();
		// 로그인 값 체크
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		String msg = request.getParameter("msg");
	    request.setAttribute("msg", msg);

	      
		// 로그인 폼 View
		request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
	}
	
	// 로그인 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 로그인 세션정보 :  session.setAttribute("loginMember", Member타입)
		 */
		// 로그인 전에만 진입가능
		HttpSession session = request.getSession(); 
		// request 값세팅
		request.setCharacterEncoding("UTF-8");
		String memberId=request.getParameter("memberId");
		String memberPw=request.getParameter("memberPw");
		// 디버깅
		System.out.println(memberId+"님의 아이디로 로그인이 시도되었습니다.");
		
		// 메서드 호출시 매개변수
		Member member = new Member(); // request 파라미터값으로 바인딩
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		
		// 모델 호출
		this.memberService = new MemberService();
		Member returnMember = memberService.login(member);
		
		// 결과값이 없다면
	    if(returnMember == null){ 
		String msg = URLEncoder.encode("로그인 실패", "utf-8");
		response.sendRedirect(request.getContextPath()+"/member/login?msg="+msg);
		return;
	    }
	    
	    // 결과값 있다면
	    session.setAttribute("loginMember", returnMember);
	    response.sendRedirect(request.getContextPath() + "/home");
	}
}
