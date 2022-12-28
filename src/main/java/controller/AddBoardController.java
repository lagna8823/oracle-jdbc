package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import service.MemberService;
import vo.Member;

@WebServlet("/board/addBoard")
public class AddBoardController extends HttpServlet {
	// 글쓰기 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션정보 받아오기
		HttpSession session = request.getSession();
		// 로그인 값 체크
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		String msg = request.getParameter("msg");
	    request.setAttribute("msg", msg);
	    
	    // 글작성 폼 View
		request.getRequestDispatcher("/WEB-INF/view/board/addBoard.jsp").forward(request, response);
	}
	// 글쓰기 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션정보 받아오기
		HttpSession session = request.getSession();
		// 로그인 값 체크
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		request.setCharacterEncoding("UTF-8");
		String boardTitle=request.getParameter("boardTitle");
		String boardContent=request.getParameter("boardContent");
		String memberId = loginMember.getMemberId();
		int resultRow  = 0;

		// 모델 호출
		BoardService boardService = new BoardService();
		resultRow = boardService.addBoard(boardTitle, boardContent, memberId);
		// 글작성 성공
		if(resultRow !=0) {
			response.sendRedirect(request.getContextPath()+"/board/boardList");
			return;
		}
		// 작성실패(입력값 확인)
		String msg = URLEncoder.encode("입력되지 않은 값이 있습니다.", "utf-8");
		response.sendRedirect(request.getContextPath() + "/board/addBoard?msg="+msg);
	}
}
