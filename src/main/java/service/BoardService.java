package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.BoardDao;
import dao.MemberDao;
import util.DBUtil;
import vo.Board;
import vo.Member;

public class BoardService {
		private BoardDao boardDao;
		
		// 작성글 수정 ModifyBoardController
		public int modifyBoard(Board modifyBoard) {
			int resultRow=0;
			Connection conn = null;
			try {
				conn = DBUtil.getConnection();
				boardDao= new BoardDao();
				resultRow = boardDao.modifyBoard(conn, modifyBoard);
				conn.commit(); // DBUtil.class에서 conn.setAutoCommit(false);
			} catch(Exception e) {
				try {
		            conn.rollback(); // DBUtil.class에서 conn.setAutoCommit(false);
		         } catch (SQLException e1) {
		            e1.printStackTrace();
		         }
			} finally {
				try {
					conn.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			return resultRow;	
		}
			
		// 작성글 삭제 RemoveBoardController
		public int removeBoard(int boardNo, String memberId) {
			int resultRow = 0;
			Connection conn = null;
			try {
				conn = DBUtil.getConnection();
				boardDao= new BoardDao();
				resultRow = boardDao.removeBoard(conn, boardNo, memberId);
				conn.commit(); // DBUtil.class에서 conn.setAutoCommit(false);
			} catch(Exception e) {
				try {
		            conn.rollback(); // DBUtil.class에서 conn.setAutoCommit(false);
		         } catch (SQLException e1) {
		            e1.printStackTrace();
		         }
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			return resultRow;	
		}
		
		// 게시글 작성 AddBoardController
		public int addBoard(String boardTitle, String boardContent, String memberId) {
			int resultRow = 0;
			Connection conn = null;
			try {
				conn = DBUtil.getConnection();
				boardDao= new BoardDao();
				resultRow = boardDao.addBoard(conn, boardTitle, boardContent, memberId);
				conn.commit(); // DBUtil.class에서 conn.setAutoCommit(false);
			} catch(Exception e) {
				try {
		            conn.rollback(); // DBUtil.class에서 conn.setAutoCommit(false);
		         } catch (SQLException e1) {
		            e1.printStackTrace();
		         }
				e.printStackTrace();
			} finally {
				try {
					conn.rollback(); // DBUtil.class에서 conn.setAutoCommit(false);
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			return resultRow;	
		}
		
		// 게시글 상세보기
		public Board getBoardListByPageUser(int boardNo) {
			  this.boardDao = new BoardDao();
			  Board returnBoard= null;
		      Connection conn = null;
		      try {
		         conn = DBUtil.getConnection();
		         boardDao = new BoardDao();
		         returnBoard = boardDao.selectBoardListByPageUser(conn, boardNo);
		         conn.commit(); // DBUtil.class에서 conn.setAutoCommit(false);
		      } catch (Exception e) {
		         try {
		            conn.rollback(); // DBUtil.class에서 conn.setAutoCommit(false);
		         } catch (SQLException e1) {
		            e1.printStackTrace();
		         }
		         e.printStackTrace();
		      } finally {
		         try {
		            conn.close();
		         } catch (SQLException e) {
		            e.printStackTrace();
		         }
		      }
		      return returnBoard;
		}
				
		// 게시판  전체
		public ArrayList<Board> getBoardListByPage(int currentPage, int rowPerPage, String word) {
		      /*
		          1) connection 생성 <- DBUtil.class
		          2) beginRow, endRow 생성 <- currentPage,rowPerPage를 가공
		       */
		      ArrayList<Board> list = null;
		      Connection conn = null;
		      try {
		         conn = DBUtil.getConnection();
		         int beginRow = (currentPage-1)*rowPerPage+1;
		         int endRow = beginRow + rowPerPage - 1;
		         boardDao = new BoardDao();
		         list = boardDao.selectBoardListByPage(conn, beginRow, endRow, word);
		         conn.commit(); // DBUtil.class에서 conn.setAutoCommit(false);
		      } catch (Exception e) {
		         try {
		            conn.rollback(); // DBUtil.class에서 conn.setAutoCommit(false);
		         } catch (SQLException e1) {
		            e1.printStackTrace();
		         }
		         e.printStackTrace();
		      } finally {
		         try {
		            conn.close();
		         } catch (SQLException e) {
		            e.printStackTrace();
		         }
		      }
		      return list;
		}
}
