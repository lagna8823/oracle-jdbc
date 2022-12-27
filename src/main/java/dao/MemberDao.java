package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.Board;
import vo.Member;

public class MemberDao {
	// 회원탈퇴 DeleteMemberActionController
	public int deleteMember(Connection conn, String memberId, String memberPw) throws Exception {
		int resultRow = 0; 
		String sql = "DELETE FROM member WHERE member_id=? and member_pw =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberId);
		stmt.setString(2, memberPw);
		resultRow = stmt.executeUpdate();
		stmt.close();
		return resultRow;
	}
	
	// 로그인 LoginActionController
	public Member selectMemberByAndPw(Connection conn, Member member) throws Exception {
		Member retrunMember = null;
		String sql = "SELECT member_id memberId, member_pw memberPw, member_name memberName FROM member WHERE member_id =? AND  member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			retrunMember= new Member();
			retrunMember.setMemberId(rs.getString("memberId"));
			retrunMember.setMemberPw(rs.getString("memberPw"));
			retrunMember.setMemberName(rs.getString("memberName"));
		}
		stmt.close();
		return retrunMember;
	}
	
	// 회원가입 InsertMemberActionController
	public int insertMember(Connection conn, String memberId, String memberPw, String memberName) throws Exception{
		int resultRow = 0;
		String sql = "insert into member(member_id, member_pw, member_name, updatedate, createdate) values (?, ?, ?, sysdate, sysdate)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberId);
		stmt.setString(2, memberPw);
		stmt.setString(3, memberName);
		resultRow = stmt.executeUpdate();
		stmt.close();
		return resultRow;
	}
	
	public int insertBoard(Connection conn, Board board) {
		String sql = "insert into board (board_no, board_title, board_content, member_id, updatedate, createdate) values ( board_seq.nextval, ?, ?, ?, sysdate, sysdate)";
		return 0;
	}

	

}
