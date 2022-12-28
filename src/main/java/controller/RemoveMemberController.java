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

@WebServlet("/member/removeMember")
public class RemoveMemberController extends HttpServlet {
	// 회원탈퇴 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/*
	 * VIEW -> /WEB-INF/view/member/removeMember.jsp
	 */
	// 세션정보 받아오기
	HttpSession session = request.getSession();
	// 로그인 값 체크
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null) {
		response.sendRedirect(request.getContextPath()+"/member/login");
		return;
	}
	
	String msg = request.getParameter("msg");
    request.setAttribute("msg", msg);
    
	//  회원탈퇴 폼 View
	request.getRequestDispatcher("/WEB-INF/view/member/removeMember.jsp").forward(request, response);
	}
	// 회원 탈퇴 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/*
	 *  redirect -> get방식 /member/logout <- 컨트롤러 요청
	 */
	// request 값세팅
	request.setCharacterEncoding("UTF-8");
	String memberId=request.getParameter("memberId");
	String memberPw=request.getParameter("memberPw");
	int resultRow  = 0;
	
	// 모델 호출
	MemberService memberService = new MemberService();
	resultRow = memberService.removeMember(memberId, memberPw);
	
	// 탈퇴성공
	if(resultRow !=0) {
	response.sendRedirect(request.getContextPath()+"/member/logout");
	return;
	}
	// 탈퇴실패 (비밀번호확인)
	String msg = URLEncoder.encode("비밀번호가 틀렸습니다.", "utf-8");
	response.sendRedirect(request.getContextPath() + "/member/removeMember?msg="+msg);
	}
}
