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
		
		request.setCharacterEncoding("UTF-8");
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		
		// 모델 호출 ( 게시글 번호로 작성자 정보확인)
		this.boardService = new BoardService();
		Board returnBoard = boardService.getBoardListByPageUser(boardNo);
		// 디버깅
		System.out.println(loginMember.getMemberId()+"로그인멤버");
		System.out.println(returnBoard.getMemberId()+"게시글의멤버");
		// 작성자 확인
		if(!(loginMember.getMemberId()).equals(returnBoard.getMemberId())) {
			String msg = URLEncoder.encode("작성자가 일치하지않습니다.", "utf-8");
			response.sendRedirect(request.getContextPath() + "/board/boardOne?msg="+msg+"&boardNo="+boardNo);
			return;
	    }
	    request.setAttribute("b", returnBoard);
		
		// 작성글 수정폼 View
		request.getRequestDispatcher("/WEB-INF/view/board/modifyBoard.jsp").forward(request, response);
	}
	// 글 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션정보 받아오기
		HttpSession session = request.getSession();
		// 로그인 값 체크
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		// request 값세팅
		request.setCharacterEncoding("UTF-8");
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		String boardTitle=request.getParameter("boardTitle");
		String boardContent=request.getParameter("boardContent");
		String memberId=loginMember.getMemberId();
		
		// 매개값
		Board modifyBoard = new Board();
		modifyBoard.setBoardNo(boardNo);
		modifyBoard.setBoardTitle(boardTitle);
		modifyBoard.setBoardContent(boardContent);
		modifyBoard.setMemberId(memberId);
		
		// 모델 호출(수정)
		BoardService boardService = new BoardService();
		int resultRow = boardService.modifyBoard(modifyBoard);
		
		// 결과값이 없다면
		if(resultRow == 0) {
			String msg = URLEncoder.encode("입력된값을 확인하세요.", "utf-8");
			response.sendRedirect(request.getContextPath() + "/board/modifyBoard?msg="+msg);
			return;
		}
		// 결과값이 있다면
		response.sendRedirect(request.getContextPath()+"/board/boardList");
	}

}
