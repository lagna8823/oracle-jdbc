package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.MemberDao;
import util.DBUtil;
import vo.Member;

public class MemberService {
	private MemberDao memberDao;
	
	// 회원탈퇴 DeleteMemberActionController
	public int deleteMember(String memberId, String memberPw) {
	int resultRow = 0;
	Connection conn = null;
	try {
		conn = DBUtil.getConnection();
		memberDao= new MemberDao();
		resultRow = memberDao.deleteMember(conn, memberId, memberPw);
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
		
	// 로그인 LoginActionController
	public Member login(Member member) {
		this.memberDao = new MemberDao();
		Member returnMember= new Member();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			memberDao= new MemberDao();
			returnMember = memberDao.selectMemberByAndPw(conn, member);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return returnMember;	
		}
	
	// 회원가입 InsertMemberActionController
	public int insertMember(String memberId, String memberPw, String memberName) {
		int resultRow = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			memberDao= new MemberDao();
			resultRow = memberDao.insertMember(conn, memberId, memberPw, memberName);
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
}
