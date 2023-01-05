package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBUtil;
import vo.Board;
import vo.Member;

public class BoardDao {
	
		
	// 작성글 수정 ModifyBoardController
	public int modifyBoard(Connection conn, Board modifyBoard) throws Exception {
		int resultRow=0;
		String sql = "UPDATE Board SET board_title=?, board_content=?, updatedate=sysdate  WHERE board_no=? AND member_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, modifyBoard.getBoardTitle());
		stmt.setString(2, modifyBoard.getBoardContent());
		stmt.setInt(3, modifyBoard.getBoardNo());
		stmt.setString(4, modifyBoard.getMemberId());
		resultRow  = stmt.executeUpdate();
		stmt.close();
		return resultRow;
	}	
		
	// 작성글 삭제 RemoveBoardController
	public int removeBoard(Connection conn, int boardNo, String memberId) throws Exception {
		int resultRow = 0; 
		String sql = "DELETE FROM board WHERE board_no=? and member_id =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, boardNo);
		stmt.setString(2, memberId);
		resultRow = stmt.executeUpdate();
		stmt.close();
		return resultRow;
	}
	
	// 게시글작성 AddBoardController
	public int addBoard(Connection conn, String boardTitle, String boardContent, String memberId) throws Exception{
		int resultRow = 0;
		String sql = "INSERT INTO board(board_no, Board_title, Board_content, member_id, updatedate, createdate) values (board_seq.nextval, ?, ?, ?, sysdate, sysdate)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, boardTitle);
		stmt.setString(2, boardContent);
		stmt.setString(3, memberId);
		resultRow = stmt.executeUpdate();
		stmt.close();
		return resultRow;
	}
	
	// 게시글 상세보기
	public Board selectBoardListByPageUser(Connection conn, int boardNo) throws Exception{
		Board returnBoard = null;
		String sql ="SELECT board_no boardNo, board_title boardTitle, board_content boardContent, member_id memberId FROM(SELECT board_no, board_title, board_content, member_id FROM board ORDER BY board_no desc) where board_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, boardNo);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			returnBoard = new Board();
			returnBoard.setBoardNo(rs.getInt("boardNo"));
			returnBoard.setBoardTitle(rs.getString("boardTitle"));
			returnBoard.setBoardContent(rs.getString("boardContent"));
			returnBoard.setMemberId(rs.getString("memberId"));
		}
		rs.close();
		stmt.close();
		return returnBoard;
	}
	
	// 공지사항 cnt 라스트페이지 
	public int count(Connection conn) throws Exception{
		int cnt = 0; // 전체 행의 수
		String sql = "SELECT COUNT(*) cnt FROM board";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
	    if(rs.next()) {
	    	cnt = rs.getInt("cnt");
	    }
		return cnt;
	}
		
	// 게시글 리스트 (간단히 검색추가)
	public ArrayList<Board> selectBoardListByPage(Connection conn, int beginRow, int endRow, String word, String search) throws SQLException{
		 System.out.print("search");
		ArrayList<Board> list = new ArrayList<Board>();
		String sql=null;
		PreparedStatement stmt=null;
		if(word.equals("") || word == null) {
			word=("");
		} 
		if(search.equals("") || search == null) {
			search=("");
			sql = " SELECT board_no boardNo, board_title boardTitle, board_content boardContent, member_id memberId, createdate"
					+ " FROM(SELECT rownum rnum, board_no, board_title, board_content, member_id, createdate "
					+ "		FROM(SELECT board_no, board_title, board_content, member_id, createdate "
					+ " 		FROM board WHERE board_title LIKE ? OR board_content LIKE ? OR member_id LIKE ? ORDER BY to_number(board_no) DESC))"
					+ " WHERE rnum BETWEEN ? AND ?"; // WHERE rnum >=? AND rnum <=?;
			 stmt = conn.prepareStatement(sql);
			 stmt.setString(1, "%"+word+"%");
			 stmt.setString(2, "%"+word+"%");
			 stmt.setString(3, "%"+word+"%");
			 stmt.setInt(4, beginRow);
			 stmt.setInt(5, endRow);
		}
		if(search.equals("title")) {
			sql = " SELECT board_no boardNo, board_title boardTitle, board_content boardContent, member_id memberId, createdate"
					+ " FROM(SELECT rownum rnum, board_no, board_title, board_content, member_id, createdate "
					+ "		FROM(SELECT board_no, board_title, board_content, member_id, createdate "
					+ " 		FROM board WHERE board_title LIKE ? ORDER BY to_number(board_no) DESC))"
					+ " WHERE rnum BETWEEN ? AND ?"; 
			stmt = conn.prepareStatement(sql);
			 stmt.setString(1, "%"+word+"%");
			 stmt.setInt(2, beginRow);
			 stmt.setInt(3, endRow);
		} else if(search.equals("content")) {
			sql = " SELECT board_no boardNo, board_title boardTitle, board_content boardContent, member_id memberId, createdate"
					+ " FROM(SELECT rownum rnum, board_no, board_title, board_content, member_id, createdate "
					+ "		FROM(SELECT board_no, board_title, board_content, member_id, createdate "
					+ " 		FROM board WHERE board_content LIKE ? ORDER BY to_number(board_no) DESC))"
					+ " WHERE rnum BETWEEN ? AND ?"; 
			stmt = conn.prepareStatement(sql);
			 stmt.setString(1, "%"+word+"%");
			 stmt.setInt(2, beginRow);
			 stmt.setInt(3, endRow);
		} else if(search.equals("memberId")) {
			sql = " SELECT board_no boardNo, board_title boardTitle, board_content boardContent, member_id memberId, createdate"
					+ " FROM(SELECT rownum rnum, board_no, board_title, board_content, member_id, createdate "
					+ "		FROM(SELECT board_no, board_title, board_content, member_id, createdate "
					+ " 		FROM board WHERE member_id LIKE ? ORDER BY to_number(board_no) DESC))"
					+ " WHERE rnum BETWEEN ? AND ?"; 
			stmt = conn.prepareStatement(sql);
			 stmt.setString(1, "%"+word+"%");
			 stmt.setInt(2, beginRow);
			 stmt.setInt(3, endRow);
		}
		 
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setBoardContent(rs.getString("boardContent"));
			b.setMemberId(rs.getString("memberId"));
			b.setCreatedate(rs.getString("createdate"));
			list.add(b);
		}
		return list;
	}
}
