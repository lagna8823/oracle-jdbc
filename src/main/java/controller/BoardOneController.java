package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;

@WebServlet("/board/boardOne")
public class BoardOneController extends HttpServlet {
	private BoardService boardService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW 메뉴구성
		 * 1) 글 수정(로그인 멤버 == 글쓴멤버)
		 * 2) 글 삭제(로그인 멤버 == 글쓴멤버)
		 */
		// 세션정보 받아오기
		HttpSession session = request.getSession(); 
		// 로그인 값 체크 로그인 전/후: loginMember -> null /  not null
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그인정보없을시
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
	    
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
	    this.boardService = new BoardService();
		Board returnBoard = boardService.getBoardListByPageUser(boardNo);
		
		request.setAttribute("b", returnBoard);
		session.setAttribute("loginMember", loginMember);
		String msg = request.getParameter("msg");
	    request.setAttribute("msg", msg);
	    
		// 작성글 View
		request.getRequestDispatcher("/WEB-INF/view/board/boardOne.jsp").forward(request, response);
	}
}
