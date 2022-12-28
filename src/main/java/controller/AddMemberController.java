package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;

@WebServlet("/member/addMember")
public class AddMemberController extends HttpServlet {
	// 회원가입 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/*
	 * VIEW -> /WEB-INF/view/member/addMember.jsp
	 */
	request.setCharacterEncoding("UTF-8");
	String msg = request.getParameter("msg");
    request.setAttribute("msg", msg);
    
    // 회원가입 폼 View
	request.getRequestDispatcher("/WEB-INF/view/member/addMember.jsp").forward(request, response);
	}
	
	// 회원가입 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/*
	 *  redirect -> get방식 /member/login <- 컨트롤러 요청
	 */
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
	resultRow = memberService.addMember(memberId, memberPw, memberName);
	// 가입성공
	if(resultRow !=0) {
		response.sendRedirect(request.getContextPath()+"/home");
		return;
	}
	// 가입실패(중복아이디)
	String msg = URLEncoder.encode("가입된 아이디가 있습니다.", "utf-8");
	response.sendRedirect(request.getContextPath() + "/member/addMember?msg="+msg);
	}
}
