package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
		String sql = "INSERT INTO Board(board_no, Board_title, Board_content, member_id, updatedate, createdate) values (board_seq.nextval, ?, ?, ?, sysdate, sysdate)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, boardTitle);
		stmt.setString(2, boardContent);
		stmt.setString(3, memberId);
		resultRow = stmt.executeUpdate();
		stmt.close();
		return resultRow;
	}
	
	// 게시판 상세보기
	public Board selectBoardListByPageUser(Connection conn, int boardNo) throws SQLException{
		Board returnBoard = null;
		String sql ="SELECT board_no boardNo, board_title boardTitle, board_content boardContent FROM(SELECT board_no, board_title, board_content FROM board ORDER BY board_no desc) where board_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		stmt.setInt(1, boardNo);
		if(rs.next()) {
			returnBoard = new Board();
			rs.getInt("boardNo");
			rs.getString("boardTitle");
			rs.getString("boardContent");
		}
		return returnBoard;
	}
		
	// 게시글 리스트 (검색 추가하기)
	public ArrayList<Board> selectBoardListByPage(Connection conn, int beginRow, int endRow) throws SQLException{
		ArrayList<Board> list = new ArrayList<Board>();
		String sql = " SELECT board_no boardNo, board_title boardTitle, createdate"
				+ " FROM(SELECT rownum rnum, board_no, board_title, createdate "
				+ "		FROM(SELECT board_no, board_title, createdate "
				+ " 		FROM board ORDER BY board_no DESC))"
				+ " WHERE rnum BETWEEN ? AND ?"; // WHERE rnum >=? AND rnum <=?;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, endRow);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setCreatedate(rs.getString("createdate"));
			list.add(b);
		}
		return list;
	}
}
