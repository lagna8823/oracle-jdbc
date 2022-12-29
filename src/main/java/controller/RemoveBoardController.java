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
import vo.Member;

@WebServlet("/board/removeBoard")
public class RemoveBoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션정보 받아오기
		HttpSession session = request.getSession();
		// 로그인 값 체크
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		// request 값세팅
		String memberId=loginMember.getMemberId();
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		
		// 모델 호출
		BoardService boardService = new BoardService();
		int resultRow = boardService.removeBoard(boardNo, memberId);
		
		// 삭제성공
		if(resultRow !=0) {
		response.sendRedirect(request.getContextPath()+"/board/boardList");
		return;
		}
		// 삭제실패 (아이디 확인)
		String msg = URLEncoder.encode("작성자가 일치하지 않습니다.", "utf-8");
		response.sendRedirect(request.getContextPath() + "/board/boardOne?msg="+msg+"&boardNo="+boardNo);
	}
}
