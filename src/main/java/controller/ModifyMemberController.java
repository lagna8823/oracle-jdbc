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
@WebServlet("/member/modifyMember")
public class ModifyMemberController extends HttpServlet {
	// 회원수정 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/*
	 * VIEW -> /WEB-INF/view/member/modifymMember.jsp
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
    
	// 회원정보 수정폼 View
	request.getRequestDispatcher("/WEB-INF/view/member/modifyMember.jsp").forward(request, response);
	}
	
	// 회원수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/*
	 * redirect -> get 방식 /member/memberOne?key값<--컨트롤러 요청
	*/
	// 세션정보 받아오기
	HttpSession session = request.getSession();
	// request 값세팅
	request.setCharacterEncoding("UTF-8");
	String memberId=request.getParameter("memberId");
	String memberPw=request.getParameter("memberPw");
	String memberPw2=request.getParameter("memberPw2");
	String memberName=request.getParameter("memberName");
	
	Member member = new Member();
	member.setMemberId(memberId);
	member.setMemberPw(memberPw);
	member.setMemberPw2(memberPw2);
	member.setMemberName(memberName);
	
	// 모델 호출(수정)
	MemberService memberService = new MemberService();
	int resultRow = memberService.modifyMember(member);
	
	// 모델 호출(바뀐값 검색)
	MemberService memberService1 = new MemberService();
	member = memberService1.login(member);
	
	// 결과값이 없다면
	if(resultRow == 0) {
		String msg = URLEncoder.encode("입력된값을 확인하세요.", "utf-8");
		response.sendRedirect(request.getContextPath() + "/member/modifyMember?msg="+msg);
		return;
	}
	// 결과값이 있다면 수정된 값 세션에 저장
	session.setAttribute("loginMember", member);
	response.sendRedirect(request.getContextPath()+"/member/memberOne");
	}
}
