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
import service.MemberService;
import vo.Board;
import vo.Member;

@WebServlet("/home")
public class HomeController extends HttpServlet {
	private MemberService memberService;
	private BoardService boardService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW -> /WEB-INF
		 * 메뉴구성(로그인 전/후 에따라 분기)
		 * 로그인 전
		 * 1) 회원가입
		 * 2) 로그인
		 * 
		 * 로그인 후
		 * 1) 로그아웃
		 * 2) 회원정보
		 * 3) 게시판 리스트
		 */
		
		// 세션정보 받아오기
		HttpSession session = request.getSession(); 
		// 로그인 값 체크 로그인 전/후: loginMember -> null /  not null
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그인정보없을시
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		String word = ("");
		if(request.getParameter("word") != null) {
	    	 word =request.getParameter("word");
	     } 
	    request.setAttribute("word", word);
	    
	    String search = ("");
	   if(request.getParameter("search") != null) {
		   search =request.getParameter("search");
		   //System.out.print(search+"받아온값");
	   } 
	   
	 	int currentPage = 1;
	    if(request.getParameter("currentPage") != null) {
	       currentPage = Integer.parseInt(request.getParameter("currentPage"));
	    }
	      
	    int rowPerPage = 10;
	    if(request.getParameter("rowPerPage") != null) {
	       rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
	    }
	     
	    this.boardService = new BoardService();
	    ArrayList<Board> list = boardService.getBoardListByPage(currentPage, rowPerPage, word, search);
	    request.setAttribute("boardList", list);
	    request.setAttribute("currentPage", currentPage); // view에서 필요
	    request.setAttribute("rowPerPage", rowPerPage); // view에서 필요
	    request.setAttribute("search", search); // view에서 필요
	    
	    session.setAttribute("loginMember", loginMember);
	     
	 	// 홈 View
	 	request.getRequestDispatcher("/WEB-INF/view/home.jsp").forward(request, response);
	}
}
