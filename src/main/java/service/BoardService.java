package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.BoardDao;
import util.DBUtil;
import vo.Board;

public class BoardService {
		private BoardDao boardDao;
			
		
		// 게시글 작성 AddBoardController
		public int addBoard(String boardTitle, String boardContent, String memberId) {
			int resultRow = 0;
			Connection conn = null;
			try {
				conn = DBUtil.getConnection();
				boardDao= new BoardDao();
				resultRow = boardDao.addBoard(conn, boardTitle, boardContent, memberId);
			} catch(Exception e) {
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
		// 작성 게시판 검색
				public ArrayList<Board> getBoardListByPageUser(int currentPage, int rowPerPage) {
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
				         list = boardDao.selectBoardListByPage(conn, beginRow, endRow);
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
				
		// 게시판  전체
		public ArrayList<Board> getBoardListByPage(int currentPage, int rowPerPage) {
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
		         list = boardDao.selectBoardListByPage(conn, beginRow, endRow);
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
