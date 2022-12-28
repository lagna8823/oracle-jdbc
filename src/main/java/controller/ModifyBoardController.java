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
import vo.Board;
import vo.Member;

@WebServlet("/board/modifyBoard")
public class ModifyBoardController extends HttpServlet {
	private BoardService boardService;
	// 글 수정 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션정보 받아오기
		HttpSession session = request.getSession();
		// 로그인 값 체크
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		
		this.boardService = new BoardService();
		Board returnBoard = boardService.getBoardListByPageUser(boardNo);
		
		request.setAttribute("b", returnBoard);
		session.setAttribute("loginMember", loginMember);
		String msg = request.getParameter("msg");
		System.out.print(msg);
	    request.setAttribute("msg", msg);
	    
		// 작성글 View
		request.getRequestDispatcher("/WEB-INF/view/board/boardOne.jsp").forward(request, response);
	}
	// 글 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션정보 받아오기
		HttpSession session = request.getSession();
		// request 값세팅
		request.setCharacterEncoding("UTF-8");
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		String boardTitle=request.getParameter("boardTitle");
		String boardContent=request.getParameter("boardContent");
		
		Board modifyBoard = new Board();
		modifyBoard.setBoardNo(boardNo);
		modifyBoard.setBoardTitle(boardTitle);
		modifyBoard.setBoardContent(boardContent);
		
		// 모델 호출(수정)
		BoardService boardService = new BoardService();
		int resultRow = boardService.modifyBoard(modifyBoard);
		
		// 결과값이 없다면
		if(resultRow == 0) {
			String msg = URLEncoder.encode("입력된값을 확인하세요.", "utf-8");
			response.sendRedirect(request.getContextPath() + "/board/modifyBoard");
			return;
		}
		// 결과값이 있다면
		response.sendRedirect(request.getContextPath()+"/board/boardList");
	}

}
