package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.Board;
import vo.Member;

public class BoardDao {
	
	// 회원수정 ModifyBoardController
	public int modifyBoard(Connection conn, Board modifyBoard) throws Exception {
		int resultRow=0;
		String sql = "UPDATE Board SET Board_pw=?, Board_name=? WHERE Board_id=? AND Board_pw =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, modifyBoard.getBoardPw2());
		stmt.setString(2, modifyBoard.getBoardName());
		stmt.setString(3, modifyBoard.getBoardId());
		stmt.setString(4, modifyBoard.getBoardPw());
		resultRow  = stmt.executeUpdate();
		stmt.close();
		return resultRow;
	}	
	// 회원탈퇴 RemoveBoardController
	public int removeBoard(Connection conn, String BoardId, String BoardPw) throws Exception {
		int resultRow = 0; 
		String sql = "DELETE FROM Board WHERE Board_id=? and Board_pw =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, BoardId);
		stmt.setString(2, BoardPw);
		resultRow = stmt.executeUpdate();
		stmt.close();
		return resultRow;
	}
	
	// 로그인 LoginActionController
	public Board selectBoardByAndPw(Connection conn, Board Board) throws Exception {
		Board retrunBoard = null;
		String sql = "SELECT Board_id BoardId, Board_pw BoardPw, Board_name BoardName FROM Board WHERE Board_id =? AND  Board_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, Board.getBoardId());
		stmt.setString(2, Board.getBoardPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			retrunBoard= new Board();
			retrunBoard.setBoardId(rs.getString("BoardId"));
			retrunBoard.setBoardPw(rs.getString("BoardPw"));
			retrunBoard.setBoardName(rs.getString("BoardName"));
		}
		stmt.close();
		return retrunBoard;
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
		
	// 검색 추가하기
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
	public int insertBoard(Connection conn, Board board) {
		String sql = "insert into board (board_no, board_title, board_content, member_id, updatedate, createdate) values ( board_seq.nextval, ?, ?, ?, sysdate, sysdate)";
		return 0;
	}
}
